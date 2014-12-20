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
-3.135297, -0.5413902, -2.033304, 1, 0, 0, 1,
-3.078465, 0.06733975, -2.208697, 1, 0.007843138, 0, 1,
-2.619834, -0.6861381, -0.9703916, 1, 0.01176471, 0, 1,
-2.606181, -1.215251, -1.997219, 1, 0.01960784, 0, 1,
-2.469062, -1.072735, -1.125669, 1, 0.02352941, 0, 1,
-2.437693, 0.3986459, -1.851419, 1, 0.03137255, 0, 1,
-2.337766, 1.365887, 0.4301739, 1, 0.03529412, 0, 1,
-2.278029, -0.2973449, -1.625163, 1, 0.04313726, 0, 1,
-2.22631, 1.440174, -1.18887, 1, 0.04705882, 0, 1,
-2.202524, -0.5647323, -4.860178, 1, 0.05490196, 0, 1,
-2.194914, 0.9592849, -0.2559479, 1, 0.05882353, 0, 1,
-2.182099, -0.5106905, -1.886499, 1, 0.06666667, 0, 1,
-2.13282, -0.9242132, -2.098949, 1, 0.07058824, 0, 1,
-2.127908, -0.451563, -1.545442, 1, 0.07843138, 0, 1,
-2.101804, -0.1739474, -1.836648, 1, 0.08235294, 0, 1,
-2.071821, 0.2656615, -1.658335, 1, 0.09019608, 0, 1,
-2.029857, 0.5299675, -0.8893151, 1, 0.09411765, 0, 1,
-2.019509, -0.149844, -0.9829385, 1, 0.1019608, 0, 1,
-1.990599, -1.046469, -2.058193, 1, 0.1098039, 0, 1,
-1.975592, 0.2425635, -0.2119278, 1, 0.1137255, 0, 1,
-1.957965, 1.603736, 0.03137347, 1, 0.1215686, 0, 1,
-1.940292, 1.111929, -1.04892, 1, 0.1254902, 0, 1,
-1.872916, 2.05139, -0.9915796, 1, 0.1333333, 0, 1,
-1.860522, -0.4446428, -1.857859, 1, 0.1372549, 0, 1,
-1.854111, -1.090709, -3.26915, 1, 0.145098, 0, 1,
-1.853079, -0.8765308, -2.808425, 1, 0.1490196, 0, 1,
-1.849436, 0.4946499, -0.1328756, 1, 0.1568628, 0, 1,
-1.844547, 1.315189, 0.06610093, 1, 0.1607843, 0, 1,
-1.842922, 1.634829, 0.09463426, 1, 0.1686275, 0, 1,
-1.829266, -0.06545002, -0.2353266, 1, 0.172549, 0, 1,
-1.824374, -1.282164, -2.481844, 1, 0.1803922, 0, 1,
-1.823684, 0.01456314, 0.05777337, 1, 0.1843137, 0, 1,
-1.795802, -2.298527, -1.205189, 1, 0.1921569, 0, 1,
-1.792128, 0.8612331, -0.5241209, 1, 0.1960784, 0, 1,
-1.766831, -0.08525409, -1.46089, 1, 0.2039216, 0, 1,
-1.759913, -1.016836, 0.8700992, 1, 0.2117647, 0, 1,
-1.750029, 0.2019994, -2.894052, 1, 0.2156863, 0, 1,
-1.725619, -0.7047735, -0.2715385, 1, 0.2235294, 0, 1,
-1.723951, 0.020154, -2.111415, 1, 0.227451, 0, 1,
-1.718879, 0.2703641, -1.426565, 1, 0.2352941, 0, 1,
-1.714701, 0.4925222, -0.4976662, 1, 0.2392157, 0, 1,
-1.68538, -0.1746073, -2.893477, 1, 0.2470588, 0, 1,
-1.684166, 1.037688, -2.234871, 1, 0.2509804, 0, 1,
-1.678025, 1.231332, -0.1471202, 1, 0.2588235, 0, 1,
-1.657439, 0.03067684, -1.530768, 1, 0.2627451, 0, 1,
-1.647329, 0.269302, -1.466404, 1, 0.2705882, 0, 1,
-1.6146, -2.863305, -1.105049, 1, 0.2745098, 0, 1,
-1.61348, 0.2138311, -0.6375942, 1, 0.282353, 0, 1,
-1.603159, -0.7455492, -3.389479, 1, 0.2862745, 0, 1,
-1.59429, -0.007679436, -1.438339, 1, 0.2941177, 0, 1,
-1.581389, -0.1266825, -1.043921, 1, 0.3019608, 0, 1,
-1.575938, -0.02086377, -1.801514, 1, 0.3058824, 0, 1,
-1.568417, 0.8039223, -2.188657, 1, 0.3137255, 0, 1,
-1.567571, 0.8524189, -2.204956, 1, 0.3176471, 0, 1,
-1.567086, 0.03840946, -2.411495, 1, 0.3254902, 0, 1,
-1.565499, 0.3711099, -2.228613, 1, 0.3294118, 0, 1,
-1.55206, 0.6675821, -3.290246, 1, 0.3372549, 0, 1,
-1.542259, -0.6121072, -3.066678, 1, 0.3411765, 0, 1,
-1.534495, -0.6831687, -2.696686, 1, 0.3490196, 0, 1,
-1.521279, 0.6915991, -1.796727, 1, 0.3529412, 0, 1,
-1.513628, -1.083965, -3.716748, 1, 0.3607843, 0, 1,
-1.513362, -0.09498936, -0.4792093, 1, 0.3647059, 0, 1,
-1.510156, 1.605611, -0.5601671, 1, 0.372549, 0, 1,
-1.502524, 0.005220895, 0.3646579, 1, 0.3764706, 0, 1,
-1.498335, 0.5388764, -0.8342784, 1, 0.3843137, 0, 1,
-1.481385, 0.2310539, -0.7802457, 1, 0.3882353, 0, 1,
-1.470543, -0.6240336, -2.625617, 1, 0.3960784, 0, 1,
-1.451996, -0.4382818, -0.7720684, 1, 0.4039216, 0, 1,
-1.448025, 1.544535, -0.3069374, 1, 0.4078431, 0, 1,
-1.43632, 0.2903971, -3.175822, 1, 0.4156863, 0, 1,
-1.435213, 0.466937, -0.8319842, 1, 0.4196078, 0, 1,
-1.433345, -1.689085, -2.611511, 1, 0.427451, 0, 1,
-1.43127, 2.154613, -2.102652, 1, 0.4313726, 0, 1,
-1.428068, -0.6009312, -2.68381, 1, 0.4392157, 0, 1,
-1.426535, 2.729011, 0.4128288, 1, 0.4431373, 0, 1,
-1.417363, -1.686073, -2.09572, 1, 0.4509804, 0, 1,
-1.413563, 1.150012, 0.2629073, 1, 0.454902, 0, 1,
-1.4121, 0.4558837, -0.2341427, 1, 0.4627451, 0, 1,
-1.400405, -0.3307454, -2.315405, 1, 0.4666667, 0, 1,
-1.400253, -0.6748406, -2.436097, 1, 0.4745098, 0, 1,
-1.396612, 0.1865768, -1.441697, 1, 0.4784314, 0, 1,
-1.391958, 0.8866537, -0.5030783, 1, 0.4862745, 0, 1,
-1.389292, -0.9453067, -1.410576, 1, 0.4901961, 0, 1,
-1.388159, 0.08923773, -0.06374458, 1, 0.4980392, 0, 1,
-1.385375, -0.1223939, -0.9199678, 1, 0.5058824, 0, 1,
-1.384079, 1.275543, -0.1234341, 1, 0.509804, 0, 1,
-1.379748, -0.1168554, -2.28945, 1, 0.5176471, 0, 1,
-1.37582, 0.1877892, -2.706322, 1, 0.5215687, 0, 1,
-1.373951, -0.4899318, -2.298724, 1, 0.5294118, 0, 1,
-1.366355, -0.233669, -0.8997236, 1, 0.5333334, 0, 1,
-1.365993, -0.01290154, -0.997653, 1, 0.5411765, 0, 1,
-1.357544, -0.8023072, -0.8948973, 1, 0.5450981, 0, 1,
-1.355785, -1.180651, -1.550108, 1, 0.5529412, 0, 1,
-1.351368, 0.7180395, -1.2739, 1, 0.5568628, 0, 1,
-1.350148, 1.381633, -2.377325, 1, 0.5647059, 0, 1,
-1.340691, 0.8157587, -0.2476628, 1, 0.5686275, 0, 1,
-1.335396, -0.6763627, -3.349054, 1, 0.5764706, 0, 1,
-1.318137, 0.4870732, -1.432156, 1, 0.5803922, 0, 1,
-1.314804, 0.7393439, 0.1327907, 1, 0.5882353, 0, 1,
-1.31319, 0.1620019, -0.7013259, 1, 0.5921569, 0, 1,
-1.298475, 1.434352, -1.107402, 1, 0.6, 0, 1,
-1.290943, -0.4564478, -1.910205, 1, 0.6078432, 0, 1,
-1.287509, -0.5722116, -1.329522, 1, 0.6117647, 0, 1,
-1.281444, 1.55818, -0.1782573, 1, 0.6196079, 0, 1,
-1.265893, -0.2506559, -1.286475, 1, 0.6235294, 0, 1,
-1.26552, 0.4624312, -0.5601602, 1, 0.6313726, 0, 1,
-1.263166, -0.1567717, -2.623113, 1, 0.6352941, 0, 1,
-1.246924, 0.7978792, -1.633365, 1, 0.6431373, 0, 1,
-1.244367, -0.2751959, 0.4100134, 1, 0.6470588, 0, 1,
-1.234848, -0.1290287, -2.053778, 1, 0.654902, 0, 1,
-1.223602, -0.2804015, -1.774723, 1, 0.6588235, 0, 1,
-1.213003, 0.418181, -0.5869407, 1, 0.6666667, 0, 1,
-1.208638, 0.2960378, -1.15371, 1, 0.6705883, 0, 1,
-1.204487, -1.004917, -3.632194, 1, 0.6784314, 0, 1,
-1.203007, 0.002127792, -1.203973, 1, 0.682353, 0, 1,
-1.202761, -0.5621662, -1.647968, 1, 0.6901961, 0, 1,
-1.198635, 2.276168, -0.06037673, 1, 0.6941177, 0, 1,
-1.198033, -0.1206637, -1.14122, 1, 0.7019608, 0, 1,
-1.197043, -0.3705015, -2.168563, 1, 0.7098039, 0, 1,
-1.195741, 0.33097, -1.295832, 1, 0.7137255, 0, 1,
-1.188866, 1.642556, 0.5507709, 1, 0.7215686, 0, 1,
-1.186352, 0.2580568, -2.161937, 1, 0.7254902, 0, 1,
-1.172447, -0.7705454, -1.650257, 1, 0.7333333, 0, 1,
-1.164091, -0.466078, -2.47802, 1, 0.7372549, 0, 1,
-1.158376, 0.6519191, -2.76933, 1, 0.7450981, 0, 1,
-1.154223, -0.8798837, -0.1437905, 1, 0.7490196, 0, 1,
-1.152508, 1.346942, 0.03512657, 1, 0.7568628, 0, 1,
-1.147169, -1.267565, -1.975556, 1, 0.7607843, 0, 1,
-1.142916, 1.904832, -0.4627244, 1, 0.7686275, 0, 1,
-1.142565, -2.103959, -2.778675, 1, 0.772549, 0, 1,
-1.140912, -1.061963, -3.1152, 1, 0.7803922, 0, 1,
-1.127395, 0.06079368, -1.298336, 1, 0.7843137, 0, 1,
-1.12712, -0.6023955, -2.2051, 1, 0.7921569, 0, 1,
-1.126094, 0.3470778, -2.479157, 1, 0.7960784, 0, 1,
-1.118992, 2.095134, 0.4027022, 1, 0.8039216, 0, 1,
-1.113216, 1.862329, -2.114479, 1, 0.8117647, 0, 1,
-1.105067, 0.7690656, -0.819758, 1, 0.8156863, 0, 1,
-1.102168, -0.4991317, -2.767606, 1, 0.8235294, 0, 1,
-1.097488, 2.269682, -0.1042728, 1, 0.827451, 0, 1,
-1.095286, -0.6383231, -1.542597, 1, 0.8352941, 0, 1,
-1.090945, -1.589958, -3.705597, 1, 0.8392157, 0, 1,
-1.089595, -1.764213, -1.776558, 1, 0.8470588, 0, 1,
-1.086781, -1.594654, -2.857741, 1, 0.8509804, 0, 1,
-1.085474, -0.5171726, -2.370782, 1, 0.8588235, 0, 1,
-1.082605, 1.508279, -0.4697836, 1, 0.8627451, 0, 1,
-1.0765, 1.7684, 0.2069482, 1, 0.8705882, 0, 1,
-1.071449, -1.136811, -1.858605, 1, 0.8745098, 0, 1,
-1.069492, 0.5607296, -0.3725255, 1, 0.8823529, 0, 1,
-1.064374, -0.4501705, -3.115425, 1, 0.8862745, 0, 1,
-1.05845, 0.6847044, -1.632218, 1, 0.8941177, 0, 1,
-1.041081, 0.1242386, -0.2286525, 1, 0.8980392, 0, 1,
-1.040475, 2.058158, -1.300346, 1, 0.9058824, 0, 1,
-1.039642, -0.01768771, -1.032064, 1, 0.9137255, 0, 1,
-1.037919, -0.1427702, -1.49203, 1, 0.9176471, 0, 1,
-1.036253, 0.9092353, -0.3786271, 1, 0.9254902, 0, 1,
-1.034155, -0.8058764, -2.012025, 1, 0.9294118, 0, 1,
-1.025587, 0.5836657, -1.735193, 1, 0.9372549, 0, 1,
-1.020562, -0.5697207, -2.461348, 1, 0.9411765, 0, 1,
-1.019767, -0.7018632, -0.8789474, 1, 0.9490196, 0, 1,
-1.018727, 0.7973815, -0.1108449, 1, 0.9529412, 0, 1,
-1.016222, -0.7801203, -2.352807, 1, 0.9607843, 0, 1,
-1.014323, -2.166728, -3.15174, 1, 0.9647059, 0, 1,
-1.01163, 2.079044, -1.104935, 1, 0.972549, 0, 1,
-1.011373, -0.8160742, -0.6044399, 1, 0.9764706, 0, 1,
-0.9967173, 0.3180105, -1.096739, 1, 0.9843137, 0, 1,
-0.9911535, -1.237946, -1.865144, 1, 0.9882353, 0, 1,
-0.9899732, 0.2494274, -0.5557446, 1, 0.9960784, 0, 1,
-0.9839689, 1.256046, 0.2402928, 0.9960784, 1, 0, 1,
-0.9802412, 0.3748082, -0.9151816, 0.9921569, 1, 0, 1,
-0.9757783, -1.120862, -0.7004705, 0.9843137, 1, 0, 1,
-0.9737098, 0.9706486, 0.1087154, 0.9803922, 1, 0, 1,
-0.971557, -0.8830954, -2.246242, 0.972549, 1, 0, 1,
-0.9619706, -0.534915, -1.578661, 0.9686275, 1, 0, 1,
-0.9580799, -0.1234039, -2.416513, 0.9607843, 1, 0, 1,
-0.9517837, -1.579273, -2.590544, 0.9568627, 1, 0, 1,
-0.9442811, 1.037472, -0.2759178, 0.9490196, 1, 0, 1,
-0.942943, -1.435293, -3.492023, 0.945098, 1, 0, 1,
-0.9392969, -2.094684, -3.000668, 0.9372549, 1, 0, 1,
-0.9380295, 0.554835, -0.2443352, 0.9333333, 1, 0, 1,
-0.9370205, 1.186355, -0.8359017, 0.9254902, 1, 0, 1,
-0.935035, -1.666764, -1.663501, 0.9215686, 1, 0, 1,
-0.9330104, -2.025612, -2.105788, 0.9137255, 1, 0, 1,
-0.9282737, 0.4020512, -1.872421, 0.9098039, 1, 0, 1,
-0.9224869, -1.05138, -2.018795, 0.9019608, 1, 0, 1,
-0.9108068, -0.6187977, -2.473662, 0.8941177, 1, 0, 1,
-0.9059423, 1.103885, -1.238918, 0.8901961, 1, 0, 1,
-0.9019688, -0.2749892, -1.232217, 0.8823529, 1, 0, 1,
-0.8970833, 0.6460671, -1.311153, 0.8784314, 1, 0, 1,
-0.8940002, 0.622113, -0.3126246, 0.8705882, 1, 0, 1,
-0.8865495, -0.9654391, -1.950023, 0.8666667, 1, 0, 1,
-0.8845477, 0.6574049, -1.596721, 0.8588235, 1, 0, 1,
-0.8811929, -2.111869, -1.824768, 0.854902, 1, 0, 1,
-0.8663467, 0.3108425, -0.7192817, 0.8470588, 1, 0, 1,
-0.865075, 0.2769871, -0.8076708, 0.8431373, 1, 0, 1,
-0.8650058, 0.2774097, 0.4394071, 0.8352941, 1, 0, 1,
-0.8571913, -0.007146462, -1.690998, 0.8313726, 1, 0, 1,
-0.8567997, -1.392012, -3.382323, 0.8235294, 1, 0, 1,
-0.8470509, -2.026448, -2.830678, 0.8196079, 1, 0, 1,
-0.8457094, -0.5194895, -1.801043, 0.8117647, 1, 0, 1,
-0.8348947, 1.82641, -0.6413543, 0.8078431, 1, 0, 1,
-0.8292977, 0.6819664, -1.959676, 0.8, 1, 0, 1,
-0.8249517, 0.7308046, -2.511592, 0.7921569, 1, 0, 1,
-0.8221586, 0.8930692, -1.171452, 0.7882353, 1, 0, 1,
-0.8177059, -2.095111, -1.123583, 0.7803922, 1, 0, 1,
-0.8122922, 2.354386, 1.818432, 0.7764706, 1, 0, 1,
-0.8098852, 0.5356094, -0.2132391, 0.7686275, 1, 0, 1,
-0.8096318, 0.4975585, -2.567285, 0.7647059, 1, 0, 1,
-0.8072093, 0.1877839, -0.5042148, 0.7568628, 1, 0, 1,
-0.8061482, -0.8250768, -4.422726, 0.7529412, 1, 0, 1,
-0.8021845, -0.01843594, 1.058296, 0.7450981, 1, 0, 1,
-0.8019676, 0.5566898, 0.5708242, 0.7411765, 1, 0, 1,
-0.8006821, 1.095622, 0.8448949, 0.7333333, 1, 0, 1,
-0.7997319, 0.08205209, -0.2040985, 0.7294118, 1, 0, 1,
-0.7982641, -0.5248774, -1.511642, 0.7215686, 1, 0, 1,
-0.7970706, -0.3408486, -2.870927, 0.7176471, 1, 0, 1,
-0.7953025, 0.1475738, -0.4885494, 0.7098039, 1, 0, 1,
-0.7936773, 0.7560132, -0.7836009, 0.7058824, 1, 0, 1,
-0.7847753, -0.3388599, -2.151455, 0.6980392, 1, 0, 1,
-0.7791372, 0.3548405, -0.1215026, 0.6901961, 1, 0, 1,
-0.7729159, 0.8710592, -1.544901, 0.6862745, 1, 0, 1,
-0.7727283, -1.865828, -2.488554, 0.6784314, 1, 0, 1,
-0.7708302, -0.4522375, -2.274145, 0.6745098, 1, 0, 1,
-0.7692442, -2.111865, -1.698737, 0.6666667, 1, 0, 1,
-0.7682219, 0.6206217, 0.1726064, 0.6627451, 1, 0, 1,
-0.7679704, -1.250302, -4.379354, 0.654902, 1, 0, 1,
-0.762466, 0.6747556, -1.830677, 0.6509804, 1, 0, 1,
-0.7591444, -0.6267513, -1.765586, 0.6431373, 1, 0, 1,
-0.7581787, 0.4953158, -1.178027, 0.6392157, 1, 0, 1,
-0.7550477, 0.9479527, -0.7438355, 0.6313726, 1, 0, 1,
-0.7481504, 1.200145, 0.2161868, 0.627451, 1, 0, 1,
-0.7471002, -0.5107403, -2.061795, 0.6196079, 1, 0, 1,
-0.7426551, -0.4217559, -3.884791, 0.6156863, 1, 0, 1,
-0.7388012, -2.157302, -3.393914, 0.6078432, 1, 0, 1,
-0.7312045, 1.93423, -0.518586, 0.6039216, 1, 0, 1,
-0.7273507, 1.123133, 0.3264263, 0.5960785, 1, 0, 1,
-0.7263494, 0.954019, -1.090241, 0.5882353, 1, 0, 1,
-0.7263085, 0.2369607, -1.281569, 0.5843138, 1, 0, 1,
-0.7225605, 1.076344, -0.5209417, 0.5764706, 1, 0, 1,
-0.722235, 0.3858105, -0.2648349, 0.572549, 1, 0, 1,
-0.7183456, -0.5012802, -1.053167, 0.5647059, 1, 0, 1,
-0.7169877, 0.8795664, 0.9312705, 0.5607843, 1, 0, 1,
-0.7101293, -0.2587618, -2.90251, 0.5529412, 1, 0, 1,
-0.7053795, 0.6862923, 0.4869704, 0.5490196, 1, 0, 1,
-0.7034107, 0.2205689, -0.2362657, 0.5411765, 1, 0, 1,
-0.6970173, -1.221189, -1.886737, 0.5372549, 1, 0, 1,
-0.6935474, 0.6703376, 0.622076, 0.5294118, 1, 0, 1,
-0.6927782, -1.459345, -2.626704, 0.5254902, 1, 0, 1,
-0.6907444, 1.342988, 0.4794287, 0.5176471, 1, 0, 1,
-0.6898542, 0.2451712, -1.173738, 0.5137255, 1, 0, 1,
-0.6879763, 1.810673, -1.592366, 0.5058824, 1, 0, 1,
-0.6857671, 0.336033, 1.294637, 0.5019608, 1, 0, 1,
-0.6768082, 1.121774, -0.714622, 0.4941176, 1, 0, 1,
-0.6737757, 0.8632668, -0.5010464, 0.4862745, 1, 0, 1,
-0.6715247, -0.02433805, -2.186839, 0.4823529, 1, 0, 1,
-0.6695544, 1.498578, -0.3884876, 0.4745098, 1, 0, 1,
-0.6647089, -2.110501, -2.86921, 0.4705882, 1, 0, 1,
-0.6632476, -0.751398, -2.091226, 0.4627451, 1, 0, 1,
-0.6624159, 1.440912, 0.6919439, 0.4588235, 1, 0, 1,
-0.6586531, 1.875445, -0.8583826, 0.4509804, 1, 0, 1,
-0.6581271, 0.0893659, -1.265259, 0.4470588, 1, 0, 1,
-0.6534466, -0.9548079, -2.396044, 0.4392157, 1, 0, 1,
-0.6513744, -0.5553485, -1.972042, 0.4352941, 1, 0, 1,
-0.6496224, 0.4769143, -0.758155, 0.427451, 1, 0, 1,
-0.6489301, 0.5039054, -2.006767, 0.4235294, 1, 0, 1,
-0.6478762, 1.110079, -1.572634, 0.4156863, 1, 0, 1,
-0.645312, -1.129278, -4.250194, 0.4117647, 1, 0, 1,
-0.6431172, 1.811213, 0.2769741, 0.4039216, 1, 0, 1,
-0.6417698, 1.144639, 0.968775, 0.3960784, 1, 0, 1,
-0.6400309, 0.2270353, -0.8793934, 0.3921569, 1, 0, 1,
-0.6362531, 1.054925, 0.2852138, 0.3843137, 1, 0, 1,
-0.6342835, -1.042775, -1.648161, 0.3803922, 1, 0, 1,
-0.6334168, 0.2966089, -2.064383, 0.372549, 1, 0, 1,
-0.6309679, 1.221144, -1.125874, 0.3686275, 1, 0, 1,
-0.628831, -2.39686, -1.635926, 0.3607843, 1, 0, 1,
-0.6269209, -0.6504685, -2.554921, 0.3568628, 1, 0, 1,
-0.6266019, 1.421548, 1.201173, 0.3490196, 1, 0, 1,
-0.6236622, -1.272551, -2.88215, 0.345098, 1, 0, 1,
-0.6182668, 1.14533, 1.988418, 0.3372549, 1, 0, 1,
-0.617992, 0.2820307, -2.04848, 0.3333333, 1, 0, 1,
-0.6147491, -0.2901036, -2.387125, 0.3254902, 1, 0, 1,
-0.6142004, 0.6224039, -0.8254505, 0.3215686, 1, 0, 1,
-0.6098972, 0.2737297, -0.7595649, 0.3137255, 1, 0, 1,
-0.6098092, -0.7021802, -3.909714, 0.3098039, 1, 0, 1,
-0.6090903, 0.03707269, -2.37886, 0.3019608, 1, 0, 1,
-0.6075594, -0.04427061, 0.2458462, 0.2941177, 1, 0, 1,
-0.6044554, 0.5793004, -2.025878, 0.2901961, 1, 0, 1,
-0.6028011, -0.335905, -0.9459821, 0.282353, 1, 0, 1,
-0.6020256, -0.3607543, -2.734885, 0.2784314, 1, 0, 1,
-0.5885404, -0.6434613, -1.304237, 0.2705882, 1, 0, 1,
-0.5878221, 0.9997923, -0.8477741, 0.2666667, 1, 0, 1,
-0.5840789, 1.735932, -1.572459, 0.2588235, 1, 0, 1,
-0.579643, -0.3814543, -2.314699, 0.254902, 1, 0, 1,
-0.5783038, -1.378758, -1.870574, 0.2470588, 1, 0, 1,
-0.5782714, 0.02663804, -0.6911031, 0.2431373, 1, 0, 1,
-0.5768426, -0.2260137, -2.224829, 0.2352941, 1, 0, 1,
-0.5641455, -1.678396, -1.945498, 0.2313726, 1, 0, 1,
-0.5627046, 0.779336, -0.484568, 0.2235294, 1, 0, 1,
-0.5541057, 1.727393, -0.00160491, 0.2196078, 1, 0, 1,
-0.5514932, -1.991257, -2.783776, 0.2117647, 1, 0, 1,
-0.5465376, -0.3457187, -0.7697571, 0.2078431, 1, 0, 1,
-0.5461124, 1.490854, 1.299597, 0.2, 1, 0, 1,
-0.5436832, -1.157331, -1.859815, 0.1921569, 1, 0, 1,
-0.5217739, 0.2707717, -1.640871, 0.1882353, 1, 0, 1,
-0.5191074, -0.4302419, -0.7365538, 0.1803922, 1, 0, 1,
-0.5150079, 1.028653, -1.850107, 0.1764706, 1, 0, 1,
-0.510927, -0.4347519, -3.400444, 0.1686275, 1, 0, 1,
-0.5108991, 0.4754474, -1.383649, 0.1647059, 1, 0, 1,
-0.5094401, -0.0971425, -2.483147, 0.1568628, 1, 0, 1,
-0.5034969, 2.412845, 0.2454302, 0.1529412, 1, 0, 1,
-0.4994339, 0.5847735, -1.73313, 0.145098, 1, 0, 1,
-0.4986085, 0.216437, -1.572713, 0.1411765, 1, 0, 1,
-0.4978976, 0.945634, 0.0647247, 0.1333333, 1, 0, 1,
-0.4902895, 0.7909398, -0.7236085, 0.1294118, 1, 0, 1,
-0.4895434, -0.4668551, -2.559313, 0.1215686, 1, 0, 1,
-0.4894041, 0.6877028, -0.01183175, 0.1176471, 1, 0, 1,
-0.4846067, -0.3329355, -1.628189, 0.1098039, 1, 0, 1,
-0.4810742, 0.5908224, -0.8412942, 0.1058824, 1, 0, 1,
-0.4794316, 0.4549852, -1.824266, 0.09803922, 1, 0, 1,
-0.4752945, -0.3984027, -1.155621, 0.09019608, 1, 0, 1,
-0.4741034, 0.3024831, 0.4490647, 0.08627451, 1, 0, 1,
-0.4716243, -1.708821, -2.593032, 0.07843138, 1, 0, 1,
-0.4711666, -1.572623, -2.734754, 0.07450981, 1, 0, 1,
-0.4676836, 0.6447405, -0.783124, 0.06666667, 1, 0, 1,
-0.4676071, -0.3242641, -1.279573, 0.0627451, 1, 0, 1,
-0.4668171, 0.1319257, -0.9689211, 0.05490196, 1, 0, 1,
-0.4642124, -0.9006711, -3.755663, 0.05098039, 1, 0, 1,
-0.4551747, -0.352009, -2.194838, 0.04313726, 1, 0, 1,
-0.4453864, 0.8463619, -1.670438, 0.03921569, 1, 0, 1,
-0.445097, -0.7039684, -2.65457, 0.03137255, 1, 0, 1,
-0.4366578, -0.1836613, -3.163824, 0.02745098, 1, 0, 1,
-0.4365738, -0.5808972, -1.393926, 0.01960784, 1, 0, 1,
-0.432327, 1.293506, 0.2752072, 0.01568628, 1, 0, 1,
-0.4320282, -0.02919601, 0.2185959, 0.007843138, 1, 0, 1,
-0.4254014, -0.6369202, -2.872897, 0.003921569, 1, 0, 1,
-0.4242309, 0.4400766, -2.22017, 0, 1, 0.003921569, 1,
-0.4177816, 0.5656717, -1.83187, 0, 1, 0.01176471, 1,
-0.417515, 0.5930158, -2.155834, 0, 1, 0.01568628, 1,
-0.4159831, -0.03152647, -1.021981, 0, 1, 0.02352941, 1,
-0.413281, 0.9526734, -0.255799, 0, 1, 0.02745098, 1,
-0.4100207, 1.812811, 0.2309958, 0, 1, 0.03529412, 1,
-0.4077126, 0.08797254, -1.493412, 0, 1, 0.03921569, 1,
-0.3963591, -0.4345306, -3.308346, 0, 1, 0.04705882, 1,
-0.3904459, 0.4494959, -0.7568063, 0, 1, 0.05098039, 1,
-0.3760664, 0.4317567, 0.4280315, 0, 1, 0.05882353, 1,
-0.3750406, 1.752114, -0.5661899, 0, 1, 0.0627451, 1,
-0.3749642, 1.566076, -1.475877, 0, 1, 0.07058824, 1,
-0.3716179, -0.1850531, -1.641278, 0, 1, 0.07450981, 1,
-0.3682884, -0.2122424, -2.421865, 0, 1, 0.08235294, 1,
-0.3594527, -1.035503, -2.765682, 0, 1, 0.08627451, 1,
-0.359011, 0.2255387, -0.03259244, 0, 1, 0.09411765, 1,
-0.3588709, 0.086437, -0.5573149, 0, 1, 0.1019608, 1,
-0.3572757, 2.780376, -1.197751, 0, 1, 0.1058824, 1,
-0.3570622, -1.44894, -2.484874, 0, 1, 0.1137255, 1,
-0.3566471, 0.5288343, -0.6525381, 0, 1, 0.1176471, 1,
-0.3563699, -2.602106, -2.301722, 0, 1, 0.1254902, 1,
-0.3525331, -0.7232028, -3.195962, 0, 1, 0.1294118, 1,
-0.3523771, -1.800613, -1.23912, 0, 1, 0.1372549, 1,
-0.3501636, 0.04505608, -0.5993365, 0, 1, 0.1411765, 1,
-0.3486297, -1.878135, -3.396157, 0, 1, 0.1490196, 1,
-0.3404268, 0.853368, -1.237156, 0, 1, 0.1529412, 1,
-0.3390973, 2.636341, 0.2190338, 0, 1, 0.1607843, 1,
-0.335764, -1.163791, -0.4222247, 0, 1, 0.1647059, 1,
-0.3348266, 1.505935, 0.2576491, 0, 1, 0.172549, 1,
-0.3306479, 0.2546425, -0.6170405, 0, 1, 0.1764706, 1,
-0.32839, 0.5702117, 0.6950421, 0, 1, 0.1843137, 1,
-0.326871, -0.4979091, -4.177705, 0, 1, 0.1882353, 1,
-0.3260981, -0.6805579, -0.7052669, 0, 1, 0.1960784, 1,
-0.3236955, 0.179963, -0.2349387, 0, 1, 0.2039216, 1,
-0.3217253, 1.05171, -0.3555964, 0, 1, 0.2078431, 1,
-0.3151194, 0.1464629, -1.63912, 0, 1, 0.2156863, 1,
-0.3112713, -0.5851142, -2.581732, 0, 1, 0.2196078, 1,
-0.3065676, 0.5136274, -0.2260529, 0, 1, 0.227451, 1,
-0.3006363, 1.685028, 0.102951, 0, 1, 0.2313726, 1,
-0.3006192, 0.9784272, -0.4328741, 0, 1, 0.2392157, 1,
-0.2980937, 1.217257, -0.994297, 0, 1, 0.2431373, 1,
-0.2953388, -0.5685942, -0.9226376, 0, 1, 0.2509804, 1,
-0.2778881, -1.499325, -3.6041, 0, 1, 0.254902, 1,
-0.2769555, 1.198173, 0.4534543, 0, 1, 0.2627451, 1,
-0.2767005, -0.4507294, -1.499327, 0, 1, 0.2666667, 1,
-0.2744233, 0.2330023, -0.4534764, 0, 1, 0.2745098, 1,
-0.2718202, -1.724725, -3.709923, 0, 1, 0.2784314, 1,
-0.2696992, 1.466367, 0.2453814, 0, 1, 0.2862745, 1,
-0.2686498, 0.6887854, 0.3858506, 0, 1, 0.2901961, 1,
-0.2664182, 0.6085274, 0.5557778, 0, 1, 0.2980392, 1,
-0.2619466, -0.03232658, -2.456504, 0, 1, 0.3058824, 1,
-0.2600319, -0.9183105, -2.076025, 0, 1, 0.3098039, 1,
-0.2590248, -1.211113, -3.374399, 0, 1, 0.3176471, 1,
-0.2549493, -0.2358184, -1.920586, 0, 1, 0.3215686, 1,
-0.2517948, -0.4297923, -3.83843, 0, 1, 0.3294118, 1,
-0.25156, 0.4009703, -1.5461, 0, 1, 0.3333333, 1,
-0.2498866, 0.496596, 0.9990518, 0, 1, 0.3411765, 1,
-0.2495372, -0.2365852, -4.941377, 0, 1, 0.345098, 1,
-0.2480605, -0.1883547, -3.438644, 0, 1, 0.3529412, 1,
-0.2449403, 0.3228278, 0.3908409, 0, 1, 0.3568628, 1,
-0.2441564, 0.1419795, -0.2488018, 0, 1, 0.3647059, 1,
-0.2419628, -1.415134, -4.23954, 0, 1, 0.3686275, 1,
-0.2383932, 0.1254431, -2.188761, 0, 1, 0.3764706, 1,
-0.2340051, 0.3426011, -1.712337, 0, 1, 0.3803922, 1,
-0.2339591, -1.101412, -2.185701, 0, 1, 0.3882353, 1,
-0.2319753, -0.9964921, -4.560129, 0, 1, 0.3921569, 1,
-0.2307293, -0.8165832, -3.572034, 0, 1, 0.4, 1,
-0.2286699, 0.3477645, 0.2333189, 0, 1, 0.4078431, 1,
-0.2253654, -1.321018, -3.90435, 0, 1, 0.4117647, 1,
-0.2250261, -0.7686956, -4.811293, 0, 1, 0.4196078, 1,
-0.2216515, 0.3484588, -0.1570157, 0, 1, 0.4235294, 1,
-0.2213452, 1.66262, 1.899256, 0, 1, 0.4313726, 1,
-0.2209839, -0.5362595, -1.828562, 0, 1, 0.4352941, 1,
-0.2190583, 0.6608471, -0.02727161, 0, 1, 0.4431373, 1,
-0.2184506, -0.6834078, -1.963795, 0, 1, 0.4470588, 1,
-0.2169336, 0.9477497, -0.8566337, 0, 1, 0.454902, 1,
-0.2140489, -0.4921941, -1.801145, 0, 1, 0.4588235, 1,
-0.2111162, -1.162252, -3.78551, 0, 1, 0.4666667, 1,
-0.2108945, -0.9174806, -3.143506, 0, 1, 0.4705882, 1,
-0.2069521, 1.313187, -0.519925, 0, 1, 0.4784314, 1,
-0.203315, -0.4959154, -4.560015, 0, 1, 0.4823529, 1,
-0.19436, 0.8512438, 0.03698286, 0, 1, 0.4901961, 1,
-0.1937728, 1.828332, 0.2831568, 0, 1, 0.4941176, 1,
-0.1901126, -0.8795118, -4.374313, 0, 1, 0.5019608, 1,
-0.1896456, -1.08011, -4.645078, 0, 1, 0.509804, 1,
-0.1892134, 0.382503, -0.8941616, 0, 1, 0.5137255, 1,
-0.187005, 1.430356, -0.05274193, 0, 1, 0.5215687, 1,
-0.1861546, -0.01914867, -1.621123, 0, 1, 0.5254902, 1,
-0.1825967, 0.6028339, -0.5175607, 0, 1, 0.5333334, 1,
-0.1823332, 0.07249235, -1.028027, 0, 1, 0.5372549, 1,
-0.1797869, 0.458616, -0.2012467, 0, 1, 0.5450981, 1,
-0.1758195, -1.715087, -0.6312513, 0, 1, 0.5490196, 1,
-0.1755141, 0.5690331, 1.16974, 0, 1, 0.5568628, 1,
-0.1712759, -0.1932414, -2.349271, 0, 1, 0.5607843, 1,
-0.1688152, 0.6770367, 2.187024, 0, 1, 0.5686275, 1,
-0.1665031, -0.05958251, -3.112875, 0, 1, 0.572549, 1,
-0.1566813, 0.05141551, 0.5862178, 0, 1, 0.5803922, 1,
-0.1531821, 0.8649414, 0.5198628, 0, 1, 0.5843138, 1,
-0.1501269, -0.177509, -2.233766, 0, 1, 0.5921569, 1,
-0.150028, 0.6358225, 1.209797, 0, 1, 0.5960785, 1,
-0.1454488, -0.5642903, -0.8601598, 0, 1, 0.6039216, 1,
-0.1426504, 1.244732, -1.374601, 0, 1, 0.6117647, 1,
-0.1378393, -1.121565, -2.98045, 0, 1, 0.6156863, 1,
-0.1360582, -0.2969465, -2.607092, 0, 1, 0.6235294, 1,
-0.1320753, 0.5021631, -1.148384, 0, 1, 0.627451, 1,
-0.1308637, 2.757244, -0.6607192, 0, 1, 0.6352941, 1,
-0.1229754, -0.01455776, -1.54936, 0, 1, 0.6392157, 1,
-0.1203364, -1.674069, -2.130262, 0, 1, 0.6470588, 1,
-0.1201803, -1.15802, -2.843762, 0, 1, 0.6509804, 1,
-0.119574, -1.78438, -2.450114, 0, 1, 0.6588235, 1,
-0.1146882, -1.471274, -2.875859, 0, 1, 0.6627451, 1,
-0.1119806, -0.698613, -2.453386, 0, 1, 0.6705883, 1,
-0.1118675, 1.866881, 1.457669, 0, 1, 0.6745098, 1,
-0.1056179, -0.1765479, -1.722781, 0, 1, 0.682353, 1,
-0.1041493, -0.8744953, -3.427056, 0, 1, 0.6862745, 1,
-0.1001428, 1.330138, 0.679201, 0, 1, 0.6941177, 1,
-0.09936075, 1.024637, 1.089655, 0, 1, 0.7019608, 1,
-0.09739543, -2.730462, -3.948329, 0, 1, 0.7058824, 1,
-0.0973846, -0.6437937, -3.647323, 0, 1, 0.7137255, 1,
-0.0931145, -1.278907, -4.985956, 0, 1, 0.7176471, 1,
-0.09284487, -0.8074484, -4.202115, 0, 1, 0.7254902, 1,
-0.09029815, -0.2915032, -0.8758824, 0, 1, 0.7294118, 1,
-0.08675389, -0.2894244, -4.04726, 0, 1, 0.7372549, 1,
-0.08648247, -0.67168, -2.832468, 0, 1, 0.7411765, 1,
-0.08567362, -0.4567084, -3.157851, 0, 1, 0.7490196, 1,
-0.0852088, -0.2152123, -2.038385, 0, 1, 0.7529412, 1,
-0.08379108, -0.6041995, -3.984188, 0, 1, 0.7607843, 1,
-0.08219246, 1.329702, -0.8802346, 0, 1, 0.7647059, 1,
-0.07954208, -0.1088833, -3.899961, 0, 1, 0.772549, 1,
-0.07951397, -0.7242414, -3.232668, 0, 1, 0.7764706, 1,
-0.07808019, -2.175704, -2.171506, 0, 1, 0.7843137, 1,
-0.07745117, 0.1975289, -0.1244716, 0, 1, 0.7882353, 1,
-0.07544428, -0.4106086, -3.675931, 0, 1, 0.7960784, 1,
-0.0714158, -0.5501024, -3.867737, 0, 1, 0.8039216, 1,
-0.07100727, -1.241606, -2.791983, 0, 1, 0.8078431, 1,
-0.06901875, -0.3373666, -4.067563, 0, 1, 0.8156863, 1,
-0.06724608, -0.4103954, -3.546524, 0, 1, 0.8196079, 1,
-0.06438763, -1.199434, -5.175244, 0, 1, 0.827451, 1,
-0.06227359, 0.4535944, -0.01989243, 0, 1, 0.8313726, 1,
-0.06079125, -1.409762, -4.048717, 0, 1, 0.8392157, 1,
-0.06049589, -1.498311, -2.350394, 0, 1, 0.8431373, 1,
-0.05980763, 2.238492, 0.2384169, 0, 1, 0.8509804, 1,
-0.05946571, 0.0239386, -1.75797, 0, 1, 0.854902, 1,
-0.05693671, -0.3514694, -2.831427, 0, 1, 0.8627451, 1,
-0.05611001, -0.8720996, -4.170031, 0, 1, 0.8666667, 1,
-0.05254144, 1.522576, 0.7324212, 0, 1, 0.8745098, 1,
-0.05253645, -0.1037712, -1.625637, 0, 1, 0.8784314, 1,
-0.05249952, 0.6614628, -0.440796, 0, 1, 0.8862745, 1,
-0.05073294, -0.2048007, -2.506455, 0, 1, 0.8901961, 1,
-0.04891103, -1.63289, -0.5183949, 0, 1, 0.8980392, 1,
-0.04636472, -0.2108957, -4.82277, 0, 1, 0.9058824, 1,
-0.04587794, -0.8335999, -3.939374, 0, 1, 0.9098039, 1,
-0.04529425, -1.115176, -2.026322, 0, 1, 0.9176471, 1,
-0.04257672, 0.01967952, 0.4024747, 0, 1, 0.9215686, 1,
-0.03621765, 1.306793, 0.3370564, 0, 1, 0.9294118, 1,
-0.03589303, 0.3293425, 1.024977, 0, 1, 0.9333333, 1,
-0.03489672, -0.8569537, -2.252072, 0, 1, 0.9411765, 1,
-0.03446613, 1.023968, 0.3375159, 0, 1, 0.945098, 1,
-0.03331947, -0.01380685, -2.902293, 0, 1, 0.9529412, 1,
-0.02844606, 1.009424, -0.2121768, 0, 1, 0.9568627, 1,
-0.02730598, 0.8347839, 1.801714, 0, 1, 0.9647059, 1,
-0.02572039, 1.04414, 1.395352, 0, 1, 0.9686275, 1,
-0.02555701, 0.3475129, 1.049496, 0, 1, 0.9764706, 1,
-0.02517556, 0.5774313, 0.4577662, 0, 1, 0.9803922, 1,
-0.02450769, -1.643692, -1.958763, 0, 1, 0.9882353, 1,
-0.0240214, -0.1021466, -2.994244, 0, 1, 0.9921569, 1,
-0.02159452, 0.2403444, -0.1813819, 0, 1, 1, 1,
-0.0156041, -0.6434782, -2.328829, 0, 0.9921569, 1, 1,
-0.01021469, -2.770588, -3.179649, 0, 0.9882353, 1, 1,
-0.00782193, -1.82627, -1.808975, 0, 0.9803922, 1, 1,
-0.002505957, -0.3889976, -2.614605, 0, 0.9764706, 1, 1,
-0.0001353734, 0.3802346, 0.853914, 0, 0.9686275, 1, 1,
0.002103117, -0.9934533, 3.086463, 0, 0.9647059, 1, 1,
0.00308022, 0.3330395, -0.7966776, 0, 0.9568627, 1, 1,
0.003351758, 1.997843, 0.8098729, 0, 0.9529412, 1, 1,
0.004584878, 0.9493049, -0.2034768, 0, 0.945098, 1, 1,
0.006187449, 0.5453765, 0.1630249, 0, 0.9411765, 1, 1,
0.006871302, -0.9407911, 3.124549, 0, 0.9333333, 1, 1,
0.01040796, 0.1600495, 2.151622, 0, 0.9294118, 1, 1,
0.01068791, 0.5465738, -1.244578, 0, 0.9215686, 1, 1,
0.01141452, 0.8985577, -0.3493801, 0, 0.9176471, 1, 1,
0.01177353, 0.9996447, -0.3939542, 0, 0.9098039, 1, 1,
0.01812315, 0.8689539, -0.1464681, 0, 0.9058824, 1, 1,
0.02298898, 1.790834, 1.044017, 0, 0.8980392, 1, 1,
0.02448686, 1.215332, -0.06306671, 0, 0.8901961, 1, 1,
0.02858089, -0.6505846, 2.567241, 0, 0.8862745, 1, 1,
0.03202778, 0.1049342, -0.08180042, 0, 0.8784314, 1, 1,
0.03742408, 1.618102, -0.3983721, 0, 0.8745098, 1, 1,
0.04134504, -0.9702047, 3.414208, 0, 0.8666667, 1, 1,
0.04657566, 0.4856996, -1.650921, 0, 0.8627451, 1, 1,
0.04984282, -0.1674829, 4.612258, 0, 0.854902, 1, 1,
0.05054276, -0.1412988, 3.624634, 0, 0.8509804, 1, 1,
0.05127256, -0.5338795, 2.454212, 0, 0.8431373, 1, 1,
0.05145187, 0.2713409, 1.075403, 0, 0.8392157, 1, 1,
0.05257245, 0.4561665, -0.8539407, 0, 0.8313726, 1, 1,
0.0544106, -1.042838, 3.536475, 0, 0.827451, 1, 1,
0.0555498, 0.1309893, -0.06492832, 0, 0.8196079, 1, 1,
0.06004033, -0.3005909, 1.768711, 0, 0.8156863, 1, 1,
0.06037721, -0.9948993, 4.255813, 0, 0.8078431, 1, 1,
0.06349824, -1.807016, 4.079321, 0, 0.8039216, 1, 1,
0.07251015, -1.54357, 4.753932, 0, 0.7960784, 1, 1,
0.07409775, -1.360308, 3.313065, 0, 0.7882353, 1, 1,
0.08083002, 0.7449623, 0.8121268, 0, 0.7843137, 1, 1,
0.0810233, 0.3289397, 0.1285846, 0, 0.7764706, 1, 1,
0.08484291, 1.029378, -1.060817, 0, 0.772549, 1, 1,
0.08792155, -1.134202, 4.700644, 0, 0.7647059, 1, 1,
0.08925623, -1.161312, 3.971747, 0, 0.7607843, 1, 1,
0.09135661, -2.966307, 2.627296, 0, 0.7529412, 1, 1,
0.09146464, 0.650512, 1.425654, 0, 0.7490196, 1, 1,
0.09384645, -1.197001, 2.944566, 0, 0.7411765, 1, 1,
0.09559849, 0.4768482, -0.05895442, 0, 0.7372549, 1, 1,
0.09735042, -0.8778216, 3.564937, 0, 0.7294118, 1, 1,
0.1023774, 0.7339559, 0.866114, 0, 0.7254902, 1, 1,
0.1057993, 0.4958833, -0.8823868, 0, 0.7176471, 1, 1,
0.10699, 1.544654, 0.06266103, 0, 0.7137255, 1, 1,
0.1071201, -0.5756955, 3.695791, 0, 0.7058824, 1, 1,
0.110169, 0.7491247, 1.698069, 0, 0.6980392, 1, 1,
0.1141219, 0.8474283, -0.2315759, 0, 0.6941177, 1, 1,
0.1142316, -1.977901, 2.485207, 0, 0.6862745, 1, 1,
0.1146235, 1.155437, -1.518193, 0, 0.682353, 1, 1,
0.1148291, -1.55153, 2.898037, 0, 0.6745098, 1, 1,
0.1156593, 0.7016172, 0.6065188, 0, 0.6705883, 1, 1,
0.116194, -0.926944, 3.761252, 0, 0.6627451, 1, 1,
0.1168725, 0.9015651, 0.3766444, 0, 0.6588235, 1, 1,
0.1222335, 0.8039605, -0.6317549, 0, 0.6509804, 1, 1,
0.1227549, 0.7870233, -0.2793352, 0, 0.6470588, 1, 1,
0.126005, -1.059546, 2.887864, 0, 0.6392157, 1, 1,
0.1268322, -0.7821071, 3.661475, 0, 0.6352941, 1, 1,
0.1274186, 0.8678514, -0.05651616, 0, 0.627451, 1, 1,
0.128117, -1.766441, 3.336095, 0, 0.6235294, 1, 1,
0.1321388, -1.000188, 3.076909, 0, 0.6156863, 1, 1,
0.138018, 0.135782, -0.2590485, 0, 0.6117647, 1, 1,
0.1438831, 0.8797686, 1.911039, 0, 0.6039216, 1, 1,
0.1457327, -0.9548007, 1.888764, 0, 0.5960785, 1, 1,
0.1473698, 0.578351, 1.610327, 0, 0.5921569, 1, 1,
0.1525746, -1.395624, 2.383765, 0, 0.5843138, 1, 1,
0.15439, -0.1125192, -0.4906398, 0, 0.5803922, 1, 1,
0.1579523, -1.145349, 2.704889, 0, 0.572549, 1, 1,
0.1581368, -1.175091, 4.194268, 0, 0.5686275, 1, 1,
0.160033, 2.106582, 0.950729, 0, 0.5607843, 1, 1,
0.1641354, 0.5451319, 1.134897, 0, 0.5568628, 1, 1,
0.1653988, 0.659379, 0.3367849, 0, 0.5490196, 1, 1,
0.1657599, 1.225157, -2.815953, 0, 0.5450981, 1, 1,
0.1680132, -0.2892593, 2.399598, 0, 0.5372549, 1, 1,
0.1700434, -0.2612025, 3.431773, 0, 0.5333334, 1, 1,
0.1738004, -1.686482, 1.613311, 0, 0.5254902, 1, 1,
0.174061, -0.7788461, 3.10667, 0, 0.5215687, 1, 1,
0.1746741, 0.1526195, 2.604021, 0, 0.5137255, 1, 1,
0.1756462, 0.8806698, -0.3380699, 0, 0.509804, 1, 1,
0.1805545, 0.4068562, 1.628416, 0, 0.5019608, 1, 1,
0.188703, -0.6532999, 2.330002, 0, 0.4941176, 1, 1,
0.1892009, 0.08874162, 1.660681, 0, 0.4901961, 1, 1,
0.1928051, 1.709916, -0.5008497, 0, 0.4823529, 1, 1,
0.2040147, 0.2898358, -0.07190628, 0, 0.4784314, 1, 1,
0.2066299, 2.012465, -1.256594, 0, 0.4705882, 1, 1,
0.2090615, -0.164555, 3.861094, 0, 0.4666667, 1, 1,
0.2140438, -0.222479, 3.648896, 0, 0.4588235, 1, 1,
0.2157058, 1.58505, 1.700486, 0, 0.454902, 1, 1,
0.2246167, -1.091204, 2.793797, 0, 0.4470588, 1, 1,
0.2249898, 0.1084078, 1.671908, 0, 0.4431373, 1, 1,
0.2311681, 0.8271728, 2.862305, 0, 0.4352941, 1, 1,
0.2362036, -0.7635074, 3.709813, 0, 0.4313726, 1, 1,
0.2362835, 0.1116159, 1.041059, 0, 0.4235294, 1, 1,
0.2375001, -0.3934283, 0.9521112, 0, 0.4196078, 1, 1,
0.2384834, 0.4192364, 0.8045505, 0, 0.4117647, 1, 1,
0.2459899, 2.821815, -0.5377436, 0, 0.4078431, 1, 1,
0.2460953, 1.109092, 0.9141434, 0, 0.4, 1, 1,
0.2510112, 1.181424, -1.288131, 0, 0.3921569, 1, 1,
0.2521154, -1.06999, 4.721315, 0, 0.3882353, 1, 1,
0.2561128, 1.696066, -0.6434252, 0, 0.3803922, 1, 1,
0.2638663, -1.41233, 4.037559, 0, 0.3764706, 1, 1,
0.2653648, -0.8178091, 3.710118, 0, 0.3686275, 1, 1,
0.2672722, -2.347506, 3.566153, 0, 0.3647059, 1, 1,
0.2732016, -0.5000774, 2.873358, 0, 0.3568628, 1, 1,
0.2783655, 1.274666, -0.6897395, 0, 0.3529412, 1, 1,
0.2797766, 0.2876244, 2.104248, 0, 0.345098, 1, 1,
0.281855, -1.64451, 3.566569, 0, 0.3411765, 1, 1,
0.2841933, 0.9099567, -0.1053503, 0, 0.3333333, 1, 1,
0.2913004, 0.1442489, 0.2111998, 0, 0.3294118, 1, 1,
0.2995223, -1.265556, 1.832032, 0, 0.3215686, 1, 1,
0.2996773, -0.8457143, 3.059309, 0, 0.3176471, 1, 1,
0.3002805, 0.2269381, 2.098329, 0, 0.3098039, 1, 1,
0.3015785, -0.8587694, 2.611876, 0, 0.3058824, 1, 1,
0.3119337, -0.244859, 1.889637, 0, 0.2980392, 1, 1,
0.3133415, -0.8282028, 2.987509, 0, 0.2901961, 1, 1,
0.3178863, -1.02775, 3.574664, 0, 0.2862745, 1, 1,
0.318417, -0.2696768, 1.906239, 0, 0.2784314, 1, 1,
0.3184777, -0.3298831, 2.343116, 0, 0.2745098, 1, 1,
0.3215967, -0.8475387, 2.546683, 0, 0.2666667, 1, 1,
0.324838, -1.556351, 3.992972, 0, 0.2627451, 1, 1,
0.3248596, 2.144151, -0.5175657, 0, 0.254902, 1, 1,
0.3293844, -0.5820805, 3.963494, 0, 0.2509804, 1, 1,
0.329685, 0.007805666, 0.529775, 0, 0.2431373, 1, 1,
0.332975, 0.3794861, 1.969094, 0, 0.2392157, 1, 1,
0.3414017, -0.6678448, 3.610445, 0, 0.2313726, 1, 1,
0.3435118, 1.554647, -2.100844, 0, 0.227451, 1, 1,
0.3458698, -1.459535, 1.835049, 0, 0.2196078, 1, 1,
0.3470651, -0.1328338, 1.133738, 0, 0.2156863, 1, 1,
0.3477522, 1.625349, -0.3779151, 0, 0.2078431, 1, 1,
0.3488999, -0.7264789, 1.135597, 0, 0.2039216, 1, 1,
0.3492333, -0.6074954, 2.293488, 0, 0.1960784, 1, 1,
0.3500819, -0.002764573, 1.300807, 0, 0.1882353, 1, 1,
0.3527448, 1.699276, -0.8038415, 0, 0.1843137, 1, 1,
0.3545016, 0.99344, 0.3556406, 0, 0.1764706, 1, 1,
0.3573617, 0.700229, -0.6144575, 0, 0.172549, 1, 1,
0.3602587, -0.8656917, 4.85275, 0, 0.1647059, 1, 1,
0.3612646, -2.341295, 3.51833, 0, 0.1607843, 1, 1,
0.3635753, 0.05211484, 2.719135, 0, 0.1529412, 1, 1,
0.3713518, 1.325751, 0.9105045, 0, 0.1490196, 1, 1,
0.373891, 0.3931464, 0.4404411, 0, 0.1411765, 1, 1,
0.3768062, -0.1802248, 0.5531512, 0, 0.1372549, 1, 1,
0.378717, -1.71749, 3.117502, 0, 0.1294118, 1, 1,
0.3804202, -0.2364069, 0.7030303, 0, 0.1254902, 1, 1,
0.3830389, -1.826632, 1.791785, 0, 0.1176471, 1, 1,
0.3876247, -1.487175, 3.611241, 0, 0.1137255, 1, 1,
0.3885985, -0.7342288, 3.696875, 0, 0.1058824, 1, 1,
0.3919603, 0.5050809, -0.3157218, 0, 0.09803922, 1, 1,
0.3946418, 1.463719, -0.8293118, 0, 0.09411765, 1, 1,
0.399196, 1.233116, -0.4976682, 0, 0.08627451, 1, 1,
0.4013777, 1.0366, 2.424719, 0, 0.08235294, 1, 1,
0.4035412, 0.1466877, 2.159579, 0, 0.07450981, 1, 1,
0.40649, 0.2882216, 1.10817, 0, 0.07058824, 1, 1,
0.4089593, -0.633673, 0.9627181, 0, 0.0627451, 1, 1,
0.4098397, -0.1603733, 4.143175, 0, 0.05882353, 1, 1,
0.4141033, 0.1536926, 1.850482, 0, 0.05098039, 1, 1,
0.4276027, 0.3372278, 1.028349, 0, 0.04705882, 1, 1,
0.4290992, -1.395679, 1.590462, 0, 0.03921569, 1, 1,
0.4291434, 1.561857, 1.390388, 0, 0.03529412, 1, 1,
0.4327747, 0.309851, 2.030326, 0, 0.02745098, 1, 1,
0.4335633, 0.2056311, 0.6717741, 0, 0.02352941, 1, 1,
0.4401243, 0.7460526, 0.4702753, 0, 0.01568628, 1, 1,
0.4424944, -0.1352599, 2.788487, 0, 0.01176471, 1, 1,
0.4427756, 1.65309, -0.6676872, 0, 0.003921569, 1, 1,
0.4430915, 1.010656, -0.08889318, 0.003921569, 0, 1, 1,
0.4471588, -0.5176892, 2.42999, 0.007843138, 0, 1, 1,
0.4504384, 0.2443683, 2.417497, 0.01568628, 0, 1, 1,
0.4526168, -0.02172976, 3.78359, 0.01960784, 0, 1, 1,
0.4538808, 0.6299684, 1.772352, 0.02745098, 0, 1, 1,
0.4539266, 0.09517384, -1.282207, 0.03137255, 0, 1, 1,
0.454482, 0.8376811, 0.3602774, 0.03921569, 0, 1, 1,
0.4619198, 1.336892, 0.1021309, 0.04313726, 0, 1, 1,
0.4622277, -0.6615154, 2.254577, 0.05098039, 0, 1, 1,
0.4633265, -0.7116297, 2.203835, 0.05490196, 0, 1, 1,
0.4646891, -1.50778, 3.329619, 0.0627451, 0, 1, 1,
0.4676612, -0.3647939, 3.789775, 0.06666667, 0, 1, 1,
0.4700375, 0.7334614, 1.808761, 0.07450981, 0, 1, 1,
0.4729982, 0.504272, 0.9198194, 0.07843138, 0, 1, 1,
0.4758455, 0.8487891, -0.8535504, 0.08627451, 0, 1, 1,
0.4766064, -2.01305, 2.633459, 0.09019608, 0, 1, 1,
0.4795454, -0.1545858, 1.361438, 0.09803922, 0, 1, 1,
0.4821703, -0.8473628, 2.2765, 0.1058824, 0, 1, 1,
0.4822326, 0.7176632, -0.03323695, 0.1098039, 0, 1, 1,
0.4830927, -0.8849467, 2.083266, 0.1176471, 0, 1, 1,
0.4834323, 0.5082346, -0.02822977, 0.1215686, 0, 1, 1,
0.4881442, -1.838187, 2.171334, 0.1294118, 0, 1, 1,
0.4954827, 0.7639564, 1.315247, 0.1333333, 0, 1, 1,
0.5046641, -0.477953, 2.735579, 0.1411765, 0, 1, 1,
0.5054799, 0.02887559, 2.171451, 0.145098, 0, 1, 1,
0.5082241, 1.168253, 0.8865405, 0.1529412, 0, 1, 1,
0.5091779, -0.6683097, 2.286698, 0.1568628, 0, 1, 1,
0.509407, -1.510894, 2.76108, 0.1647059, 0, 1, 1,
0.5142652, -1.710644, 3.28196, 0.1686275, 0, 1, 1,
0.5142736, -0.773294, 3.234428, 0.1764706, 0, 1, 1,
0.5231882, 0.7137522, -0.1094568, 0.1803922, 0, 1, 1,
0.5243908, 0.6873296, 1.043871, 0.1882353, 0, 1, 1,
0.5290174, -0.1118439, 3.491666, 0.1921569, 0, 1, 1,
0.5292478, -0.8751791, 3.385906, 0.2, 0, 1, 1,
0.5297161, -0.9339641, 1.813155, 0.2078431, 0, 1, 1,
0.5308506, -1.103278, 2.70645, 0.2117647, 0, 1, 1,
0.5310342, -0.4227454, 1.884264, 0.2196078, 0, 1, 1,
0.5426727, 0.8561184, 1.331122, 0.2235294, 0, 1, 1,
0.5468259, 1.552422, 0.9293808, 0.2313726, 0, 1, 1,
0.5484304, -0.07431386, 2.512435, 0.2352941, 0, 1, 1,
0.5516539, 0.2020682, 1.345752, 0.2431373, 0, 1, 1,
0.5531656, 1.32355, -1.990518, 0.2470588, 0, 1, 1,
0.5547571, -1.299612, 2.596166, 0.254902, 0, 1, 1,
0.5579782, -0.8774715, 3.264994, 0.2588235, 0, 1, 1,
0.5583296, 1.323433, 0.5107161, 0.2666667, 0, 1, 1,
0.5583724, 0.7679612, 0.5271609, 0.2705882, 0, 1, 1,
0.560002, -0.5541365, 3.164744, 0.2784314, 0, 1, 1,
0.5611273, 1.087353, 1.454733, 0.282353, 0, 1, 1,
0.5644792, 0.3577742, -0.3775522, 0.2901961, 0, 1, 1,
0.5690963, 0.3145883, 1.649941, 0.2941177, 0, 1, 1,
0.5706685, 1.843341, 0.2963667, 0.3019608, 0, 1, 1,
0.5792571, 1.793071, 0.469403, 0.3098039, 0, 1, 1,
0.5804775, 0.3075221, 0.06696337, 0.3137255, 0, 1, 1,
0.5829501, -0.49914, 2.676906, 0.3215686, 0, 1, 1,
0.5996131, 2.324328, 0.4186077, 0.3254902, 0, 1, 1,
0.599804, -1.244531, 4.871902, 0.3333333, 0, 1, 1,
0.6020175, -0.7914941, 3.348126, 0.3372549, 0, 1, 1,
0.6106194, -0.337685, 1.126407, 0.345098, 0, 1, 1,
0.6195409, 0.5861706, 0.7156892, 0.3490196, 0, 1, 1,
0.6198897, 0.01142465, 2.253427, 0.3568628, 0, 1, 1,
0.6244299, -1.079151, 3.047641, 0.3607843, 0, 1, 1,
0.6307065, 0.5882034, 0.3740709, 0.3686275, 0, 1, 1,
0.6320456, -0.8126111, 2.546395, 0.372549, 0, 1, 1,
0.6330252, -0.605646, 2.155484, 0.3803922, 0, 1, 1,
0.6338188, 0.7521788, -1.265711, 0.3843137, 0, 1, 1,
0.6362598, -0.7936368, 2.579634, 0.3921569, 0, 1, 1,
0.6367649, -0.5533875, 1.542312, 0.3960784, 0, 1, 1,
0.6388388, -2.324369, 1.887902, 0.4039216, 0, 1, 1,
0.6392551, -0.4160416, 2.787205, 0.4117647, 0, 1, 1,
0.6397615, 0.3901283, 0.920935, 0.4156863, 0, 1, 1,
0.6397756, -1.059555, 2.789749, 0.4235294, 0, 1, 1,
0.6512349, 0.258731, 1.640157, 0.427451, 0, 1, 1,
0.6556183, -0.1269617, 1.43052, 0.4352941, 0, 1, 1,
0.6628989, -0.2944078, 2.489248, 0.4392157, 0, 1, 1,
0.6649183, 0.2095973, 1.717778, 0.4470588, 0, 1, 1,
0.6659912, 0.4275037, 3.217108, 0.4509804, 0, 1, 1,
0.6661618, -1.870024, 3.165684, 0.4588235, 0, 1, 1,
0.6667529, -1.201414, 2.760727, 0.4627451, 0, 1, 1,
0.6792361, -0.411606, 1.082083, 0.4705882, 0, 1, 1,
0.680066, 2.497026, 0.7074644, 0.4745098, 0, 1, 1,
0.6812864, 1.370787, -1.084357, 0.4823529, 0, 1, 1,
0.6865993, 1.80605, -0.8939172, 0.4862745, 0, 1, 1,
0.6895699, 0.6073087, 1.448776, 0.4941176, 0, 1, 1,
0.6950635, 0.3581079, 2.132932, 0.5019608, 0, 1, 1,
0.6960327, -0.4923083, 2.503967, 0.5058824, 0, 1, 1,
0.6972693, 0.8586518, 1.527073, 0.5137255, 0, 1, 1,
0.6973818, -1.56557, 1.613086, 0.5176471, 0, 1, 1,
0.7014882, -0.6087392, 0.1352309, 0.5254902, 0, 1, 1,
0.7043856, -1.428665, 2.672558, 0.5294118, 0, 1, 1,
0.7080185, -1.421169, 2.261079, 0.5372549, 0, 1, 1,
0.7143015, -0.6943313, 0.2098673, 0.5411765, 0, 1, 1,
0.7180985, 0.7645709, 1.761012, 0.5490196, 0, 1, 1,
0.7206855, 1.117763, -1.862797, 0.5529412, 0, 1, 1,
0.7233388, -0.1944875, 0.201385, 0.5607843, 0, 1, 1,
0.7261925, 1.191279, -0.4767565, 0.5647059, 0, 1, 1,
0.7325564, 1.455828, -0.3928427, 0.572549, 0, 1, 1,
0.7346462, -1.266926, 3.312766, 0.5764706, 0, 1, 1,
0.7389674, 0.4939626, 2.24303, 0.5843138, 0, 1, 1,
0.7395044, -2.363771, 1.828544, 0.5882353, 0, 1, 1,
0.7399003, 0.873133, 2.019962, 0.5960785, 0, 1, 1,
0.7432533, 0.6483951, 1.47383, 0.6039216, 0, 1, 1,
0.744149, -0.6310485, 2.611718, 0.6078432, 0, 1, 1,
0.7444451, -0.3633949, 2.388197, 0.6156863, 0, 1, 1,
0.745784, 1.503684, 0.9925649, 0.6196079, 0, 1, 1,
0.7496371, -1.937782, 0.9754115, 0.627451, 0, 1, 1,
0.7522712, -1.555076, 3.482044, 0.6313726, 0, 1, 1,
0.7568704, 0.5390204, 0.9875518, 0.6392157, 0, 1, 1,
0.7608492, -0.9719669, -0.01509033, 0.6431373, 0, 1, 1,
0.761326, 0.7125362, 2.81665, 0.6509804, 0, 1, 1,
0.7613283, -0.2648958, 2.724909, 0.654902, 0, 1, 1,
0.7657692, -0.2072397, 2.836129, 0.6627451, 0, 1, 1,
0.7659538, 0.1562906, -1.071298, 0.6666667, 0, 1, 1,
0.7706821, 0.8038754, 0.3738572, 0.6745098, 0, 1, 1,
0.7746146, 1.267674, 0.6507453, 0.6784314, 0, 1, 1,
0.7802871, -0.4363175, 3.514241, 0.6862745, 0, 1, 1,
0.7917628, -0.6439581, 3.002281, 0.6901961, 0, 1, 1,
0.7934752, -0.820025, 2.702801, 0.6980392, 0, 1, 1,
0.7943105, -0.4979867, 3.155663, 0.7058824, 0, 1, 1,
0.7999028, 0.5948079, 2.271919, 0.7098039, 0, 1, 1,
0.8070522, -0.4881123, 1.35811, 0.7176471, 0, 1, 1,
0.8115512, -0.9842929, 2.794824, 0.7215686, 0, 1, 1,
0.8168178, -0.06102213, 0.8095987, 0.7294118, 0, 1, 1,
0.8168293, -1.289087, 2.46168, 0.7333333, 0, 1, 1,
0.8169622, 0.5381694, 2.569606, 0.7411765, 0, 1, 1,
0.8172147, 1.305129, 0.4736949, 0.7450981, 0, 1, 1,
0.817313, 0.7916541, 0.6540603, 0.7529412, 0, 1, 1,
0.8224066, 0.5877917, 0.9927211, 0.7568628, 0, 1, 1,
0.8235116, -0.7766454, 1.825465, 0.7647059, 0, 1, 1,
0.8276085, 1.197844, 1.33932, 0.7686275, 0, 1, 1,
0.8315423, 0.3241399, 0.406292, 0.7764706, 0, 1, 1,
0.8365006, -0.2619837, 3.117625, 0.7803922, 0, 1, 1,
0.841417, -0.5798917, 4.39146, 0.7882353, 0, 1, 1,
0.8457934, -0.8130961, 1.861752, 0.7921569, 0, 1, 1,
0.8506861, 2.04573, 0.4044145, 0.8, 0, 1, 1,
0.8591798, 0.6218826, -0.922407, 0.8078431, 0, 1, 1,
0.8602642, -0.7252117, 3.102844, 0.8117647, 0, 1, 1,
0.8607315, 0.001237968, 2.110186, 0.8196079, 0, 1, 1,
0.8610839, -0.3010491, 2.160255, 0.8235294, 0, 1, 1,
0.8635581, -0.9221616, 3.19078, 0.8313726, 0, 1, 1,
0.8659405, -0.9231254, 2.586789, 0.8352941, 0, 1, 1,
0.8663843, -1.66492, 2.950977, 0.8431373, 0, 1, 1,
0.8679191, -1.666031, 3.528242, 0.8470588, 0, 1, 1,
0.8732319, 0.3618653, 2.280805, 0.854902, 0, 1, 1,
0.8751636, -1.273852, 3.448303, 0.8588235, 0, 1, 1,
0.8787863, 1.150504, -0.3224304, 0.8666667, 0, 1, 1,
0.8826327, 0.04066299, 2.315159, 0.8705882, 0, 1, 1,
0.885771, 0.3683851, 1.804664, 0.8784314, 0, 1, 1,
0.8878055, 0.281208, 0.521025, 0.8823529, 0, 1, 1,
0.8898569, -0.3840095, 2.486283, 0.8901961, 0, 1, 1,
0.8975717, 0.7578372, 0.6776201, 0.8941177, 0, 1, 1,
0.9016759, -0.805744, 2.808109, 0.9019608, 0, 1, 1,
0.9022602, 1.176189, 2.902046, 0.9098039, 0, 1, 1,
0.9024296, 1.306074, -0.5230803, 0.9137255, 0, 1, 1,
0.9100375, -1.178772, 2.505529, 0.9215686, 0, 1, 1,
0.9215615, 0.153754, 0.8912758, 0.9254902, 0, 1, 1,
0.9289541, 0.9347771, -0.5746138, 0.9333333, 0, 1, 1,
0.934207, -1.118194, 2.000856, 0.9372549, 0, 1, 1,
0.9351264, 1.244193, 0.7512364, 0.945098, 0, 1, 1,
0.9387276, 0.6021259, 1.192791, 0.9490196, 0, 1, 1,
0.9428711, -2.06383, 2.954698, 0.9568627, 0, 1, 1,
0.9577354, -0.09634249, 1.215225, 0.9607843, 0, 1, 1,
0.9634116, 0.5845981, 1.203016, 0.9686275, 0, 1, 1,
0.968273, 0.7228319, 1.509893, 0.972549, 0, 1, 1,
0.9686394, -1.519751, 1.323175, 0.9803922, 0, 1, 1,
0.9713613, 0.08434325, -0.8916169, 0.9843137, 0, 1, 1,
0.97899, -0.7644222, 4.020328, 0.9921569, 0, 1, 1,
0.9825762, 0.1092462, 2.402988, 0.9960784, 0, 1, 1,
0.9884201, -1.606085, 1.549892, 1, 0, 0.9960784, 1,
0.9919354, 0.421553, 1.49838, 1, 0, 0.9882353, 1,
0.9952879, 1.483474, 0.5061944, 1, 0, 0.9843137, 1,
0.9961373, 0.7531016, 1.155019, 1, 0, 0.9764706, 1,
0.9968468, -1.22838, 3.220865, 1, 0, 0.972549, 1,
1.00046, 0.5107738, 0.9245825, 1, 0, 0.9647059, 1,
1.006761, 2.264787, 1.557926, 1, 0, 0.9607843, 1,
1.007347, -0.5373975, 2.194296, 1, 0, 0.9529412, 1,
1.00988, 2.154799, -0.1135608, 1, 0, 0.9490196, 1,
1.014016, 1.742686, -1.349863, 1, 0, 0.9411765, 1,
1.015814, -0.2688812, 2.519666, 1, 0, 0.9372549, 1,
1.016933, -1.797545, 1.985864, 1, 0, 0.9294118, 1,
1.016953, 0.6892858, -1.242366, 1, 0, 0.9254902, 1,
1.01823, -0.5212628, 2.439657, 1, 0, 0.9176471, 1,
1.019979, 0.4361834, 2.652554, 1, 0, 0.9137255, 1,
1.025782, 1.212864, 0.6435333, 1, 0, 0.9058824, 1,
1.042495, 0.07518635, 0.1814385, 1, 0, 0.9019608, 1,
1.044234, -0.3926626, 1.763632, 1, 0, 0.8941177, 1,
1.049323, 0.3549862, 2.993441, 1, 0, 0.8862745, 1,
1.05479, 0.06300858, 2.235834, 1, 0, 0.8823529, 1,
1.05738, -1.324648, 3.59005, 1, 0, 0.8745098, 1,
1.058589, -0.6982878, 2.387426, 1, 0, 0.8705882, 1,
1.061898, -0.04139601, 0.7851562, 1, 0, 0.8627451, 1,
1.062055, -0.2107162, 0.5735069, 1, 0, 0.8588235, 1,
1.062756, -1.024804, 1.95409, 1, 0, 0.8509804, 1,
1.069048, -1.008544, 2.666266, 1, 0, 0.8470588, 1,
1.0696, -0.5637096, 3.192972, 1, 0, 0.8392157, 1,
1.070112, 0.4395543, 1.563117, 1, 0, 0.8352941, 1,
1.075731, -0.8779959, 2.461987, 1, 0, 0.827451, 1,
1.076009, -0.208288, 0.9973649, 1, 0, 0.8235294, 1,
1.079146, -0.6440229, 0.6141289, 1, 0, 0.8156863, 1,
1.082801, 0.1644192, 0.9452435, 1, 0, 0.8117647, 1,
1.087256, 0.5755936, 0.7497148, 1, 0, 0.8039216, 1,
1.089559, 1.754258, 2.119677, 1, 0, 0.7960784, 1,
1.093382, 0.2827395, 1.306819, 1, 0, 0.7921569, 1,
1.106833, 0.9150894, 2.033209, 1, 0, 0.7843137, 1,
1.116162, -0.4832933, 2.82287, 1, 0, 0.7803922, 1,
1.11656, -0.2927015, 2.528971, 1, 0, 0.772549, 1,
1.117843, 0.6383318, 0.5831, 1, 0, 0.7686275, 1,
1.120429, -0.987541, 2.203741, 1, 0, 0.7607843, 1,
1.12452, 0.7145336, 0.8792133, 1, 0, 0.7568628, 1,
1.129697, -0.8402044, 2.254761, 1, 0, 0.7490196, 1,
1.133547, -0.4415773, 0.8488334, 1, 0, 0.7450981, 1,
1.135024, -0.4959416, 0.5408591, 1, 0, 0.7372549, 1,
1.136601, -2.076464, 1.973245, 1, 0, 0.7333333, 1,
1.144134, 0.8628898, 0.8364677, 1, 0, 0.7254902, 1,
1.145151, 0.8748471, 1.500866, 1, 0, 0.7215686, 1,
1.14569, 1.533905, 0.3059495, 1, 0, 0.7137255, 1,
1.146448, -0.4077965, 2.687043, 1, 0, 0.7098039, 1,
1.147912, -1.138565, 2.893203, 1, 0, 0.7019608, 1,
1.157412, -0.6423291, 3.899392, 1, 0, 0.6941177, 1,
1.175838, -0.5768356, 2.074049, 1, 0, 0.6901961, 1,
1.177358, 0.4465008, 0.3556762, 1, 0, 0.682353, 1,
1.178104, 1.452359, 1.78709, 1, 0, 0.6784314, 1,
1.19423, -0.1016449, 0.8445911, 1, 0, 0.6705883, 1,
1.196548, -0.440938, 2.306204, 1, 0, 0.6666667, 1,
1.196646, 1.548482, 0.8463077, 1, 0, 0.6588235, 1,
1.210367, -0.5250026, 1.187986, 1, 0, 0.654902, 1,
1.22043, 0.8155234, 1.674969, 1, 0, 0.6470588, 1,
1.221587, 0.4004309, 0.430378, 1, 0, 0.6431373, 1,
1.222162, -2.168231, 1.188421, 1, 0, 0.6352941, 1,
1.227367, 0.3290124, -0.2066177, 1, 0, 0.6313726, 1,
1.23699, -0.6946738, 2.154403, 1, 0, 0.6235294, 1,
1.23866, -0.1107462, 2.003088, 1, 0, 0.6196079, 1,
1.240534, 0.6877726, 1.925814, 1, 0, 0.6117647, 1,
1.250011, -1.137977, 3.083616, 1, 0, 0.6078432, 1,
1.250621, 0.266841, -0.7786759, 1, 0, 0.6, 1,
1.258341, 0.8447352, 1.070963, 1, 0, 0.5921569, 1,
1.262157, -1.229603, 1.381973, 1, 0, 0.5882353, 1,
1.268829, -0.4613701, 2.046101, 1, 0, 0.5803922, 1,
1.272941, 1.277704, 1.810554, 1, 0, 0.5764706, 1,
1.277659, 0.2109952, 2.227486, 1, 0, 0.5686275, 1,
1.279332, -1.357816, 1.511319, 1, 0, 0.5647059, 1,
1.280723, 0.1828657, -0.5245367, 1, 0, 0.5568628, 1,
1.282546, -1.799047, 2.723089, 1, 0, 0.5529412, 1,
1.298428, -1.275654, 2.513263, 1, 0, 0.5450981, 1,
1.303312, -0.3838996, 2.720831, 1, 0, 0.5411765, 1,
1.308234, -0.5577823, 2.477199, 1, 0, 0.5333334, 1,
1.308339, -0.1634396, -0.04625084, 1, 0, 0.5294118, 1,
1.311193, 0.2267972, 1.360538, 1, 0, 0.5215687, 1,
1.311648, 0.3369997, -0.04659111, 1, 0, 0.5176471, 1,
1.327455, -0.5604788, 2.25772, 1, 0, 0.509804, 1,
1.332057, -0.978746, 0.2974148, 1, 0, 0.5058824, 1,
1.337561, 0.9337117, -0.02690265, 1, 0, 0.4980392, 1,
1.342358, 1.578092, -0.2005645, 1, 0, 0.4901961, 1,
1.351443, 1.04653, 0.672237, 1, 0, 0.4862745, 1,
1.368414, -0.5038576, 3.404179, 1, 0, 0.4784314, 1,
1.377479, -0.7769493, 2.199062, 1, 0, 0.4745098, 1,
1.382233, 0.880173, 2.881762, 1, 0, 0.4666667, 1,
1.400945, -0.1596446, 0.9632623, 1, 0, 0.4627451, 1,
1.402172, 0.6108508, 2.186732, 1, 0, 0.454902, 1,
1.403533, 0.6607153, 1.592913, 1, 0, 0.4509804, 1,
1.405097, -0.9294249, 0.5519343, 1, 0, 0.4431373, 1,
1.405621, -0.2807343, 3.63075, 1, 0, 0.4392157, 1,
1.40841, 0.682388, 1.933544, 1, 0, 0.4313726, 1,
1.416323, -0.09093761, 1.599521, 1, 0, 0.427451, 1,
1.418342, 0.7090229, 0.06767706, 1, 0, 0.4196078, 1,
1.421104, 0.8658471, 2.411566, 1, 0, 0.4156863, 1,
1.425534, 1.270426, 2.455586, 1, 0, 0.4078431, 1,
1.425762, 0.02147214, -0.5999306, 1, 0, 0.4039216, 1,
1.435001, -0.05384878, 0.4918725, 1, 0, 0.3960784, 1,
1.441979, 0.7042276, 3.150979, 1, 0, 0.3882353, 1,
1.443604, -0.5189435, 0.8946419, 1, 0, 0.3843137, 1,
1.443974, 1.27878, 1.66748, 1, 0, 0.3764706, 1,
1.457112, 0.6035794, 1.481544, 1, 0, 0.372549, 1,
1.472173, -0.7909909, 1.889278, 1, 0, 0.3647059, 1,
1.475724, 0.2989542, -0.06370568, 1, 0, 0.3607843, 1,
1.478843, -0.4308367, 1.008535, 1, 0, 0.3529412, 1,
1.479505, -0.08319286, 2.621683, 1, 0, 0.3490196, 1,
1.481601, 0.7555166, 1.647909, 1, 0, 0.3411765, 1,
1.483302, 0.360181, 0.5951076, 1, 0, 0.3372549, 1,
1.485942, 0.4835436, 0.8698173, 1, 0, 0.3294118, 1,
1.489893, -1.171294, 4.19968, 1, 0, 0.3254902, 1,
1.4936, -1.985732, 2.615377, 1, 0, 0.3176471, 1,
1.495797, 0.4651891, 0.8817303, 1, 0, 0.3137255, 1,
1.508828, -0.03764125, 0.1953612, 1, 0, 0.3058824, 1,
1.510591, -0.4318741, 3.397649, 1, 0, 0.2980392, 1,
1.513369, 0.9392087, 1.338991, 1, 0, 0.2941177, 1,
1.527409, -0.837892, 0.2105632, 1, 0, 0.2862745, 1,
1.555702, 1.447552, 1.93392, 1, 0, 0.282353, 1,
1.58623, 1.024866, 1.551123, 1, 0, 0.2745098, 1,
1.600773, -1.719763, 2.583959, 1, 0, 0.2705882, 1,
1.612681, 1.791467, -0.8947998, 1, 0, 0.2627451, 1,
1.615963, -0.3253177, 1.489333, 1, 0, 0.2588235, 1,
1.619724, -0.284473, 0.1813964, 1, 0, 0.2509804, 1,
1.622931, -0.7589754, 3.264665, 1, 0, 0.2470588, 1,
1.624758, 1.727086, 0.8778789, 1, 0, 0.2392157, 1,
1.625811, 1.14383, 2.21015, 1, 0, 0.2352941, 1,
1.639468, -0.4647946, 1.740192, 1, 0, 0.227451, 1,
1.658645, 1.060679, 1.268038, 1, 0, 0.2235294, 1,
1.685427, 0.1921122, 2.843551, 1, 0, 0.2156863, 1,
1.714564, 1.045144, 1.172018, 1, 0, 0.2117647, 1,
1.714882, 1.246392, 2.308042, 1, 0, 0.2039216, 1,
1.728497, -0.5768371, 3.177267, 1, 0, 0.1960784, 1,
1.736844, 0.6084117, 0.6254957, 1, 0, 0.1921569, 1,
1.738077, -0.7096669, 2.314203, 1, 0, 0.1843137, 1,
1.741152, -0.4445224, 1.26922, 1, 0, 0.1803922, 1,
1.77044, -1.026269, 1.747109, 1, 0, 0.172549, 1,
1.812114, 1.122781, 0.3446426, 1, 0, 0.1686275, 1,
1.816558, -1.43929, 2.416256, 1, 0, 0.1607843, 1,
1.823014, 0.206035, 1.498759, 1, 0, 0.1568628, 1,
1.862459, 0.1626133, -0.227666, 1, 0, 0.1490196, 1,
1.8855, 0.2734439, 1.762404, 1, 0, 0.145098, 1,
1.909175, -0.7014228, 1.600818, 1, 0, 0.1372549, 1,
1.919273, 0.1640367, 0.7562895, 1, 0, 0.1333333, 1,
1.919768, -1.822613, 2.342961, 1, 0, 0.1254902, 1,
1.96058, -1.732433, 2.940663, 1, 0, 0.1215686, 1,
1.995493, -0.4657105, 2.540992, 1, 0, 0.1137255, 1,
2.063812, 0.2816647, 0.6574245, 1, 0, 0.1098039, 1,
2.065364, -0.2774077, 1.852939, 1, 0, 0.1019608, 1,
2.089191, -0.9838043, 3.185977, 1, 0, 0.09411765, 1,
2.106735, -0.750259, 1.412414, 1, 0, 0.09019608, 1,
2.154104, 1.92148, 0.1838758, 1, 0, 0.08235294, 1,
2.163211, -0.3763312, 0.6794441, 1, 0, 0.07843138, 1,
2.185284, 0.3175445, -0.6243135, 1, 0, 0.07058824, 1,
2.192412, 2.729382, 0.3881635, 1, 0, 0.06666667, 1,
2.249088, -0.3363134, 1.489432, 1, 0, 0.05882353, 1,
2.265306, -0.9027264, 1.167568, 1, 0, 0.05490196, 1,
2.272578, -0.7340831, 2.40811, 1, 0, 0.04705882, 1,
2.321319, -0.361332, 0.7007284, 1, 0, 0.04313726, 1,
2.336569, -0.8049588, 3.245567, 1, 0, 0.03529412, 1,
2.478861, -0.6448358, 2.725202, 1, 0, 0.03137255, 1,
2.508823, -0.08529348, 2.517482, 1, 0, 0.02352941, 1,
2.632253, 1.320382, 1.707444, 1, 0, 0.01960784, 1,
2.641422, 0.3562028, 1.489915, 1, 0, 0.01176471, 1,
2.76528, -1.567722, 2.02368, 1, 0, 0.007843138, 1
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
-0.1850084, -3.947394, -6.878236, 0, -0.5, 0.5, 0.5,
-0.1850084, -3.947394, -6.878236, 1, -0.5, 0.5, 0.5,
-0.1850084, -3.947394, -6.878236, 1, 1.5, 0.5, 0.5,
-0.1850084, -3.947394, -6.878236, 0, 1.5, 0.5, 0.5
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
-4.135445, -0.07224596, -6.878236, 0, -0.5, 0.5, 0.5,
-4.135445, -0.07224596, -6.878236, 1, -0.5, 0.5, 0.5,
-4.135445, -0.07224596, -6.878236, 1, 1.5, 0.5, 0.5,
-4.135445, -0.07224596, -6.878236, 0, 1.5, 0.5, 0.5
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
-4.135445, -3.947394, -0.1516709, 0, -0.5, 0.5, 0.5,
-4.135445, -3.947394, -0.1516709, 1, -0.5, 0.5, 0.5,
-4.135445, -3.947394, -0.1516709, 1, 1.5, 0.5, 0.5,
-4.135445, -3.947394, -0.1516709, 0, 1.5, 0.5, 0.5
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
-3, -3.053129, -5.325952,
2, -3.053129, -5.325952,
-3, -3.053129, -5.325952,
-3, -3.202173, -5.584666,
-2, -3.053129, -5.325952,
-2, -3.202173, -5.584666,
-1, -3.053129, -5.325952,
-1, -3.202173, -5.584666,
0, -3.053129, -5.325952,
0, -3.202173, -5.584666,
1, -3.053129, -5.325952,
1, -3.202173, -5.584666,
2, -3.053129, -5.325952,
2, -3.202173, -5.584666
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
-3, -3.500262, -6.102094, 0, -0.5, 0.5, 0.5,
-3, -3.500262, -6.102094, 1, -0.5, 0.5, 0.5,
-3, -3.500262, -6.102094, 1, 1.5, 0.5, 0.5,
-3, -3.500262, -6.102094, 0, 1.5, 0.5, 0.5,
-2, -3.500262, -6.102094, 0, -0.5, 0.5, 0.5,
-2, -3.500262, -6.102094, 1, -0.5, 0.5, 0.5,
-2, -3.500262, -6.102094, 1, 1.5, 0.5, 0.5,
-2, -3.500262, -6.102094, 0, 1.5, 0.5, 0.5,
-1, -3.500262, -6.102094, 0, -0.5, 0.5, 0.5,
-1, -3.500262, -6.102094, 1, -0.5, 0.5, 0.5,
-1, -3.500262, -6.102094, 1, 1.5, 0.5, 0.5,
-1, -3.500262, -6.102094, 0, 1.5, 0.5, 0.5,
0, -3.500262, -6.102094, 0, -0.5, 0.5, 0.5,
0, -3.500262, -6.102094, 1, -0.5, 0.5, 0.5,
0, -3.500262, -6.102094, 1, 1.5, 0.5, 0.5,
0, -3.500262, -6.102094, 0, 1.5, 0.5, 0.5,
1, -3.500262, -6.102094, 0, -0.5, 0.5, 0.5,
1, -3.500262, -6.102094, 1, -0.5, 0.5, 0.5,
1, -3.500262, -6.102094, 1, 1.5, 0.5, 0.5,
1, -3.500262, -6.102094, 0, 1.5, 0.5, 0.5,
2, -3.500262, -6.102094, 0, -0.5, 0.5, 0.5,
2, -3.500262, -6.102094, 1, -0.5, 0.5, 0.5,
2, -3.500262, -6.102094, 1, 1.5, 0.5, 0.5,
2, -3.500262, -6.102094, 0, 1.5, 0.5, 0.5
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
-3.223806, -2, -5.325952,
-3.223806, 2, -5.325952,
-3.223806, -2, -5.325952,
-3.375746, -2, -5.584666,
-3.223806, -1, -5.325952,
-3.375746, -1, -5.584666,
-3.223806, 0, -5.325952,
-3.375746, 0, -5.584666,
-3.223806, 1, -5.325952,
-3.375746, 1, -5.584666,
-3.223806, 2, -5.325952,
-3.375746, 2, -5.584666
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
-3.679625, -2, -6.102094, 0, -0.5, 0.5, 0.5,
-3.679625, -2, -6.102094, 1, -0.5, 0.5, 0.5,
-3.679625, -2, -6.102094, 1, 1.5, 0.5, 0.5,
-3.679625, -2, -6.102094, 0, 1.5, 0.5, 0.5,
-3.679625, -1, -6.102094, 0, -0.5, 0.5, 0.5,
-3.679625, -1, -6.102094, 1, -0.5, 0.5, 0.5,
-3.679625, -1, -6.102094, 1, 1.5, 0.5, 0.5,
-3.679625, -1, -6.102094, 0, 1.5, 0.5, 0.5,
-3.679625, 0, -6.102094, 0, -0.5, 0.5, 0.5,
-3.679625, 0, -6.102094, 1, -0.5, 0.5, 0.5,
-3.679625, 0, -6.102094, 1, 1.5, 0.5, 0.5,
-3.679625, 0, -6.102094, 0, 1.5, 0.5, 0.5,
-3.679625, 1, -6.102094, 0, -0.5, 0.5, 0.5,
-3.679625, 1, -6.102094, 1, -0.5, 0.5, 0.5,
-3.679625, 1, -6.102094, 1, 1.5, 0.5, 0.5,
-3.679625, 1, -6.102094, 0, 1.5, 0.5, 0.5,
-3.679625, 2, -6.102094, 0, -0.5, 0.5, 0.5,
-3.679625, 2, -6.102094, 1, -0.5, 0.5, 0.5,
-3.679625, 2, -6.102094, 1, 1.5, 0.5, 0.5,
-3.679625, 2, -6.102094, 0, 1.5, 0.5, 0.5
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
-3.223806, -3.053129, -4,
-3.223806, -3.053129, 4,
-3.223806, -3.053129, -4,
-3.375746, -3.202173, -4,
-3.223806, -3.053129, -2,
-3.375746, -3.202173, -2,
-3.223806, -3.053129, 0,
-3.375746, -3.202173, 0,
-3.223806, -3.053129, 2,
-3.375746, -3.202173, 2,
-3.223806, -3.053129, 4,
-3.375746, -3.202173, 4
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
-3.679625, -3.500262, -4, 0, -0.5, 0.5, 0.5,
-3.679625, -3.500262, -4, 1, -0.5, 0.5, 0.5,
-3.679625, -3.500262, -4, 1, 1.5, 0.5, 0.5,
-3.679625, -3.500262, -4, 0, 1.5, 0.5, 0.5,
-3.679625, -3.500262, -2, 0, -0.5, 0.5, 0.5,
-3.679625, -3.500262, -2, 1, -0.5, 0.5, 0.5,
-3.679625, -3.500262, -2, 1, 1.5, 0.5, 0.5,
-3.679625, -3.500262, -2, 0, 1.5, 0.5, 0.5,
-3.679625, -3.500262, 0, 0, -0.5, 0.5, 0.5,
-3.679625, -3.500262, 0, 1, -0.5, 0.5, 0.5,
-3.679625, -3.500262, 0, 1, 1.5, 0.5, 0.5,
-3.679625, -3.500262, 0, 0, 1.5, 0.5, 0.5,
-3.679625, -3.500262, 2, 0, -0.5, 0.5, 0.5,
-3.679625, -3.500262, 2, 1, -0.5, 0.5, 0.5,
-3.679625, -3.500262, 2, 1, 1.5, 0.5, 0.5,
-3.679625, -3.500262, 2, 0, 1.5, 0.5, 0.5,
-3.679625, -3.500262, 4, 0, -0.5, 0.5, 0.5,
-3.679625, -3.500262, 4, 1, -0.5, 0.5, 0.5,
-3.679625, -3.500262, 4, 1, 1.5, 0.5, 0.5,
-3.679625, -3.500262, 4, 0, 1.5, 0.5, 0.5
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
-3.223806, -3.053129, -5.325952,
-3.223806, 2.908637, -5.325952,
-3.223806, -3.053129, 5.02261,
-3.223806, 2.908637, 5.02261,
-3.223806, -3.053129, -5.325952,
-3.223806, -3.053129, 5.02261,
-3.223806, 2.908637, -5.325952,
-3.223806, 2.908637, 5.02261,
-3.223806, -3.053129, -5.325952,
2.853789, -3.053129, -5.325952,
-3.223806, -3.053129, 5.02261,
2.853789, -3.053129, 5.02261,
-3.223806, 2.908637, -5.325952,
2.853789, 2.908637, -5.325952,
-3.223806, 2.908637, 5.02261,
2.853789, 2.908637, 5.02261,
2.853789, -3.053129, -5.325952,
2.853789, 2.908637, -5.325952,
2.853789, -3.053129, 5.02261,
2.853789, 2.908637, 5.02261,
2.853789, -3.053129, -5.325952,
2.853789, -3.053129, 5.02261,
2.853789, 2.908637, -5.325952,
2.853789, 2.908637, 5.02261
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
var radius = 7.155589;
var distance = 31.83602;
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
mvMatrix.translate( 0.1850084, 0.07224596, 0.1516709 );
mvMatrix.scale( 1.272998, 1.29773, 0.7476173 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -31.83602);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
pyridazine_N-oxide<-read.table("pyridazine_N-oxide.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pyridazine_N-oxide$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyridazine_N' not found
```

```r
y<-pyridazine_N-oxide$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyridazine_N' not found
```

```r
z<-pyridazine_N-oxide$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyridazine_N' not found
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
-3.135297, -0.5413902, -2.033304, 0, 0, 1, 1, 1,
-3.078465, 0.06733975, -2.208697, 1, 0, 0, 1, 1,
-2.619834, -0.6861381, -0.9703916, 1, 0, 0, 1, 1,
-2.606181, -1.215251, -1.997219, 1, 0, 0, 1, 1,
-2.469062, -1.072735, -1.125669, 1, 0, 0, 1, 1,
-2.437693, 0.3986459, -1.851419, 1, 0, 0, 1, 1,
-2.337766, 1.365887, 0.4301739, 0, 0, 0, 1, 1,
-2.278029, -0.2973449, -1.625163, 0, 0, 0, 1, 1,
-2.22631, 1.440174, -1.18887, 0, 0, 0, 1, 1,
-2.202524, -0.5647323, -4.860178, 0, 0, 0, 1, 1,
-2.194914, 0.9592849, -0.2559479, 0, 0, 0, 1, 1,
-2.182099, -0.5106905, -1.886499, 0, 0, 0, 1, 1,
-2.13282, -0.9242132, -2.098949, 0, 0, 0, 1, 1,
-2.127908, -0.451563, -1.545442, 1, 1, 1, 1, 1,
-2.101804, -0.1739474, -1.836648, 1, 1, 1, 1, 1,
-2.071821, 0.2656615, -1.658335, 1, 1, 1, 1, 1,
-2.029857, 0.5299675, -0.8893151, 1, 1, 1, 1, 1,
-2.019509, -0.149844, -0.9829385, 1, 1, 1, 1, 1,
-1.990599, -1.046469, -2.058193, 1, 1, 1, 1, 1,
-1.975592, 0.2425635, -0.2119278, 1, 1, 1, 1, 1,
-1.957965, 1.603736, 0.03137347, 1, 1, 1, 1, 1,
-1.940292, 1.111929, -1.04892, 1, 1, 1, 1, 1,
-1.872916, 2.05139, -0.9915796, 1, 1, 1, 1, 1,
-1.860522, -0.4446428, -1.857859, 1, 1, 1, 1, 1,
-1.854111, -1.090709, -3.26915, 1, 1, 1, 1, 1,
-1.853079, -0.8765308, -2.808425, 1, 1, 1, 1, 1,
-1.849436, 0.4946499, -0.1328756, 1, 1, 1, 1, 1,
-1.844547, 1.315189, 0.06610093, 1, 1, 1, 1, 1,
-1.842922, 1.634829, 0.09463426, 0, 0, 1, 1, 1,
-1.829266, -0.06545002, -0.2353266, 1, 0, 0, 1, 1,
-1.824374, -1.282164, -2.481844, 1, 0, 0, 1, 1,
-1.823684, 0.01456314, 0.05777337, 1, 0, 0, 1, 1,
-1.795802, -2.298527, -1.205189, 1, 0, 0, 1, 1,
-1.792128, 0.8612331, -0.5241209, 1, 0, 0, 1, 1,
-1.766831, -0.08525409, -1.46089, 0, 0, 0, 1, 1,
-1.759913, -1.016836, 0.8700992, 0, 0, 0, 1, 1,
-1.750029, 0.2019994, -2.894052, 0, 0, 0, 1, 1,
-1.725619, -0.7047735, -0.2715385, 0, 0, 0, 1, 1,
-1.723951, 0.020154, -2.111415, 0, 0, 0, 1, 1,
-1.718879, 0.2703641, -1.426565, 0, 0, 0, 1, 1,
-1.714701, 0.4925222, -0.4976662, 0, 0, 0, 1, 1,
-1.68538, -0.1746073, -2.893477, 1, 1, 1, 1, 1,
-1.684166, 1.037688, -2.234871, 1, 1, 1, 1, 1,
-1.678025, 1.231332, -0.1471202, 1, 1, 1, 1, 1,
-1.657439, 0.03067684, -1.530768, 1, 1, 1, 1, 1,
-1.647329, 0.269302, -1.466404, 1, 1, 1, 1, 1,
-1.6146, -2.863305, -1.105049, 1, 1, 1, 1, 1,
-1.61348, 0.2138311, -0.6375942, 1, 1, 1, 1, 1,
-1.603159, -0.7455492, -3.389479, 1, 1, 1, 1, 1,
-1.59429, -0.007679436, -1.438339, 1, 1, 1, 1, 1,
-1.581389, -0.1266825, -1.043921, 1, 1, 1, 1, 1,
-1.575938, -0.02086377, -1.801514, 1, 1, 1, 1, 1,
-1.568417, 0.8039223, -2.188657, 1, 1, 1, 1, 1,
-1.567571, 0.8524189, -2.204956, 1, 1, 1, 1, 1,
-1.567086, 0.03840946, -2.411495, 1, 1, 1, 1, 1,
-1.565499, 0.3711099, -2.228613, 1, 1, 1, 1, 1,
-1.55206, 0.6675821, -3.290246, 0, 0, 1, 1, 1,
-1.542259, -0.6121072, -3.066678, 1, 0, 0, 1, 1,
-1.534495, -0.6831687, -2.696686, 1, 0, 0, 1, 1,
-1.521279, 0.6915991, -1.796727, 1, 0, 0, 1, 1,
-1.513628, -1.083965, -3.716748, 1, 0, 0, 1, 1,
-1.513362, -0.09498936, -0.4792093, 1, 0, 0, 1, 1,
-1.510156, 1.605611, -0.5601671, 0, 0, 0, 1, 1,
-1.502524, 0.005220895, 0.3646579, 0, 0, 0, 1, 1,
-1.498335, 0.5388764, -0.8342784, 0, 0, 0, 1, 1,
-1.481385, 0.2310539, -0.7802457, 0, 0, 0, 1, 1,
-1.470543, -0.6240336, -2.625617, 0, 0, 0, 1, 1,
-1.451996, -0.4382818, -0.7720684, 0, 0, 0, 1, 1,
-1.448025, 1.544535, -0.3069374, 0, 0, 0, 1, 1,
-1.43632, 0.2903971, -3.175822, 1, 1, 1, 1, 1,
-1.435213, 0.466937, -0.8319842, 1, 1, 1, 1, 1,
-1.433345, -1.689085, -2.611511, 1, 1, 1, 1, 1,
-1.43127, 2.154613, -2.102652, 1, 1, 1, 1, 1,
-1.428068, -0.6009312, -2.68381, 1, 1, 1, 1, 1,
-1.426535, 2.729011, 0.4128288, 1, 1, 1, 1, 1,
-1.417363, -1.686073, -2.09572, 1, 1, 1, 1, 1,
-1.413563, 1.150012, 0.2629073, 1, 1, 1, 1, 1,
-1.4121, 0.4558837, -0.2341427, 1, 1, 1, 1, 1,
-1.400405, -0.3307454, -2.315405, 1, 1, 1, 1, 1,
-1.400253, -0.6748406, -2.436097, 1, 1, 1, 1, 1,
-1.396612, 0.1865768, -1.441697, 1, 1, 1, 1, 1,
-1.391958, 0.8866537, -0.5030783, 1, 1, 1, 1, 1,
-1.389292, -0.9453067, -1.410576, 1, 1, 1, 1, 1,
-1.388159, 0.08923773, -0.06374458, 1, 1, 1, 1, 1,
-1.385375, -0.1223939, -0.9199678, 0, 0, 1, 1, 1,
-1.384079, 1.275543, -0.1234341, 1, 0, 0, 1, 1,
-1.379748, -0.1168554, -2.28945, 1, 0, 0, 1, 1,
-1.37582, 0.1877892, -2.706322, 1, 0, 0, 1, 1,
-1.373951, -0.4899318, -2.298724, 1, 0, 0, 1, 1,
-1.366355, -0.233669, -0.8997236, 1, 0, 0, 1, 1,
-1.365993, -0.01290154, -0.997653, 0, 0, 0, 1, 1,
-1.357544, -0.8023072, -0.8948973, 0, 0, 0, 1, 1,
-1.355785, -1.180651, -1.550108, 0, 0, 0, 1, 1,
-1.351368, 0.7180395, -1.2739, 0, 0, 0, 1, 1,
-1.350148, 1.381633, -2.377325, 0, 0, 0, 1, 1,
-1.340691, 0.8157587, -0.2476628, 0, 0, 0, 1, 1,
-1.335396, -0.6763627, -3.349054, 0, 0, 0, 1, 1,
-1.318137, 0.4870732, -1.432156, 1, 1, 1, 1, 1,
-1.314804, 0.7393439, 0.1327907, 1, 1, 1, 1, 1,
-1.31319, 0.1620019, -0.7013259, 1, 1, 1, 1, 1,
-1.298475, 1.434352, -1.107402, 1, 1, 1, 1, 1,
-1.290943, -0.4564478, -1.910205, 1, 1, 1, 1, 1,
-1.287509, -0.5722116, -1.329522, 1, 1, 1, 1, 1,
-1.281444, 1.55818, -0.1782573, 1, 1, 1, 1, 1,
-1.265893, -0.2506559, -1.286475, 1, 1, 1, 1, 1,
-1.26552, 0.4624312, -0.5601602, 1, 1, 1, 1, 1,
-1.263166, -0.1567717, -2.623113, 1, 1, 1, 1, 1,
-1.246924, 0.7978792, -1.633365, 1, 1, 1, 1, 1,
-1.244367, -0.2751959, 0.4100134, 1, 1, 1, 1, 1,
-1.234848, -0.1290287, -2.053778, 1, 1, 1, 1, 1,
-1.223602, -0.2804015, -1.774723, 1, 1, 1, 1, 1,
-1.213003, 0.418181, -0.5869407, 1, 1, 1, 1, 1,
-1.208638, 0.2960378, -1.15371, 0, 0, 1, 1, 1,
-1.204487, -1.004917, -3.632194, 1, 0, 0, 1, 1,
-1.203007, 0.002127792, -1.203973, 1, 0, 0, 1, 1,
-1.202761, -0.5621662, -1.647968, 1, 0, 0, 1, 1,
-1.198635, 2.276168, -0.06037673, 1, 0, 0, 1, 1,
-1.198033, -0.1206637, -1.14122, 1, 0, 0, 1, 1,
-1.197043, -0.3705015, -2.168563, 0, 0, 0, 1, 1,
-1.195741, 0.33097, -1.295832, 0, 0, 0, 1, 1,
-1.188866, 1.642556, 0.5507709, 0, 0, 0, 1, 1,
-1.186352, 0.2580568, -2.161937, 0, 0, 0, 1, 1,
-1.172447, -0.7705454, -1.650257, 0, 0, 0, 1, 1,
-1.164091, -0.466078, -2.47802, 0, 0, 0, 1, 1,
-1.158376, 0.6519191, -2.76933, 0, 0, 0, 1, 1,
-1.154223, -0.8798837, -0.1437905, 1, 1, 1, 1, 1,
-1.152508, 1.346942, 0.03512657, 1, 1, 1, 1, 1,
-1.147169, -1.267565, -1.975556, 1, 1, 1, 1, 1,
-1.142916, 1.904832, -0.4627244, 1, 1, 1, 1, 1,
-1.142565, -2.103959, -2.778675, 1, 1, 1, 1, 1,
-1.140912, -1.061963, -3.1152, 1, 1, 1, 1, 1,
-1.127395, 0.06079368, -1.298336, 1, 1, 1, 1, 1,
-1.12712, -0.6023955, -2.2051, 1, 1, 1, 1, 1,
-1.126094, 0.3470778, -2.479157, 1, 1, 1, 1, 1,
-1.118992, 2.095134, 0.4027022, 1, 1, 1, 1, 1,
-1.113216, 1.862329, -2.114479, 1, 1, 1, 1, 1,
-1.105067, 0.7690656, -0.819758, 1, 1, 1, 1, 1,
-1.102168, -0.4991317, -2.767606, 1, 1, 1, 1, 1,
-1.097488, 2.269682, -0.1042728, 1, 1, 1, 1, 1,
-1.095286, -0.6383231, -1.542597, 1, 1, 1, 1, 1,
-1.090945, -1.589958, -3.705597, 0, 0, 1, 1, 1,
-1.089595, -1.764213, -1.776558, 1, 0, 0, 1, 1,
-1.086781, -1.594654, -2.857741, 1, 0, 0, 1, 1,
-1.085474, -0.5171726, -2.370782, 1, 0, 0, 1, 1,
-1.082605, 1.508279, -0.4697836, 1, 0, 0, 1, 1,
-1.0765, 1.7684, 0.2069482, 1, 0, 0, 1, 1,
-1.071449, -1.136811, -1.858605, 0, 0, 0, 1, 1,
-1.069492, 0.5607296, -0.3725255, 0, 0, 0, 1, 1,
-1.064374, -0.4501705, -3.115425, 0, 0, 0, 1, 1,
-1.05845, 0.6847044, -1.632218, 0, 0, 0, 1, 1,
-1.041081, 0.1242386, -0.2286525, 0, 0, 0, 1, 1,
-1.040475, 2.058158, -1.300346, 0, 0, 0, 1, 1,
-1.039642, -0.01768771, -1.032064, 0, 0, 0, 1, 1,
-1.037919, -0.1427702, -1.49203, 1, 1, 1, 1, 1,
-1.036253, 0.9092353, -0.3786271, 1, 1, 1, 1, 1,
-1.034155, -0.8058764, -2.012025, 1, 1, 1, 1, 1,
-1.025587, 0.5836657, -1.735193, 1, 1, 1, 1, 1,
-1.020562, -0.5697207, -2.461348, 1, 1, 1, 1, 1,
-1.019767, -0.7018632, -0.8789474, 1, 1, 1, 1, 1,
-1.018727, 0.7973815, -0.1108449, 1, 1, 1, 1, 1,
-1.016222, -0.7801203, -2.352807, 1, 1, 1, 1, 1,
-1.014323, -2.166728, -3.15174, 1, 1, 1, 1, 1,
-1.01163, 2.079044, -1.104935, 1, 1, 1, 1, 1,
-1.011373, -0.8160742, -0.6044399, 1, 1, 1, 1, 1,
-0.9967173, 0.3180105, -1.096739, 1, 1, 1, 1, 1,
-0.9911535, -1.237946, -1.865144, 1, 1, 1, 1, 1,
-0.9899732, 0.2494274, -0.5557446, 1, 1, 1, 1, 1,
-0.9839689, 1.256046, 0.2402928, 1, 1, 1, 1, 1,
-0.9802412, 0.3748082, -0.9151816, 0, 0, 1, 1, 1,
-0.9757783, -1.120862, -0.7004705, 1, 0, 0, 1, 1,
-0.9737098, 0.9706486, 0.1087154, 1, 0, 0, 1, 1,
-0.971557, -0.8830954, -2.246242, 1, 0, 0, 1, 1,
-0.9619706, -0.534915, -1.578661, 1, 0, 0, 1, 1,
-0.9580799, -0.1234039, -2.416513, 1, 0, 0, 1, 1,
-0.9517837, -1.579273, -2.590544, 0, 0, 0, 1, 1,
-0.9442811, 1.037472, -0.2759178, 0, 0, 0, 1, 1,
-0.942943, -1.435293, -3.492023, 0, 0, 0, 1, 1,
-0.9392969, -2.094684, -3.000668, 0, 0, 0, 1, 1,
-0.9380295, 0.554835, -0.2443352, 0, 0, 0, 1, 1,
-0.9370205, 1.186355, -0.8359017, 0, 0, 0, 1, 1,
-0.935035, -1.666764, -1.663501, 0, 0, 0, 1, 1,
-0.9330104, -2.025612, -2.105788, 1, 1, 1, 1, 1,
-0.9282737, 0.4020512, -1.872421, 1, 1, 1, 1, 1,
-0.9224869, -1.05138, -2.018795, 1, 1, 1, 1, 1,
-0.9108068, -0.6187977, -2.473662, 1, 1, 1, 1, 1,
-0.9059423, 1.103885, -1.238918, 1, 1, 1, 1, 1,
-0.9019688, -0.2749892, -1.232217, 1, 1, 1, 1, 1,
-0.8970833, 0.6460671, -1.311153, 1, 1, 1, 1, 1,
-0.8940002, 0.622113, -0.3126246, 1, 1, 1, 1, 1,
-0.8865495, -0.9654391, -1.950023, 1, 1, 1, 1, 1,
-0.8845477, 0.6574049, -1.596721, 1, 1, 1, 1, 1,
-0.8811929, -2.111869, -1.824768, 1, 1, 1, 1, 1,
-0.8663467, 0.3108425, -0.7192817, 1, 1, 1, 1, 1,
-0.865075, 0.2769871, -0.8076708, 1, 1, 1, 1, 1,
-0.8650058, 0.2774097, 0.4394071, 1, 1, 1, 1, 1,
-0.8571913, -0.007146462, -1.690998, 1, 1, 1, 1, 1,
-0.8567997, -1.392012, -3.382323, 0, 0, 1, 1, 1,
-0.8470509, -2.026448, -2.830678, 1, 0, 0, 1, 1,
-0.8457094, -0.5194895, -1.801043, 1, 0, 0, 1, 1,
-0.8348947, 1.82641, -0.6413543, 1, 0, 0, 1, 1,
-0.8292977, 0.6819664, -1.959676, 1, 0, 0, 1, 1,
-0.8249517, 0.7308046, -2.511592, 1, 0, 0, 1, 1,
-0.8221586, 0.8930692, -1.171452, 0, 0, 0, 1, 1,
-0.8177059, -2.095111, -1.123583, 0, 0, 0, 1, 1,
-0.8122922, 2.354386, 1.818432, 0, 0, 0, 1, 1,
-0.8098852, 0.5356094, -0.2132391, 0, 0, 0, 1, 1,
-0.8096318, 0.4975585, -2.567285, 0, 0, 0, 1, 1,
-0.8072093, 0.1877839, -0.5042148, 0, 0, 0, 1, 1,
-0.8061482, -0.8250768, -4.422726, 0, 0, 0, 1, 1,
-0.8021845, -0.01843594, 1.058296, 1, 1, 1, 1, 1,
-0.8019676, 0.5566898, 0.5708242, 1, 1, 1, 1, 1,
-0.8006821, 1.095622, 0.8448949, 1, 1, 1, 1, 1,
-0.7997319, 0.08205209, -0.2040985, 1, 1, 1, 1, 1,
-0.7982641, -0.5248774, -1.511642, 1, 1, 1, 1, 1,
-0.7970706, -0.3408486, -2.870927, 1, 1, 1, 1, 1,
-0.7953025, 0.1475738, -0.4885494, 1, 1, 1, 1, 1,
-0.7936773, 0.7560132, -0.7836009, 1, 1, 1, 1, 1,
-0.7847753, -0.3388599, -2.151455, 1, 1, 1, 1, 1,
-0.7791372, 0.3548405, -0.1215026, 1, 1, 1, 1, 1,
-0.7729159, 0.8710592, -1.544901, 1, 1, 1, 1, 1,
-0.7727283, -1.865828, -2.488554, 1, 1, 1, 1, 1,
-0.7708302, -0.4522375, -2.274145, 1, 1, 1, 1, 1,
-0.7692442, -2.111865, -1.698737, 1, 1, 1, 1, 1,
-0.7682219, 0.6206217, 0.1726064, 1, 1, 1, 1, 1,
-0.7679704, -1.250302, -4.379354, 0, 0, 1, 1, 1,
-0.762466, 0.6747556, -1.830677, 1, 0, 0, 1, 1,
-0.7591444, -0.6267513, -1.765586, 1, 0, 0, 1, 1,
-0.7581787, 0.4953158, -1.178027, 1, 0, 0, 1, 1,
-0.7550477, 0.9479527, -0.7438355, 1, 0, 0, 1, 1,
-0.7481504, 1.200145, 0.2161868, 1, 0, 0, 1, 1,
-0.7471002, -0.5107403, -2.061795, 0, 0, 0, 1, 1,
-0.7426551, -0.4217559, -3.884791, 0, 0, 0, 1, 1,
-0.7388012, -2.157302, -3.393914, 0, 0, 0, 1, 1,
-0.7312045, 1.93423, -0.518586, 0, 0, 0, 1, 1,
-0.7273507, 1.123133, 0.3264263, 0, 0, 0, 1, 1,
-0.7263494, 0.954019, -1.090241, 0, 0, 0, 1, 1,
-0.7263085, 0.2369607, -1.281569, 0, 0, 0, 1, 1,
-0.7225605, 1.076344, -0.5209417, 1, 1, 1, 1, 1,
-0.722235, 0.3858105, -0.2648349, 1, 1, 1, 1, 1,
-0.7183456, -0.5012802, -1.053167, 1, 1, 1, 1, 1,
-0.7169877, 0.8795664, 0.9312705, 1, 1, 1, 1, 1,
-0.7101293, -0.2587618, -2.90251, 1, 1, 1, 1, 1,
-0.7053795, 0.6862923, 0.4869704, 1, 1, 1, 1, 1,
-0.7034107, 0.2205689, -0.2362657, 1, 1, 1, 1, 1,
-0.6970173, -1.221189, -1.886737, 1, 1, 1, 1, 1,
-0.6935474, 0.6703376, 0.622076, 1, 1, 1, 1, 1,
-0.6927782, -1.459345, -2.626704, 1, 1, 1, 1, 1,
-0.6907444, 1.342988, 0.4794287, 1, 1, 1, 1, 1,
-0.6898542, 0.2451712, -1.173738, 1, 1, 1, 1, 1,
-0.6879763, 1.810673, -1.592366, 1, 1, 1, 1, 1,
-0.6857671, 0.336033, 1.294637, 1, 1, 1, 1, 1,
-0.6768082, 1.121774, -0.714622, 1, 1, 1, 1, 1,
-0.6737757, 0.8632668, -0.5010464, 0, 0, 1, 1, 1,
-0.6715247, -0.02433805, -2.186839, 1, 0, 0, 1, 1,
-0.6695544, 1.498578, -0.3884876, 1, 0, 0, 1, 1,
-0.6647089, -2.110501, -2.86921, 1, 0, 0, 1, 1,
-0.6632476, -0.751398, -2.091226, 1, 0, 0, 1, 1,
-0.6624159, 1.440912, 0.6919439, 1, 0, 0, 1, 1,
-0.6586531, 1.875445, -0.8583826, 0, 0, 0, 1, 1,
-0.6581271, 0.0893659, -1.265259, 0, 0, 0, 1, 1,
-0.6534466, -0.9548079, -2.396044, 0, 0, 0, 1, 1,
-0.6513744, -0.5553485, -1.972042, 0, 0, 0, 1, 1,
-0.6496224, 0.4769143, -0.758155, 0, 0, 0, 1, 1,
-0.6489301, 0.5039054, -2.006767, 0, 0, 0, 1, 1,
-0.6478762, 1.110079, -1.572634, 0, 0, 0, 1, 1,
-0.645312, -1.129278, -4.250194, 1, 1, 1, 1, 1,
-0.6431172, 1.811213, 0.2769741, 1, 1, 1, 1, 1,
-0.6417698, 1.144639, 0.968775, 1, 1, 1, 1, 1,
-0.6400309, 0.2270353, -0.8793934, 1, 1, 1, 1, 1,
-0.6362531, 1.054925, 0.2852138, 1, 1, 1, 1, 1,
-0.6342835, -1.042775, -1.648161, 1, 1, 1, 1, 1,
-0.6334168, 0.2966089, -2.064383, 1, 1, 1, 1, 1,
-0.6309679, 1.221144, -1.125874, 1, 1, 1, 1, 1,
-0.628831, -2.39686, -1.635926, 1, 1, 1, 1, 1,
-0.6269209, -0.6504685, -2.554921, 1, 1, 1, 1, 1,
-0.6266019, 1.421548, 1.201173, 1, 1, 1, 1, 1,
-0.6236622, -1.272551, -2.88215, 1, 1, 1, 1, 1,
-0.6182668, 1.14533, 1.988418, 1, 1, 1, 1, 1,
-0.617992, 0.2820307, -2.04848, 1, 1, 1, 1, 1,
-0.6147491, -0.2901036, -2.387125, 1, 1, 1, 1, 1,
-0.6142004, 0.6224039, -0.8254505, 0, 0, 1, 1, 1,
-0.6098972, 0.2737297, -0.7595649, 1, 0, 0, 1, 1,
-0.6098092, -0.7021802, -3.909714, 1, 0, 0, 1, 1,
-0.6090903, 0.03707269, -2.37886, 1, 0, 0, 1, 1,
-0.6075594, -0.04427061, 0.2458462, 1, 0, 0, 1, 1,
-0.6044554, 0.5793004, -2.025878, 1, 0, 0, 1, 1,
-0.6028011, -0.335905, -0.9459821, 0, 0, 0, 1, 1,
-0.6020256, -0.3607543, -2.734885, 0, 0, 0, 1, 1,
-0.5885404, -0.6434613, -1.304237, 0, 0, 0, 1, 1,
-0.5878221, 0.9997923, -0.8477741, 0, 0, 0, 1, 1,
-0.5840789, 1.735932, -1.572459, 0, 0, 0, 1, 1,
-0.579643, -0.3814543, -2.314699, 0, 0, 0, 1, 1,
-0.5783038, -1.378758, -1.870574, 0, 0, 0, 1, 1,
-0.5782714, 0.02663804, -0.6911031, 1, 1, 1, 1, 1,
-0.5768426, -0.2260137, -2.224829, 1, 1, 1, 1, 1,
-0.5641455, -1.678396, -1.945498, 1, 1, 1, 1, 1,
-0.5627046, 0.779336, -0.484568, 1, 1, 1, 1, 1,
-0.5541057, 1.727393, -0.00160491, 1, 1, 1, 1, 1,
-0.5514932, -1.991257, -2.783776, 1, 1, 1, 1, 1,
-0.5465376, -0.3457187, -0.7697571, 1, 1, 1, 1, 1,
-0.5461124, 1.490854, 1.299597, 1, 1, 1, 1, 1,
-0.5436832, -1.157331, -1.859815, 1, 1, 1, 1, 1,
-0.5217739, 0.2707717, -1.640871, 1, 1, 1, 1, 1,
-0.5191074, -0.4302419, -0.7365538, 1, 1, 1, 1, 1,
-0.5150079, 1.028653, -1.850107, 1, 1, 1, 1, 1,
-0.510927, -0.4347519, -3.400444, 1, 1, 1, 1, 1,
-0.5108991, 0.4754474, -1.383649, 1, 1, 1, 1, 1,
-0.5094401, -0.0971425, -2.483147, 1, 1, 1, 1, 1,
-0.5034969, 2.412845, 0.2454302, 0, 0, 1, 1, 1,
-0.4994339, 0.5847735, -1.73313, 1, 0, 0, 1, 1,
-0.4986085, 0.216437, -1.572713, 1, 0, 0, 1, 1,
-0.4978976, 0.945634, 0.0647247, 1, 0, 0, 1, 1,
-0.4902895, 0.7909398, -0.7236085, 1, 0, 0, 1, 1,
-0.4895434, -0.4668551, -2.559313, 1, 0, 0, 1, 1,
-0.4894041, 0.6877028, -0.01183175, 0, 0, 0, 1, 1,
-0.4846067, -0.3329355, -1.628189, 0, 0, 0, 1, 1,
-0.4810742, 0.5908224, -0.8412942, 0, 0, 0, 1, 1,
-0.4794316, 0.4549852, -1.824266, 0, 0, 0, 1, 1,
-0.4752945, -0.3984027, -1.155621, 0, 0, 0, 1, 1,
-0.4741034, 0.3024831, 0.4490647, 0, 0, 0, 1, 1,
-0.4716243, -1.708821, -2.593032, 0, 0, 0, 1, 1,
-0.4711666, -1.572623, -2.734754, 1, 1, 1, 1, 1,
-0.4676836, 0.6447405, -0.783124, 1, 1, 1, 1, 1,
-0.4676071, -0.3242641, -1.279573, 1, 1, 1, 1, 1,
-0.4668171, 0.1319257, -0.9689211, 1, 1, 1, 1, 1,
-0.4642124, -0.9006711, -3.755663, 1, 1, 1, 1, 1,
-0.4551747, -0.352009, -2.194838, 1, 1, 1, 1, 1,
-0.4453864, 0.8463619, -1.670438, 1, 1, 1, 1, 1,
-0.445097, -0.7039684, -2.65457, 1, 1, 1, 1, 1,
-0.4366578, -0.1836613, -3.163824, 1, 1, 1, 1, 1,
-0.4365738, -0.5808972, -1.393926, 1, 1, 1, 1, 1,
-0.432327, 1.293506, 0.2752072, 1, 1, 1, 1, 1,
-0.4320282, -0.02919601, 0.2185959, 1, 1, 1, 1, 1,
-0.4254014, -0.6369202, -2.872897, 1, 1, 1, 1, 1,
-0.4242309, 0.4400766, -2.22017, 1, 1, 1, 1, 1,
-0.4177816, 0.5656717, -1.83187, 1, 1, 1, 1, 1,
-0.417515, 0.5930158, -2.155834, 0, 0, 1, 1, 1,
-0.4159831, -0.03152647, -1.021981, 1, 0, 0, 1, 1,
-0.413281, 0.9526734, -0.255799, 1, 0, 0, 1, 1,
-0.4100207, 1.812811, 0.2309958, 1, 0, 0, 1, 1,
-0.4077126, 0.08797254, -1.493412, 1, 0, 0, 1, 1,
-0.3963591, -0.4345306, -3.308346, 1, 0, 0, 1, 1,
-0.3904459, 0.4494959, -0.7568063, 0, 0, 0, 1, 1,
-0.3760664, 0.4317567, 0.4280315, 0, 0, 0, 1, 1,
-0.3750406, 1.752114, -0.5661899, 0, 0, 0, 1, 1,
-0.3749642, 1.566076, -1.475877, 0, 0, 0, 1, 1,
-0.3716179, -0.1850531, -1.641278, 0, 0, 0, 1, 1,
-0.3682884, -0.2122424, -2.421865, 0, 0, 0, 1, 1,
-0.3594527, -1.035503, -2.765682, 0, 0, 0, 1, 1,
-0.359011, 0.2255387, -0.03259244, 1, 1, 1, 1, 1,
-0.3588709, 0.086437, -0.5573149, 1, 1, 1, 1, 1,
-0.3572757, 2.780376, -1.197751, 1, 1, 1, 1, 1,
-0.3570622, -1.44894, -2.484874, 1, 1, 1, 1, 1,
-0.3566471, 0.5288343, -0.6525381, 1, 1, 1, 1, 1,
-0.3563699, -2.602106, -2.301722, 1, 1, 1, 1, 1,
-0.3525331, -0.7232028, -3.195962, 1, 1, 1, 1, 1,
-0.3523771, -1.800613, -1.23912, 1, 1, 1, 1, 1,
-0.3501636, 0.04505608, -0.5993365, 1, 1, 1, 1, 1,
-0.3486297, -1.878135, -3.396157, 1, 1, 1, 1, 1,
-0.3404268, 0.853368, -1.237156, 1, 1, 1, 1, 1,
-0.3390973, 2.636341, 0.2190338, 1, 1, 1, 1, 1,
-0.335764, -1.163791, -0.4222247, 1, 1, 1, 1, 1,
-0.3348266, 1.505935, 0.2576491, 1, 1, 1, 1, 1,
-0.3306479, 0.2546425, -0.6170405, 1, 1, 1, 1, 1,
-0.32839, 0.5702117, 0.6950421, 0, 0, 1, 1, 1,
-0.326871, -0.4979091, -4.177705, 1, 0, 0, 1, 1,
-0.3260981, -0.6805579, -0.7052669, 1, 0, 0, 1, 1,
-0.3236955, 0.179963, -0.2349387, 1, 0, 0, 1, 1,
-0.3217253, 1.05171, -0.3555964, 1, 0, 0, 1, 1,
-0.3151194, 0.1464629, -1.63912, 1, 0, 0, 1, 1,
-0.3112713, -0.5851142, -2.581732, 0, 0, 0, 1, 1,
-0.3065676, 0.5136274, -0.2260529, 0, 0, 0, 1, 1,
-0.3006363, 1.685028, 0.102951, 0, 0, 0, 1, 1,
-0.3006192, 0.9784272, -0.4328741, 0, 0, 0, 1, 1,
-0.2980937, 1.217257, -0.994297, 0, 0, 0, 1, 1,
-0.2953388, -0.5685942, -0.9226376, 0, 0, 0, 1, 1,
-0.2778881, -1.499325, -3.6041, 0, 0, 0, 1, 1,
-0.2769555, 1.198173, 0.4534543, 1, 1, 1, 1, 1,
-0.2767005, -0.4507294, -1.499327, 1, 1, 1, 1, 1,
-0.2744233, 0.2330023, -0.4534764, 1, 1, 1, 1, 1,
-0.2718202, -1.724725, -3.709923, 1, 1, 1, 1, 1,
-0.2696992, 1.466367, 0.2453814, 1, 1, 1, 1, 1,
-0.2686498, 0.6887854, 0.3858506, 1, 1, 1, 1, 1,
-0.2664182, 0.6085274, 0.5557778, 1, 1, 1, 1, 1,
-0.2619466, -0.03232658, -2.456504, 1, 1, 1, 1, 1,
-0.2600319, -0.9183105, -2.076025, 1, 1, 1, 1, 1,
-0.2590248, -1.211113, -3.374399, 1, 1, 1, 1, 1,
-0.2549493, -0.2358184, -1.920586, 1, 1, 1, 1, 1,
-0.2517948, -0.4297923, -3.83843, 1, 1, 1, 1, 1,
-0.25156, 0.4009703, -1.5461, 1, 1, 1, 1, 1,
-0.2498866, 0.496596, 0.9990518, 1, 1, 1, 1, 1,
-0.2495372, -0.2365852, -4.941377, 1, 1, 1, 1, 1,
-0.2480605, -0.1883547, -3.438644, 0, 0, 1, 1, 1,
-0.2449403, 0.3228278, 0.3908409, 1, 0, 0, 1, 1,
-0.2441564, 0.1419795, -0.2488018, 1, 0, 0, 1, 1,
-0.2419628, -1.415134, -4.23954, 1, 0, 0, 1, 1,
-0.2383932, 0.1254431, -2.188761, 1, 0, 0, 1, 1,
-0.2340051, 0.3426011, -1.712337, 1, 0, 0, 1, 1,
-0.2339591, -1.101412, -2.185701, 0, 0, 0, 1, 1,
-0.2319753, -0.9964921, -4.560129, 0, 0, 0, 1, 1,
-0.2307293, -0.8165832, -3.572034, 0, 0, 0, 1, 1,
-0.2286699, 0.3477645, 0.2333189, 0, 0, 0, 1, 1,
-0.2253654, -1.321018, -3.90435, 0, 0, 0, 1, 1,
-0.2250261, -0.7686956, -4.811293, 0, 0, 0, 1, 1,
-0.2216515, 0.3484588, -0.1570157, 0, 0, 0, 1, 1,
-0.2213452, 1.66262, 1.899256, 1, 1, 1, 1, 1,
-0.2209839, -0.5362595, -1.828562, 1, 1, 1, 1, 1,
-0.2190583, 0.6608471, -0.02727161, 1, 1, 1, 1, 1,
-0.2184506, -0.6834078, -1.963795, 1, 1, 1, 1, 1,
-0.2169336, 0.9477497, -0.8566337, 1, 1, 1, 1, 1,
-0.2140489, -0.4921941, -1.801145, 1, 1, 1, 1, 1,
-0.2111162, -1.162252, -3.78551, 1, 1, 1, 1, 1,
-0.2108945, -0.9174806, -3.143506, 1, 1, 1, 1, 1,
-0.2069521, 1.313187, -0.519925, 1, 1, 1, 1, 1,
-0.203315, -0.4959154, -4.560015, 1, 1, 1, 1, 1,
-0.19436, 0.8512438, 0.03698286, 1, 1, 1, 1, 1,
-0.1937728, 1.828332, 0.2831568, 1, 1, 1, 1, 1,
-0.1901126, -0.8795118, -4.374313, 1, 1, 1, 1, 1,
-0.1896456, -1.08011, -4.645078, 1, 1, 1, 1, 1,
-0.1892134, 0.382503, -0.8941616, 1, 1, 1, 1, 1,
-0.187005, 1.430356, -0.05274193, 0, 0, 1, 1, 1,
-0.1861546, -0.01914867, -1.621123, 1, 0, 0, 1, 1,
-0.1825967, 0.6028339, -0.5175607, 1, 0, 0, 1, 1,
-0.1823332, 0.07249235, -1.028027, 1, 0, 0, 1, 1,
-0.1797869, 0.458616, -0.2012467, 1, 0, 0, 1, 1,
-0.1758195, -1.715087, -0.6312513, 1, 0, 0, 1, 1,
-0.1755141, 0.5690331, 1.16974, 0, 0, 0, 1, 1,
-0.1712759, -0.1932414, -2.349271, 0, 0, 0, 1, 1,
-0.1688152, 0.6770367, 2.187024, 0, 0, 0, 1, 1,
-0.1665031, -0.05958251, -3.112875, 0, 0, 0, 1, 1,
-0.1566813, 0.05141551, 0.5862178, 0, 0, 0, 1, 1,
-0.1531821, 0.8649414, 0.5198628, 0, 0, 0, 1, 1,
-0.1501269, -0.177509, -2.233766, 0, 0, 0, 1, 1,
-0.150028, 0.6358225, 1.209797, 1, 1, 1, 1, 1,
-0.1454488, -0.5642903, -0.8601598, 1, 1, 1, 1, 1,
-0.1426504, 1.244732, -1.374601, 1, 1, 1, 1, 1,
-0.1378393, -1.121565, -2.98045, 1, 1, 1, 1, 1,
-0.1360582, -0.2969465, -2.607092, 1, 1, 1, 1, 1,
-0.1320753, 0.5021631, -1.148384, 1, 1, 1, 1, 1,
-0.1308637, 2.757244, -0.6607192, 1, 1, 1, 1, 1,
-0.1229754, -0.01455776, -1.54936, 1, 1, 1, 1, 1,
-0.1203364, -1.674069, -2.130262, 1, 1, 1, 1, 1,
-0.1201803, -1.15802, -2.843762, 1, 1, 1, 1, 1,
-0.119574, -1.78438, -2.450114, 1, 1, 1, 1, 1,
-0.1146882, -1.471274, -2.875859, 1, 1, 1, 1, 1,
-0.1119806, -0.698613, -2.453386, 1, 1, 1, 1, 1,
-0.1118675, 1.866881, 1.457669, 1, 1, 1, 1, 1,
-0.1056179, -0.1765479, -1.722781, 1, 1, 1, 1, 1,
-0.1041493, -0.8744953, -3.427056, 0, 0, 1, 1, 1,
-0.1001428, 1.330138, 0.679201, 1, 0, 0, 1, 1,
-0.09936075, 1.024637, 1.089655, 1, 0, 0, 1, 1,
-0.09739543, -2.730462, -3.948329, 1, 0, 0, 1, 1,
-0.0973846, -0.6437937, -3.647323, 1, 0, 0, 1, 1,
-0.0931145, -1.278907, -4.985956, 1, 0, 0, 1, 1,
-0.09284487, -0.8074484, -4.202115, 0, 0, 0, 1, 1,
-0.09029815, -0.2915032, -0.8758824, 0, 0, 0, 1, 1,
-0.08675389, -0.2894244, -4.04726, 0, 0, 0, 1, 1,
-0.08648247, -0.67168, -2.832468, 0, 0, 0, 1, 1,
-0.08567362, -0.4567084, -3.157851, 0, 0, 0, 1, 1,
-0.0852088, -0.2152123, -2.038385, 0, 0, 0, 1, 1,
-0.08379108, -0.6041995, -3.984188, 0, 0, 0, 1, 1,
-0.08219246, 1.329702, -0.8802346, 1, 1, 1, 1, 1,
-0.07954208, -0.1088833, -3.899961, 1, 1, 1, 1, 1,
-0.07951397, -0.7242414, -3.232668, 1, 1, 1, 1, 1,
-0.07808019, -2.175704, -2.171506, 1, 1, 1, 1, 1,
-0.07745117, 0.1975289, -0.1244716, 1, 1, 1, 1, 1,
-0.07544428, -0.4106086, -3.675931, 1, 1, 1, 1, 1,
-0.0714158, -0.5501024, -3.867737, 1, 1, 1, 1, 1,
-0.07100727, -1.241606, -2.791983, 1, 1, 1, 1, 1,
-0.06901875, -0.3373666, -4.067563, 1, 1, 1, 1, 1,
-0.06724608, -0.4103954, -3.546524, 1, 1, 1, 1, 1,
-0.06438763, -1.199434, -5.175244, 1, 1, 1, 1, 1,
-0.06227359, 0.4535944, -0.01989243, 1, 1, 1, 1, 1,
-0.06079125, -1.409762, -4.048717, 1, 1, 1, 1, 1,
-0.06049589, -1.498311, -2.350394, 1, 1, 1, 1, 1,
-0.05980763, 2.238492, 0.2384169, 1, 1, 1, 1, 1,
-0.05946571, 0.0239386, -1.75797, 0, 0, 1, 1, 1,
-0.05693671, -0.3514694, -2.831427, 1, 0, 0, 1, 1,
-0.05611001, -0.8720996, -4.170031, 1, 0, 0, 1, 1,
-0.05254144, 1.522576, 0.7324212, 1, 0, 0, 1, 1,
-0.05253645, -0.1037712, -1.625637, 1, 0, 0, 1, 1,
-0.05249952, 0.6614628, -0.440796, 1, 0, 0, 1, 1,
-0.05073294, -0.2048007, -2.506455, 0, 0, 0, 1, 1,
-0.04891103, -1.63289, -0.5183949, 0, 0, 0, 1, 1,
-0.04636472, -0.2108957, -4.82277, 0, 0, 0, 1, 1,
-0.04587794, -0.8335999, -3.939374, 0, 0, 0, 1, 1,
-0.04529425, -1.115176, -2.026322, 0, 0, 0, 1, 1,
-0.04257672, 0.01967952, 0.4024747, 0, 0, 0, 1, 1,
-0.03621765, 1.306793, 0.3370564, 0, 0, 0, 1, 1,
-0.03589303, 0.3293425, 1.024977, 1, 1, 1, 1, 1,
-0.03489672, -0.8569537, -2.252072, 1, 1, 1, 1, 1,
-0.03446613, 1.023968, 0.3375159, 1, 1, 1, 1, 1,
-0.03331947, -0.01380685, -2.902293, 1, 1, 1, 1, 1,
-0.02844606, 1.009424, -0.2121768, 1, 1, 1, 1, 1,
-0.02730598, 0.8347839, 1.801714, 1, 1, 1, 1, 1,
-0.02572039, 1.04414, 1.395352, 1, 1, 1, 1, 1,
-0.02555701, 0.3475129, 1.049496, 1, 1, 1, 1, 1,
-0.02517556, 0.5774313, 0.4577662, 1, 1, 1, 1, 1,
-0.02450769, -1.643692, -1.958763, 1, 1, 1, 1, 1,
-0.0240214, -0.1021466, -2.994244, 1, 1, 1, 1, 1,
-0.02159452, 0.2403444, -0.1813819, 1, 1, 1, 1, 1,
-0.0156041, -0.6434782, -2.328829, 1, 1, 1, 1, 1,
-0.01021469, -2.770588, -3.179649, 1, 1, 1, 1, 1,
-0.00782193, -1.82627, -1.808975, 1, 1, 1, 1, 1,
-0.002505957, -0.3889976, -2.614605, 0, 0, 1, 1, 1,
-0.0001353734, 0.3802346, 0.853914, 1, 0, 0, 1, 1,
0.002103117, -0.9934533, 3.086463, 1, 0, 0, 1, 1,
0.00308022, 0.3330395, -0.7966776, 1, 0, 0, 1, 1,
0.003351758, 1.997843, 0.8098729, 1, 0, 0, 1, 1,
0.004584878, 0.9493049, -0.2034768, 1, 0, 0, 1, 1,
0.006187449, 0.5453765, 0.1630249, 0, 0, 0, 1, 1,
0.006871302, -0.9407911, 3.124549, 0, 0, 0, 1, 1,
0.01040796, 0.1600495, 2.151622, 0, 0, 0, 1, 1,
0.01068791, 0.5465738, -1.244578, 0, 0, 0, 1, 1,
0.01141452, 0.8985577, -0.3493801, 0, 0, 0, 1, 1,
0.01177353, 0.9996447, -0.3939542, 0, 0, 0, 1, 1,
0.01812315, 0.8689539, -0.1464681, 0, 0, 0, 1, 1,
0.02298898, 1.790834, 1.044017, 1, 1, 1, 1, 1,
0.02448686, 1.215332, -0.06306671, 1, 1, 1, 1, 1,
0.02858089, -0.6505846, 2.567241, 1, 1, 1, 1, 1,
0.03202778, 0.1049342, -0.08180042, 1, 1, 1, 1, 1,
0.03742408, 1.618102, -0.3983721, 1, 1, 1, 1, 1,
0.04134504, -0.9702047, 3.414208, 1, 1, 1, 1, 1,
0.04657566, 0.4856996, -1.650921, 1, 1, 1, 1, 1,
0.04984282, -0.1674829, 4.612258, 1, 1, 1, 1, 1,
0.05054276, -0.1412988, 3.624634, 1, 1, 1, 1, 1,
0.05127256, -0.5338795, 2.454212, 1, 1, 1, 1, 1,
0.05145187, 0.2713409, 1.075403, 1, 1, 1, 1, 1,
0.05257245, 0.4561665, -0.8539407, 1, 1, 1, 1, 1,
0.0544106, -1.042838, 3.536475, 1, 1, 1, 1, 1,
0.0555498, 0.1309893, -0.06492832, 1, 1, 1, 1, 1,
0.06004033, -0.3005909, 1.768711, 1, 1, 1, 1, 1,
0.06037721, -0.9948993, 4.255813, 0, 0, 1, 1, 1,
0.06349824, -1.807016, 4.079321, 1, 0, 0, 1, 1,
0.07251015, -1.54357, 4.753932, 1, 0, 0, 1, 1,
0.07409775, -1.360308, 3.313065, 1, 0, 0, 1, 1,
0.08083002, 0.7449623, 0.8121268, 1, 0, 0, 1, 1,
0.0810233, 0.3289397, 0.1285846, 1, 0, 0, 1, 1,
0.08484291, 1.029378, -1.060817, 0, 0, 0, 1, 1,
0.08792155, -1.134202, 4.700644, 0, 0, 0, 1, 1,
0.08925623, -1.161312, 3.971747, 0, 0, 0, 1, 1,
0.09135661, -2.966307, 2.627296, 0, 0, 0, 1, 1,
0.09146464, 0.650512, 1.425654, 0, 0, 0, 1, 1,
0.09384645, -1.197001, 2.944566, 0, 0, 0, 1, 1,
0.09559849, 0.4768482, -0.05895442, 0, 0, 0, 1, 1,
0.09735042, -0.8778216, 3.564937, 1, 1, 1, 1, 1,
0.1023774, 0.7339559, 0.866114, 1, 1, 1, 1, 1,
0.1057993, 0.4958833, -0.8823868, 1, 1, 1, 1, 1,
0.10699, 1.544654, 0.06266103, 1, 1, 1, 1, 1,
0.1071201, -0.5756955, 3.695791, 1, 1, 1, 1, 1,
0.110169, 0.7491247, 1.698069, 1, 1, 1, 1, 1,
0.1141219, 0.8474283, -0.2315759, 1, 1, 1, 1, 1,
0.1142316, -1.977901, 2.485207, 1, 1, 1, 1, 1,
0.1146235, 1.155437, -1.518193, 1, 1, 1, 1, 1,
0.1148291, -1.55153, 2.898037, 1, 1, 1, 1, 1,
0.1156593, 0.7016172, 0.6065188, 1, 1, 1, 1, 1,
0.116194, -0.926944, 3.761252, 1, 1, 1, 1, 1,
0.1168725, 0.9015651, 0.3766444, 1, 1, 1, 1, 1,
0.1222335, 0.8039605, -0.6317549, 1, 1, 1, 1, 1,
0.1227549, 0.7870233, -0.2793352, 1, 1, 1, 1, 1,
0.126005, -1.059546, 2.887864, 0, 0, 1, 1, 1,
0.1268322, -0.7821071, 3.661475, 1, 0, 0, 1, 1,
0.1274186, 0.8678514, -0.05651616, 1, 0, 0, 1, 1,
0.128117, -1.766441, 3.336095, 1, 0, 0, 1, 1,
0.1321388, -1.000188, 3.076909, 1, 0, 0, 1, 1,
0.138018, 0.135782, -0.2590485, 1, 0, 0, 1, 1,
0.1438831, 0.8797686, 1.911039, 0, 0, 0, 1, 1,
0.1457327, -0.9548007, 1.888764, 0, 0, 0, 1, 1,
0.1473698, 0.578351, 1.610327, 0, 0, 0, 1, 1,
0.1525746, -1.395624, 2.383765, 0, 0, 0, 1, 1,
0.15439, -0.1125192, -0.4906398, 0, 0, 0, 1, 1,
0.1579523, -1.145349, 2.704889, 0, 0, 0, 1, 1,
0.1581368, -1.175091, 4.194268, 0, 0, 0, 1, 1,
0.160033, 2.106582, 0.950729, 1, 1, 1, 1, 1,
0.1641354, 0.5451319, 1.134897, 1, 1, 1, 1, 1,
0.1653988, 0.659379, 0.3367849, 1, 1, 1, 1, 1,
0.1657599, 1.225157, -2.815953, 1, 1, 1, 1, 1,
0.1680132, -0.2892593, 2.399598, 1, 1, 1, 1, 1,
0.1700434, -0.2612025, 3.431773, 1, 1, 1, 1, 1,
0.1738004, -1.686482, 1.613311, 1, 1, 1, 1, 1,
0.174061, -0.7788461, 3.10667, 1, 1, 1, 1, 1,
0.1746741, 0.1526195, 2.604021, 1, 1, 1, 1, 1,
0.1756462, 0.8806698, -0.3380699, 1, 1, 1, 1, 1,
0.1805545, 0.4068562, 1.628416, 1, 1, 1, 1, 1,
0.188703, -0.6532999, 2.330002, 1, 1, 1, 1, 1,
0.1892009, 0.08874162, 1.660681, 1, 1, 1, 1, 1,
0.1928051, 1.709916, -0.5008497, 1, 1, 1, 1, 1,
0.2040147, 0.2898358, -0.07190628, 1, 1, 1, 1, 1,
0.2066299, 2.012465, -1.256594, 0, 0, 1, 1, 1,
0.2090615, -0.164555, 3.861094, 1, 0, 0, 1, 1,
0.2140438, -0.222479, 3.648896, 1, 0, 0, 1, 1,
0.2157058, 1.58505, 1.700486, 1, 0, 0, 1, 1,
0.2246167, -1.091204, 2.793797, 1, 0, 0, 1, 1,
0.2249898, 0.1084078, 1.671908, 1, 0, 0, 1, 1,
0.2311681, 0.8271728, 2.862305, 0, 0, 0, 1, 1,
0.2362036, -0.7635074, 3.709813, 0, 0, 0, 1, 1,
0.2362835, 0.1116159, 1.041059, 0, 0, 0, 1, 1,
0.2375001, -0.3934283, 0.9521112, 0, 0, 0, 1, 1,
0.2384834, 0.4192364, 0.8045505, 0, 0, 0, 1, 1,
0.2459899, 2.821815, -0.5377436, 0, 0, 0, 1, 1,
0.2460953, 1.109092, 0.9141434, 0, 0, 0, 1, 1,
0.2510112, 1.181424, -1.288131, 1, 1, 1, 1, 1,
0.2521154, -1.06999, 4.721315, 1, 1, 1, 1, 1,
0.2561128, 1.696066, -0.6434252, 1, 1, 1, 1, 1,
0.2638663, -1.41233, 4.037559, 1, 1, 1, 1, 1,
0.2653648, -0.8178091, 3.710118, 1, 1, 1, 1, 1,
0.2672722, -2.347506, 3.566153, 1, 1, 1, 1, 1,
0.2732016, -0.5000774, 2.873358, 1, 1, 1, 1, 1,
0.2783655, 1.274666, -0.6897395, 1, 1, 1, 1, 1,
0.2797766, 0.2876244, 2.104248, 1, 1, 1, 1, 1,
0.281855, -1.64451, 3.566569, 1, 1, 1, 1, 1,
0.2841933, 0.9099567, -0.1053503, 1, 1, 1, 1, 1,
0.2913004, 0.1442489, 0.2111998, 1, 1, 1, 1, 1,
0.2995223, -1.265556, 1.832032, 1, 1, 1, 1, 1,
0.2996773, -0.8457143, 3.059309, 1, 1, 1, 1, 1,
0.3002805, 0.2269381, 2.098329, 1, 1, 1, 1, 1,
0.3015785, -0.8587694, 2.611876, 0, 0, 1, 1, 1,
0.3119337, -0.244859, 1.889637, 1, 0, 0, 1, 1,
0.3133415, -0.8282028, 2.987509, 1, 0, 0, 1, 1,
0.3178863, -1.02775, 3.574664, 1, 0, 0, 1, 1,
0.318417, -0.2696768, 1.906239, 1, 0, 0, 1, 1,
0.3184777, -0.3298831, 2.343116, 1, 0, 0, 1, 1,
0.3215967, -0.8475387, 2.546683, 0, 0, 0, 1, 1,
0.324838, -1.556351, 3.992972, 0, 0, 0, 1, 1,
0.3248596, 2.144151, -0.5175657, 0, 0, 0, 1, 1,
0.3293844, -0.5820805, 3.963494, 0, 0, 0, 1, 1,
0.329685, 0.007805666, 0.529775, 0, 0, 0, 1, 1,
0.332975, 0.3794861, 1.969094, 0, 0, 0, 1, 1,
0.3414017, -0.6678448, 3.610445, 0, 0, 0, 1, 1,
0.3435118, 1.554647, -2.100844, 1, 1, 1, 1, 1,
0.3458698, -1.459535, 1.835049, 1, 1, 1, 1, 1,
0.3470651, -0.1328338, 1.133738, 1, 1, 1, 1, 1,
0.3477522, 1.625349, -0.3779151, 1, 1, 1, 1, 1,
0.3488999, -0.7264789, 1.135597, 1, 1, 1, 1, 1,
0.3492333, -0.6074954, 2.293488, 1, 1, 1, 1, 1,
0.3500819, -0.002764573, 1.300807, 1, 1, 1, 1, 1,
0.3527448, 1.699276, -0.8038415, 1, 1, 1, 1, 1,
0.3545016, 0.99344, 0.3556406, 1, 1, 1, 1, 1,
0.3573617, 0.700229, -0.6144575, 1, 1, 1, 1, 1,
0.3602587, -0.8656917, 4.85275, 1, 1, 1, 1, 1,
0.3612646, -2.341295, 3.51833, 1, 1, 1, 1, 1,
0.3635753, 0.05211484, 2.719135, 1, 1, 1, 1, 1,
0.3713518, 1.325751, 0.9105045, 1, 1, 1, 1, 1,
0.373891, 0.3931464, 0.4404411, 1, 1, 1, 1, 1,
0.3768062, -0.1802248, 0.5531512, 0, 0, 1, 1, 1,
0.378717, -1.71749, 3.117502, 1, 0, 0, 1, 1,
0.3804202, -0.2364069, 0.7030303, 1, 0, 0, 1, 1,
0.3830389, -1.826632, 1.791785, 1, 0, 0, 1, 1,
0.3876247, -1.487175, 3.611241, 1, 0, 0, 1, 1,
0.3885985, -0.7342288, 3.696875, 1, 0, 0, 1, 1,
0.3919603, 0.5050809, -0.3157218, 0, 0, 0, 1, 1,
0.3946418, 1.463719, -0.8293118, 0, 0, 0, 1, 1,
0.399196, 1.233116, -0.4976682, 0, 0, 0, 1, 1,
0.4013777, 1.0366, 2.424719, 0, 0, 0, 1, 1,
0.4035412, 0.1466877, 2.159579, 0, 0, 0, 1, 1,
0.40649, 0.2882216, 1.10817, 0, 0, 0, 1, 1,
0.4089593, -0.633673, 0.9627181, 0, 0, 0, 1, 1,
0.4098397, -0.1603733, 4.143175, 1, 1, 1, 1, 1,
0.4141033, 0.1536926, 1.850482, 1, 1, 1, 1, 1,
0.4276027, 0.3372278, 1.028349, 1, 1, 1, 1, 1,
0.4290992, -1.395679, 1.590462, 1, 1, 1, 1, 1,
0.4291434, 1.561857, 1.390388, 1, 1, 1, 1, 1,
0.4327747, 0.309851, 2.030326, 1, 1, 1, 1, 1,
0.4335633, 0.2056311, 0.6717741, 1, 1, 1, 1, 1,
0.4401243, 0.7460526, 0.4702753, 1, 1, 1, 1, 1,
0.4424944, -0.1352599, 2.788487, 1, 1, 1, 1, 1,
0.4427756, 1.65309, -0.6676872, 1, 1, 1, 1, 1,
0.4430915, 1.010656, -0.08889318, 1, 1, 1, 1, 1,
0.4471588, -0.5176892, 2.42999, 1, 1, 1, 1, 1,
0.4504384, 0.2443683, 2.417497, 1, 1, 1, 1, 1,
0.4526168, -0.02172976, 3.78359, 1, 1, 1, 1, 1,
0.4538808, 0.6299684, 1.772352, 1, 1, 1, 1, 1,
0.4539266, 0.09517384, -1.282207, 0, 0, 1, 1, 1,
0.454482, 0.8376811, 0.3602774, 1, 0, 0, 1, 1,
0.4619198, 1.336892, 0.1021309, 1, 0, 0, 1, 1,
0.4622277, -0.6615154, 2.254577, 1, 0, 0, 1, 1,
0.4633265, -0.7116297, 2.203835, 1, 0, 0, 1, 1,
0.4646891, -1.50778, 3.329619, 1, 0, 0, 1, 1,
0.4676612, -0.3647939, 3.789775, 0, 0, 0, 1, 1,
0.4700375, 0.7334614, 1.808761, 0, 0, 0, 1, 1,
0.4729982, 0.504272, 0.9198194, 0, 0, 0, 1, 1,
0.4758455, 0.8487891, -0.8535504, 0, 0, 0, 1, 1,
0.4766064, -2.01305, 2.633459, 0, 0, 0, 1, 1,
0.4795454, -0.1545858, 1.361438, 0, 0, 0, 1, 1,
0.4821703, -0.8473628, 2.2765, 0, 0, 0, 1, 1,
0.4822326, 0.7176632, -0.03323695, 1, 1, 1, 1, 1,
0.4830927, -0.8849467, 2.083266, 1, 1, 1, 1, 1,
0.4834323, 0.5082346, -0.02822977, 1, 1, 1, 1, 1,
0.4881442, -1.838187, 2.171334, 1, 1, 1, 1, 1,
0.4954827, 0.7639564, 1.315247, 1, 1, 1, 1, 1,
0.5046641, -0.477953, 2.735579, 1, 1, 1, 1, 1,
0.5054799, 0.02887559, 2.171451, 1, 1, 1, 1, 1,
0.5082241, 1.168253, 0.8865405, 1, 1, 1, 1, 1,
0.5091779, -0.6683097, 2.286698, 1, 1, 1, 1, 1,
0.509407, -1.510894, 2.76108, 1, 1, 1, 1, 1,
0.5142652, -1.710644, 3.28196, 1, 1, 1, 1, 1,
0.5142736, -0.773294, 3.234428, 1, 1, 1, 1, 1,
0.5231882, 0.7137522, -0.1094568, 1, 1, 1, 1, 1,
0.5243908, 0.6873296, 1.043871, 1, 1, 1, 1, 1,
0.5290174, -0.1118439, 3.491666, 1, 1, 1, 1, 1,
0.5292478, -0.8751791, 3.385906, 0, 0, 1, 1, 1,
0.5297161, -0.9339641, 1.813155, 1, 0, 0, 1, 1,
0.5308506, -1.103278, 2.70645, 1, 0, 0, 1, 1,
0.5310342, -0.4227454, 1.884264, 1, 0, 0, 1, 1,
0.5426727, 0.8561184, 1.331122, 1, 0, 0, 1, 1,
0.5468259, 1.552422, 0.9293808, 1, 0, 0, 1, 1,
0.5484304, -0.07431386, 2.512435, 0, 0, 0, 1, 1,
0.5516539, 0.2020682, 1.345752, 0, 0, 0, 1, 1,
0.5531656, 1.32355, -1.990518, 0, 0, 0, 1, 1,
0.5547571, -1.299612, 2.596166, 0, 0, 0, 1, 1,
0.5579782, -0.8774715, 3.264994, 0, 0, 0, 1, 1,
0.5583296, 1.323433, 0.5107161, 0, 0, 0, 1, 1,
0.5583724, 0.7679612, 0.5271609, 0, 0, 0, 1, 1,
0.560002, -0.5541365, 3.164744, 1, 1, 1, 1, 1,
0.5611273, 1.087353, 1.454733, 1, 1, 1, 1, 1,
0.5644792, 0.3577742, -0.3775522, 1, 1, 1, 1, 1,
0.5690963, 0.3145883, 1.649941, 1, 1, 1, 1, 1,
0.5706685, 1.843341, 0.2963667, 1, 1, 1, 1, 1,
0.5792571, 1.793071, 0.469403, 1, 1, 1, 1, 1,
0.5804775, 0.3075221, 0.06696337, 1, 1, 1, 1, 1,
0.5829501, -0.49914, 2.676906, 1, 1, 1, 1, 1,
0.5996131, 2.324328, 0.4186077, 1, 1, 1, 1, 1,
0.599804, -1.244531, 4.871902, 1, 1, 1, 1, 1,
0.6020175, -0.7914941, 3.348126, 1, 1, 1, 1, 1,
0.6106194, -0.337685, 1.126407, 1, 1, 1, 1, 1,
0.6195409, 0.5861706, 0.7156892, 1, 1, 1, 1, 1,
0.6198897, 0.01142465, 2.253427, 1, 1, 1, 1, 1,
0.6244299, -1.079151, 3.047641, 1, 1, 1, 1, 1,
0.6307065, 0.5882034, 0.3740709, 0, 0, 1, 1, 1,
0.6320456, -0.8126111, 2.546395, 1, 0, 0, 1, 1,
0.6330252, -0.605646, 2.155484, 1, 0, 0, 1, 1,
0.6338188, 0.7521788, -1.265711, 1, 0, 0, 1, 1,
0.6362598, -0.7936368, 2.579634, 1, 0, 0, 1, 1,
0.6367649, -0.5533875, 1.542312, 1, 0, 0, 1, 1,
0.6388388, -2.324369, 1.887902, 0, 0, 0, 1, 1,
0.6392551, -0.4160416, 2.787205, 0, 0, 0, 1, 1,
0.6397615, 0.3901283, 0.920935, 0, 0, 0, 1, 1,
0.6397756, -1.059555, 2.789749, 0, 0, 0, 1, 1,
0.6512349, 0.258731, 1.640157, 0, 0, 0, 1, 1,
0.6556183, -0.1269617, 1.43052, 0, 0, 0, 1, 1,
0.6628989, -0.2944078, 2.489248, 0, 0, 0, 1, 1,
0.6649183, 0.2095973, 1.717778, 1, 1, 1, 1, 1,
0.6659912, 0.4275037, 3.217108, 1, 1, 1, 1, 1,
0.6661618, -1.870024, 3.165684, 1, 1, 1, 1, 1,
0.6667529, -1.201414, 2.760727, 1, 1, 1, 1, 1,
0.6792361, -0.411606, 1.082083, 1, 1, 1, 1, 1,
0.680066, 2.497026, 0.7074644, 1, 1, 1, 1, 1,
0.6812864, 1.370787, -1.084357, 1, 1, 1, 1, 1,
0.6865993, 1.80605, -0.8939172, 1, 1, 1, 1, 1,
0.6895699, 0.6073087, 1.448776, 1, 1, 1, 1, 1,
0.6950635, 0.3581079, 2.132932, 1, 1, 1, 1, 1,
0.6960327, -0.4923083, 2.503967, 1, 1, 1, 1, 1,
0.6972693, 0.8586518, 1.527073, 1, 1, 1, 1, 1,
0.6973818, -1.56557, 1.613086, 1, 1, 1, 1, 1,
0.7014882, -0.6087392, 0.1352309, 1, 1, 1, 1, 1,
0.7043856, -1.428665, 2.672558, 1, 1, 1, 1, 1,
0.7080185, -1.421169, 2.261079, 0, 0, 1, 1, 1,
0.7143015, -0.6943313, 0.2098673, 1, 0, 0, 1, 1,
0.7180985, 0.7645709, 1.761012, 1, 0, 0, 1, 1,
0.7206855, 1.117763, -1.862797, 1, 0, 0, 1, 1,
0.7233388, -0.1944875, 0.201385, 1, 0, 0, 1, 1,
0.7261925, 1.191279, -0.4767565, 1, 0, 0, 1, 1,
0.7325564, 1.455828, -0.3928427, 0, 0, 0, 1, 1,
0.7346462, -1.266926, 3.312766, 0, 0, 0, 1, 1,
0.7389674, 0.4939626, 2.24303, 0, 0, 0, 1, 1,
0.7395044, -2.363771, 1.828544, 0, 0, 0, 1, 1,
0.7399003, 0.873133, 2.019962, 0, 0, 0, 1, 1,
0.7432533, 0.6483951, 1.47383, 0, 0, 0, 1, 1,
0.744149, -0.6310485, 2.611718, 0, 0, 0, 1, 1,
0.7444451, -0.3633949, 2.388197, 1, 1, 1, 1, 1,
0.745784, 1.503684, 0.9925649, 1, 1, 1, 1, 1,
0.7496371, -1.937782, 0.9754115, 1, 1, 1, 1, 1,
0.7522712, -1.555076, 3.482044, 1, 1, 1, 1, 1,
0.7568704, 0.5390204, 0.9875518, 1, 1, 1, 1, 1,
0.7608492, -0.9719669, -0.01509033, 1, 1, 1, 1, 1,
0.761326, 0.7125362, 2.81665, 1, 1, 1, 1, 1,
0.7613283, -0.2648958, 2.724909, 1, 1, 1, 1, 1,
0.7657692, -0.2072397, 2.836129, 1, 1, 1, 1, 1,
0.7659538, 0.1562906, -1.071298, 1, 1, 1, 1, 1,
0.7706821, 0.8038754, 0.3738572, 1, 1, 1, 1, 1,
0.7746146, 1.267674, 0.6507453, 1, 1, 1, 1, 1,
0.7802871, -0.4363175, 3.514241, 1, 1, 1, 1, 1,
0.7917628, -0.6439581, 3.002281, 1, 1, 1, 1, 1,
0.7934752, -0.820025, 2.702801, 1, 1, 1, 1, 1,
0.7943105, -0.4979867, 3.155663, 0, 0, 1, 1, 1,
0.7999028, 0.5948079, 2.271919, 1, 0, 0, 1, 1,
0.8070522, -0.4881123, 1.35811, 1, 0, 0, 1, 1,
0.8115512, -0.9842929, 2.794824, 1, 0, 0, 1, 1,
0.8168178, -0.06102213, 0.8095987, 1, 0, 0, 1, 1,
0.8168293, -1.289087, 2.46168, 1, 0, 0, 1, 1,
0.8169622, 0.5381694, 2.569606, 0, 0, 0, 1, 1,
0.8172147, 1.305129, 0.4736949, 0, 0, 0, 1, 1,
0.817313, 0.7916541, 0.6540603, 0, 0, 0, 1, 1,
0.8224066, 0.5877917, 0.9927211, 0, 0, 0, 1, 1,
0.8235116, -0.7766454, 1.825465, 0, 0, 0, 1, 1,
0.8276085, 1.197844, 1.33932, 0, 0, 0, 1, 1,
0.8315423, 0.3241399, 0.406292, 0, 0, 0, 1, 1,
0.8365006, -0.2619837, 3.117625, 1, 1, 1, 1, 1,
0.841417, -0.5798917, 4.39146, 1, 1, 1, 1, 1,
0.8457934, -0.8130961, 1.861752, 1, 1, 1, 1, 1,
0.8506861, 2.04573, 0.4044145, 1, 1, 1, 1, 1,
0.8591798, 0.6218826, -0.922407, 1, 1, 1, 1, 1,
0.8602642, -0.7252117, 3.102844, 1, 1, 1, 1, 1,
0.8607315, 0.001237968, 2.110186, 1, 1, 1, 1, 1,
0.8610839, -0.3010491, 2.160255, 1, 1, 1, 1, 1,
0.8635581, -0.9221616, 3.19078, 1, 1, 1, 1, 1,
0.8659405, -0.9231254, 2.586789, 1, 1, 1, 1, 1,
0.8663843, -1.66492, 2.950977, 1, 1, 1, 1, 1,
0.8679191, -1.666031, 3.528242, 1, 1, 1, 1, 1,
0.8732319, 0.3618653, 2.280805, 1, 1, 1, 1, 1,
0.8751636, -1.273852, 3.448303, 1, 1, 1, 1, 1,
0.8787863, 1.150504, -0.3224304, 1, 1, 1, 1, 1,
0.8826327, 0.04066299, 2.315159, 0, 0, 1, 1, 1,
0.885771, 0.3683851, 1.804664, 1, 0, 0, 1, 1,
0.8878055, 0.281208, 0.521025, 1, 0, 0, 1, 1,
0.8898569, -0.3840095, 2.486283, 1, 0, 0, 1, 1,
0.8975717, 0.7578372, 0.6776201, 1, 0, 0, 1, 1,
0.9016759, -0.805744, 2.808109, 1, 0, 0, 1, 1,
0.9022602, 1.176189, 2.902046, 0, 0, 0, 1, 1,
0.9024296, 1.306074, -0.5230803, 0, 0, 0, 1, 1,
0.9100375, -1.178772, 2.505529, 0, 0, 0, 1, 1,
0.9215615, 0.153754, 0.8912758, 0, 0, 0, 1, 1,
0.9289541, 0.9347771, -0.5746138, 0, 0, 0, 1, 1,
0.934207, -1.118194, 2.000856, 0, 0, 0, 1, 1,
0.9351264, 1.244193, 0.7512364, 0, 0, 0, 1, 1,
0.9387276, 0.6021259, 1.192791, 1, 1, 1, 1, 1,
0.9428711, -2.06383, 2.954698, 1, 1, 1, 1, 1,
0.9577354, -0.09634249, 1.215225, 1, 1, 1, 1, 1,
0.9634116, 0.5845981, 1.203016, 1, 1, 1, 1, 1,
0.968273, 0.7228319, 1.509893, 1, 1, 1, 1, 1,
0.9686394, -1.519751, 1.323175, 1, 1, 1, 1, 1,
0.9713613, 0.08434325, -0.8916169, 1, 1, 1, 1, 1,
0.97899, -0.7644222, 4.020328, 1, 1, 1, 1, 1,
0.9825762, 0.1092462, 2.402988, 1, 1, 1, 1, 1,
0.9884201, -1.606085, 1.549892, 1, 1, 1, 1, 1,
0.9919354, 0.421553, 1.49838, 1, 1, 1, 1, 1,
0.9952879, 1.483474, 0.5061944, 1, 1, 1, 1, 1,
0.9961373, 0.7531016, 1.155019, 1, 1, 1, 1, 1,
0.9968468, -1.22838, 3.220865, 1, 1, 1, 1, 1,
1.00046, 0.5107738, 0.9245825, 1, 1, 1, 1, 1,
1.006761, 2.264787, 1.557926, 0, 0, 1, 1, 1,
1.007347, -0.5373975, 2.194296, 1, 0, 0, 1, 1,
1.00988, 2.154799, -0.1135608, 1, 0, 0, 1, 1,
1.014016, 1.742686, -1.349863, 1, 0, 0, 1, 1,
1.015814, -0.2688812, 2.519666, 1, 0, 0, 1, 1,
1.016933, -1.797545, 1.985864, 1, 0, 0, 1, 1,
1.016953, 0.6892858, -1.242366, 0, 0, 0, 1, 1,
1.01823, -0.5212628, 2.439657, 0, 0, 0, 1, 1,
1.019979, 0.4361834, 2.652554, 0, 0, 0, 1, 1,
1.025782, 1.212864, 0.6435333, 0, 0, 0, 1, 1,
1.042495, 0.07518635, 0.1814385, 0, 0, 0, 1, 1,
1.044234, -0.3926626, 1.763632, 0, 0, 0, 1, 1,
1.049323, 0.3549862, 2.993441, 0, 0, 0, 1, 1,
1.05479, 0.06300858, 2.235834, 1, 1, 1, 1, 1,
1.05738, -1.324648, 3.59005, 1, 1, 1, 1, 1,
1.058589, -0.6982878, 2.387426, 1, 1, 1, 1, 1,
1.061898, -0.04139601, 0.7851562, 1, 1, 1, 1, 1,
1.062055, -0.2107162, 0.5735069, 1, 1, 1, 1, 1,
1.062756, -1.024804, 1.95409, 1, 1, 1, 1, 1,
1.069048, -1.008544, 2.666266, 1, 1, 1, 1, 1,
1.0696, -0.5637096, 3.192972, 1, 1, 1, 1, 1,
1.070112, 0.4395543, 1.563117, 1, 1, 1, 1, 1,
1.075731, -0.8779959, 2.461987, 1, 1, 1, 1, 1,
1.076009, -0.208288, 0.9973649, 1, 1, 1, 1, 1,
1.079146, -0.6440229, 0.6141289, 1, 1, 1, 1, 1,
1.082801, 0.1644192, 0.9452435, 1, 1, 1, 1, 1,
1.087256, 0.5755936, 0.7497148, 1, 1, 1, 1, 1,
1.089559, 1.754258, 2.119677, 1, 1, 1, 1, 1,
1.093382, 0.2827395, 1.306819, 0, 0, 1, 1, 1,
1.106833, 0.9150894, 2.033209, 1, 0, 0, 1, 1,
1.116162, -0.4832933, 2.82287, 1, 0, 0, 1, 1,
1.11656, -0.2927015, 2.528971, 1, 0, 0, 1, 1,
1.117843, 0.6383318, 0.5831, 1, 0, 0, 1, 1,
1.120429, -0.987541, 2.203741, 1, 0, 0, 1, 1,
1.12452, 0.7145336, 0.8792133, 0, 0, 0, 1, 1,
1.129697, -0.8402044, 2.254761, 0, 0, 0, 1, 1,
1.133547, -0.4415773, 0.8488334, 0, 0, 0, 1, 1,
1.135024, -0.4959416, 0.5408591, 0, 0, 0, 1, 1,
1.136601, -2.076464, 1.973245, 0, 0, 0, 1, 1,
1.144134, 0.8628898, 0.8364677, 0, 0, 0, 1, 1,
1.145151, 0.8748471, 1.500866, 0, 0, 0, 1, 1,
1.14569, 1.533905, 0.3059495, 1, 1, 1, 1, 1,
1.146448, -0.4077965, 2.687043, 1, 1, 1, 1, 1,
1.147912, -1.138565, 2.893203, 1, 1, 1, 1, 1,
1.157412, -0.6423291, 3.899392, 1, 1, 1, 1, 1,
1.175838, -0.5768356, 2.074049, 1, 1, 1, 1, 1,
1.177358, 0.4465008, 0.3556762, 1, 1, 1, 1, 1,
1.178104, 1.452359, 1.78709, 1, 1, 1, 1, 1,
1.19423, -0.1016449, 0.8445911, 1, 1, 1, 1, 1,
1.196548, -0.440938, 2.306204, 1, 1, 1, 1, 1,
1.196646, 1.548482, 0.8463077, 1, 1, 1, 1, 1,
1.210367, -0.5250026, 1.187986, 1, 1, 1, 1, 1,
1.22043, 0.8155234, 1.674969, 1, 1, 1, 1, 1,
1.221587, 0.4004309, 0.430378, 1, 1, 1, 1, 1,
1.222162, -2.168231, 1.188421, 1, 1, 1, 1, 1,
1.227367, 0.3290124, -0.2066177, 1, 1, 1, 1, 1,
1.23699, -0.6946738, 2.154403, 0, 0, 1, 1, 1,
1.23866, -0.1107462, 2.003088, 1, 0, 0, 1, 1,
1.240534, 0.6877726, 1.925814, 1, 0, 0, 1, 1,
1.250011, -1.137977, 3.083616, 1, 0, 0, 1, 1,
1.250621, 0.266841, -0.7786759, 1, 0, 0, 1, 1,
1.258341, 0.8447352, 1.070963, 1, 0, 0, 1, 1,
1.262157, -1.229603, 1.381973, 0, 0, 0, 1, 1,
1.268829, -0.4613701, 2.046101, 0, 0, 0, 1, 1,
1.272941, 1.277704, 1.810554, 0, 0, 0, 1, 1,
1.277659, 0.2109952, 2.227486, 0, 0, 0, 1, 1,
1.279332, -1.357816, 1.511319, 0, 0, 0, 1, 1,
1.280723, 0.1828657, -0.5245367, 0, 0, 0, 1, 1,
1.282546, -1.799047, 2.723089, 0, 0, 0, 1, 1,
1.298428, -1.275654, 2.513263, 1, 1, 1, 1, 1,
1.303312, -0.3838996, 2.720831, 1, 1, 1, 1, 1,
1.308234, -0.5577823, 2.477199, 1, 1, 1, 1, 1,
1.308339, -0.1634396, -0.04625084, 1, 1, 1, 1, 1,
1.311193, 0.2267972, 1.360538, 1, 1, 1, 1, 1,
1.311648, 0.3369997, -0.04659111, 1, 1, 1, 1, 1,
1.327455, -0.5604788, 2.25772, 1, 1, 1, 1, 1,
1.332057, -0.978746, 0.2974148, 1, 1, 1, 1, 1,
1.337561, 0.9337117, -0.02690265, 1, 1, 1, 1, 1,
1.342358, 1.578092, -0.2005645, 1, 1, 1, 1, 1,
1.351443, 1.04653, 0.672237, 1, 1, 1, 1, 1,
1.368414, -0.5038576, 3.404179, 1, 1, 1, 1, 1,
1.377479, -0.7769493, 2.199062, 1, 1, 1, 1, 1,
1.382233, 0.880173, 2.881762, 1, 1, 1, 1, 1,
1.400945, -0.1596446, 0.9632623, 1, 1, 1, 1, 1,
1.402172, 0.6108508, 2.186732, 0, 0, 1, 1, 1,
1.403533, 0.6607153, 1.592913, 1, 0, 0, 1, 1,
1.405097, -0.9294249, 0.5519343, 1, 0, 0, 1, 1,
1.405621, -0.2807343, 3.63075, 1, 0, 0, 1, 1,
1.40841, 0.682388, 1.933544, 1, 0, 0, 1, 1,
1.416323, -0.09093761, 1.599521, 1, 0, 0, 1, 1,
1.418342, 0.7090229, 0.06767706, 0, 0, 0, 1, 1,
1.421104, 0.8658471, 2.411566, 0, 0, 0, 1, 1,
1.425534, 1.270426, 2.455586, 0, 0, 0, 1, 1,
1.425762, 0.02147214, -0.5999306, 0, 0, 0, 1, 1,
1.435001, -0.05384878, 0.4918725, 0, 0, 0, 1, 1,
1.441979, 0.7042276, 3.150979, 0, 0, 0, 1, 1,
1.443604, -0.5189435, 0.8946419, 0, 0, 0, 1, 1,
1.443974, 1.27878, 1.66748, 1, 1, 1, 1, 1,
1.457112, 0.6035794, 1.481544, 1, 1, 1, 1, 1,
1.472173, -0.7909909, 1.889278, 1, 1, 1, 1, 1,
1.475724, 0.2989542, -0.06370568, 1, 1, 1, 1, 1,
1.478843, -0.4308367, 1.008535, 1, 1, 1, 1, 1,
1.479505, -0.08319286, 2.621683, 1, 1, 1, 1, 1,
1.481601, 0.7555166, 1.647909, 1, 1, 1, 1, 1,
1.483302, 0.360181, 0.5951076, 1, 1, 1, 1, 1,
1.485942, 0.4835436, 0.8698173, 1, 1, 1, 1, 1,
1.489893, -1.171294, 4.19968, 1, 1, 1, 1, 1,
1.4936, -1.985732, 2.615377, 1, 1, 1, 1, 1,
1.495797, 0.4651891, 0.8817303, 1, 1, 1, 1, 1,
1.508828, -0.03764125, 0.1953612, 1, 1, 1, 1, 1,
1.510591, -0.4318741, 3.397649, 1, 1, 1, 1, 1,
1.513369, 0.9392087, 1.338991, 1, 1, 1, 1, 1,
1.527409, -0.837892, 0.2105632, 0, 0, 1, 1, 1,
1.555702, 1.447552, 1.93392, 1, 0, 0, 1, 1,
1.58623, 1.024866, 1.551123, 1, 0, 0, 1, 1,
1.600773, -1.719763, 2.583959, 1, 0, 0, 1, 1,
1.612681, 1.791467, -0.8947998, 1, 0, 0, 1, 1,
1.615963, -0.3253177, 1.489333, 1, 0, 0, 1, 1,
1.619724, -0.284473, 0.1813964, 0, 0, 0, 1, 1,
1.622931, -0.7589754, 3.264665, 0, 0, 0, 1, 1,
1.624758, 1.727086, 0.8778789, 0, 0, 0, 1, 1,
1.625811, 1.14383, 2.21015, 0, 0, 0, 1, 1,
1.639468, -0.4647946, 1.740192, 0, 0, 0, 1, 1,
1.658645, 1.060679, 1.268038, 0, 0, 0, 1, 1,
1.685427, 0.1921122, 2.843551, 0, 0, 0, 1, 1,
1.714564, 1.045144, 1.172018, 1, 1, 1, 1, 1,
1.714882, 1.246392, 2.308042, 1, 1, 1, 1, 1,
1.728497, -0.5768371, 3.177267, 1, 1, 1, 1, 1,
1.736844, 0.6084117, 0.6254957, 1, 1, 1, 1, 1,
1.738077, -0.7096669, 2.314203, 1, 1, 1, 1, 1,
1.741152, -0.4445224, 1.26922, 1, 1, 1, 1, 1,
1.77044, -1.026269, 1.747109, 1, 1, 1, 1, 1,
1.812114, 1.122781, 0.3446426, 1, 1, 1, 1, 1,
1.816558, -1.43929, 2.416256, 1, 1, 1, 1, 1,
1.823014, 0.206035, 1.498759, 1, 1, 1, 1, 1,
1.862459, 0.1626133, -0.227666, 1, 1, 1, 1, 1,
1.8855, 0.2734439, 1.762404, 1, 1, 1, 1, 1,
1.909175, -0.7014228, 1.600818, 1, 1, 1, 1, 1,
1.919273, 0.1640367, 0.7562895, 1, 1, 1, 1, 1,
1.919768, -1.822613, 2.342961, 1, 1, 1, 1, 1,
1.96058, -1.732433, 2.940663, 0, 0, 1, 1, 1,
1.995493, -0.4657105, 2.540992, 1, 0, 0, 1, 1,
2.063812, 0.2816647, 0.6574245, 1, 0, 0, 1, 1,
2.065364, -0.2774077, 1.852939, 1, 0, 0, 1, 1,
2.089191, -0.9838043, 3.185977, 1, 0, 0, 1, 1,
2.106735, -0.750259, 1.412414, 1, 0, 0, 1, 1,
2.154104, 1.92148, 0.1838758, 0, 0, 0, 1, 1,
2.163211, -0.3763312, 0.6794441, 0, 0, 0, 1, 1,
2.185284, 0.3175445, -0.6243135, 0, 0, 0, 1, 1,
2.192412, 2.729382, 0.3881635, 0, 0, 0, 1, 1,
2.249088, -0.3363134, 1.489432, 0, 0, 0, 1, 1,
2.265306, -0.9027264, 1.167568, 0, 0, 0, 1, 1,
2.272578, -0.7340831, 2.40811, 0, 0, 0, 1, 1,
2.321319, -0.361332, 0.7007284, 1, 1, 1, 1, 1,
2.336569, -0.8049588, 3.245567, 1, 1, 1, 1, 1,
2.478861, -0.6448358, 2.725202, 1, 1, 1, 1, 1,
2.508823, -0.08529348, 2.517482, 1, 1, 1, 1, 1,
2.632253, 1.320382, 1.707444, 1, 1, 1, 1, 1,
2.641422, 0.3562028, 1.489915, 1, 1, 1, 1, 1,
2.76528, -1.567722, 2.02368, 1, 1, 1, 1, 1
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
var radius = 9.007377;
var distance = 31.63803;
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
mvMatrix.translate( 0.1850083, 0.07224596, 0.1516709 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -31.63803);
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
