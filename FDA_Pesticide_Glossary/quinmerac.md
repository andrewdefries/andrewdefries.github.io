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
-3.249818, -1.330822, -1.711712, 1, 0, 0, 1,
-2.865992, -0.4850661, -2.526716, 1, 0.007843138, 0, 1,
-2.808271, 1.755607, -0.8208451, 1, 0.01176471, 0, 1,
-2.715767, 0.7675725, -0.7554969, 1, 0.01960784, 0, 1,
-2.614607, 0.779672, -0.3731135, 1, 0.02352941, 0, 1,
-2.48358, -0.1145702, -1.627722, 1, 0.03137255, 0, 1,
-2.355934, -0.06834975, -1.206492, 1, 0.03529412, 0, 1,
-2.291444, 0.9131366, 0.7986515, 1, 0.04313726, 0, 1,
-2.28941, -0.8554789, -3.060175, 1, 0.04705882, 0, 1,
-2.260474, -0.4189565, -1.46821, 1, 0.05490196, 0, 1,
-2.244965, 0.1266205, -2.021394, 1, 0.05882353, 0, 1,
-2.172533, -0.4477512, -1.550819, 1, 0.06666667, 0, 1,
-2.152547, 0.9459721, -1.37789, 1, 0.07058824, 0, 1,
-2.150124, 1.750678, -2.168255, 1, 0.07843138, 0, 1,
-2.110015, -1.672537, -3.145364, 1, 0.08235294, 0, 1,
-2.105858, -0.7210144, -0.4233322, 1, 0.09019608, 0, 1,
-2.09455, 1.200783, -0.4224861, 1, 0.09411765, 0, 1,
-2.055297, -1.132716, -4.733715, 1, 0.1019608, 0, 1,
-2.042776, -0.9497391, -3.070138, 1, 0.1098039, 0, 1,
-2.012915, -0.5566643, -2.439081, 1, 0.1137255, 0, 1,
-2.011473, -0.601988, -1.54079, 1, 0.1215686, 0, 1,
-1.996072, -0.4636688, -2.88856, 1, 0.1254902, 0, 1,
-1.95466, 0.7342135, -2.456991, 1, 0.1333333, 0, 1,
-1.949747, 0.8790075, 0.08636979, 1, 0.1372549, 0, 1,
-1.944317, 1.799218, -1.214315, 1, 0.145098, 0, 1,
-1.934216, -1.249801, -2.413849, 1, 0.1490196, 0, 1,
-1.912317, -0.4475081, -1.654546, 1, 0.1568628, 0, 1,
-1.907869, -0.1408721, -0.834841, 1, 0.1607843, 0, 1,
-1.899117, -0.2015753, -1.171966, 1, 0.1686275, 0, 1,
-1.895266, 0.7752343, 0.1088333, 1, 0.172549, 0, 1,
-1.894852, 0.08027941, -1.513175, 1, 0.1803922, 0, 1,
-1.869461, -1.129102, -2.857679, 1, 0.1843137, 0, 1,
-1.857954, -0.9664775, -1.918074, 1, 0.1921569, 0, 1,
-1.825271, -2.125358, -3.037548, 1, 0.1960784, 0, 1,
-1.818818, -2.144778, -1.4125, 1, 0.2039216, 0, 1,
-1.812979, -1.326919, -1.383475, 1, 0.2117647, 0, 1,
-1.802326, -0.4570526, -1.890966, 1, 0.2156863, 0, 1,
-1.799414, 1.502338, -0.952431, 1, 0.2235294, 0, 1,
-1.78217, -0.8482016, -2.914912, 1, 0.227451, 0, 1,
-1.756419, -0.2894945, -1.372504, 1, 0.2352941, 0, 1,
-1.754817, -1.330272, -2.543806, 1, 0.2392157, 0, 1,
-1.731083, 0.9662943, -0.298831, 1, 0.2470588, 0, 1,
-1.714597, 0.6905358, -1.776716, 1, 0.2509804, 0, 1,
-1.705126, -0.2098404, -0.4247487, 1, 0.2588235, 0, 1,
-1.694324, 0.8416429, -0.8929135, 1, 0.2627451, 0, 1,
-1.688996, -0.005299155, -0.3827357, 1, 0.2705882, 0, 1,
-1.686032, -1.236116, -1.992936, 1, 0.2745098, 0, 1,
-1.660334, -1.621195, -2.119242, 1, 0.282353, 0, 1,
-1.660077, 0.1759796, -1.794742, 1, 0.2862745, 0, 1,
-1.656036, 0.8657345, -2.14755, 1, 0.2941177, 0, 1,
-1.645384, -0.1734181, -2.130165, 1, 0.3019608, 0, 1,
-1.642232, 0.4794142, -0.4473881, 1, 0.3058824, 0, 1,
-1.603322, -0.5703129, -2.248747, 1, 0.3137255, 0, 1,
-1.59895, 0.3855841, -1.84502, 1, 0.3176471, 0, 1,
-1.596473, -1.152675, -0.9523683, 1, 0.3254902, 0, 1,
-1.594661, 1.077136, -1.450323, 1, 0.3294118, 0, 1,
-1.589657, -0.7942083, -3.912542, 1, 0.3372549, 0, 1,
-1.582747, 1.014317, -1.545933, 1, 0.3411765, 0, 1,
-1.579742, 0.6134245, -0.96201, 1, 0.3490196, 0, 1,
-1.576903, 1.775159, 0.9922025, 1, 0.3529412, 0, 1,
-1.573688, 0.6975604, -0.7108388, 1, 0.3607843, 0, 1,
-1.566859, -2.172188, -1.508236, 1, 0.3647059, 0, 1,
-1.545061, -0.6372343, -2.812019, 1, 0.372549, 0, 1,
-1.532259, -1.166123, -2.819493, 1, 0.3764706, 0, 1,
-1.53018, -0.9835119, -1.508379, 1, 0.3843137, 0, 1,
-1.529301, 1.182262, -1.285987, 1, 0.3882353, 0, 1,
-1.529113, -0.2368326, -0.7091544, 1, 0.3960784, 0, 1,
-1.512744, 0.04540955, -1.63633, 1, 0.4039216, 0, 1,
-1.502293, -0.3469211, -1.949446, 1, 0.4078431, 0, 1,
-1.492986, 1.189761, -0.5756185, 1, 0.4156863, 0, 1,
-1.489248, -0.05033949, -1.483206, 1, 0.4196078, 0, 1,
-1.482088, -1.385928, -2.618317, 1, 0.427451, 0, 1,
-1.481326, -0.1117699, -2.070683, 1, 0.4313726, 0, 1,
-1.46511, 0.5892314, -1.961952, 1, 0.4392157, 0, 1,
-1.46269, -0.7695968, -4.151512, 1, 0.4431373, 0, 1,
-1.459479, -0.7432223, -1.700681, 1, 0.4509804, 0, 1,
-1.457079, -0.3532205, -0.658122, 1, 0.454902, 0, 1,
-1.456334, -0.7158435, -4.023349, 1, 0.4627451, 0, 1,
-1.451931, -0.8031393, -2.364226, 1, 0.4666667, 0, 1,
-1.450839, 0.3424102, -2.207823, 1, 0.4745098, 0, 1,
-1.436107, 0.170779, -0.21414, 1, 0.4784314, 0, 1,
-1.431835, 0.03263499, -0.168438, 1, 0.4862745, 0, 1,
-1.4307, 1.301304, -0.5331748, 1, 0.4901961, 0, 1,
-1.423145, 0.05357268, -3.302675, 1, 0.4980392, 0, 1,
-1.418885, -0.3890175, -2.063831, 1, 0.5058824, 0, 1,
-1.414689, 1.175896, 1.306281, 1, 0.509804, 0, 1,
-1.395128, 0.3744813, -2.266634, 1, 0.5176471, 0, 1,
-1.391288, 1.423771, -0.1231625, 1, 0.5215687, 0, 1,
-1.387911, -1.092154, -1.650333, 1, 0.5294118, 0, 1,
-1.381822, -1.296348, -0.7687684, 1, 0.5333334, 0, 1,
-1.37796, 0.7162679, 0.2786885, 1, 0.5411765, 0, 1,
-1.371375, 0.6559283, -2.419023, 1, 0.5450981, 0, 1,
-1.357312, -1.664635, -0.2309875, 1, 0.5529412, 0, 1,
-1.348456, -0.8540261, -1.250871, 1, 0.5568628, 0, 1,
-1.347107, -0.4671709, -1.112447, 1, 0.5647059, 0, 1,
-1.342479, -0.2198796, -3.952111, 1, 0.5686275, 0, 1,
-1.340958, -0.01421642, -1.486842, 1, 0.5764706, 0, 1,
-1.333602, -1.167478, -1.539665, 1, 0.5803922, 0, 1,
-1.306603, -0.1424512, -1.950305, 1, 0.5882353, 0, 1,
-1.301604, -0.6645309, -1.055089, 1, 0.5921569, 0, 1,
-1.296613, 1.348403, 0.1778342, 1, 0.6, 0, 1,
-1.293549, -0.07929489, -0.4113673, 1, 0.6078432, 0, 1,
-1.292576, 0.5059782, -1.183809, 1, 0.6117647, 0, 1,
-1.290668, -1.19389, -3.428034, 1, 0.6196079, 0, 1,
-1.290378, -1.469377, -1.418715, 1, 0.6235294, 0, 1,
-1.27993, -1.526796, -2.509163, 1, 0.6313726, 0, 1,
-1.268334, 0.0494725, -1.511963, 1, 0.6352941, 0, 1,
-1.268079, -0.8807187, -1.899912, 1, 0.6431373, 0, 1,
-1.26486, -0.00036444, -3.434465, 1, 0.6470588, 0, 1,
-1.258659, -0.2465554, -2.453653, 1, 0.654902, 0, 1,
-1.258416, -0.6434468, -2.342912, 1, 0.6588235, 0, 1,
-1.251349, -1.262214, -2.336545, 1, 0.6666667, 0, 1,
-1.249198, -0.8093005, -1.857105, 1, 0.6705883, 0, 1,
-1.237014, -0.6831863, -2.285031, 1, 0.6784314, 0, 1,
-1.232135, -1.261277, -1.346337, 1, 0.682353, 0, 1,
-1.23158, -0.2264453, -2.0425, 1, 0.6901961, 0, 1,
-1.229298, -1.329427, -1.697894, 1, 0.6941177, 0, 1,
-1.229152, 1.723986, -0.5466492, 1, 0.7019608, 0, 1,
-1.218011, -0.4155667, -2.758353, 1, 0.7098039, 0, 1,
-1.214442, -1.172562, -2.815332, 1, 0.7137255, 0, 1,
-1.210711, -0.4883318, -1.943677, 1, 0.7215686, 0, 1,
-1.208252, 0.1893828, -1.844304, 1, 0.7254902, 0, 1,
-1.207759, -1.023264, -1.966018, 1, 0.7333333, 0, 1,
-1.206934, 0.3980511, 0.1187702, 1, 0.7372549, 0, 1,
-1.200594, 0.1263034, -1.118291, 1, 0.7450981, 0, 1,
-1.199978, -1.667825, -2.695319, 1, 0.7490196, 0, 1,
-1.194396, 0.2886063, -4.045835, 1, 0.7568628, 0, 1,
-1.185581, -0.4721181, -1.700211, 1, 0.7607843, 0, 1,
-1.185113, 0.6478893, 0.6159859, 1, 0.7686275, 0, 1,
-1.182596, 0.6965322, -0.3089372, 1, 0.772549, 0, 1,
-1.170098, 1.057817, -0.8860375, 1, 0.7803922, 0, 1,
-1.163183, -0.09213916, -2.998595, 1, 0.7843137, 0, 1,
-1.159794, 0.684023, -0.282395, 1, 0.7921569, 0, 1,
-1.158651, 1.02682, -2.934119, 1, 0.7960784, 0, 1,
-1.155434, -0.577632, -2.643033, 1, 0.8039216, 0, 1,
-1.14807, -0.8291299, -2.692674, 1, 0.8117647, 0, 1,
-1.142962, -0.9985312, -1.773854, 1, 0.8156863, 0, 1,
-1.140205, -0.1204822, 1.049333, 1, 0.8235294, 0, 1,
-1.134188, -0.09091039, -0.3025023, 1, 0.827451, 0, 1,
-1.133036, 0.8203458, -1.832345, 1, 0.8352941, 0, 1,
-1.126897, 0.9882802, -1.002381, 1, 0.8392157, 0, 1,
-1.124546, -1.749875, -0.4938355, 1, 0.8470588, 0, 1,
-1.119966, -1.089939, -2.584154, 1, 0.8509804, 0, 1,
-1.119338, 0.1875838, -0.2695113, 1, 0.8588235, 0, 1,
-1.117454, -0.524544, -1.98156, 1, 0.8627451, 0, 1,
-1.110368, 1.255205, -1.292424, 1, 0.8705882, 0, 1,
-1.107537, 0.6867369, -0.3422469, 1, 0.8745098, 0, 1,
-1.105, -1.115133, -1.622952, 1, 0.8823529, 0, 1,
-1.095123, 1.297939, -0.6954789, 1, 0.8862745, 0, 1,
-1.074058, 0.4877993, -2.230958, 1, 0.8941177, 0, 1,
-1.07383, -0.05046173, -1.458526, 1, 0.8980392, 0, 1,
-1.072699, 0.8181674, -1.208591, 1, 0.9058824, 0, 1,
-1.062209, 0.1469821, -2.606186, 1, 0.9137255, 0, 1,
-1.046515, 0.7454954, -0.6233086, 1, 0.9176471, 0, 1,
-1.041921, 1.081588, -0.2116509, 1, 0.9254902, 0, 1,
-1.039501, -1.042367, -4.595666, 1, 0.9294118, 0, 1,
-1.035806, 0.4869448, -2.63065, 1, 0.9372549, 0, 1,
-1.029416, -1.579045, 0.03834081, 1, 0.9411765, 0, 1,
-1.023721, 0.01465975, -2.350129, 1, 0.9490196, 0, 1,
-1.022814, 0.9226176, 0.000797048, 1, 0.9529412, 0, 1,
-1.010888, 0.2893391, -2.395795, 1, 0.9607843, 0, 1,
-1.010213, 0.7144523, -0.4932463, 1, 0.9647059, 0, 1,
-0.9939842, -0.7152115, -1.45724, 1, 0.972549, 0, 1,
-0.9932552, -0.7732574, -1.875319, 1, 0.9764706, 0, 1,
-0.9923793, -1.16889, -2.414687, 1, 0.9843137, 0, 1,
-0.9901687, -0.1130633, 0.2842343, 1, 0.9882353, 0, 1,
-0.9808156, 0.5155495, 1.117032, 1, 0.9960784, 0, 1,
-0.9788141, 1.195976, -1.15575, 0.9960784, 1, 0, 1,
-0.9782065, 2.014739, -2.079887, 0.9921569, 1, 0, 1,
-0.9770143, 0.7696759, -1.233147, 0.9843137, 1, 0, 1,
-0.966152, 0.1668487, -1.560253, 0.9803922, 1, 0, 1,
-0.9533213, -0.7808422, -2.000383, 0.972549, 1, 0, 1,
-0.9528534, -0.136083, -2.247688, 0.9686275, 1, 0, 1,
-0.9448815, 1.428545, -2.635339, 0.9607843, 1, 0, 1,
-0.9428309, -0.3328424, -1.970967, 0.9568627, 1, 0, 1,
-0.9419481, -0.06569006, -0.9432836, 0.9490196, 1, 0, 1,
-0.9408454, 0.39339, -1.93578, 0.945098, 1, 0, 1,
-0.9394002, -1.280341, -2.860926, 0.9372549, 1, 0, 1,
-0.9379702, -0.06008722, -3.020416, 0.9333333, 1, 0, 1,
-0.9352087, -0.4655605, -3.76324, 0.9254902, 1, 0, 1,
-0.9347708, -0.1055948, -1.208191, 0.9215686, 1, 0, 1,
-0.9327043, -0.8356702, -2.799645, 0.9137255, 1, 0, 1,
-0.9296414, -0.8237538, -3.531528, 0.9098039, 1, 0, 1,
-0.9213306, -0.1592684, -1.155691, 0.9019608, 1, 0, 1,
-0.9206645, -1.501878, -3.371246, 0.8941177, 1, 0, 1,
-0.9187151, -0.7321394, -1.898527, 0.8901961, 1, 0, 1,
-0.9186955, -0.9535006, -3.965785, 0.8823529, 1, 0, 1,
-0.9060938, -0.3636653, -3.367049, 0.8784314, 1, 0, 1,
-0.903745, 0.9518836, -1.253278, 0.8705882, 1, 0, 1,
-0.8994294, 0.3528884, -2.132656, 0.8666667, 1, 0, 1,
-0.8986226, -1.030296, -1.817191, 0.8588235, 1, 0, 1,
-0.894449, -0.009816992, -1.195855, 0.854902, 1, 0, 1,
-0.8942663, 1.101095, -0.2067245, 0.8470588, 1, 0, 1,
-0.8909541, 0.6301746, -1.001012, 0.8431373, 1, 0, 1,
-0.8894806, 0.5706443, -1.670494, 0.8352941, 1, 0, 1,
-0.8832611, -1.674371, -2.711069, 0.8313726, 1, 0, 1,
-0.8802219, -1.157969, -2.411909, 0.8235294, 1, 0, 1,
-0.8781112, 1.182016, -3.492949, 0.8196079, 1, 0, 1,
-0.8724909, -0.3864963, -1.009494, 0.8117647, 1, 0, 1,
-0.8677627, 0.9522148, -0.7674172, 0.8078431, 1, 0, 1,
-0.8664757, 0.1497859, -1.977475, 0.8, 1, 0, 1,
-0.8597676, -0.1441042, -2.221272, 0.7921569, 1, 0, 1,
-0.8555418, -0.07269815, -0.1487433, 0.7882353, 1, 0, 1,
-0.8554187, -1.242064, -1.066939, 0.7803922, 1, 0, 1,
-0.8548273, -0.9823255, -1.821671, 0.7764706, 1, 0, 1,
-0.8535677, -0.6039225, -2.448138, 0.7686275, 1, 0, 1,
-0.8534414, -0.626712, -2.34782, 0.7647059, 1, 0, 1,
-0.8534362, -0.4128022, -3.608482, 0.7568628, 1, 0, 1,
-0.8495587, 0.04375365, -1.022369, 0.7529412, 1, 0, 1,
-0.8419108, -0.3399111, -2.983689, 0.7450981, 1, 0, 1,
-0.839108, -0.7172653, -1.98082, 0.7411765, 1, 0, 1,
-0.8366788, -0.4851763, -2.387647, 0.7333333, 1, 0, 1,
-0.8286527, 1.946794, 0.09108204, 0.7294118, 1, 0, 1,
-0.8262296, 1.246932, 0.5682896, 0.7215686, 1, 0, 1,
-0.8159149, 1.14399, -0.9102336, 0.7176471, 1, 0, 1,
-0.8154132, 1.020738, 1.541192, 0.7098039, 1, 0, 1,
-0.8139097, -0.05814474, -0.8421772, 0.7058824, 1, 0, 1,
-0.8114807, 0.4817739, -0.6939391, 0.6980392, 1, 0, 1,
-0.8094754, -0.3735763, -2.154689, 0.6901961, 1, 0, 1,
-0.8083722, -0.8731154, -3.038866, 0.6862745, 1, 0, 1,
-0.7947052, 1.464666, -1.587611, 0.6784314, 1, 0, 1,
-0.7938911, 0.5823192, -1.921095, 0.6745098, 1, 0, 1,
-0.7898564, 1.036231, -1.176346, 0.6666667, 1, 0, 1,
-0.7841839, -0.7777581, -1.199169, 0.6627451, 1, 0, 1,
-0.7832711, -1.603984, -1.843499, 0.654902, 1, 0, 1,
-0.7820727, -0.1031738, -1.67816, 0.6509804, 1, 0, 1,
-0.7808074, -1.265171, -1.632017, 0.6431373, 1, 0, 1,
-0.7800732, 0.3018028, -1.447706, 0.6392157, 1, 0, 1,
-0.7768148, 0.6643186, -1.051427, 0.6313726, 1, 0, 1,
-0.7727513, 1.626882, -0.4584771, 0.627451, 1, 0, 1,
-0.7704785, 1.958307, -1.005206, 0.6196079, 1, 0, 1,
-0.7682559, 1.01212, 1.56066, 0.6156863, 1, 0, 1,
-0.7680613, 0.3227074, -0.8652174, 0.6078432, 1, 0, 1,
-0.7680169, -0.1632763, -1.618712, 0.6039216, 1, 0, 1,
-0.7664847, 0.5041696, -1.857268, 0.5960785, 1, 0, 1,
-0.7653161, -1.133439, -2.307122, 0.5882353, 1, 0, 1,
-0.7627054, 0.4946345, -0.9848885, 0.5843138, 1, 0, 1,
-0.7611607, 0.4111078, -1.302909, 0.5764706, 1, 0, 1,
-0.7582504, -0.73498, -2.030447, 0.572549, 1, 0, 1,
-0.7524658, -0.9139946, -1.086802, 0.5647059, 1, 0, 1,
-0.75169, 0.9565905, -1.278656, 0.5607843, 1, 0, 1,
-0.7493502, -0.5075872, -1.238584, 0.5529412, 1, 0, 1,
-0.749321, 0.9624199, -1.149828, 0.5490196, 1, 0, 1,
-0.748929, 0.4201622, -0.965943, 0.5411765, 1, 0, 1,
-0.7471173, -1.963888, -3.997676, 0.5372549, 1, 0, 1,
-0.7460192, -2.15585, -2.456057, 0.5294118, 1, 0, 1,
-0.7440766, -0.001858152, 0.6036708, 0.5254902, 1, 0, 1,
-0.7339001, 1.073428, -1.547891, 0.5176471, 1, 0, 1,
-0.7252293, 1.148034, -0.6741009, 0.5137255, 1, 0, 1,
-0.7213668, -0.8934568, -1.988655, 0.5058824, 1, 0, 1,
-0.7192956, -0.03896924, -2.386461, 0.5019608, 1, 0, 1,
-0.7172772, 0.358924, 0.07338556, 0.4941176, 1, 0, 1,
-0.7086592, -0.02381626, -0.8890437, 0.4862745, 1, 0, 1,
-0.6956685, -0.9546543, -3.377756, 0.4823529, 1, 0, 1,
-0.695033, -1.488419, -2.880134, 0.4745098, 1, 0, 1,
-0.6941798, -1.133568, -2.707303, 0.4705882, 1, 0, 1,
-0.6929012, -1.989658, -2.455824, 0.4627451, 1, 0, 1,
-0.6795785, 0.5560584, 0.09706755, 0.4588235, 1, 0, 1,
-0.6750477, 0.01146714, -3.291604, 0.4509804, 1, 0, 1,
-0.6747548, -1.197461, -2.972878, 0.4470588, 1, 0, 1,
-0.6731397, 0.3341628, -1.60825, 0.4392157, 1, 0, 1,
-0.669114, -0.05736807, -2.295504, 0.4352941, 1, 0, 1,
-0.6689593, -0.5213346, -1.520366, 0.427451, 1, 0, 1,
-0.6682929, -0.6932978, -1.993243, 0.4235294, 1, 0, 1,
-0.6673852, -1.748045, -2.300735, 0.4156863, 1, 0, 1,
-0.6623654, 0.1181778, -3.150673, 0.4117647, 1, 0, 1,
-0.6612614, 1.093768, -2.15708, 0.4039216, 1, 0, 1,
-0.660888, 0.6105102, -0.3394458, 0.3960784, 1, 0, 1,
-0.6606826, 0.2346173, 0.52356, 0.3921569, 1, 0, 1,
-0.6597307, 1.390043, -0.6056251, 0.3843137, 1, 0, 1,
-0.6596712, 0.5033528, -1.816068, 0.3803922, 1, 0, 1,
-0.6578042, -0.1745468, -0.03260325, 0.372549, 1, 0, 1,
-0.6538973, -0.497777, -4.114905, 0.3686275, 1, 0, 1,
-0.6474406, -0.2313912, -2.135298, 0.3607843, 1, 0, 1,
-0.6472926, 0.5908553, -1.442364, 0.3568628, 1, 0, 1,
-0.6451588, -0.2976615, -2.472966, 0.3490196, 1, 0, 1,
-0.6438205, 0.4332368, -0.8795364, 0.345098, 1, 0, 1,
-0.6408802, 2.281104, -1.430268, 0.3372549, 1, 0, 1,
-0.639094, 0.02066042, -1.068805, 0.3333333, 1, 0, 1,
-0.6300455, -0.3728695, -1.880074, 0.3254902, 1, 0, 1,
-0.6245999, -0.8870872, -2.33986, 0.3215686, 1, 0, 1,
-0.6234573, 0.3643875, -2.077718, 0.3137255, 1, 0, 1,
-0.6213267, -0.1195876, -0.8661182, 0.3098039, 1, 0, 1,
-0.6197516, 0.4810628, -0.7666191, 0.3019608, 1, 0, 1,
-0.6161588, 1.111341, -0.2152022, 0.2941177, 1, 0, 1,
-0.6154112, 0.2963679, -1.543777, 0.2901961, 1, 0, 1,
-0.6152051, 0.1169598, -0.9992048, 0.282353, 1, 0, 1,
-0.6114154, -1.18484, -2.952044, 0.2784314, 1, 0, 1,
-0.6104417, -0.1381351, -2.158046, 0.2705882, 1, 0, 1,
-0.6071401, -1.218318, -3.55992, 0.2666667, 1, 0, 1,
-0.6021492, 0.2015925, -0.5874695, 0.2588235, 1, 0, 1,
-0.6005206, 0.4833376, -0.1735252, 0.254902, 1, 0, 1,
-0.5994291, 0.1902574, 0.0136281, 0.2470588, 1, 0, 1,
-0.5990846, 0.4430753, -2.752064, 0.2431373, 1, 0, 1,
-0.5954084, 0.8067213, -1.746851, 0.2352941, 1, 0, 1,
-0.5938792, 1.055618, -0.05467891, 0.2313726, 1, 0, 1,
-0.5920695, 2.111708, 0.6643063, 0.2235294, 1, 0, 1,
-0.5916412, -0.1083486, -2.898604, 0.2196078, 1, 0, 1,
-0.5903773, 0.3384919, -1.686926, 0.2117647, 1, 0, 1,
-0.5887414, 0.06839661, -1.947695, 0.2078431, 1, 0, 1,
-0.5846968, -1.109693, -2.683994, 0.2, 1, 0, 1,
-0.5832052, -0.7019472, -3.342687, 0.1921569, 1, 0, 1,
-0.5824788, 0.9347631, -0.3256922, 0.1882353, 1, 0, 1,
-0.5785179, 0.4386815, 0.6569688, 0.1803922, 1, 0, 1,
-0.5767205, 0.04932149, 0.260922, 0.1764706, 1, 0, 1,
-0.5764274, -0.1331591, -1.739265, 0.1686275, 1, 0, 1,
-0.5750082, 0.9806882, -1.17529, 0.1647059, 1, 0, 1,
-0.5713159, -1.161388, -2.146526, 0.1568628, 1, 0, 1,
-0.5686684, -0.3453172, -1.729807, 0.1529412, 1, 0, 1,
-0.5675718, 0.8154597, -2.597883, 0.145098, 1, 0, 1,
-0.5633444, -1.193031, -2.343912, 0.1411765, 1, 0, 1,
-0.5630184, 1.742125, -0.1035056, 0.1333333, 1, 0, 1,
-0.5574713, -1.535182, -1.714236, 0.1294118, 1, 0, 1,
-0.5532486, 0.05041144, -0.2836392, 0.1215686, 1, 0, 1,
-0.5509626, 0.2816555, -0.4639819, 0.1176471, 1, 0, 1,
-0.5469627, 0.3361149, -2.419666, 0.1098039, 1, 0, 1,
-0.5461237, -0.09361952, -1.792463, 0.1058824, 1, 0, 1,
-0.5454857, -0.7937428, -2.836699, 0.09803922, 1, 0, 1,
-0.5417433, -0.3315294, -2.95791, 0.09019608, 1, 0, 1,
-0.540966, 0.7658169, -0.7923688, 0.08627451, 1, 0, 1,
-0.5341564, -0.1920627, 0.1567478, 0.07843138, 1, 0, 1,
-0.5209327, 0.9382753, -0.7237699, 0.07450981, 1, 0, 1,
-0.5201098, -0.1291419, -2.23112, 0.06666667, 1, 0, 1,
-0.5155706, -0.4223934, -3.763774, 0.0627451, 1, 0, 1,
-0.5133204, -0.03960901, -0.7259657, 0.05490196, 1, 0, 1,
-0.5076442, -0.8870127, -1.891709, 0.05098039, 1, 0, 1,
-0.5010458, 0.2919647, -1.829031, 0.04313726, 1, 0, 1,
-0.5009853, -0.2041701, -2.152184, 0.03921569, 1, 0, 1,
-0.4972866, -0.0841105, -1.95203, 0.03137255, 1, 0, 1,
-0.495438, 0.1701792, -2.802537, 0.02745098, 1, 0, 1,
-0.4921688, 0.008711353, -1.911893, 0.01960784, 1, 0, 1,
-0.4885324, 0.04616508, -3.164103, 0.01568628, 1, 0, 1,
-0.4849292, 1.622918, 0.973431, 0.007843138, 1, 0, 1,
-0.4845392, -0.8406307, -2.562456, 0.003921569, 1, 0, 1,
-0.4802806, -1.209606, -3.535207, 0, 1, 0.003921569, 1,
-0.4779652, 2.298321, 0.7893041, 0, 1, 0.01176471, 1,
-0.4774049, 0.3616539, -1.110148, 0, 1, 0.01568628, 1,
-0.4772578, 1.586822, 0.3219879, 0, 1, 0.02352941, 1,
-0.4729927, -0.8511145, -2.399332, 0, 1, 0.02745098, 1,
-0.472798, 0.6058188, -1.116812, 0, 1, 0.03529412, 1,
-0.4679155, 0.4772852, -1.146694, 0, 1, 0.03921569, 1,
-0.4652322, 1.060146, 0.1489811, 0, 1, 0.04705882, 1,
-0.4641308, -0.9005626, -4.48885, 0, 1, 0.05098039, 1,
-0.4639178, -1.457449, -2.962114, 0, 1, 0.05882353, 1,
-0.4580447, 1.032156, -0.3690482, 0, 1, 0.0627451, 1,
-0.4447761, -2.197711, -2.819366, 0, 1, 0.07058824, 1,
-0.4436015, 0.1299882, -2.69334, 0, 1, 0.07450981, 1,
-0.4430141, -0.7927878, -3.83441, 0, 1, 0.08235294, 1,
-0.4394678, 0.8325689, -1.068899, 0, 1, 0.08627451, 1,
-0.4390495, 0.5150612, -1.438705, 0, 1, 0.09411765, 1,
-0.4310825, 2.127691, 0.21215, 0, 1, 0.1019608, 1,
-0.4251282, -0.1388531, -0.06187622, 0, 1, 0.1058824, 1,
-0.4125478, -0.9517151, -1.652029, 0, 1, 0.1137255, 1,
-0.4124503, -2.061212, -3.166207, 0, 1, 0.1176471, 1,
-0.411137, -0.1063679, -3.052239, 0, 1, 0.1254902, 1,
-0.4077884, 0.1675326, -2.09173, 0, 1, 0.1294118, 1,
-0.4056721, 0.221311, -1.80539, 0, 1, 0.1372549, 1,
-0.3971987, -0.6594954, -2.831164, 0, 1, 0.1411765, 1,
-0.3967435, -0.8810018, -1.908799, 0, 1, 0.1490196, 1,
-0.3927236, 0.7193806, 0.3323902, 0, 1, 0.1529412, 1,
-0.3894946, -0.6259887, -4.970895, 0, 1, 0.1607843, 1,
-0.3804019, 1.031926, 0.3538184, 0, 1, 0.1647059, 1,
-0.3798175, 0.1510899, -1.081409, 0, 1, 0.172549, 1,
-0.3773995, -1.055256, -2.299592, 0, 1, 0.1764706, 1,
-0.3766643, 0.7282299, -1.329286, 0, 1, 0.1843137, 1,
-0.3740299, 2.493436, -0.6919078, 0, 1, 0.1882353, 1,
-0.3725259, -0.04935648, -1.489272, 0, 1, 0.1960784, 1,
-0.3718373, 1.320421, 2.28012, 0, 1, 0.2039216, 1,
-0.3707071, 0.3849559, -0.2348086, 0, 1, 0.2078431, 1,
-0.3706353, -0.562767, -2.053371, 0, 1, 0.2156863, 1,
-0.3701528, 1.038992, -0.4344591, 0, 1, 0.2196078, 1,
-0.3676185, 1.232711, -1.940415, 0, 1, 0.227451, 1,
-0.3623553, -0.6582707, -2.630406, 0, 1, 0.2313726, 1,
-0.3561879, -0.6737031, -0.7343591, 0, 1, 0.2392157, 1,
-0.3507035, 0.768602, -1.832723, 0, 1, 0.2431373, 1,
-0.3479106, -1.452187, -4.103972, 0, 1, 0.2509804, 1,
-0.3476005, 0.7880602, -0.03002867, 0, 1, 0.254902, 1,
-0.3469748, 0.01359927, -1.606898, 0, 1, 0.2627451, 1,
-0.3458319, -0.1374286, -1.952571, 0, 1, 0.2666667, 1,
-0.3362309, -1.843174, -1.660568, 0, 1, 0.2745098, 1,
-0.3350877, 0.7311085, 0.9340443, 0, 1, 0.2784314, 1,
-0.3322647, 1.515889, -1.935506, 0, 1, 0.2862745, 1,
-0.3308821, -1.087805, -2.475021, 0, 1, 0.2901961, 1,
-0.330322, 1.34867, 0.3593003, 0, 1, 0.2980392, 1,
-0.3292233, 1.769809, 0.6180868, 0, 1, 0.3058824, 1,
-0.327517, -0.7812265, -2.627169, 0, 1, 0.3098039, 1,
-0.3192568, -0.1856993, -2.085043, 0, 1, 0.3176471, 1,
-0.3187837, -0.8966175, -2.529335, 0, 1, 0.3215686, 1,
-0.3168809, -1.088601, -3.304802, 0, 1, 0.3294118, 1,
-0.3157379, 0.2218454, -1.658874, 0, 1, 0.3333333, 1,
-0.3126539, -0.1644261, -2.459462, 0, 1, 0.3411765, 1,
-0.3109109, 0.268097, -0.9007956, 0, 1, 0.345098, 1,
-0.3075432, -0.2170612, -1.378231, 0, 1, 0.3529412, 1,
-0.3019216, -1.398187, -3.524223, 0, 1, 0.3568628, 1,
-0.2944147, 0.2321412, -0.4543587, 0, 1, 0.3647059, 1,
-0.2937619, -0.570513, -3.860934, 0, 1, 0.3686275, 1,
-0.289532, 1.088658, -1.385661, 0, 1, 0.3764706, 1,
-0.2889167, -0.667025, -2.096406, 0, 1, 0.3803922, 1,
-0.2875912, 1.408152, -1.507227, 0, 1, 0.3882353, 1,
-0.2874192, -0.05851411, -2.20621, 0, 1, 0.3921569, 1,
-0.2843522, 2.870345, -1.965153, 0, 1, 0.4, 1,
-0.2806287, -0.4985795, -3.326145, 0, 1, 0.4078431, 1,
-0.2799797, 0.3485039, -1.197073, 0, 1, 0.4117647, 1,
-0.2734886, -0.7745596, -2.907644, 0, 1, 0.4196078, 1,
-0.2715638, -0.1629054, -3.119029, 0, 1, 0.4235294, 1,
-0.271528, -0.8367313, -0.1206309, 0, 1, 0.4313726, 1,
-0.2668624, 1.111613, 0.63331, 0, 1, 0.4352941, 1,
-0.2636755, 1.830093, 0.4142249, 0, 1, 0.4431373, 1,
-0.2635962, 0.1393538, -1.817655, 0, 1, 0.4470588, 1,
-0.2602714, -0.1859539, -2.474201, 0, 1, 0.454902, 1,
-0.2562332, -0.1572434, -1.770792, 0, 1, 0.4588235, 1,
-0.2555108, -0.04989599, -1.479133, 0, 1, 0.4666667, 1,
-0.2545478, 1.678689, -0.1824273, 0, 1, 0.4705882, 1,
-0.252572, 1.767954, -0.1916237, 0, 1, 0.4784314, 1,
-0.2522662, 1.48791, 0.4816406, 0, 1, 0.4823529, 1,
-0.2521869, 1.093222, 1.70309, 0, 1, 0.4901961, 1,
-0.2491889, 0.9528244, -1.275301, 0, 1, 0.4941176, 1,
-0.2432053, -0.7921299, -1.541117, 0, 1, 0.5019608, 1,
-0.2415035, 0.3791434, -1.184311, 0, 1, 0.509804, 1,
-0.2393498, 0.7597843, 0.02442211, 0, 1, 0.5137255, 1,
-0.2380271, -0.8799457, -4.954758, 0, 1, 0.5215687, 1,
-0.2376687, -0.3224715, -1.482344, 0, 1, 0.5254902, 1,
-0.2343104, 2.43643, 0.0929528, 0, 1, 0.5333334, 1,
-0.2303575, -1.680347, -3.914767, 0, 1, 0.5372549, 1,
-0.2241064, -1.244285, -2.643992, 0, 1, 0.5450981, 1,
-0.2215786, -1.246708, -4.348463, 0, 1, 0.5490196, 1,
-0.2152309, -0.2951882, -2.91362, 0, 1, 0.5568628, 1,
-0.2097356, -0.4714558, -1.367574, 0, 1, 0.5607843, 1,
-0.2096216, 0.6922724, -3.106904, 0, 1, 0.5686275, 1,
-0.2054448, -0.4746839, -3.333484, 0, 1, 0.572549, 1,
-0.2030653, 0.2204059, -0.6677427, 0, 1, 0.5803922, 1,
-0.2009854, -0.2136733, -1.526428, 0, 1, 0.5843138, 1,
-0.2001338, -1.42789, -2.204336, 0, 1, 0.5921569, 1,
-0.1991835, 1.332301, -0.8917698, 0, 1, 0.5960785, 1,
-0.1990848, -0.1468285, -3.373495, 0, 1, 0.6039216, 1,
-0.1980687, 0.7101598, -1.057936, 0, 1, 0.6117647, 1,
-0.1968427, -0.6441525, -3.495329, 0, 1, 0.6156863, 1,
-0.1929361, -0.4248188, -4.061382, 0, 1, 0.6235294, 1,
-0.1898452, 1.285439, -0.0596847, 0, 1, 0.627451, 1,
-0.1856437, -0.2228468, -1.982683, 0, 1, 0.6352941, 1,
-0.1745111, 0.2760226, -0.03732601, 0, 1, 0.6392157, 1,
-0.1730037, -0.6755036, -4.321418, 0, 1, 0.6470588, 1,
-0.1726239, 0.3267819, -0.04704258, 0, 1, 0.6509804, 1,
-0.1723978, 0.1628236, 0.1222731, 0, 1, 0.6588235, 1,
-0.1704045, -0.3436165, -2.622578, 0, 1, 0.6627451, 1,
-0.1701871, -1.223359, -3.548193, 0, 1, 0.6705883, 1,
-0.1699206, -0.1264376, -0.8633709, 0, 1, 0.6745098, 1,
-0.1697142, -0.2602659, -3.582736, 0, 1, 0.682353, 1,
-0.1689653, 0.09441479, -0.489765, 0, 1, 0.6862745, 1,
-0.1677828, 1.624278, 0.4203774, 0, 1, 0.6941177, 1,
-0.1676362, 1.025248, 0.7162083, 0, 1, 0.7019608, 1,
-0.1676337, 0.3309776, 1.099749, 0, 1, 0.7058824, 1,
-0.1603547, 0.5292066, 0.2977215, 0, 1, 0.7137255, 1,
-0.1530206, -0.0411677, -3.314161, 0, 1, 0.7176471, 1,
-0.1527736, 1.942346, -1.001048, 0, 1, 0.7254902, 1,
-0.1523213, 1.609086, -1.154354, 0, 1, 0.7294118, 1,
-0.1514165, -0.8574146, -2.398011, 0, 1, 0.7372549, 1,
-0.1510812, -0.4319048, -3.004327, 0, 1, 0.7411765, 1,
-0.1485015, -0.03037748, -2.183992, 0, 1, 0.7490196, 1,
-0.1467103, -0.8150482, -1.759374, 0, 1, 0.7529412, 1,
-0.143626, 0.05288376, -2.478988, 0, 1, 0.7607843, 1,
-0.142295, -0.7632952, -3.643528, 0, 1, 0.7647059, 1,
-0.1413137, -2.327102, -3.691567, 0, 1, 0.772549, 1,
-0.1406352, -0.331492, -3.992805, 0, 1, 0.7764706, 1,
-0.1317668, -0.06543919, -0.2666488, 0, 1, 0.7843137, 1,
-0.130554, 2.201494, -0.5661015, 0, 1, 0.7882353, 1,
-0.1298082, 0.1987862, -0.5076326, 0, 1, 0.7960784, 1,
-0.1288917, 0.008601423, -3.787352, 0, 1, 0.8039216, 1,
-0.1188695, 1.155719, 0.8615155, 0, 1, 0.8078431, 1,
-0.1137583, 0.3962274, -0.2416531, 0, 1, 0.8156863, 1,
-0.1119521, 0.4806181, -1.215302, 0, 1, 0.8196079, 1,
-0.1073054, 0.0403511, -3.389563, 0, 1, 0.827451, 1,
-0.1070183, 0.3712448, -1.026366, 0, 1, 0.8313726, 1,
-0.1061318, 0.4119078, 1.852677, 0, 1, 0.8392157, 1,
-0.1048541, 0.4821371, -0.01564653, 0, 1, 0.8431373, 1,
-0.1025218, 1.552799, -1.633563, 0, 1, 0.8509804, 1,
-0.101038, 1.496677, -0.7580171, 0, 1, 0.854902, 1,
-0.0935187, 0.03441941, 0.860983, 0, 1, 0.8627451, 1,
-0.09344996, -0.7262303, -3.920306, 0, 1, 0.8666667, 1,
-0.09272056, 1.065788, 0.3599063, 0, 1, 0.8745098, 1,
-0.09123924, 1.766573, -0.1066364, 0, 1, 0.8784314, 1,
-0.09016132, 0.089067, -0.6048547, 0, 1, 0.8862745, 1,
-0.08980038, 0.1375874, 0.5552704, 0, 1, 0.8901961, 1,
-0.08667532, 0.05338475, 0.325802, 0, 1, 0.8980392, 1,
-0.08401694, 0.1567564, -0.6403889, 0, 1, 0.9058824, 1,
-0.08398343, 0.3381644, -0.7540779, 0, 1, 0.9098039, 1,
-0.08260275, -0.06289712, -2.172804, 0, 1, 0.9176471, 1,
-0.07848339, 0.7700961, 1.68493, 0, 1, 0.9215686, 1,
-0.07491738, -0.2541848, -2.200721, 0, 1, 0.9294118, 1,
-0.07471174, 0.1617642, -0.1018729, 0, 1, 0.9333333, 1,
-0.0729671, -0.7901595, -4.009068, 0, 1, 0.9411765, 1,
-0.07294337, 0.5538899, 0.09849394, 0, 1, 0.945098, 1,
-0.07248088, -0.1984136, -2.098076, 0, 1, 0.9529412, 1,
-0.07222147, 1.550152, -0.009693072, 0, 1, 0.9568627, 1,
-0.07063232, -0.4609165, -3.172401, 0, 1, 0.9647059, 1,
-0.07046559, -1.118923, -1.446352, 0, 1, 0.9686275, 1,
-0.06896358, 1.652943, -0.8846441, 0, 1, 0.9764706, 1,
-0.06287622, 0.6806373, -0.08353566, 0, 1, 0.9803922, 1,
-0.0616913, 1.130529, -0.6480348, 0, 1, 0.9882353, 1,
-0.06116894, 1.307433, 0.08134641, 0, 1, 0.9921569, 1,
-0.06077492, -0.2993652, -3.055279, 0, 1, 1, 1,
-0.0511555, -1.130811, -2.176233, 0, 0.9921569, 1, 1,
-0.03624163, -0.01401921, -1.241766, 0, 0.9882353, 1, 1,
-0.03538116, -0.5191843, -4.161017, 0, 0.9803922, 1, 1,
-0.03503295, 1.29569, 0.4542468, 0, 0.9764706, 1, 1,
-0.03311711, 0.02113634, -3.101202, 0, 0.9686275, 1, 1,
-0.03064039, -1.146566, -3.094436, 0, 0.9647059, 1, 1,
-0.01350028, 0.8990809, -0.01424181, 0, 0.9568627, 1, 1,
-0.01221853, 1.882282, 0.9578751, 0, 0.9529412, 1, 1,
-0.0119917, 0.8422902, 0.5016448, 0, 0.945098, 1, 1,
-0.01014751, 1.992396, -0.4052495, 0, 0.9411765, 1, 1,
-0.009958568, -0.547453, -2.087109, 0, 0.9333333, 1, 1,
-0.009510505, -2.157014, -3.412856, 0, 0.9294118, 1, 1,
-0.009476186, 0.3221467, 0.5572678, 0, 0.9215686, 1, 1,
-0.007361518, -0.518046, -2.757319, 0, 0.9176471, 1, 1,
-0.0052087, 0.571604, -1.780766, 0, 0.9098039, 1, 1,
0.004350621, 0.7596612, -0.1593321, 0, 0.9058824, 1, 1,
0.005406125, 0.5447157, -1.737172, 0, 0.8980392, 1, 1,
0.009140826, 0.5904653, -0.2648914, 0, 0.8901961, 1, 1,
0.01604068, -2.081764, 3.434522, 0, 0.8862745, 1, 1,
0.01746616, 0.03963817, 1.677131, 0, 0.8784314, 1, 1,
0.01913179, 0.9634976, 0.586545, 0, 0.8745098, 1, 1,
0.02123373, -0.4527858, 2.913728, 0, 0.8666667, 1, 1,
0.02125791, -1.040469, 3.597245, 0, 0.8627451, 1, 1,
0.0231196, 1.14709, 0.572436, 0, 0.854902, 1, 1,
0.02792085, -0.9842628, 5.527261, 0, 0.8509804, 1, 1,
0.03121041, -0.4290867, 3.027276, 0, 0.8431373, 1, 1,
0.03161843, -0.8412451, 3.12239, 0, 0.8392157, 1, 1,
0.03238746, -0.6525936, 0.8875079, 0, 0.8313726, 1, 1,
0.04325565, -1.600971, 3.286164, 0, 0.827451, 1, 1,
0.04708236, 0.7545532, -0.6384805, 0, 0.8196079, 1, 1,
0.04954837, -0.6262531, 4.268782, 0, 0.8156863, 1, 1,
0.05041688, -1.399481, 2.584215, 0, 0.8078431, 1, 1,
0.05510887, -1.831444, 2.469757, 0, 0.8039216, 1, 1,
0.06132823, 1.325541, -0.9264416, 0, 0.7960784, 1, 1,
0.06164965, 1.539767, 0.3122775, 0, 0.7882353, 1, 1,
0.06176401, -1.536219, 2.590487, 0, 0.7843137, 1, 1,
0.06565691, 0.1631777, 1.981748, 0, 0.7764706, 1, 1,
0.07161272, -0.1022365, 3.80164, 0, 0.772549, 1, 1,
0.07328467, 0.935585, 0.5582908, 0, 0.7647059, 1, 1,
0.07448301, -0.2328027, 3.198037, 0, 0.7607843, 1, 1,
0.08337075, -0.1658381, 2.938047, 0, 0.7529412, 1, 1,
0.08376231, 0.07370811, 1.068912, 0, 0.7490196, 1, 1,
0.08559431, -1.067035, 4.859926, 0, 0.7411765, 1, 1,
0.08629736, 0.1308454, -0.3283235, 0, 0.7372549, 1, 1,
0.08963709, 0.1506888, 3.598458, 0, 0.7294118, 1, 1,
0.08993788, -0.7345915, 0.6866627, 0, 0.7254902, 1, 1,
0.09280352, -1.458947, 2.200737, 0, 0.7176471, 1, 1,
0.09406879, -0.4060174, 2.413643, 0, 0.7137255, 1, 1,
0.09810828, 0.1916609, -0.545344, 0, 0.7058824, 1, 1,
0.1007859, -0.1523903, 2.651053, 0, 0.6980392, 1, 1,
0.1041091, -0.03411748, 2.889318, 0, 0.6941177, 1, 1,
0.1064123, 1.337429, -0.729607, 0, 0.6862745, 1, 1,
0.1071654, 1.843732, -0.6427166, 0, 0.682353, 1, 1,
0.1123123, 0.1570496, 0.8131835, 0, 0.6745098, 1, 1,
0.1187237, -0.3654673, 3.380439, 0, 0.6705883, 1, 1,
0.1218202, -0.7628989, 3.090588, 0, 0.6627451, 1, 1,
0.121907, -0.005400874, 2.201181, 0, 0.6588235, 1, 1,
0.1243566, -1.029002, 0.267436, 0, 0.6509804, 1, 1,
0.1273597, -0.1389973, 0.5086054, 0, 0.6470588, 1, 1,
0.132843, -0.2481788, 4.650372, 0, 0.6392157, 1, 1,
0.1384776, -0.475557, 2.376556, 0, 0.6352941, 1, 1,
0.1388938, 0.2160782, 0.3970819, 0, 0.627451, 1, 1,
0.1407568, 1.466797, -0.7454229, 0, 0.6235294, 1, 1,
0.1439802, 0.6114249, 1.362283, 0, 0.6156863, 1, 1,
0.1473125, -0.1670564, 0.2293948, 0, 0.6117647, 1, 1,
0.1490687, 0.9957042, -0.04175121, 0, 0.6039216, 1, 1,
0.1495197, 0.4008786, 1.444983, 0, 0.5960785, 1, 1,
0.155026, -0.9503139, 3.964421, 0, 0.5921569, 1, 1,
0.1652066, -1.375296, 5.314556, 0, 0.5843138, 1, 1,
0.1709597, 2.775255, -0.7985801, 0, 0.5803922, 1, 1,
0.1714464, -1.043983, 2.861851, 0, 0.572549, 1, 1,
0.1721734, -0.1016477, 1.45874, 0, 0.5686275, 1, 1,
0.1796832, 0.2182547, 1.028013, 0, 0.5607843, 1, 1,
0.1800285, -1.832189, 3.176233, 0, 0.5568628, 1, 1,
0.1812703, 0.6326725, -0.03543958, 0, 0.5490196, 1, 1,
0.1863661, 0.9507442, -0.9580455, 0, 0.5450981, 1, 1,
0.1896347, -2.103262, 5.063883, 0, 0.5372549, 1, 1,
0.1916306, -0.2008707, -0.1594558, 0, 0.5333334, 1, 1,
0.1951416, 1.039305, -1.256254, 0, 0.5254902, 1, 1,
0.2000578, -0.7955911, 2.313932, 0, 0.5215687, 1, 1,
0.2003372, -0.9213277, 3.16687, 0, 0.5137255, 1, 1,
0.204448, 0.0611598, 1.719833, 0, 0.509804, 1, 1,
0.2111237, 0.8311177, -0.8858505, 0, 0.5019608, 1, 1,
0.2121803, -0.6335694, 4.605455, 0, 0.4941176, 1, 1,
0.2153621, 0.7036704, 1.042469, 0, 0.4901961, 1, 1,
0.2164717, 0.3433834, 1.425247, 0, 0.4823529, 1, 1,
0.2166211, 0.001034819, 3.544277, 0, 0.4784314, 1, 1,
0.2179088, -1.142446, 2.06059, 0, 0.4705882, 1, 1,
0.2193634, 0.1739319, 1.547607, 0, 0.4666667, 1, 1,
0.2208633, -0.1124514, 2.277822, 0, 0.4588235, 1, 1,
0.2210198, -0.5337079, 1.93875, 0, 0.454902, 1, 1,
0.2235, 0.1364128, 1.940654, 0, 0.4470588, 1, 1,
0.224238, 0.1338244, 0.0389822, 0, 0.4431373, 1, 1,
0.241647, 1.084093, 0.2519673, 0, 0.4352941, 1, 1,
0.2454863, -0.952911, 2.051074, 0, 0.4313726, 1, 1,
0.2478848, 1.691191, -0.8459222, 0, 0.4235294, 1, 1,
0.2490356, -1.509469, 1.58778, 0, 0.4196078, 1, 1,
0.2514802, -0.7393047, 3.392584, 0, 0.4117647, 1, 1,
0.2523974, 0.8412731, 0.4119365, 0, 0.4078431, 1, 1,
0.2544399, 0.08325292, 0.07734822, 0, 0.4, 1, 1,
0.2557498, -2.260063, 4.247621, 0, 0.3921569, 1, 1,
0.2643846, 0.4637669, 1.271447, 0, 0.3882353, 1, 1,
0.2653926, -0.07681616, 1.751083, 0, 0.3803922, 1, 1,
0.2677569, -1.572683, 3.44733, 0, 0.3764706, 1, 1,
0.2695802, -0.4800674, 1.074188, 0, 0.3686275, 1, 1,
0.2702582, -2.37357, 3.358097, 0, 0.3647059, 1, 1,
0.270493, 0.5483057, -0.6265764, 0, 0.3568628, 1, 1,
0.273812, 0.3350843, 1.364142, 0, 0.3529412, 1, 1,
0.2759233, 1.538501, -1.475842, 0, 0.345098, 1, 1,
0.2769156, 0.8408927, 0.09359194, 0, 0.3411765, 1, 1,
0.2832374, -0.8107037, 3.793987, 0, 0.3333333, 1, 1,
0.2847094, -0.03868095, 0.01077159, 0, 0.3294118, 1, 1,
0.2900161, -0.5672483, 2.412861, 0, 0.3215686, 1, 1,
0.2903162, 0.1177991, 0.5944368, 0, 0.3176471, 1, 1,
0.2924004, 1.002959, 0.3031958, 0, 0.3098039, 1, 1,
0.2935225, 0.08275192, 1.261748, 0, 0.3058824, 1, 1,
0.2974013, -0.1028063, 3.519339, 0, 0.2980392, 1, 1,
0.3043305, 1.414712, -0.7222461, 0, 0.2901961, 1, 1,
0.3056967, 0.4496774, -0.5583341, 0, 0.2862745, 1, 1,
0.3059236, 0.1532457, 0.6191129, 0, 0.2784314, 1, 1,
0.3069663, 1.11285, -0.09611815, 0, 0.2745098, 1, 1,
0.3080893, -1.760459, 2.040046, 0, 0.2666667, 1, 1,
0.3089076, 0.3725827, 1.093074, 0, 0.2627451, 1, 1,
0.3108523, 1.08293, -1.786367, 0, 0.254902, 1, 1,
0.3129908, 0.2276572, 1.223936, 0, 0.2509804, 1, 1,
0.3132923, 1.001728, 1.662613, 0, 0.2431373, 1, 1,
0.316155, 0.5365595, -0.08425237, 0, 0.2392157, 1, 1,
0.3164635, -0.2169166, 1.425732, 0, 0.2313726, 1, 1,
0.3172008, 0.4482802, -0.1286259, 0, 0.227451, 1, 1,
0.3176141, -0.2399843, 1.539869, 0, 0.2196078, 1, 1,
0.3227561, 0.4694579, 0.7673813, 0, 0.2156863, 1, 1,
0.3234647, 1.092904, -0.1413347, 0, 0.2078431, 1, 1,
0.3325484, 0.7851143, 0.08728824, 0, 0.2039216, 1, 1,
0.3348113, -1.290241, 3.327454, 0, 0.1960784, 1, 1,
0.3425185, -1.940396, 3.175055, 0, 0.1882353, 1, 1,
0.3469381, 0.4577095, -0.7804633, 0, 0.1843137, 1, 1,
0.3475017, -2.862995, 3.107225, 0, 0.1764706, 1, 1,
0.350587, -1.24663, 2.822848, 0, 0.172549, 1, 1,
0.3555006, 0.3870312, 0.4697359, 0, 0.1647059, 1, 1,
0.3606755, -0.05089279, 2.118882, 0, 0.1607843, 1, 1,
0.3625207, 0.2567557, 0.6460047, 0, 0.1529412, 1, 1,
0.3665752, -0.9484242, 1.475884, 0, 0.1490196, 1, 1,
0.3713762, 1.57212, 0.9853373, 0, 0.1411765, 1, 1,
0.3750081, 0.903429, 1.931563, 0, 0.1372549, 1, 1,
0.3756883, -1.30873, 2.77316, 0, 0.1294118, 1, 1,
0.376948, 0.008463525, 1.227986, 0, 0.1254902, 1, 1,
0.3843826, -1.429685, 3.64501, 0, 0.1176471, 1, 1,
0.3865812, -0.9868925, 2.077533, 0, 0.1137255, 1, 1,
0.3881466, -0.3644019, 1.577474, 0, 0.1058824, 1, 1,
0.3892122, -0.1102331, 0.2118583, 0, 0.09803922, 1, 1,
0.3937017, 2.100178, 1.291225, 0, 0.09411765, 1, 1,
0.3954088, 0.4721259, -0.2212704, 0, 0.08627451, 1, 1,
0.3963436, -1.128547, 1.844238, 0, 0.08235294, 1, 1,
0.3993589, 0.6709737, -1.148443, 0, 0.07450981, 1, 1,
0.4058098, -0.4593682, 3.217662, 0, 0.07058824, 1, 1,
0.4068974, 1.480077, 2.620362, 0, 0.0627451, 1, 1,
0.4078565, 0.2388758, 1.364346, 0, 0.05882353, 1, 1,
0.4086268, -2.117102, 3.550477, 0, 0.05098039, 1, 1,
0.4091962, -1.443394, 1.423184, 0, 0.04705882, 1, 1,
0.4130445, -0.4738519, 1.782538, 0, 0.03921569, 1, 1,
0.4140121, -0.6834911, 4.090353, 0, 0.03529412, 1, 1,
0.4142618, 0.7508694, 0.9563013, 0, 0.02745098, 1, 1,
0.4144923, 0.585497, 0.5832767, 0, 0.02352941, 1, 1,
0.4145218, 1.089837, 1.454305, 0, 0.01568628, 1, 1,
0.4146648, 0.4492063, 1.291778, 0, 0.01176471, 1, 1,
0.415824, 0.2072894, -0.9848266, 0, 0.003921569, 1, 1,
0.4188422, -0.6843922, 3.514987, 0.003921569, 0, 1, 1,
0.4194476, 0.1287293, 0.1728639, 0.007843138, 0, 1, 1,
0.4198898, -0.3079425, 2.503003, 0.01568628, 0, 1, 1,
0.4235759, 0.7184963, 1.805563, 0.01960784, 0, 1, 1,
0.425907, -0.1309994, 0.4202691, 0.02745098, 0, 1, 1,
0.42831, 0.8025131, -2.282889, 0.03137255, 0, 1, 1,
0.4381361, 0.4745392, 3.263268, 0.03921569, 0, 1, 1,
0.4415734, -0.8705859, 4.097088, 0.04313726, 0, 1, 1,
0.4420788, 1.020301, 0.5160714, 0.05098039, 0, 1, 1,
0.4438128, -0.2191522, 2.695266, 0.05490196, 0, 1, 1,
0.4504816, 0.218078, 1.271766, 0.0627451, 0, 1, 1,
0.4516574, 0.1594747, 2.135574, 0.06666667, 0, 1, 1,
0.4521395, 0.5355405, -0.2832362, 0.07450981, 0, 1, 1,
0.452892, -0.6878339, 2.020038, 0.07843138, 0, 1, 1,
0.4563408, -1.213687, 2.74829, 0.08627451, 0, 1, 1,
0.457819, -1.217271, 4.056881, 0.09019608, 0, 1, 1,
0.458696, -0.4478237, 1.297842, 0.09803922, 0, 1, 1,
0.4611108, -1.232129, 1.949162, 0.1058824, 0, 1, 1,
0.4614653, -0.100596, 1.26491, 0.1098039, 0, 1, 1,
0.4639507, -3.558047, 2.357007, 0.1176471, 0, 1, 1,
0.4669459, -0.3651343, 1.815271, 0.1215686, 0, 1, 1,
0.468839, 0.006865213, 1.984287, 0.1294118, 0, 1, 1,
0.4718515, -0.1595086, 1.54285, 0.1333333, 0, 1, 1,
0.4824181, 0.1729401, 1.31086, 0.1411765, 0, 1, 1,
0.4913877, -1.340936, 4.237321, 0.145098, 0, 1, 1,
0.4940211, 0.8960191, 0.1469366, 0.1529412, 0, 1, 1,
0.4960169, -0.4345337, 3.325787, 0.1568628, 0, 1, 1,
0.4978531, -1.34432, 2.14145, 0.1647059, 0, 1, 1,
0.5014644, -1.937903, 2.025777, 0.1686275, 0, 1, 1,
0.5056183, 1.79065, -0.691105, 0.1764706, 0, 1, 1,
0.5056823, 0.8862716, -0.765941, 0.1803922, 0, 1, 1,
0.5069651, -0.504501, 2.46317, 0.1882353, 0, 1, 1,
0.516479, 0.3293414, 1.688212, 0.1921569, 0, 1, 1,
0.5185828, -0.2348347, 1.035266, 0.2, 0, 1, 1,
0.520785, 1.142094, 1.340619, 0.2078431, 0, 1, 1,
0.5221775, 0.7905703, -0.1058534, 0.2117647, 0, 1, 1,
0.5233544, 0.3493153, 0.9237022, 0.2196078, 0, 1, 1,
0.5241032, 0.6301392, 1.823026, 0.2235294, 0, 1, 1,
0.5266843, -1.486025, 1.454852, 0.2313726, 0, 1, 1,
0.5283889, 0.9760935, 1.130152, 0.2352941, 0, 1, 1,
0.5317964, 0.5460279, 1.214428, 0.2431373, 0, 1, 1,
0.5321706, -0.3660716, 1.04469, 0.2470588, 0, 1, 1,
0.5327529, 0.4352601, 0.3183709, 0.254902, 0, 1, 1,
0.5355708, -0.1798669, 2.84699, 0.2588235, 0, 1, 1,
0.5370089, -0.202028, 1.431167, 0.2666667, 0, 1, 1,
0.5372246, 2.295205, 1.007582, 0.2705882, 0, 1, 1,
0.5469622, -0.01732625, 2.097104, 0.2784314, 0, 1, 1,
0.5558238, -0.1754129, 1.755334, 0.282353, 0, 1, 1,
0.557526, -0.6784259, 3.641767, 0.2901961, 0, 1, 1,
0.5582457, -0.4935158, 3.014654, 0.2941177, 0, 1, 1,
0.5584012, -2.016109, 2.2497, 0.3019608, 0, 1, 1,
0.5643884, 1.033091, -0.2321871, 0.3098039, 0, 1, 1,
0.5645924, 0.8621752, -0.9886757, 0.3137255, 0, 1, 1,
0.5747533, -0.2472939, 0.9445773, 0.3215686, 0, 1, 1,
0.5801632, 1.795207, 1.039115, 0.3254902, 0, 1, 1,
0.5803305, 1.597554, 0.829603, 0.3333333, 0, 1, 1,
0.5842153, -0.829281, 1.701951, 0.3372549, 0, 1, 1,
0.5856139, 1.567565, 1.543273, 0.345098, 0, 1, 1,
0.5874892, -0.005606139, -0.008581628, 0.3490196, 0, 1, 1,
0.58924, 1.798728, 0.6418421, 0.3568628, 0, 1, 1,
0.5952108, 1.51001, 0.1184035, 0.3607843, 0, 1, 1,
0.5967918, -1.666188, 4.194446, 0.3686275, 0, 1, 1,
0.6020721, -0.8742056, 3.687922, 0.372549, 0, 1, 1,
0.603288, 0.1162121, -0.5949134, 0.3803922, 0, 1, 1,
0.6052172, -1.418742, 1.815797, 0.3843137, 0, 1, 1,
0.6057379, -0.8279216, 4.038232, 0.3921569, 0, 1, 1,
0.6064572, 1.785133, 0.579317, 0.3960784, 0, 1, 1,
0.6097599, 1.569274, -0.6669899, 0.4039216, 0, 1, 1,
0.6173115, -0.9389706, 1.618924, 0.4117647, 0, 1, 1,
0.6191789, 0.8085591, 1.386248, 0.4156863, 0, 1, 1,
0.6206771, 2.29501, 2.191555, 0.4235294, 0, 1, 1,
0.6250072, 0.04419719, 1.222123, 0.427451, 0, 1, 1,
0.6287429, -1.201527, 2.066764, 0.4352941, 0, 1, 1,
0.6361847, -0.1573046, 2.613154, 0.4392157, 0, 1, 1,
0.6365206, 0.9429877, -1.3123, 0.4470588, 0, 1, 1,
0.6377048, -1.354023, 2.833161, 0.4509804, 0, 1, 1,
0.6411564, -0.5870184, 4.104998, 0.4588235, 0, 1, 1,
0.6450891, -0.6120152, 1.969348, 0.4627451, 0, 1, 1,
0.6562148, 0.1415383, 2.407903, 0.4705882, 0, 1, 1,
0.6585294, -0.7949898, 1.71271, 0.4745098, 0, 1, 1,
0.6591719, -0.1087284, 2.638873, 0.4823529, 0, 1, 1,
0.6608399, 0.8626794, 1.408226, 0.4862745, 0, 1, 1,
0.6676464, -0.3143166, 3.848797, 0.4941176, 0, 1, 1,
0.6705718, 1.150546, 0.7111577, 0.5019608, 0, 1, 1,
0.6741416, -0.871533, 4.414221, 0.5058824, 0, 1, 1,
0.6828286, 0.0762525, 1.939995, 0.5137255, 0, 1, 1,
0.6836941, 0.3571209, 1.178068, 0.5176471, 0, 1, 1,
0.6901941, -0.2088896, 1.772059, 0.5254902, 0, 1, 1,
0.6921967, 0.2631835, 2.976008, 0.5294118, 0, 1, 1,
0.697446, -0.8824381, 1.980295, 0.5372549, 0, 1, 1,
0.6979286, -0.4980184, 1.603951, 0.5411765, 0, 1, 1,
0.716508, -2.436824, 1.90369, 0.5490196, 0, 1, 1,
0.7211251, 0.06157527, 2.971552, 0.5529412, 0, 1, 1,
0.7215048, -0.4169591, 2.310875, 0.5607843, 0, 1, 1,
0.7276953, 1.411987, 0.7194729, 0.5647059, 0, 1, 1,
0.7282118, -0.786268, 3.82988, 0.572549, 0, 1, 1,
0.7360707, -0.1096626, 1.340086, 0.5764706, 0, 1, 1,
0.7389158, -0.1818817, 1.956717, 0.5843138, 0, 1, 1,
0.7410839, -1.728364, 2.476084, 0.5882353, 0, 1, 1,
0.7455572, 0.154569, 1.18901, 0.5960785, 0, 1, 1,
0.7461902, 2.522547, 3.419596, 0.6039216, 0, 1, 1,
0.747993, 0.2519238, 1.520908, 0.6078432, 0, 1, 1,
0.7575062, -0.1962631, 1.671775, 0.6156863, 0, 1, 1,
0.7610828, -1.016054, 2.488844, 0.6196079, 0, 1, 1,
0.761862, 0.4266336, 1.572713, 0.627451, 0, 1, 1,
0.7641656, -0.1487473, 2.209959, 0.6313726, 0, 1, 1,
0.7651993, 1.578472, -0.3716508, 0.6392157, 0, 1, 1,
0.7683388, -1.096889, 4.758264, 0.6431373, 0, 1, 1,
0.7748482, -0.5935005, 3.054447, 0.6509804, 0, 1, 1,
0.7759262, -0.7002972, 1.552695, 0.654902, 0, 1, 1,
0.780484, -0.4606039, 1.60733, 0.6627451, 0, 1, 1,
0.7810003, -1.567311, 2.735577, 0.6666667, 0, 1, 1,
0.7829579, 0.0177815, 3.166066, 0.6745098, 0, 1, 1,
0.7911339, 0.7738781, 1.431429, 0.6784314, 0, 1, 1,
0.7953519, -1.052968, 1.382851, 0.6862745, 0, 1, 1,
0.7995223, 0.209812, 1.093782, 0.6901961, 0, 1, 1,
0.8016967, 0.7850285, -0.4786057, 0.6980392, 0, 1, 1,
0.8026749, 0.04205669, 1.393167, 0.7058824, 0, 1, 1,
0.8045911, -0.1602736, 1.189328, 0.7098039, 0, 1, 1,
0.8072281, 0.4733917, 0.8934947, 0.7176471, 0, 1, 1,
0.8228206, -0.8910795, 1.815412, 0.7215686, 0, 1, 1,
0.8250436, 1.322891, 1.064273, 0.7294118, 0, 1, 1,
0.8262705, 0.8328431, 1.64631, 0.7333333, 0, 1, 1,
0.8293226, -1.632825, 1.562196, 0.7411765, 0, 1, 1,
0.837205, -0.7688637, 4.852689, 0.7450981, 0, 1, 1,
0.8383632, 0.06943632, 1.983943, 0.7529412, 0, 1, 1,
0.8506187, -0.4682879, 2.559396, 0.7568628, 0, 1, 1,
0.8510792, 0.7973801, 3.785771, 0.7647059, 0, 1, 1,
0.8531843, -0.9900442, 2.621781, 0.7686275, 0, 1, 1,
0.8549846, 0.2168393, 1.191392, 0.7764706, 0, 1, 1,
0.8558934, -0.8117121, 1.546517, 0.7803922, 0, 1, 1,
0.8572155, -0.9417028, 3.470233, 0.7882353, 0, 1, 1,
0.8581939, -0.8592663, 2.967306, 0.7921569, 0, 1, 1,
0.8583039, 2.32451, 0.948944, 0.8, 0, 1, 1,
0.8595455, 0.3220101, 0.2049064, 0.8078431, 0, 1, 1,
0.8597554, 1.345712, 0.9303899, 0.8117647, 0, 1, 1,
0.8604396, 1.151749, -0.08608994, 0.8196079, 0, 1, 1,
0.8623163, 0.1405155, 3.051635, 0.8235294, 0, 1, 1,
0.867171, -1.198519, 2.576651, 0.8313726, 0, 1, 1,
0.8689325, -0.3603528, 4.090468, 0.8352941, 0, 1, 1,
0.8721683, -1.506952, 3.751538, 0.8431373, 0, 1, 1,
0.8762368, -0.7651006, 1.085618, 0.8470588, 0, 1, 1,
0.8782232, -0.10015, 3.311165, 0.854902, 0, 1, 1,
0.8790832, -0.8308282, 2.198971, 0.8588235, 0, 1, 1,
0.8835075, 0.6684776, 1.285983, 0.8666667, 0, 1, 1,
0.8888562, -0.9037637, 2.20957, 0.8705882, 0, 1, 1,
0.8891746, -0.5956047, 2.284452, 0.8784314, 0, 1, 1,
0.8917959, -0.5423834, 3.917754, 0.8823529, 0, 1, 1,
0.8920783, -0.5354293, 2.495235, 0.8901961, 0, 1, 1,
0.8977482, -0.1778967, 1.59621, 0.8941177, 0, 1, 1,
0.8980777, -0.4334034, 2.707276, 0.9019608, 0, 1, 1,
0.9002404, 0.5548477, 1.686076, 0.9098039, 0, 1, 1,
0.9028346, -0.2681258, 3.344858, 0.9137255, 0, 1, 1,
0.9035971, -0.1184789, 0.6598052, 0.9215686, 0, 1, 1,
0.9197343, 2.129336, 0.2992234, 0.9254902, 0, 1, 1,
0.919936, 0.6316178, 3.126587, 0.9333333, 0, 1, 1,
0.9226767, -1.108608, 2.597608, 0.9372549, 0, 1, 1,
0.9269015, -0.7628496, 1.999521, 0.945098, 0, 1, 1,
0.9319094, 0.8344445, 0.8327972, 0.9490196, 0, 1, 1,
0.9361284, -0.06354923, 0.4911404, 0.9568627, 0, 1, 1,
0.9384965, -0.2475894, 1.172026, 0.9607843, 0, 1, 1,
0.9395773, -1.235552, 3.779402, 0.9686275, 0, 1, 1,
0.9427202, -0.6652206, 3.350945, 0.972549, 0, 1, 1,
0.9437047, 1.054621, 0.4637806, 0.9803922, 0, 1, 1,
0.9448223, 0.3815271, 1.7586, 0.9843137, 0, 1, 1,
0.9489928, -0.225123, -0.05983449, 0.9921569, 0, 1, 1,
0.9550461, -0.2119959, 1.839354, 0.9960784, 0, 1, 1,
0.9588718, -0.2909534, 0.6883253, 1, 0, 0.9960784, 1,
0.9601182, -0.296261, 1.026541, 1, 0, 0.9882353, 1,
0.9612338, 1.188984, -0.5752, 1, 0, 0.9843137, 1,
0.9680184, -0.8045112, 2.718477, 1, 0, 0.9764706, 1,
0.9819574, -0.9198666, 4.392086, 1, 0, 0.972549, 1,
0.9865203, 1.099646, -0.5238086, 1, 0, 0.9647059, 1,
0.991068, -0.4503417, 0.4769687, 1, 0, 0.9607843, 1,
0.9984311, 0.5119265, 0.3672553, 1, 0, 0.9529412, 1,
0.9996717, 1.830847, -0.2131618, 1, 0, 0.9490196, 1,
0.9998979, -0.8220567, 0.266456, 1, 0, 0.9411765, 1,
1.002914, -1.089258, 3.084188, 1, 0, 0.9372549, 1,
1.005621, -0.3637567, 1.460998, 1, 0, 0.9294118, 1,
1.009514, 0.5582036, 2.023303, 1, 0, 0.9254902, 1,
1.010456, -0.016092, 1.590948, 1, 0, 0.9176471, 1,
1.016613, -0.5193472, 1.929957, 1, 0, 0.9137255, 1,
1.021225, 0.2370515, 2.077241, 1, 0, 0.9058824, 1,
1.02413, -0.5511735, 1.946951, 1, 0, 0.9019608, 1,
1.030301, -0.1419423, 3.76916, 1, 0, 0.8941177, 1,
1.033265, 1.595374, -0.9056542, 1, 0, 0.8862745, 1,
1.040619, -1.042779, 3.677651, 1, 0, 0.8823529, 1,
1.05303, 0.008817976, 0.8681344, 1, 0, 0.8745098, 1,
1.05425, -0.7281194, 3.6065, 1, 0, 0.8705882, 1,
1.054269, -0.1223391, 1.902357, 1, 0, 0.8627451, 1,
1.056988, 0.7791293, 0.9462597, 1, 0, 0.8588235, 1,
1.059125, -1.545439, 1.582139, 1, 0, 0.8509804, 1,
1.064552, -0.4389157, 1.966197, 1, 0, 0.8470588, 1,
1.073256, -0.06284492, 1.594005, 1, 0, 0.8392157, 1,
1.074847, 0.8135841, -0.3167366, 1, 0, 0.8352941, 1,
1.075198, 0.107758, 1.287464, 1, 0, 0.827451, 1,
1.085786, -0.3361258, 1.680346, 1, 0, 0.8235294, 1,
1.087495, 0.351605, 1.841043, 1, 0, 0.8156863, 1,
1.093573, 1.068501, 1.007939, 1, 0, 0.8117647, 1,
1.097486, -2.016548, 3.276874, 1, 0, 0.8039216, 1,
1.09919, -0.1694659, 1.495596, 1, 0, 0.7960784, 1,
1.109468, -0.8535157, 0.1009326, 1, 0, 0.7921569, 1,
1.111111, -1.17994, 1.528104, 1, 0, 0.7843137, 1,
1.112158, 0.4083215, 0.3609669, 1, 0, 0.7803922, 1,
1.11678, -0.2866871, 1.965984, 1, 0, 0.772549, 1,
1.117248, 0.7094439, 0.07017718, 1, 0, 0.7686275, 1,
1.117989, -0.318622, 1.178, 1, 0, 0.7607843, 1,
1.122055, -1.32442, 1.954512, 1, 0, 0.7568628, 1,
1.128034, 0.318518, 0.462975, 1, 0, 0.7490196, 1,
1.133147, 0.0618893, 1.92975, 1, 0, 0.7450981, 1,
1.141171, 0.1051356, 1.17689, 1, 0, 0.7372549, 1,
1.145559, -0.6692424, 1.183766, 1, 0, 0.7333333, 1,
1.147105, 2.931636, 0.3405178, 1, 0, 0.7254902, 1,
1.149841, -0.5358144, 2.485254, 1, 0, 0.7215686, 1,
1.151177, 0.6258935, 2.006212, 1, 0, 0.7137255, 1,
1.154661, 0.7687657, 1.969639, 1, 0, 0.7098039, 1,
1.160325, 1.970549, 0.1758668, 1, 0, 0.7019608, 1,
1.160772, 0.2924582, 2.729009, 1, 0, 0.6941177, 1,
1.163134, -1.457824, 3.211415, 1, 0, 0.6901961, 1,
1.165594, -0.7517867, 1.753025, 1, 0, 0.682353, 1,
1.181274, -0.9973268, 1.861674, 1, 0, 0.6784314, 1,
1.181477, 0.4455013, 1.402033, 1, 0, 0.6705883, 1,
1.181533, 0.4393843, 2.528737, 1, 0, 0.6666667, 1,
1.188999, 0.1576966, 0.4229914, 1, 0, 0.6588235, 1,
1.189217, 1.008784, 1.697785, 1, 0, 0.654902, 1,
1.194359, -1.502651, 2.319885, 1, 0, 0.6470588, 1,
1.197041, -0.03057309, 2.703032, 1, 0, 0.6431373, 1,
1.199682, -1.399537, 3.803204, 1, 0, 0.6352941, 1,
1.200866, -1.241508, 2.525446, 1, 0, 0.6313726, 1,
1.203038, -0.2525147, 1.957462, 1, 0, 0.6235294, 1,
1.208711, 0.1794221, 1.381518, 1, 0, 0.6196079, 1,
1.209772, 1.761107, 1.02983, 1, 0, 0.6117647, 1,
1.209959, -0.6818684, 2.315586, 1, 0, 0.6078432, 1,
1.212227, -1.268656, 1.178872, 1, 0, 0.6, 1,
1.21344, -0.8773366, 4.332704, 1, 0, 0.5921569, 1,
1.221347, -0.7017761, 0.2854847, 1, 0, 0.5882353, 1,
1.227629, -0.286027, 2.368099, 1, 0, 0.5803922, 1,
1.227906, -1.338248, 2.873159, 1, 0, 0.5764706, 1,
1.228632, -0.2608149, 2.954388, 1, 0, 0.5686275, 1,
1.234597, -1.256964, 2.023252, 1, 0, 0.5647059, 1,
1.24751, 0.03035767, 1.769083, 1, 0, 0.5568628, 1,
1.250741, -0.2677414, 1.83846, 1, 0, 0.5529412, 1,
1.251039, 1.493979, -0.4270435, 1, 0, 0.5450981, 1,
1.251447, -1.050461, 2.487421, 1, 0, 0.5411765, 1,
1.260929, 0.8740277, 3.189465, 1, 0, 0.5333334, 1,
1.267327, 1.088759, 0.2648868, 1, 0, 0.5294118, 1,
1.272484, 0.1610802, 0.8312129, 1, 0, 0.5215687, 1,
1.289237, -0.2886843, 1.079224, 1, 0, 0.5176471, 1,
1.292548, -0.13787, 1.748536, 1, 0, 0.509804, 1,
1.297665, -1.509762, 2.8643, 1, 0, 0.5058824, 1,
1.315533, 0.8431754, 1.087013, 1, 0, 0.4980392, 1,
1.326374, -0.2431988, 2.703983, 1, 0, 0.4901961, 1,
1.327602, -0.5504351, 2.364685, 1, 0, 0.4862745, 1,
1.331026, 0.1922721, 1.39762, 1, 0, 0.4784314, 1,
1.339676, -0.8861969, 2.122823, 1, 0, 0.4745098, 1,
1.361826, -0.01342273, 1.717205, 1, 0, 0.4666667, 1,
1.364394, -1.517333, 0.814398, 1, 0, 0.4627451, 1,
1.376679, 0.1474114, 1.014356, 1, 0, 0.454902, 1,
1.378156, 1.28736, 2.111479, 1, 0, 0.4509804, 1,
1.383186, -0.4860844, 3.571512, 1, 0, 0.4431373, 1,
1.387351, -1.407311, 2.331656, 1, 0, 0.4392157, 1,
1.393989, 0.774639, 1.406718, 1, 0, 0.4313726, 1,
1.395913, 0.64834, -0.1942091, 1, 0, 0.427451, 1,
1.396702, 0.4522977, 0.7949119, 1, 0, 0.4196078, 1,
1.405923, 1.7293, 1.006146, 1, 0, 0.4156863, 1,
1.448687, 1.268794, 1.520092, 1, 0, 0.4078431, 1,
1.449329, 0.1960549, -0.0146316, 1, 0, 0.4039216, 1,
1.473738, -0.1495443, 2.049639, 1, 0, 0.3960784, 1,
1.479994, -1.268881, 2.579597, 1, 0, 0.3882353, 1,
1.483339, -1.298912, 1.035653, 1, 0, 0.3843137, 1,
1.485855, 0.03795202, 1.408203, 1, 0, 0.3764706, 1,
1.4958, 0.824994, 0.2144752, 1, 0, 0.372549, 1,
1.506278, -0.2765391, 0.3754743, 1, 0, 0.3647059, 1,
1.509, 1.635501, 1.306881, 1, 0, 0.3607843, 1,
1.512317, 0.03381891, 1.992615, 1, 0, 0.3529412, 1,
1.51488, -0.3741997, 1.551083, 1, 0, 0.3490196, 1,
1.522927, 1.237455, 0.5442615, 1, 0, 0.3411765, 1,
1.523925, 1.07606, 0.6951677, 1, 0, 0.3372549, 1,
1.527172, 0.17731, 2.448265, 1, 0, 0.3294118, 1,
1.535134, 0.8399003, 1.385842, 1, 0, 0.3254902, 1,
1.536157, -0.4513881, 1.705957, 1, 0, 0.3176471, 1,
1.550336, 0.09311578, 1.285694, 1, 0, 0.3137255, 1,
1.556685, -1.307355, 2.707239, 1, 0, 0.3058824, 1,
1.594633, -1.036739, 1.586512, 1, 0, 0.2980392, 1,
1.605986, 0.5104325, 1.8667, 1, 0, 0.2941177, 1,
1.608601, -1.841253, 2.671699, 1, 0, 0.2862745, 1,
1.647062, -0.2521715, 2.17729, 1, 0, 0.282353, 1,
1.657519, -1.117623, 1.33586, 1, 0, 0.2745098, 1,
1.65837, -0.3675848, 1.386409, 1, 0, 0.2705882, 1,
1.70931, -0.3286611, 1.96579, 1, 0, 0.2627451, 1,
1.720665, 0.6694178, 0.1156004, 1, 0, 0.2588235, 1,
1.726349, -1.290399, 1.93119, 1, 0, 0.2509804, 1,
1.735984, 0.2484864, 2.386825, 1, 0, 0.2470588, 1,
1.737371, -1.750804, 2.136684, 1, 0, 0.2392157, 1,
1.7449, -0.8745179, 1.377641, 1, 0, 0.2352941, 1,
1.750337, -0.6138991, 3.519727, 1, 0, 0.227451, 1,
1.754684, 1.881808, 2.264602, 1, 0, 0.2235294, 1,
1.756563, -0.3789606, 1.61045, 1, 0, 0.2156863, 1,
1.764034, 0.7645524, 2.488684, 1, 0, 0.2117647, 1,
1.780056, 0.09583189, 2.561585, 1, 0, 0.2039216, 1,
1.787485, 0.1924331, -0.3569047, 1, 0, 0.1960784, 1,
1.789354, -1.543615, 2.02787, 1, 0, 0.1921569, 1,
1.83305, -0.6624336, 2.969759, 1, 0, 0.1843137, 1,
1.865292, -1.769747, 0.8270847, 1, 0, 0.1803922, 1,
1.875921, 0.152597, 0.8387475, 1, 0, 0.172549, 1,
1.912838, -1.044534, 2.153703, 1, 0, 0.1686275, 1,
1.91791, 1.328564, 2.277371, 1, 0, 0.1607843, 1,
1.928239, -0.2728878, 0.860769, 1, 0, 0.1568628, 1,
1.956092, 0.7040588, 1.622953, 1, 0, 0.1490196, 1,
1.962711, 0.7875267, 0.2791467, 1, 0, 0.145098, 1,
1.976397, -1.183434, 2.177999, 1, 0, 0.1372549, 1,
1.978119, 0.6891885, 2.215957, 1, 0, 0.1333333, 1,
1.997431, 1.615037, 0.895498, 1, 0, 0.1254902, 1,
2.015008, -2.158973, 3.924265, 1, 0, 0.1215686, 1,
2.076096, -1.280874, 3.114249, 1, 0, 0.1137255, 1,
2.079807, -0.7000135, 1.827796, 1, 0, 0.1098039, 1,
2.080208, 0.2655399, 1.680608, 1, 0, 0.1019608, 1,
2.111095, -0.4362062, 0.7791573, 1, 0, 0.09411765, 1,
2.126868, 0.6078234, 0.3553565, 1, 0, 0.09019608, 1,
2.148696, -1.074171, 0.7118044, 1, 0, 0.08235294, 1,
2.181255, 1.738754, 1.40836, 1, 0, 0.07843138, 1,
2.263303, 0.5265272, 0.8050854, 1, 0, 0.07058824, 1,
2.285611, -1.056407, 2.324693, 1, 0, 0.06666667, 1,
2.304666, 0.1347116, 1.690478, 1, 0, 0.05882353, 1,
2.338913, -0.3554842, 1.19962, 1, 0, 0.05490196, 1,
2.400516, -0.4892452, 0.4040491, 1, 0, 0.04705882, 1,
2.481878, 0.1495813, 2.501983, 1, 0, 0.04313726, 1,
2.511733, 0.0005551002, 2.093664, 1, 0, 0.03529412, 1,
2.59344, 0.3843247, 0.846975, 1, 0, 0.03137255, 1,
2.786186, 1.332261, 2.529202, 1, 0, 0.02352941, 1,
2.851806, 1.172303, 0.5067998, 1, 0, 0.01960784, 1,
3.158089, -0.7210203, 2.452805, 1, 0, 0.01176471, 1,
3.196224, 1.10028, 1.532985, 1, 0, 0.007843138, 1
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
-0.02679682, -4.658048, -6.750333, 0, -0.5, 0.5, 0.5,
-0.02679682, -4.658048, -6.750333, 1, -0.5, 0.5, 0.5,
-0.02679682, -4.658048, -6.750333, 1, 1.5, 0.5, 0.5,
-0.02679682, -4.658048, -6.750333, 0, 1.5, 0.5, 0.5
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
-4.342422, -0.3132054, -6.750333, 0, -0.5, 0.5, 0.5,
-4.342422, -0.3132054, -6.750333, 1, -0.5, 0.5, 0.5,
-4.342422, -0.3132054, -6.750333, 1, 1.5, 0.5, 0.5,
-4.342422, -0.3132054, -6.750333, 0, 1.5, 0.5, 0.5
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
-4.342422, -4.658048, 0.278183, 0, -0.5, 0.5, 0.5,
-4.342422, -4.658048, 0.278183, 1, -0.5, 0.5, 0.5,
-4.342422, -4.658048, 0.278183, 1, 1.5, 0.5, 0.5,
-4.342422, -4.658048, 0.278183, 0, 1.5, 0.5, 0.5
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
-3, -3.655392, -5.128367,
3, -3.655392, -5.128367,
-3, -3.655392, -5.128367,
-3, -3.822501, -5.398695,
-2, -3.655392, -5.128367,
-2, -3.822501, -5.398695,
-1, -3.655392, -5.128367,
-1, -3.822501, -5.398695,
0, -3.655392, -5.128367,
0, -3.822501, -5.398695,
1, -3.655392, -5.128367,
1, -3.822501, -5.398695,
2, -3.655392, -5.128367,
2, -3.822501, -5.398695,
3, -3.655392, -5.128367,
3, -3.822501, -5.398695
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
-3, -4.15672, -5.93935, 0, -0.5, 0.5, 0.5,
-3, -4.15672, -5.93935, 1, -0.5, 0.5, 0.5,
-3, -4.15672, -5.93935, 1, 1.5, 0.5, 0.5,
-3, -4.15672, -5.93935, 0, 1.5, 0.5, 0.5,
-2, -4.15672, -5.93935, 0, -0.5, 0.5, 0.5,
-2, -4.15672, -5.93935, 1, -0.5, 0.5, 0.5,
-2, -4.15672, -5.93935, 1, 1.5, 0.5, 0.5,
-2, -4.15672, -5.93935, 0, 1.5, 0.5, 0.5,
-1, -4.15672, -5.93935, 0, -0.5, 0.5, 0.5,
-1, -4.15672, -5.93935, 1, -0.5, 0.5, 0.5,
-1, -4.15672, -5.93935, 1, 1.5, 0.5, 0.5,
-1, -4.15672, -5.93935, 0, 1.5, 0.5, 0.5,
0, -4.15672, -5.93935, 0, -0.5, 0.5, 0.5,
0, -4.15672, -5.93935, 1, -0.5, 0.5, 0.5,
0, -4.15672, -5.93935, 1, 1.5, 0.5, 0.5,
0, -4.15672, -5.93935, 0, 1.5, 0.5, 0.5,
1, -4.15672, -5.93935, 0, -0.5, 0.5, 0.5,
1, -4.15672, -5.93935, 1, -0.5, 0.5, 0.5,
1, -4.15672, -5.93935, 1, 1.5, 0.5, 0.5,
1, -4.15672, -5.93935, 0, 1.5, 0.5, 0.5,
2, -4.15672, -5.93935, 0, -0.5, 0.5, 0.5,
2, -4.15672, -5.93935, 1, -0.5, 0.5, 0.5,
2, -4.15672, -5.93935, 1, 1.5, 0.5, 0.5,
2, -4.15672, -5.93935, 0, 1.5, 0.5, 0.5,
3, -4.15672, -5.93935, 0, -0.5, 0.5, 0.5,
3, -4.15672, -5.93935, 1, -0.5, 0.5, 0.5,
3, -4.15672, -5.93935, 1, 1.5, 0.5, 0.5,
3, -4.15672, -5.93935, 0, 1.5, 0.5, 0.5
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
-3.346509, -3, -5.128367,
-3.346509, 2, -5.128367,
-3.346509, -3, -5.128367,
-3.512494, -3, -5.398695,
-3.346509, -2, -5.128367,
-3.512494, -2, -5.398695,
-3.346509, -1, -5.128367,
-3.512494, -1, -5.398695,
-3.346509, 0, -5.128367,
-3.512494, 0, -5.398695,
-3.346509, 1, -5.128367,
-3.512494, 1, -5.398695,
-3.346509, 2, -5.128367,
-3.512494, 2, -5.398695
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
-3.844465, -3, -5.93935, 0, -0.5, 0.5, 0.5,
-3.844465, -3, -5.93935, 1, -0.5, 0.5, 0.5,
-3.844465, -3, -5.93935, 1, 1.5, 0.5, 0.5,
-3.844465, -3, -5.93935, 0, 1.5, 0.5, 0.5,
-3.844465, -2, -5.93935, 0, -0.5, 0.5, 0.5,
-3.844465, -2, -5.93935, 1, -0.5, 0.5, 0.5,
-3.844465, -2, -5.93935, 1, 1.5, 0.5, 0.5,
-3.844465, -2, -5.93935, 0, 1.5, 0.5, 0.5,
-3.844465, -1, -5.93935, 0, -0.5, 0.5, 0.5,
-3.844465, -1, -5.93935, 1, -0.5, 0.5, 0.5,
-3.844465, -1, -5.93935, 1, 1.5, 0.5, 0.5,
-3.844465, -1, -5.93935, 0, 1.5, 0.5, 0.5,
-3.844465, 0, -5.93935, 0, -0.5, 0.5, 0.5,
-3.844465, 0, -5.93935, 1, -0.5, 0.5, 0.5,
-3.844465, 0, -5.93935, 1, 1.5, 0.5, 0.5,
-3.844465, 0, -5.93935, 0, 1.5, 0.5, 0.5,
-3.844465, 1, -5.93935, 0, -0.5, 0.5, 0.5,
-3.844465, 1, -5.93935, 1, -0.5, 0.5, 0.5,
-3.844465, 1, -5.93935, 1, 1.5, 0.5, 0.5,
-3.844465, 1, -5.93935, 0, 1.5, 0.5, 0.5,
-3.844465, 2, -5.93935, 0, -0.5, 0.5, 0.5,
-3.844465, 2, -5.93935, 1, -0.5, 0.5, 0.5,
-3.844465, 2, -5.93935, 1, 1.5, 0.5, 0.5,
-3.844465, 2, -5.93935, 0, 1.5, 0.5, 0.5
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
-3.346509, -3.655392, -4,
-3.346509, -3.655392, 4,
-3.346509, -3.655392, -4,
-3.512494, -3.822501, -4,
-3.346509, -3.655392, -2,
-3.512494, -3.822501, -2,
-3.346509, -3.655392, 0,
-3.512494, -3.822501, 0,
-3.346509, -3.655392, 2,
-3.512494, -3.822501, 2,
-3.346509, -3.655392, 4,
-3.512494, -3.822501, 4
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
-3.844465, -4.15672, -4, 0, -0.5, 0.5, 0.5,
-3.844465, -4.15672, -4, 1, -0.5, 0.5, 0.5,
-3.844465, -4.15672, -4, 1, 1.5, 0.5, 0.5,
-3.844465, -4.15672, -4, 0, 1.5, 0.5, 0.5,
-3.844465, -4.15672, -2, 0, -0.5, 0.5, 0.5,
-3.844465, -4.15672, -2, 1, -0.5, 0.5, 0.5,
-3.844465, -4.15672, -2, 1, 1.5, 0.5, 0.5,
-3.844465, -4.15672, -2, 0, 1.5, 0.5, 0.5,
-3.844465, -4.15672, 0, 0, -0.5, 0.5, 0.5,
-3.844465, -4.15672, 0, 1, -0.5, 0.5, 0.5,
-3.844465, -4.15672, 0, 1, 1.5, 0.5, 0.5,
-3.844465, -4.15672, 0, 0, 1.5, 0.5, 0.5,
-3.844465, -4.15672, 2, 0, -0.5, 0.5, 0.5,
-3.844465, -4.15672, 2, 1, -0.5, 0.5, 0.5,
-3.844465, -4.15672, 2, 1, 1.5, 0.5, 0.5,
-3.844465, -4.15672, 2, 0, 1.5, 0.5, 0.5,
-3.844465, -4.15672, 4, 0, -0.5, 0.5, 0.5,
-3.844465, -4.15672, 4, 1, -0.5, 0.5, 0.5,
-3.844465, -4.15672, 4, 1, 1.5, 0.5, 0.5,
-3.844465, -4.15672, 4, 0, 1.5, 0.5, 0.5
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
-3.346509, -3.655392, -5.128367,
-3.346509, 3.028981, -5.128367,
-3.346509, -3.655392, 5.684733,
-3.346509, 3.028981, 5.684733,
-3.346509, -3.655392, -5.128367,
-3.346509, -3.655392, 5.684733,
-3.346509, 3.028981, -5.128367,
-3.346509, 3.028981, 5.684733,
-3.346509, -3.655392, -5.128367,
3.292915, -3.655392, -5.128367,
-3.346509, -3.655392, 5.684733,
3.292915, -3.655392, 5.684733,
-3.346509, 3.028981, -5.128367,
3.292915, 3.028981, -5.128367,
-3.346509, 3.028981, 5.684733,
3.292915, 3.028981, 5.684733,
3.292915, -3.655392, -5.128367,
3.292915, 3.028981, -5.128367,
3.292915, -3.655392, 5.684733,
3.292915, 3.028981, 5.684733,
3.292915, -3.655392, -5.128367,
3.292915, -3.655392, 5.684733,
3.292915, 3.028981, -5.128367,
3.292915, 3.028981, 5.684733
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
var radius = 7.658219;
var distance = 34.07228;
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
mvMatrix.translate( 0.02679682, 0.3132054, -0.278183 );
mvMatrix.scale( 1.247129, 1.238742, 0.7657577 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.07228);
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
quinmerac<-read.table("quinmerac.xyz")
```

```
## Error in read.table("quinmerac.xyz"): no lines available in input
```

```r
x<-quinmerac$V2
```

```
## Error in eval(expr, envir, enclos): object 'quinmerac' not found
```

```r
y<-quinmerac$V3
```

```
## Error in eval(expr, envir, enclos): object 'quinmerac' not found
```

```r
z<-quinmerac$V4
```

```
## Error in eval(expr, envir, enclos): object 'quinmerac' not found
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
-3.249818, -1.330822, -1.711712, 0, 0, 1, 1, 1,
-2.865992, -0.4850661, -2.526716, 1, 0, 0, 1, 1,
-2.808271, 1.755607, -0.8208451, 1, 0, 0, 1, 1,
-2.715767, 0.7675725, -0.7554969, 1, 0, 0, 1, 1,
-2.614607, 0.779672, -0.3731135, 1, 0, 0, 1, 1,
-2.48358, -0.1145702, -1.627722, 1, 0, 0, 1, 1,
-2.355934, -0.06834975, -1.206492, 0, 0, 0, 1, 1,
-2.291444, 0.9131366, 0.7986515, 0, 0, 0, 1, 1,
-2.28941, -0.8554789, -3.060175, 0, 0, 0, 1, 1,
-2.260474, -0.4189565, -1.46821, 0, 0, 0, 1, 1,
-2.244965, 0.1266205, -2.021394, 0, 0, 0, 1, 1,
-2.172533, -0.4477512, -1.550819, 0, 0, 0, 1, 1,
-2.152547, 0.9459721, -1.37789, 0, 0, 0, 1, 1,
-2.150124, 1.750678, -2.168255, 1, 1, 1, 1, 1,
-2.110015, -1.672537, -3.145364, 1, 1, 1, 1, 1,
-2.105858, -0.7210144, -0.4233322, 1, 1, 1, 1, 1,
-2.09455, 1.200783, -0.4224861, 1, 1, 1, 1, 1,
-2.055297, -1.132716, -4.733715, 1, 1, 1, 1, 1,
-2.042776, -0.9497391, -3.070138, 1, 1, 1, 1, 1,
-2.012915, -0.5566643, -2.439081, 1, 1, 1, 1, 1,
-2.011473, -0.601988, -1.54079, 1, 1, 1, 1, 1,
-1.996072, -0.4636688, -2.88856, 1, 1, 1, 1, 1,
-1.95466, 0.7342135, -2.456991, 1, 1, 1, 1, 1,
-1.949747, 0.8790075, 0.08636979, 1, 1, 1, 1, 1,
-1.944317, 1.799218, -1.214315, 1, 1, 1, 1, 1,
-1.934216, -1.249801, -2.413849, 1, 1, 1, 1, 1,
-1.912317, -0.4475081, -1.654546, 1, 1, 1, 1, 1,
-1.907869, -0.1408721, -0.834841, 1, 1, 1, 1, 1,
-1.899117, -0.2015753, -1.171966, 0, 0, 1, 1, 1,
-1.895266, 0.7752343, 0.1088333, 1, 0, 0, 1, 1,
-1.894852, 0.08027941, -1.513175, 1, 0, 0, 1, 1,
-1.869461, -1.129102, -2.857679, 1, 0, 0, 1, 1,
-1.857954, -0.9664775, -1.918074, 1, 0, 0, 1, 1,
-1.825271, -2.125358, -3.037548, 1, 0, 0, 1, 1,
-1.818818, -2.144778, -1.4125, 0, 0, 0, 1, 1,
-1.812979, -1.326919, -1.383475, 0, 0, 0, 1, 1,
-1.802326, -0.4570526, -1.890966, 0, 0, 0, 1, 1,
-1.799414, 1.502338, -0.952431, 0, 0, 0, 1, 1,
-1.78217, -0.8482016, -2.914912, 0, 0, 0, 1, 1,
-1.756419, -0.2894945, -1.372504, 0, 0, 0, 1, 1,
-1.754817, -1.330272, -2.543806, 0, 0, 0, 1, 1,
-1.731083, 0.9662943, -0.298831, 1, 1, 1, 1, 1,
-1.714597, 0.6905358, -1.776716, 1, 1, 1, 1, 1,
-1.705126, -0.2098404, -0.4247487, 1, 1, 1, 1, 1,
-1.694324, 0.8416429, -0.8929135, 1, 1, 1, 1, 1,
-1.688996, -0.005299155, -0.3827357, 1, 1, 1, 1, 1,
-1.686032, -1.236116, -1.992936, 1, 1, 1, 1, 1,
-1.660334, -1.621195, -2.119242, 1, 1, 1, 1, 1,
-1.660077, 0.1759796, -1.794742, 1, 1, 1, 1, 1,
-1.656036, 0.8657345, -2.14755, 1, 1, 1, 1, 1,
-1.645384, -0.1734181, -2.130165, 1, 1, 1, 1, 1,
-1.642232, 0.4794142, -0.4473881, 1, 1, 1, 1, 1,
-1.603322, -0.5703129, -2.248747, 1, 1, 1, 1, 1,
-1.59895, 0.3855841, -1.84502, 1, 1, 1, 1, 1,
-1.596473, -1.152675, -0.9523683, 1, 1, 1, 1, 1,
-1.594661, 1.077136, -1.450323, 1, 1, 1, 1, 1,
-1.589657, -0.7942083, -3.912542, 0, 0, 1, 1, 1,
-1.582747, 1.014317, -1.545933, 1, 0, 0, 1, 1,
-1.579742, 0.6134245, -0.96201, 1, 0, 0, 1, 1,
-1.576903, 1.775159, 0.9922025, 1, 0, 0, 1, 1,
-1.573688, 0.6975604, -0.7108388, 1, 0, 0, 1, 1,
-1.566859, -2.172188, -1.508236, 1, 0, 0, 1, 1,
-1.545061, -0.6372343, -2.812019, 0, 0, 0, 1, 1,
-1.532259, -1.166123, -2.819493, 0, 0, 0, 1, 1,
-1.53018, -0.9835119, -1.508379, 0, 0, 0, 1, 1,
-1.529301, 1.182262, -1.285987, 0, 0, 0, 1, 1,
-1.529113, -0.2368326, -0.7091544, 0, 0, 0, 1, 1,
-1.512744, 0.04540955, -1.63633, 0, 0, 0, 1, 1,
-1.502293, -0.3469211, -1.949446, 0, 0, 0, 1, 1,
-1.492986, 1.189761, -0.5756185, 1, 1, 1, 1, 1,
-1.489248, -0.05033949, -1.483206, 1, 1, 1, 1, 1,
-1.482088, -1.385928, -2.618317, 1, 1, 1, 1, 1,
-1.481326, -0.1117699, -2.070683, 1, 1, 1, 1, 1,
-1.46511, 0.5892314, -1.961952, 1, 1, 1, 1, 1,
-1.46269, -0.7695968, -4.151512, 1, 1, 1, 1, 1,
-1.459479, -0.7432223, -1.700681, 1, 1, 1, 1, 1,
-1.457079, -0.3532205, -0.658122, 1, 1, 1, 1, 1,
-1.456334, -0.7158435, -4.023349, 1, 1, 1, 1, 1,
-1.451931, -0.8031393, -2.364226, 1, 1, 1, 1, 1,
-1.450839, 0.3424102, -2.207823, 1, 1, 1, 1, 1,
-1.436107, 0.170779, -0.21414, 1, 1, 1, 1, 1,
-1.431835, 0.03263499, -0.168438, 1, 1, 1, 1, 1,
-1.4307, 1.301304, -0.5331748, 1, 1, 1, 1, 1,
-1.423145, 0.05357268, -3.302675, 1, 1, 1, 1, 1,
-1.418885, -0.3890175, -2.063831, 0, 0, 1, 1, 1,
-1.414689, 1.175896, 1.306281, 1, 0, 0, 1, 1,
-1.395128, 0.3744813, -2.266634, 1, 0, 0, 1, 1,
-1.391288, 1.423771, -0.1231625, 1, 0, 0, 1, 1,
-1.387911, -1.092154, -1.650333, 1, 0, 0, 1, 1,
-1.381822, -1.296348, -0.7687684, 1, 0, 0, 1, 1,
-1.37796, 0.7162679, 0.2786885, 0, 0, 0, 1, 1,
-1.371375, 0.6559283, -2.419023, 0, 0, 0, 1, 1,
-1.357312, -1.664635, -0.2309875, 0, 0, 0, 1, 1,
-1.348456, -0.8540261, -1.250871, 0, 0, 0, 1, 1,
-1.347107, -0.4671709, -1.112447, 0, 0, 0, 1, 1,
-1.342479, -0.2198796, -3.952111, 0, 0, 0, 1, 1,
-1.340958, -0.01421642, -1.486842, 0, 0, 0, 1, 1,
-1.333602, -1.167478, -1.539665, 1, 1, 1, 1, 1,
-1.306603, -0.1424512, -1.950305, 1, 1, 1, 1, 1,
-1.301604, -0.6645309, -1.055089, 1, 1, 1, 1, 1,
-1.296613, 1.348403, 0.1778342, 1, 1, 1, 1, 1,
-1.293549, -0.07929489, -0.4113673, 1, 1, 1, 1, 1,
-1.292576, 0.5059782, -1.183809, 1, 1, 1, 1, 1,
-1.290668, -1.19389, -3.428034, 1, 1, 1, 1, 1,
-1.290378, -1.469377, -1.418715, 1, 1, 1, 1, 1,
-1.27993, -1.526796, -2.509163, 1, 1, 1, 1, 1,
-1.268334, 0.0494725, -1.511963, 1, 1, 1, 1, 1,
-1.268079, -0.8807187, -1.899912, 1, 1, 1, 1, 1,
-1.26486, -0.00036444, -3.434465, 1, 1, 1, 1, 1,
-1.258659, -0.2465554, -2.453653, 1, 1, 1, 1, 1,
-1.258416, -0.6434468, -2.342912, 1, 1, 1, 1, 1,
-1.251349, -1.262214, -2.336545, 1, 1, 1, 1, 1,
-1.249198, -0.8093005, -1.857105, 0, 0, 1, 1, 1,
-1.237014, -0.6831863, -2.285031, 1, 0, 0, 1, 1,
-1.232135, -1.261277, -1.346337, 1, 0, 0, 1, 1,
-1.23158, -0.2264453, -2.0425, 1, 0, 0, 1, 1,
-1.229298, -1.329427, -1.697894, 1, 0, 0, 1, 1,
-1.229152, 1.723986, -0.5466492, 1, 0, 0, 1, 1,
-1.218011, -0.4155667, -2.758353, 0, 0, 0, 1, 1,
-1.214442, -1.172562, -2.815332, 0, 0, 0, 1, 1,
-1.210711, -0.4883318, -1.943677, 0, 0, 0, 1, 1,
-1.208252, 0.1893828, -1.844304, 0, 0, 0, 1, 1,
-1.207759, -1.023264, -1.966018, 0, 0, 0, 1, 1,
-1.206934, 0.3980511, 0.1187702, 0, 0, 0, 1, 1,
-1.200594, 0.1263034, -1.118291, 0, 0, 0, 1, 1,
-1.199978, -1.667825, -2.695319, 1, 1, 1, 1, 1,
-1.194396, 0.2886063, -4.045835, 1, 1, 1, 1, 1,
-1.185581, -0.4721181, -1.700211, 1, 1, 1, 1, 1,
-1.185113, 0.6478893, 0.6159859, 1, 1, 1, 1, 1,
-1.182596, 0.6965322, -0.3089372, 1, 1, 1, 1, 1,
-1.170098, 1.057817, -0.8860375, 1, 1, 1, 1, 1,
-1.163183, -0.09213916, -2.998595, 1, 1, 1, 1, 1,
-1.159794, 0.684023, -0.282395, 1, 1, 1, 1, 1,
-1.158651, 1.02682, -2.934119, 1, 1, 1, 1, 1,
-1.155434, -0.577632, -2.643033, 1, 1, 1, 1, 1,
-1.14807, -0.8291299, -2.692674, 1, 1, 1, 1, 1,
-1.142962, -0.9985312, -1.773854, 1, 1, 1, 1, 1,
-1.140205, -0.1204822, 1.049333, 1, 1, 1, 1, 1,
-1.134188, -0.09091039, -0.3025023, 1, 1, 1, 1, 1,
-1.133036, 0.8203458, -1.832345, 1, 1, 1, 1, 1,
-1.126897, 0.9882802, -1.002381, 0, 0, 1, 1, 1,
-1.124546, -1.749875, -0.4938355, 1, 0, 0, 1, 1,
-1.119966, -1.089939, -2.584154, 1, 0, 0, 1, 1,
-1.119338, 0.1875838, -0.2695113, 1, 0, 0, 1, 1,
-1.117454, -0.524544, -1.98156, 1, 0, 0, 1, 1,
-1.110368, 1.255205, -1.292424, 1, 0, 0, 1, 1,
-1.107537, 0.6867369, -0.3422469, 0, 0, 0, 1, 1,
-1.105, -1.115133, -1.622952, 0, 0, 0, 1, 1,
-1.095123, 1.297939, -0.6954789, 0, 0, 0, 1, 1,
-1.074058, 0.4877993, -2.230958, 0, 0, 0, 1, 1,
-1.07383, -0.05046173, -1.458526, 0, 0, 0, 1, 1,
-1.072699, 0.8181674, -1.208591, 0, 0, 0, 1, 1,
-1.062209, 0.1469821, -2.606186, 0, 0, 0, 1, 1,
-1.046515, 0.7454954, -0.6233086, 1, 1, 1, 1, 1,
-1.041921, 1.081588, -0.2116509, 1, 1, 1, 1, 1,
-1.039501, -1.042367, -4.595666, 1, 1, 1, 1, 1,
-1.035806, 0.4869448, -2.63065, 1, 1, 1, 1, 1,
-1.029416, -1.579045, 0.03834081, 1, 1, 1, 1, 1,
-1.023721, 0.01465975, -2.350129, 1, 1, 1, 1, 1,
-1.022814, 0.9226176, 0.000797048, 1, 1, 1, 1, 1,
-1.010888, 0.2893391, -2.395795, 1, 1, 1, 1, 1,
-1.010213, 0.7144523, -0.4932463, 1, 1, 1, 1, 1,
-0.9939842, -0.7152115, -1.45724, 1, 1, 1, 1, 1,
-0.9932552, -0.7732574, -1.875319, 1, 1, 1, 1, 1,
-0.9923793, -1.16889, -2.414687, 1, 1, 1, 1, 1,
-0.9901687, -0.1130633, 0.2842343, 1, 1, 1, 1, 1,
-0.9808156, 0.5155495, 1.117032, 1, 1, 1, 1, 1,
-0.9788141, 1.195976, -1.15575, 1, 1, 1, 1, 1,
-0.9782065, 2.014739, -2.079887, 0, 0, 1, 1, 1,
-0.9770143, 0.7696759, -1.233147, 1, 0, 0, 1, 1,
-0.966152, 0.1668487, -1.560253, 1, 0, 0, 1, 1,
-0.9533213, -0.7808422, -2.000383, 1, 0, 0, 1, 1,
-0.9528534, -0.136083, -2.247688, 1, 0, 0, 1, 1,
-0.9448815, 1.428545, -2.635339, 1, 0, 0, 1, 1,
-0.9428309, -0.3328424, -1.970967, 0, 0, 0, 1, 1,
-0.9419481, -0.06569006, -0.9432836, 0, 0, 0, 1, 1,
-0.9408454, 0.39339, -1.93578, 0, 0, 0, 1, 1,
-0.9394002, -1.280341, -2.860926, 0, 0, 0, 1, 1,
-0.9379702, -0.06008722, -3.020416, 0, 0, 0, 1, 1,
-0.9352087, -0.4655605, -3.76324, 0, 0, 0, 1, 1,
-0.9347708, -0.1055948, -1.208191, 0, 0, 0, 1, 1,
-0.9327043, -0.8356702, -2.799645, 1, 1, 1, 1, 1,
-0.9296414, -0.8237538, -3.531528, 1, 1, 1, 1, 1,
-0.9213306, -0.1592684, -1.155691, 1, 1, 1, 1, 1,
-0.9206645, -1.501878, -3.371246, 1, 1, 1, 1, 1,
-0.9187151, -0.7321394, -1.898527, 1, 1, 1, 1, 1,
-0.9186955, -0.9535006, -3.965785, 1, 1, 1, 1, 1,
-0.9060938, -0.3636653, -3.367049, 1, 1, 1, 1, 1,
-0.903745, 0.9518836, -1.253278, 1, 1, 1, 1, 1,
-0.8994294, 0.3528884, -2.132656, 1, 1, 1, 1, 1,
-0.8986226, -1.030296, -1.817191, 1, 1, 1, 1, 1,
-0.894449, -0.009816992, -1.195855, 1, 1, 1, 1, 1,
-0.8942663, 1.101095, -0.2067245, 1, 1, 1, 1, 1,
-0.8909541, 0.6301746, -1.001012, 1, 1, 1, 1, 1,
-0.8894806, 0.5706443, -1.670494, 1, 1, 1, 1, 1,
-0.8832611, -1.674371, -2.711069, 1, 1, 1, 1, 1,
-0.8802219, -1.157969, -2.411909, 0, 0, 1, 1, 1,
-0.8781112, 1.182016, -3.492949, 1, 0, 0, 1, 1,
-0.8724909, -0.3864963, -1.009494, 1, 0, 0, 1, 1,
-0.8677627, 0.9522148, -0.7674172, 1, 0, 0, 1, 1,
-0.8664757, 0.1497859, -1.977475, 1, 0, 0, 1, 1,
-0.8597676, -0.1441042, -2.221272, 1, 0, 0, 1, 1,
-0.8555418, -0.07269815, -0.1487433, 0, 0, 0, 1, 1,
-0.8554187, -1.242064, -1.066939, 0, 0, 0, 1, 1,
-0.8548273, -0.9823255, -1.821671, 0, 0, 0, 1, 1,
-0.8535677, -0.6039225, -2.448138, 0, 0, 0, 1, 1,
-0.8534414, -0.626712, -2.34782, 0, 0, 0, 1, 1,
-0.8534362, -0.4128022, -3.608482, 0, 0, 0, 1, 1,
-0.8495587, 0.04375365, -1.022369, 0, 0, 0, 1, 1,
-0.8419108, -0.3399111, -2.983689, 1, 1, 1, 1, 1,
-0.839108, -0.7172653, -1.98082, 1, 1, 1, 1, 1,
-0.8366788, -0.4851763, -2.387647, 1, 1, 1, 1, 1,
-0.8286527, 1.946794, 0.09108204, 1, 1, 1, 1, 1,
-0.8262296, 1.246932, 0.5682896, 1, 1, 1, 1, 1,
-0.8159149, 1.14399, -0.9102336, 1, 1, 1, 1, 1,
-0.8154132, 1.020738, 1.541192, 1, 1, 1, 1, 1,
-0.8139097, -0.05814474, -0.8421772, 1, 1, 1, 1, 1,
-0.8114807, 0.4817739, -0.6939391, 1, 1, 1, 1, 1,
-0.8094754, -0.3735763, -2.154689, 1, 1, 1, 1, 1,
-0.8083722, -0.8731154, -3.038866, 1, 1, 1, 1, 1,
-0.7947052, 1.464666, -1.587611, 1, 1, 1, 1, 1,
-0.7938911, 0.5823192, -1.921095, 1, 1, 1, 1, 1,
-0.7898564, 1.036231, -1.176346, 1, 1, 1, 1, 1,
-0.7841839, -0.7777581, -1.199169, 1, 1, 1, 1, 1,
-0.7832711, -1.603984, -1.843499, 0, 0, 1, 1, 1,
-0.7820727, -0.1031738, -1.67816, 1, 0, 0, 1, 1,
-0.7808074, -1.265171, -1.632017, 1, 0, 0, 1, 1,
-0.7800732, 0.3018028, -1.447706, 1, 0, 0, 1, 1,
-0.7768148, 0.6643186, -1.051427, 1, 0, 0, 1, 1,
-0.7727513, 1.626882, -0.4584771, 1, 0, 0, 1, 1,
-0.7704785, 1.958307, -1.005206, 0, 0, 0, 1, 1,
-0.7682559, 1.01212, 1.56066, 0, 0, 0, 1, 1,
-0.7680613, 0.3227074, -0.8652174, 0, 0, 0, 1, 1,
-0.7680169, -0.1632763, -1.618712, 0, 0, 0, 1, 1,
-0.7664847, 0.5041696, -1.857268, 0, 0, 0, 1, 1,
-0.7653161, -1.133439, -2.307122, 0, 0, 0, 1, 1,
-0.7627054, 0.4946345, -0.9848885, 0, 0, 0, 1, 1,
-0.7611607, 0.4111078, -1.302909, 1, 1, 1, 1, 1,
-0.7582504, -0.73498, -2.030447, 1, 1, 1, 1, 1,
-0.7524658, -0.9139946, -1.086802, 1, 1, 1, 1, 1,
-0.75169, 0.9565905, -1.278656, 1, 1, 1, 1, 1,
-0.7493502, -0.5075872, -1.238584, 1, 1, 1, 1, 1,
-0.749321, 0.9624199, -1.149828, 1, 1, 1, 1, 1,
-0.748929, 0.4201622, -0.965943, 1, 1, 1, 1, 1,
-0.7471173, -1.963888, -3.997676, 1, 1, 1, 1, 1,
-0.7460192, -2.15585, -2.456057, 1, 1, 1, 1, 1,
-0.7440766, -0.001858152, 0.6036708, 1, 1, 1, 1, 1,
-0.7339001, 1.073428, -1.547891, 1, 1, 1, 1, 1,
-0.7252293, 1.148034, -0.6741009, 1, 1, 1, 1, 1,
-0.7213668, -0.8934568, -1.988655, 1, 1, 1, 1, 1,
-0.7192956, -0.03896924, -2.386461, 1, 1, 1, 1, 1,
-0.7172772, 0.358924, 0.07338556, 1, 1, 1, 1, 1,
-0.7086592, -0.02381626, -0.8890437, 0, 0, 1, 1, 1,
-0.6956685, -0.9546543, -3.377756, 1, 0, 0, 1, 1,
-0.695033, -1.488419, -2.880134, 1, 0, 0, 1, 1,
-0.6941798, -1.133568, -2.707303, 1, 0, 0, 1, 1,
-0.6929012, -1.989658, -2.455824, 1, 0, 0, 1, 1,
-0.6795785, 0.5560584, 0.09706755, 1, 0, 0, 1, 1,
-0.6750477, 0.01146714, -3.291604, 0, 0, 0, 1, 1,
-0.6747548, -1.197461, -2.972878, 0, 0, 0, 1, 1,
-0.6731397, 0.3341628, -1.60825, 0, 0, 0, 1, 1,
-0.669114, -0.05736807, -2.295504, 0, 0, 0, 1, 1,
-0.6689593, -0.5213346, -1.520366, 0, 0, 0, 1, 1,
-0.6682929, -0.6932978, -1.993243, 0, 0, 0, 1, 1,
-0.6673852, -1.748045, -2.300735, 0, 0, 0, 1, 1,
-0.6623654, 0.1181778, -3.150673, 1, 1, 1, 1, 1,
-0.6612614, 1.093768, -2.15708, 1, 1, 1, 1, 1,
-0.660888, 0.6105102, -0.3394458, 1, 1, 1, 1, 1,
-0.6606826, 0.2346173, 0.52356, 1, 1, 1, 1, 1,
-0.6597307, 1.390043, -0.6056251, 1, 1, 1, 1, 1,
-0.6596712, 0.5033528, -1.816068, 1, 1, 1, 1, 1,
-0.6578042, -0.1745468, -0.03260325, 1, 1, 1, 1, 1,
-0.6538973, -0.497777, -4.114905, 1, 1, 1, 1, 1,
-0.6474406, -0.2313912, -2.135298, 1, 1, 1, 1, 1,
-0.6472926, 0.5908553, -1.442364, 1, 1, 1, 1, 1,
-0.6451588, -0.2976615, -2.472966, 1, 1, 1, 1, 1,
-0.6438205, 0.4332368, -0.8795364, 1, 1, 1, 1, 1,
-0.6408802, 2.281104, -1.430268, 1, 1, 1, 1, 1,
-0.639094, 0.02066042, -1.068805, 1, 1, 1, 1, 1,
-0.6300455, -0.3728695, -1.880074, 1, 1, 1, 1, 1,
-0.6245999, -0.8870872, -2.33986, 0, 0, 1, 1, 1,
-0.6234573, 0.3643875, -2.077718, 1, 0, 0, 1, 1,
-0.6213267, -0.1195876, -0.8661182, 1, 0, 0, 1, 1,
-0.6197516, 0.4810628, -0.7666191, 1, 0, 0, 1, 1,
-0.6161588, 1.111341, -0.2152022, 1, 0, 0, 1, 1,
-0.6154112, 0.2963679, -1.543777, 1, 0, 0, 1, 1,
-0.6152051, 0.1169598, -0.9992048, 0, 0, 0, 1, 1,
-0.6114154, -1.18484, -2.952044, 0, 0, 0, 1, 1,
-0.6104417, -0.1381351, -2.158046, 0, 0, 0, 1, 1,
-0.6071401, -1.218318, -3.55992, 0, 0, 0, 1, 1,
-0.6021492, 0.2015925, -0.5874695, 0, 0, 0, 1, 1,
-0.6005206, 0.4833376, -0.1735252, 0, 0, 0, 1, 1,
-0.5994291, 0.1902574, 0.0136281, 0, 0, 0, 1, 1,
-0.5990846, 0.4430753, -2.752064, 1, 1, 1, 1, 1,
-0.5954084, 0.8067213, -1.746851, 1, 1, 1, 1, 1,
-0.5938792, 1.055618, -0.05467891, 1, 1, 1, 1, 1,
-0.5920695, 2.111708, 0.6643063, 1, 1, 1, 1, 1,
-0.5916412, -0.1083486, -2.898604, 1, 1, 1, 1, 1,
-0.5903773, 0.3384919, -1.686926, 1, 1, 1, 1, 1,
-0.5887414, 0.06839661, -1.947695, 1, 1, 1, 1, 1,
-0.5846968, -1.109693, -2.683994, 1, 1, 1, 1, 1,
-0.5832052, -0.7019472, -3.342687, 1, 1, 1, 1, 1,
-0.5824788, 0.9347631, -0.3256922, 1, 1, 1, 1, 1,
-0.5785179, 0.4386815, 0.6569688, 1, 1, 1, 1, 1,
-0.5767205, 0.04932149, 0.260922, 1, 1, 1, 1, 1,
-0.5764274, -0.1331591, -1.739265, 1, 1, 1, 1, 1,
-0.5750082, 0.9806882, -1.17529, 1, 1, 1, 1, 1,
-0.5713159, -1.161388, -2.146526, 1, 1, 1, 1, 1,
-0.5686684, -0.3453172, -1.729807, 0, 0, 1, 1, 1,
-0.5675718, 0.8154597, -2.597883, 1, 0, 0, 1, 1,
-0.5633444, -1.193031, -2.343912, 1, 0, 0, 1, 1,
-0.5630184, 1.742125, -0.1035056, 1, 0, 0, 1, 1,
-0.5574713, -1.535182, -1.714236, 1, 0, 0, 1, 1,
-0.5532486, 0.05041144, -0.2836392, 1, 0, 0, 1, 1,
-0.5509626, 0.2816555, -0.4639819, 0, 0, 0, 1, 1,
-0.5469627, 0.3361149, -2.419666, 0, 0, 0, 1, 1,
-0.5461237, -0.09361952, -1.792463, 0, 0, 0, 1, 1,
-0.5454857, -0.7937428, -2.836699, 0, 0, 0, 1, 1,
-0.5417433, -0.3315294, -2.95791, 0, 0, 0, 1, 1,
-0.540966, 0.7658169, -0.7923688, 0, 0, 0, 1, 1,
-0.5341564, -0.1920627, 0.1567478, 0, 0, 0, 1, 1,
-0.5209327, 0.9382753, -0.7237699, 1, 1, 1, 1, 1,
-0.5201098, -0.1291419, -2.23112, 1, 1, 1, 1, 1,
-0.5155706, -0.4223934, -3.763774, 1, 1, 1, 1, 1,
-0.5133204, -0.03960901, -0.7259657, 1, 1, 1, 1, 1,
-0.5076442, -0.8870127, -1.891709, 1, 1, 1, 1, 1,
-0.5010458, 0.2919647, -1.829031, 1, 1, 1, 1, 1,
-0.5009853, -0.2041701, -2.152184, 1, 1, 1, 1, 1,
-0.4972866, -0.0841105, -1.95203, 1, 1, 1, 1, 1,
-0.495438, 0.1701792, -2.802537, 1, 1, 1, 1, 1,
-0.4921688, 0.008711353, -1.911893, 1, 1, 1, 1, 1,
-0.4885324, 0.04616508, -3.164103, 1, 1, 1, 1, 1,
-0.4849292, 1.622918, 0.973431, 1, 1, 1, 1, 1,
-0.4845392, -0.8406307, -2.562456, 1, 1, 1, 1, 1,
-0.4802806, -1.209606, -3.535207, 1, 1, 1, 1, 1,
-0.4779652, 2.298321, 0.7893041, 1, 1, 1, 1, 1,
-0.4774049, 0.3616539, -1.110148, 0, 0, 1, 1, 1,
-0.4772578, 1.586822, 0.3219879, 1, 0, 0, 1, 1,
-0.4729927, -0.8511145, -2.399332, 1, 0, 0, 1, 1,
-0.472798, 0.6058188, -1.116812, 1, 0, 0, 1, 1,
-0.4679155, 0.4772852, -1.146694, 1, 0, 0, 1, 1,
-0.4652322, 1.060146, 0.1489811, 1, 0, 0, 1, 1,
-0.4641308, -0.9005626, -4.48885, 0, 0, 0, 1, 1,
-0.4639178, -1.457449, -2.962114, 0, 0, 0, 1, 1,
-0.4580447, 1.032156, -0.3690482, 0, 0, 0, 1, 1,
-0.4447761, -2.197711, -2.819366, 0, 0, 0, 1, 1,
-0.4436015, 0.1299882, -2.69334, 0, 0, 0, 1, 1,
-0.4430141, -0.7927878, -3.83441, 0, 0, 0, 1, 1,
-0.4394678, 0.8325689, -1.068899, 0, 0, 0, 1, 1,
-0.4390495, 0.5150612, -1.438705, 1, 1, 1, 1, 1,
-0.4310825, 2.127691, 0.21215, 1, 1, 1, 1, 1,
-0.4251282, -0.1388531, -0.06187622, 1, 1, 1, 1, 1,
-0.4125478, -0.9517151, -1.652029, 1, 1, 1, 1, 1,
-0.4124503, -2.061212, -3.166207, 1, 1, 1, 1, 1,
-0.411137, -0.1063679, -3.052239, 1, 1, 1, 1, 1,
-0.4077884, 0.1675326, -2.09173, 1, 1, 1, 1, 1,
-0.4056721, 0.221311, -1.80539, 1, 1, 1, 1, 1,
-0.3971987, -0.6594954, -2.831164, 1, 1, 1, 1, 1,
-0.3967435, -0.8810018, -1.908799, 1, 1, 1, 1, 1,
-0.3927236, 0.7193806, 0.3323902, 1, 1, 1, 1, 1,
-0.3894946, -0.6259887, -4.970895, 1, 1, 1, 1, 1,
-0.3804019, 1.031926, 0.3538184, 1, 1, 1, 1, 1,
-0.3798175, 0.1510899, -1.081409, 1, 1, 1, 1, 1,
-0.3773995, -1.055256, -2.299592, 1, 1, 1, 1, 1,
-0.3766643, 0.7282299, -1.329286, 0, 0, 1, 1, 1,
-0.3740299, 2.493436, -0.6919078, 1, 0, 0, 1, 1,
-0.3725259, -0.04935648, -1.489272, 1, 0, 0, 1, 1,
-0.3718373, 1.320421, 2.28012, 1, 0, 0, 1, 1,
-0.3707071, 0.3849559, -0.2348086, 1, 0, 0, 1, 1,
-0.3706353, -0.562767, -2.053371, 1, 0, 0, 1, 1,
-0.3701528, 1.038992, -0.4344591, 0, 0, 0, 1, 1,
-0.3676185, 1.232711, -1.940415, 0, 0, 0, 1, 1,
-0.3623553, -0.6582707, -2.630406, 0, 0, 0, 1, 1,
-0.3561879, -0.6737031, -0.7343591, 0, 0, 0, 1, 1,
-0.3507035, 0.768602, -1.832723, 0, 0, 0, 1, 1,
-0.3479106, -1.452187, -4.103972, 0, 0, 0, 1, 1,
-0.3476005, 0.7880602, -0.03002867, 0, 0, 0, 1, 1,
-0.3469748, 0.01359927, -1.606898, 1, 1, 1, 1, 1,
-0.3458319, -0.1374286, -1.952571, 1, 1, 1, 1, 1,
-0.3362309, -1.843174, -1.660568, 1, 1, 1, 1, 1,
-0.3350877, 0.7311085, 0.9340443, 1, 1, 1, 1, 1,
-0.3322647, 1.515889, -1.935506, 1, 1, 1, 1, 1,
-0.3308821, -1.087805, -2.475021, 1, 1, 1, 1, 1,
-0.330322, 1.34867, 0.3593003, 1, 1, 1, 1, 1,
-0.3292233, 1.769809, 0.6180868, 1, 1, 1, 1, 1,
-0.327517, -0.7812265, -2.627169, 1, 1, 1, 1, 1,
-0.3192568, -0.1856993, -2.085043, 1, 1, 1, 1, 1,
-0.3187837, -0.8966175, -2.529335, 1, 1, 1, 1, 1,
-0.3168809, -1.088601, -3.304802, 1, 1, 1, 1, 1,
-0.3157379, 0.2218454, -1.658874, 1, 1, 1, 1, 1,
-0.3126539, -0.1644261, -2.459462, 1, 1, 1, 1, 1,
-0.3109109, 0.268097, -0.9007956, 1, 1, 1, 1, 1,
-0.3075432, -0.2170612, -1.378231, 0, 0, 1, 1, 1,
-0.3019216, -1.398187, -3.524223, 1, 0, 0, 1, 1,
-0.2944147, 0.2321412, -0.4543587, 1, 0, 0, 1, 1,
-0.2937619, -0.570513, -3.860934, 1, 0, 0, 1, 1,
-0.289532, 1.088658, -1.385661, 1, 0, 0, 1, 1,
-0.2889167, -0.667025, -2.096406, 1, 0, 0, 1, 1,
-0.2875912, 1.408152, -1.507227, 0, 0, 0, 1, 1,
-0.2874192, -0.05851411, -2.20621, 0, 0, 0, 1, 1,
-0.2843522, 2.870345, -1.965153, 0, 0, 0, 1, 1,
-0.2806287, -0.4985795, -3.326145, 0, 0, 0, 1, 1,
-0.2799797, 0.3485039, -1.197073, 0, 0, 0, 1, 1,
-0.2734886, -0.7745596, -2.907644, 0, 0, 0, 1, 1,
-0.2715638, -0.1629054, -3.119029, 0, 0, 0, 1, 1,
-0.271528, -0.8367313, -0.1206309, 1, 1, 1, 1, 1,
-0.2668624, 1.111613, 0.63331, 1, 1, 1, 1, 1,
-0.2636755, 1.830093, 0.4142249, 1, 1, 1, 1, 1,
-0.2635962, 0.1393538, -1.817655, 1, 1, 1, 1, 1,
-0.2602714, -0.1859539, -2.474201, 1, 1, 1, 1, 1,
-0.2562332, -0.1572434, -1.770792, 1, 1, 1, 1, 1,
-0.2555108, -0.04989599, -1.479133, 1, 1, 1, 1, 1,
-0.2545478, 1.678689, -0.1824273, 1, 1, 1, 1, 1,
-0.252572, 1.767954, -0.1916237, 1, 1, 1, 1, 1,
-0.2522662, 1.48791, 0.4816406, 1, 1, 1, 1, 1,
-0.2521869, 1.093222, 1.70309, 1, 1, 1, 1, 1,
-0.2491889, 0.9528244, -1.275301, 1, 1, 1, 1, 1,
-0.2432053, -0.7921299, -1.541117, 1, 1, 1, 1, 1,
-0.2415035, 0.3791434, -1.184311, 1, 1, 1, 1, 1,
-0.2393498, 0.7597843, 0.02442211, 1, 1, 1, 1, 1,
-0.2380271, -0.8799457, -4.954758, 0, 0, 1, 1, 1,
-0.2376687, -0.3224715, -1.482344, 1, 0, 0, 1, 1,
-0.2343104, 2.43643, 0.0929528, 1, 0, 0, 1, 1,
-0.2303575, -1.680347, -3.914767, 1, 0, 0, 1, 1,
-0.2241064, -1.244285, -2.643992, 1, 0, 0, 1, 1,
-0.2215786, -1.246708, -4.348463, 1, 0, 0, 1, 1,
-0.2152309, -0.2951882, -2.91362, 0, 0, 0, 1, 1,
-0.2097356, -0.4714558, -1.367574, 0, 0, 0, 1, 1,
-0.2096216, 0.6922724, -3.106904, 0, 0, 0, 1, 1,
-0.2054448, -0.4746839, -3.333484, 0, 0, 0, 1, 1,
-0.2030653, 0.2204059, -0.6677427, 0, 0, 0, 1, 1,
-0.2009854, -0.2136733, -1.526428, 0, 0, 0, 1, 1,
-0.2001338, -1.42789, -2.204336, 0, 0, 0, 1, 1,
-0.1991835, 1.332301, -0.8917698, 1, 1, 1, 1, 1,
-0.1990848, -0.1468285, -3.373495, 1, 1, 1, 1, 1,
-0.1980687, 0.7101598, -1.057936, 1, 1, 1, 1, 1,
-0.1968427, -0.6441525, -3.495329, 1, 1, 1, 1, 1,
-0.1929361, -0.4248188, -4.061382, 1, 1, 1, 1, 1,
-0.1898452, 1.285439, -0.0596847, 1, 1, 1, 1, 1,
-0.1856437, -0.2228468, -1.982683, 1, 1, 1, 1, 1,
-0.1745111, 0.2760226, -0.03732601, 1, 1, 1, 1, 1,
-0.1730037, -0.6755036, -4.321418, 1, 1, 1, 1, 1,
-0.1726239, 0.3267819, -0.04704258, 1, 1, 1, 1, 1,
-0.1723978, 0.1628236, 0.1222731, 1, 1, 1, 1, 1,
-0.1704045, -0.3436165, -2.622578, 1, 1, 1, 1, 1,
-0.1701871, -1.223359, -3.548193, 1, 1, 1, 1, 1,
-0.1699206, -0.1264376, -0.8633709, 1, 1, 1, 1, 1,
-0.1697142, -0.2602659, -3.582736, 1, 1, 1, 1, 1,
-0.1689653, 0.09441479, -0.489765, 0, 0, 1, 1, 1,
-0.1677828, 1.624278, 0.4203774, 1, 0, 0, 1, 1,
-0.1676362, 1.025248, 0.7162083, 1, 0, 0, 1, 1,
-0.1676337, 0.3309776, 1.099749, 1, 0, 0, 1, 1,
-0.1603547, 0.5292066, 0.2977215, 1, 0, 0, 1, 1,
-0.1530206, -0.0411677, -3.314161, 1, 0, 0, 1, 1,
-0.1527736, 1.942346, -1.001048, 0, 0, 0, 1, 1,
-0.1523213, 1.609086, -1.154354, 0, 0, 0, 1, 1,
-0.1514165, -0.8574146, -2.398011, 0, 0, 0, 1, 1,
-0.1510812, -0.4319048, -3.004327, 0, 0, 0, 1, 1,
-0.1485015, -0.03037748, -2.183992, 0, 0, 0, 1, 1,
-0.1467103, -0.8150482, -1.759374, 0, 0, 0, 1, 1,
-0.143626, 0.05288376, -2.478988, 0, 0, 0, 1, 1,
-0.142295, -0.7632952, -3.643528, 1, 1, 1, 1, 1,
-0.1413137, -2.327102, -3.691567, 1, 1, 1, 1, 1,
-0.1406352, -0.331492, -3.992805, 1, 1, 1, 1, 1,
-0.1317668, -0.06543919, -0.2666488, 1, 1, 1, 1, 1,
-0.130554, 2.201494, -0.5661015, 1, 1, 1, 1, 1,
-0.1298082, 0.1987862, -0.5076326, 1, 1, 1, 1, 1,
-0.1288917, 0.008601423, -3.787352, 1, 1, 1, 1, 1,
-0.1188695, 1.155719, 0.8615155, 1, 1, 1, 1, 1,
-0.1137583, 0.3962274, -0.2416531, 1, 1, 1, 1, 1,
-0.1119521, 0.4806181, -1.215302, 1, 1, 1, 1, 1,
-0.1073054, 0.0403511, -3.389563, 1, 1, 1, 1, 1,
-0.1070183, 0.3712448, -1.026366, 1, 1, 1, 1, 1,
-0.1061318, 0.4119078, 1.852677, 1, 1, 1, 1, 1,
-0.1048541, 0.4821371, -0.01564653, 1, 1, 1, 1, 1,
-0.1025218, 1.552799, -1.633563, 1, 1, 1, 1, 1,
-0.101038, 1.496677, -0.7580171, 0, 0, 1, 1, 1,
-0.0935187, 0.03441941, 0.860983, 1, 0, 0, 1, 1,
-0.09344996, -0.7262303, -3.920306, 1, 0, 0, 1, 1,
-0.09272056, 1.065788, 0.3599063, 1, 0, 0, 1, 1,
-0.09123924, 1.766573, -0.1066364, 1, 0, 0, 1, 1,
-0.09016132, 0.089067, -0.6048547, 1, 0, 0, 1, 1,
-0.08980038, 0.1375874, 0.5552704, 0, 0, 0, 1, 1,
-0.08667532, 0.05338475, 0.325802, 0, 0, 0, 1, 1,
-0.08401694, 0.1567564, -0.6403889, 0, 0, 0, 1, 1,
-0.08398343, 0.3381644, -0.7540779, 0, 0, 0, 1, 1,
-0.08260275, -0.06289712, -2.172804, 0, 0, 0, 1, 1,
-0.07848339, 0.7700961, 1.68493, 0, 0, 0, 1, 1,
-0.07491738, -0.2541848, -2.200721, 0, 0, 0, 1, 1,
-0.07471174, 0.1617642, -0.1018729, 1, 1, 1, 1, 1,
-0.0729671, -0.7901595, -4.009068, 1, 1, 1, 1, 1,
-0.07294337, 0.5538899, 0.09849394, 1, 1, 1, 1, 1,
-0.07248088, -0.1984136, -2.098076, 1, 1, 1, 1, 1,
-0.07222147, 1.550152, -0.009693072, 1, 1, 1, 1, 1,
-0.07063232, -0.4609165, -3.172401, 1, 1, 1, 1, 1,
-0.07046559, -1.118923, -1.446352, 1, 1, 1, 1, 1,
-0.06896358, 1.652943, -0.8846441, 1, 1, 1, 1, 1,
-0.06287622, 0.6806373, -0.08353566, 1, 1, 1, 1, 1,
-0.0616913, 1.130529, -0.6480348, 1, 1, 1, 1, 1,
-0.06116894, 1.307433, 0.08134641, 1, 1, 1, 1, 1,
-0.06077492, -0.2993652, -3.055279, 1, 1, 1, 1, 1,
-0.0511555, -1.130811, -2.176233, 1, 1, 1, 1, 1,
-0.03624163, -0.01401921, -1.241766, 1, 1, 1, 1, 1,
-0.03538116, -0.5191843, -4.161017, 1, 1, 1, 1, 1,
-0.03503295, 1.29569, 0.4542468, 0, 0, 1, 1, 1,
-0.03311711, 0.02113634, -3.101202, 1, 0, 0, 1, 1,
-0.03064039, -1.146566, -3.094436, 1, 0, 0, 1, 1,
-0.01350028, 0.8990809, -0.01424181, 1, 0, 0, 1, 1,
-0.01221853, 1.882282, 0.9578751, 1, 0, 0, 1, 1,
-0.0119917, 0.8422902, 0.5016448, 1, 0, 0, 1, 1,
-0.01014751, 1.992396, -0.4052495, 0, 0, 0, 1, 1,
-0.009958568, -0.547453, -2.087109, 0, 0, 0, 1, 1,
-0.009510505, -2.157014, -3.412856, 0, 0, 0, 1, 1,
-0.009476186, 0.3221467, 0.5572678, 0, 0, 0, 1, 1,
-0.007361518, -0.518046, -2.757319, 0, 0, 0, 1, 1,
-0.0052087, 0.571604, -1.780766, 0, 0, 0, 1, 1,
0.004350621, 0.7596612, -0.1593321, 0, 0, 0, 1, 1,
0.005406125, 0.5447157, -1.737172, 1, 1, 1, 1, 1,
0.009140826, 0.5904653, -0.2648914, 1, 1, 1, 1, 1,
0.01604068, -2.081764, 3.434522, 1, 1, 1, 1, 1,
0.01746616, 0.03963817, 1.677131, 1, 1, 1, 1, 1,
0.01913179, 0.9634976, 0.586545, 1, 1, 1, 1, 1,
0.02123373, -0.4527858, 2.913728, 1, 1, 1, 1, 1,
0.02125791, -1.040469, 3.597245, 1, 1, 1, 1, 1,
0.0231196, 1.14709, 0.572436, 1, 1, 1, 1, 1,
0.02792085, -0.9842628, 5.527261, 1, 1, 1, 1, 1,
0.03121041, -0.4290867, 3.027276, 1, 1, 1, 1, 1,
0.03161843, -0.8412451, 3.12239, 1, 1, 1, 1, 1,
0.03238746, -0.6525936, 0.8875079, 1, 1, 1, 1, 1,
0.04325565, -1.600971, 3.286164, 1, 1, 1, 1, 1,
0.04708236, 0.7545532, -0.6384805, 1, 1, 1, 1, 1,
0.04954837, -0.6262531, 4.268782, 1, 1, 1, 1, 1,
0.05041688, -1.399481, 2.584215, 0, 0, 1, 1, 1,
0.05510887, -1.831444, 2.469757, 1, 0, 0, 1, 1,
0.06132823, 1.325541, -0.9264416, 1, 0, 0, 1, 1,
0.06164965, 1.539767, 0.3122775, 1, 0, 0, 1, 1,
0.06176401, -1.536219, 2.590487, 1, 0, 0, 1, 1,
0.06565691, 0.1631777, 1.981748, 1, 0, 0, 1, 1,
0.07161272, -0.1022365, 3.80164, 0, 0, 0, 1, 1,
0.07328467, 0.935585, 0.5582908, 0, 0, 0, 1, 1,
0.07448301, -0.2328027, 3.198037, 0, 0, 0, 1, 1,
0.08337075, -0.1658381, 2.938047, 0, 0, 0, 1, 1,
0.08376231, 0.07370811, 1.068912, 0, 0, 0, 1, 1,
0.08559431, -1.067035, 4.859926, 0, 0, 0, 1, 1,
0.08629736, 0.1308454, -0.3283235, 0, 0, 0, 1, 1,
0.08963709, 0.1506888, 3.598458, 1, 1, 1, 1, 1,
0.08993788, -0.7345915, 0.6866627, 1, 1, 1, 1, 1,
0.09280352, -1.458947, 2.200737, 1, 1, 1, 1, 1,
0.09406879, -0.4060174, 2.413643, 1, 1, 1, 1, 1,
0.09810828, 0.1916609, -0.545344, 1, 1, 1, 1, 1,
0.1007859, -0.1523903, 2.651053, 1, 1, 1, 1, 1,
0.1041091, -0.03411748, 2.889318, 1, 1, 1, 1, 1,
0.1064123, 1.337429, -0.729607, 1, 1, 1, 1, 1,
0.1071654, 1.843732, -0.6427166, 1, 1, 1, 1, 1,
0.1123123, 0.1570496, 0.8131835, 1, 1, 1, 1, 1,
0.1187237, -0.3654673, 3.380439, 1, 1, 1, 1, 1,
0.1218202, -0.7628989, 3.090588, 1, 1, 1, 1, 1,
0.121907, -0.005400874, 2.201181, 1, 1, 1, 1, 1,
0.1243566, -1.029002, 0.267436, 1, 1, 1, 1, 1,
0.1273597, -0.1389973, 0.5086054, 1, 1, 1, 1, 1,
0.132843, -0.2481788, 4.650372, 0, 0, 1, 1, 1,
0.1384776, -0.475557, 2.376556, 1, 0, 0, 1, 1,
0.1388938, 0.2160782, 0.3970819, 1, 0, 0, 1, 1,
0.1407568, 1.466797, -0.7454229, 1, 0, 0, 1, 1,
0.1439802, 0.6114249, 1.362283, 1, 0, 0, 1, 1,
0.1473125, -0.1670564, 0.2293948, 1, 0, 0, 1, 1,
0.1490687, 0.9957042, -0.04175121, 0, 0, 0, 1, 1,
0.1495197, 0.4008786, 1.444983, 0, 0, 0, 1, 1,
0.155026, -0.9503139, 3.964421, 0, 0, 0, 1, 1,
0.1652066, -1.375296, 5.314556, 0, 0, 0, 1, 1,
0.1709597, 2.775255, -0.7985801, 0, 0, 0, 1, 1,
0.1714464, -1.043983, 2.861851, 0, 0, 0, 1, 1,
0.1721734, -0.1016477, 1.45874, 0, 0, 0, 1, 1,
0.1796832, 0.2182547, 1.028013, 1, 1, 1, 1, 1,
0.1800285, -1.832189, 3.176233, 1, 1, 1, 1, 1,
0.1812703, 0.6326725, -0.03543958, 1, 1, 1, 1, 1,
0.1863661, 0.9507442, -0.9580455, 1, 1, 1, 1, 1,
0.1896347, -2.103262, 5.063883, 1, 1, 1, 1, 1,
0.1916306, -0.2008707, -0.1594558, 1, 1, 1, 1, 1,
0.1951416, 1.039305, -1.256254, 1, 1, 1, 1, 1,
0.2000578, -0.7955911, 2.313932, 1, 1, 1, 1, 1,
0.2003372, -0.9213277, 3.16687, 1, 1, 1, 1, 1,
0.204448, 0.0611598, 1.719833, 1, 1, 1, 1, 1,
0.2111237, 0.8311177, -0.8858505, 1, 1, 1, 1, 1,
0.2121803, -0.6335694, 4.605455, 1, 1, 1, 1, 1,
0.2153621, 0.7036704, 1.042469, 1, 1, 1, 1, 1,
0.2164717, 0.3433834, 1.425247, 1, 1, 1, 1, 1,
0.2166211, 0.001034819, 3.544277, 1, 1, 1, 1, 1,
0.2179088, -1.142446, 2.06059, 0, 0, 1, 1, 1,
0.2193634, 0.1739319, 1.547607, 1, 0, 0, 1, 1,
0.2208633, -0.1124514, 2.277822, 1, 0, 0, 1, 1,
0.2210198, -0.5337079, 1.93875, 1, 0, 0, 1, 1,
0.2235, 0.1364128, 1.940654, 1, 0, 0, 1, 1,
0.224238, 0.1338244, 0.0389822, 1, 0, 0, 1, 1,
0.241647, 1.084093, 0.2519673, 0, 0, 0, 1, 1,
0.2454863, -0.952911, 2.051074, 0, 0, 0, 1, 1,
0.2478848, 1.691191, -0.8459222, 0, 0, 0, 1, 1,
0.2490356, -1.509469, 1.58778, 0, 0, 0, 1, 1,
0.2514802, -0.7393047, 3.392584, 0, 0, 0, 1, 1,
0.2523974, 0.8412731, 0.4119365, 0, 0, 0, 1, 1,
0.2544399, 0.08325292, 0.07734822, 0, 0, 0, 1, 1,
0.2557498, -2.260063, 4.247621, 1, 1, 1, 1, 1,
0.2643846, 0.4637669, 1.271447, 1, 1, 1, 1, 1,
0.2653926, -0.07681616, 1.751083, 1, 1, 1, 1, 1,
0.2677569, -1.572683, 3.44733, 1, 1, 1, 1, 1,
0.2695802, -0.4800674, 1.074188, 1, 1, 1, 1, 1,
0.2702582, -2.37357, 3.358097, 1, 1, 1, 1, 1,
0.270493, 0.5483057, -0.6265764, 1, 1, 1, 1, 1,
0.273812, 0.3350843, 1.364142, 1, 1, 1, 1, 1,
0.2759233, 1.538501, -1.475842, 1, 1, 1, 1, 1,
0.2769156, 0.8408927, 0.09359194, 1, 1, 1, 1, 1,
0.2832374, -0.8107037, 3.793987, 1, 1, 1, 1, 1,
0.2847094, -0.03868095, 0.01077159, 1, 1, 1, 1, 1,
0.2900161, -0.5672483, 2.412861, 1, 1, 1, 1, 1,
0.2903162, 0.1177991, 0.5944368, 1, 1, 1, 1, 1,
0.2924004, 1.002959, 0.3031958, 1, 1, 1, 1, 1,
0.2935225, 0.08275192, 1.261748, 0, 0, 1, 1, 1,
0.2974013, -0.1028063, 3.519339, 1, 0, 0, 1, 1,
0.3043305, 1.414712, -0.7222461, 1, 0, 0, 1, 1,
0.3056967, 0.4496774, -0.5583341, 1, 0, 0, 1, 1,
0.3059236, 0.1532457, 0.6191129, 1, 0, 0, 1, 1,
0.3069663, 1.11285, -0.09611815, 1, 0, 0, 1, 1,
0.3080893, -1.760459, 2.040046, 0, 0, 0, 1, 1,
0.3089076, 0.3725827, 1.093074, 0, 0, 0, 1, 1,
0.3108523, 1.08293, -1.786367, 0, 0, 0, 1, 1,
0.3129908, 0.2276572, 1.223936, 0, 0, 0, 1, 1,
0.3132923, 1.001728, 1.662613, 0, 0, 0, 1, 1,
0.316155, 0.5365595, -0.08425237, 0, 0, 0, 1, 1,
0.3164635, -0.2169166, 1.425732, 0, 0, 0, 1, 1,
0.3172008, 0.4482802, -0.1286259, 1, 1, 1, 1, 1,
0.3176141, -0.2399843, 1.539869, 1, 1, 1, 1, 1,
0.3227561, 0.4694579, 0.7673813, 1, 1, 1, 1, 1,
0.3234647, 1.092904, -0.1413347, 1, 1, 1, 1, 1,
0.3325484, 0.7851143, 0.08728824, 1, 1, 1, 1, 1,
0.3348113, -1.290241, 3.327454, 1, 1, 1, 1, 1,
0.3425185, -1.940396, 3.175055, 1, 1, 1, 1, 1,
0.3469381, 0.4577095, -0.7804633, 1, 1, 1, 1, 1,
0.3475017, -2.862995, 3.107225, 1, 1, 1, 1, 1,
0.350587, -1.24663, 2.822848, 1, 1, 1, 1, 1,
0.3555006, 0.3870312, 0.4697359, 1, 1, 1, 1, 1,
0.3606755, -0.05089279, 2.118882, 1, 1, 1, 1, 1,
0.3625207, 0.2567557, 0.6460047, 1, 1, 1, 1, 1,
0.3665752, -0.9484242, 1.475884, 1, 1, 1, 1, 1,
0.3713762, 1.57212, 0.9853373, 1, 1, 1, 1, 1,
0.3750081, 0.903429, 1.931563, 0, 0, 1, 1, 1,
0.3756883, -1.30873, 2.77316, 1, 0, 0, 1, 1,
0.376948, 0.008463525, 1.227986, 1, 0, 0, 1, 1,
0.3843826, -1.429685, 3.64501, 1, 0, 0, 1, 1,
0.3865812, -0.9868925, 2.077533, 1, 0, 0, 1, 1,
0.3881466, -0.3644019, 1.577474, 1, 0, 0, 1, 1,
0.3892122, -0.1102331, 0.2118583, 0, 0, 0, 1, 1,
0.3937017, 2.100178, 1.291225, 0, 0, 0, 1, 1,
0.3954088, 0.4721259, -0.2212704, 0, 0, 0, 1, 1,
0.3963436, -1.128547, 1.844238, 0, 0, 0, 1, 1,
0.3993589, 0.6709737, -1.148443, 0, 0, 0, 1, 1,
0.4058098, -0.4593682, 3.217662, 0, 0, 0, 1, 1,
0.4068974, 1.480077, 2.620362, 0, 0, 0, 1, 1,
0.4078565, 0.2388758, 1.364346, 1, 1, 1, 1, 1,
0.4086268, -2.117102, 3.550477, 1, 1, 1, 1, 1,
0.4091962, -1.443394, 1.423184, 1, 1, 1, 1, 1,
0.4130445, -0.4738519, 1.782538, 1, 1, 1, 1, 1,
0.4140121, -0.6834911, 4.090353, 1, 1, 1, 1, 1,
0.4142618, 0.7508694, 0.9563013, 1, 1, 1, 1, 1,
0.4144923, 0.585497, 0.5832767, 1, 1, 1, 1, 1,
0.4145218, 1.089837, 1.454305, 1, 1, 1, 1, 1,
0.4146648, 0.4492063, 1.291778, 1, 1, 1, 1, 1,
0.415824, 0.2072894, -0.9848266, 1, 1, 1, 1, 1,
0.4188422, -0.6843922, 3.514987, 1, 1, 1, 1, 1,
0.4194476, 0.1287293, 0.1728639, 1, 1, 1, 1, 1,
0.4198898, -0.3079425, 2.503003, 1, 1, 1, 1, 1,
0.4235759, 0.7184963, 1.805563, 1, 1, 1, 1, 1,
0.425907, -0.1309994, 0.4202691, 1, 1, 1, 1, 1,
0.42831, 0.8025131, -2.282889, 0, 0, 1, 1, 1,
0.4381361, 0.4745392, 3.263268, 1, 0, 0, 1, 1,
0.4415734, -0.8705859, 4.097088, 1, 0, 0, 1, 1,
0.4420788, 1.020301, 0.5160714, 1, 0, 0, 1, 1,
0.4438128, -0.2191522, 2.695266, 1, 0, 0, 1, 1,
0.4504816, 0.218078, 1.271766, 1, 0, 0, 1, 1,
0.4516574, 0.1594747, 2.135574, 0, 0, 0, 1, 1,
0.4521395, 0.5355405, -0.2832362, 0, 0, 0, 1, 1,
0.452892, -0.6878339, 2.020038, 0, 0, 0, 1, 1,
0.4563408, -1.213687, 2.74829, 0, 0, 0, 1, 1,
0.457819, -1.217271, 4.056881, 0, 0, 0, 1, 1,
0.458696, -0.4478237, 1.297842, 0, 0, 0, 1, 1,
0.4611108, -1.232129, 1.949162, 0, 0, 0, 1, 1,
0.4614653, -0.100596, 1.26491, 1, 1, 1, 1, 1,
0.4639507, -3.558047, 2.357007, 1, 1, 1, 1, 1,
0.4669459, -0.3651343, 1.815271, 1, 1, 1, 1, 1,
0.468839, 0.006865213, 1.984287, 1, 1, 1, 1, 1,
0.4718515, -0.1595086, 1.54285, 1, 1, 1, 1, 1,
0.4824181, 0.1729401, 1.31086, 1, 1, 1, 1, 1,
0.4913877, -1.340936, 4.237321, 1, 1, 1, 1, 1,
0.4940211, 0.8960191, 0.1469366, 1, 1, 1, 1, 1,
0.4960169, -0.4345337, 3.325787, 1, 1, 1, 1, 1,
0.4978531, -1.34432, 2.14145, 1, 1, 1, 1, 1,
0.5014644, -1.937903, 2.025777, 1, 1, 1, 1, 1,
0.5056183, 1.79065, -0.691105, 1, 1, 1, 1, 1,
0.5056823, 0.8862716, -0.765941, 1, 1, 1, 1, 1,
0.5069651, -0.504501, 2.46317, 1, 1, 1, 1, 1,
0.516479, 0.3293414, 1.688212, 1, 1, 1, 1, 1,
0.5185828, -0.2348347, 1.035266, 0, 0, 1, 1, 1,
0.520785, 1.142094, 1.340619, 1, 0, 0, 1, 1,
0.5221775, 0.7905703, -0.1058534, 1, 0, 0, 1, 1,
0.5233544, 0.3493153, 0.9237022, 1, 0, 0, 1, 1,
0.5241032, 0.6301392, 1.823026, 1, 0, 0, 1, 1,
0.5266843, -1.486025, 1.454852, 1, 0, 0, 1, 1,
0.5283889, 0.9760935, 1.130152, 0, 0, 0, 1, 1,
0.5317964, 0.5460279, 1.214428, 0, 0, 0, 1, 1,
0.5321706, -0.3660716, 1.04469, 0, 0, 0, 1, 1,
0.5327529, 0.4352601, 0.3183709, 0, 0, 0, 1, 1,
0.5355708, -0.1798669, 2.84699, 0, 0, 0, 1, 1,
0.5370089, -0.202028, 1.431167, 0, 0, 0, 1, 1,
0.5372246, 2.295205, 1.007582, 0, 0, 0, 1, 1,
0.5469622, -0.01732625, 2.097104, 1, 1, 1, 1, 1,
0.5558238, -0.1754129, 1.755334, 1, 1, 1, 1, 1,
0.557526, -0.6784259, 3.641767, 1, 1, 1, 1, 1,
0.5582457, -0.4935158, 3.014654, 1, 1, 1, 1, 1,
0.5584012, -2.016109, 2.2497, 1, 1, 1, 1, 1,
0.5643884, 1.033091, -0.2321871, 1, 1, 1, 1, 1,
0.5645924, 0.8621752, -0.9886757, 1, 1, 1, 1, 1,
0.5747533, -0.2472939, 0.9445773, 1, 1, 1, 1, 1,
0.5801632, 1.795207, 1.039115, 1, 1, 1, 1, 1,
0.5803305, 1.597554, 0.829603, 1, 1, 1, 1, 1,
0.5842153, -0.829281, 1.701951, 1, 1, 1, 1, 1,
0.5856139, 1.567565, 1.543273, 1, 1, 1, 1, 1,
0.5874892, -0.005606139, -0.008581628, 1, 1, 1, 1, 1,
0.58924, 1.798728, 0.6418421, 1, 1, 1, 1, 1,
0.5952108, 1.51001, 0.1184035, 1, 1, 1, 1, 1,
0.5967918, -1.666188, 4.194446, 0, 0, 1, 1, 1,
0.6020721, -0.8742056, 3.687922, 1, 0, 0, 1, 1,
0.603288, 0.1162121, -0.5949134, 1, 0, 0, 1, 1,
0.6052172, -1.418742, 1.815797, 1, 0, 0, 1, 1,
0.6057379, -0.8279216, 4.038232, 1, 0, 0, 1, 1,
0.6064572, 1.785133, 0.579317, 1, 0, 0, 1, 1,
0.6097599, 1.569274, -0.6669899, 0, 0, 0, 1, 1,
0.6173115, -0.9389706, 1.618924, 0, 0, 0, 1, 1,
0.6191789, 0.8085591, 1.386248, 0, 0, 0, 1, 1,
0.6206771, 2.29501, 2.191555, 0, 0, 0, 1, 1,
0.6250072, 0.04419719, 1.222123, 0, 0, 0, 1, 1,
0.6287429, -1.201527, 2.066764, 0, 0, 0, 1, 1,
0.6361847, -0.1573046, 2.613154, 0, 0, 0, 1, 1,
0.6365206, 0.9429877, -1.3123, 1, 1, 1, 1, 1,
0.6377048, -1.354023, 2.833161, 1, 1, 1, 1, 1,
0.6411564, -0.5870184, 4.104998, 1, 1, 1, 1, 1,
0.6450891, -0.6120152, 1.969348, 1, 1, 1, 1, 1,
0.6562148, 0.1415383, 2.407903, 1, 1, 1, 1, 1,
0.6585294, -0.7949898, 1.71271, 1, 1, 1, 1, 1,
0.6591719, -0.1087284, 2.638873, 1, 1, 1, 1, 1,
0.6608399, 0.8626794, 1.408226, 1, 1, 1, 1, 1,
0.6676464, -0.3143166, 3.848797, 1, 1, 1, 1, 1,
0.6705718, 1.150546, 0.7111577, 1, 1, 1, 1, 1,
0.6741416, -0.871533, 4.414221, 1, 1, 1, 1, 1,
0.6828286, 0.0762525, 1.939995, 1, 1, 1, 1, 1,
0.6836941, 0.3571209, 1.178068, 1, 1, 1, 1, 1,
0.6901941, -0.2088896, 1.772059, 1, 1, 1, 1, 1,
0.6921967, 0.2631835, 2.976008, 1, 1, 1, 1, 1,
0.697446, -0.8824381, 1.980295, 0, 0, 1, 1, 1,
0.6979286, -0.4980184, 1.603951, 1, 0, 0, 1, 1,
0.716508, -2.436824, 1.90369, 1, 0, 0, 1, 1,
0.7211251, 0.06157527, 2.971552, 1, 0, 0, 1, 1,
0.7215048, -0.4169591, 2.310875, 1, 0, 0, 1, 1,
0.7276953, 1.411987, 0.7194729, 1, 0, 0, 1, 1,
0.7282118, -0.786268, 3.82988, 0, 0, 0, 1, 1,
0.7360707, -0.1096626, 1.340086, 0, 0, 0, 1, 1,
0.7389158, -0.1818817, 1.956717, 0, 0, 0, 1, 1,
0.7410839, -1.728364, 2.476084, 0, 0, 0, 1, 1,
0.7455572, 0.154569, 1.18901, 0, 0, 0, 1, 1,
0.7461902, 2.522547, 3.419596, 0, 0, 0, 1, 1,
0.747993, 0.2519238, 1.520908, 0, 0, 0, 1, 1,
0.7575062, -0.1962631, 1.671775, 1, 1, 1, 1, 1,
0.7610828, -1.016054, 2.488844, 1, 1, 1, 1, 1,
0.761862, 0.4266336, 1.572713, 1, 1, 1, 1, 1,
0.7641656, -0.1487473, 2.209959, 1, 1, 1, 1, 1,
0.7651993, 1.578472, -0.3716508, 1, 1, 1, 1, 1,
0.7683388, -1.096889, 4.758264, 1, 1, 1, 1, 1,
0.7748482, -0.5935005, 3.054447, 1, 1, 1, 1, 1,
0.7759262, -0.7002972, 1.552695, 1, 1, 1, 1, 1,
0.780484, -0.4606039, 1.60733, 1, 1, 1, 1, 1,
0.7810003, -1.567311, 2.735577, 1, 1, 1, 1, 1,
0.7829579, 0.0177815, 3.166066, 1, 1, 1, 1, 1,
0.7911339, 0.7738781, 1.431429, 1, 1, 1, 1, 1,
0.7953519, -1.052968, 1.382851, 1, 1, 1, 1, 1,
0.7995223, 0.209812, 1.093782, 1, 1, 1, 1, 1,
0.8016967, 0.7850285, -0.4786057, 1, 1, 1, 1, 1,
0.8026749, 0.04205669, 1.393167, 0, 0, 1, 1, 1,
0.8045911, -0.1602736, 1.189328, 1, 0, 0, 1, 1,
0.8072281, 0.4733917, 0.8934947, 1, 0, 0, 1, 1,
0.8228206, -0.8910795, 1.815412, 1, 0, 0, 1, 1,
0.8250436, 1.322891, 1.064273, 1, 0, 0, 1, 1,
0.8262705, 0.8328431, 1.64631, 1, 0, 0, 1, 1,
0.8293226, -1.632825, 1.562196, 0, 0, 0, 1, 1,
0.837205, -0.7688637, 4.852689, 0, 0, 0, 1, 1,
0.8383632, 0.06943632, 1.983943, 0, 0, 0, 1, 1,
0.8506187, -0.4682879, 2.559396, 0, 0, 0, 1, 1,
0.8510792, 0.7973801, 3.785771, 0, 0, 0, 1, 1,
0.8531843, -0.9900442, 2.621781, 0, 0, 0, 1, 1,
0.8549846, 0.2168393, 1.191392, 0, 0, 0, 1, 1,
0.8558934, -0.8117121, 1.546517, 1, 1, 1, 1, 1,
0.8572155, -0.9417028, 3.470233, 1, 1, 1, 1, 1,
0.8581939, -0.8592663, 2.967306, 1, 1, 1, 1, 1,
0.8583039, 2.32451, 0.948944, 1, 1, 1, 1, 1,
0.8595455, 0.3220101, 0.2049064, 1, 1, 1, 1, 1,
0.8597554, 1.345712, 0.9303899, 1, 1, 1, 1, 1,
0.8604396, 1.151749, -0.08608994, 1, 1, 1, 1, 1,
0.8623163, 0.1405155, 3.051635, 1, 1, 1, 1, 1,
0.867171, -1.198519, 2.576651, 1, 1, 1, 1, 1,
0.8689325, -0.3603528, 4.090468, 1, 1, 1, 1, 1,
0.8721683, -1.506952, 3.751538, 1, 1, 1, 1, 1,
0.8762368, -0.7651006, 1.085618, 1, 1, 1, 1, 1,
0.8782232, -0.10015, 3.311165, 1, 1, 1, 1, 1,
0.8790832, -0.8308282, 2.198971, 1, 1, 1, 1, 1,
0.8835075, 0.6684776, 1.285983, 1, 1, 1, 1, 1,
0.8888562, -0.9037637, 2.20957, 0, 0, 1, 1, 1,
0.8891746, -0.5956047, 2.284452, 1, 0, 0, 1, 1,
0.8917959, -0.5423834, 3.917754, 1, 0, 0, 1, 1,
0.8920783, -0.5354293, 2.495235, 1, 0, 0, 1, 1,
0.8977482, -0.1778967, 1.59621, 1, 0, 0, 1, 1,
0.8980777, -0.4334034, 2.707276, 1, 0, 0, 1, 1,
0.9002404, 0.5548477, 1.686076, 0, 0, 0, 1, 1,
0.9028346, -0.2681258, 3.344858, 0, 0, 0, 1, 1,
0.9035971, -0.1184789, 0.6598052, 0, 0, 0, 1, 1,
0.9197343, 2.129336, 0.2992234, 0, 0, 0, 1, 1,
0.919936, 0.6316178, 3.126587, 0, 0, 0, 1, 1,
0.9226767, -1.108608, 2.597608, 0, 0, 0, 1, 1,
0.9269015, -0.7628496, 1.999521, 0, 0, 0, 1, 1,
0.9319094, 0.8344445, 0.8327972, 1, 1, 1, 1, 1,
0.9361284, -0.06354923, 0.4911404, 1, 1, 1, 1, 1,
0.9384965, -0.2475894, 1.172026, 1, 1, 1, 1, 1,
0.9395773, -1.235552, 3.779402, 1, 1, 1, 1, 1,
0.9427202, -0.6652206, 3.350945, 1, 1, 1, 1, 1,
0.9437047, 1.054621, 0.4637806, 1, 1, 1, 1, 1,
0.9448223, 0.3815271, 1.7586, 1, 1, 1, 1, 1,
0.9489928, -0.225123, -0.05983449, 1, 1, 1, 1, 1,
0.9550461, -0.2119959, 1.839354, 1, 1, 1, 1, 1,
0.9588718, -0.2909534, 0.6883253, 1, 1, 1, 1, 1,
0.9601182, -0.296261, 1.026541, 1, 1, 1, 1, 1,
0.9612338, 1.188984, -0.5752, 1, 1, 1, 1, 1,
0.9680184, -0.8045112, 2.718477, 1, 1, 1, 1, 1,
0.9819574, -0.9198666, 4.392086, 1, 1, 1, 1, 1,
0.9865203, 1.099646, -0.5238086, 1, 1, 1, 1, 1,
0.991068, -0.4503417, 0.4769687, 0, 0, 1, 1, 1,
0.9984311, 0.5119265, 0.3672553, 1, 0, 0, 1, 1,
0.9996717, 1.830847, -0.2131618, 1, 0, 0, 1, 1,
0.9998979, -0.8220567, 0.266456, 1, 0, 0, 1, 1,
1.002914, -1.089258, 3.084188, 1, 0, 0, 1, 1,
1.005621, -0.3637567, 1.460998, 1, 0, 0, 1, 1,
1.009514, 0.5582036, 2.023303, 0, 0, 0, 1, 1,
1.010456, -0.016092, 1.590948, 0, 0, 0, 1, 1,
1.016613, -0.5193472, 1.929957, 0, 0, 0, 1, 1,
1.021225, 0.2370515, 2.077241, 0, 0, 0, 1, 1,
1.02413, -0.5511735, 1.946951, 0, 0, 0, 1, 1,
1.030301, -0.1419423, 3.76916, 0, 0, 0, 1, 1,
1.033265, 1.595374, -0.9056542, 0, 0, 0, 1, 1,
1.040619, -1.042779, 3.677651, 1, 1, 1, 1, 1,
1.05303, 0.008817976, 0.8681344, 1, 1, 1, 1, 1,
1.05425, -0.7281194, 3.6065, 1, 1, 1, 1, 1,
1.054269, -0.1223391, 1.902357, 1, 1, 1, 1, 1,
1.056988, 0.7791293, 0.9462597, 1, 1, 1, 1, 1,
1.059125, -1.545439, 1.582139, 1, 1, 1, 1, 1,
1.064552, -0.4389157, 1.966197, 1, 1, 1, 1, 1,
1.073256, -0.06284492, 1.594005, 1, 1, 1, 1, 1,
1.074847, 0.8135841, -0.3167366, 1, 1, 1, 1, 1,
1.075198, 0.107758, 1.287464, 1, 1, 1, 1, 1,
1.085786, -0.3361258, 1.680346, 1, 1, 1, 1, 1,
1.087495, 0.351605, 1.841043, 1, 1, 1, 1, 1,
1.093573, 1.068501, 1.007939, 1, 1, 1, 1, 1,
1.097486, -2.016548, 3.276874, 1, 1, 1, 1, 1,
1.09919, -0.1694659, 1.495596, 1, 1, 1, 1, 1,
1.109468, -0.8535157, 0.1009326, 0, 0, 1, 1, 1,
1.111111, -1.17994, 1.528104, 1, 0, 0, 1, 1,
1.112158, 0.4083215, 0.3609669, 1, 0, 0, 1, 1,
1.11678, -0.2866871, 1.965984, 1, 0, 0, 1, 1,
1.117248, 0.7094439, 0.07017718, 1, 0, 0, 1, 1,
1.117989, -0.318622, 1.178, 1, 0, 0, 1, 1,
1.122055, -1.32442, 1.954512, 0, 0, 0, 1, 1,
1.128034, 0.318518, 0.462975, 0, 0, 0, 1, 1,
1.133147, 0.0618893, 1.92975, 0, 0, 0, 1, 1,
1.141171, 0.1051356, 1.17689, 0, 0, 0, 1, 1,
1.145559, -0.6692424, 1.183766, 0, 0, 0, 1, 1,
1.147105, 2.931636, 0.3405178, 0, 0, 0, 1, 1,
1.149841, -0.5358144, 2.485254, 0, 0, 0, 1, 1,
1.151177, 0.6258935, 2.006212, 1, 1, 1, 1, 1,
1.154661, 0.7687657, 1.969639, 1, 1, 1, 1, 1,
1.160325, 1.970549, 0.1758668, 1, 1, 1, 1, 1,
1.160772, 0.2924582, 2.729009, 1, 1, 1, 1, 1,
1.163134, -1.457824, 3.211415, 1, 1, 1, 1, 1,
1.165594, -0.7517867, 1.753025, 1, 1, 1, 1, 1,
1.181274, -0.9973268, 1.861674, 1, 1, 1, 1, 1,
1.181477, 0.4455013, 1.402033, 1, 1, 1, 1, 1,
1.181533, 0.4393843, 2.528737, 1, 1, 1, 1, 1,
1.188999, 0.1576966, 0.4229914, 1, 1, 1, 1, 1,
1.189217, 1.008784, 1.697785, 1, 1, 1, 1, 1,
1.194359, -1.502651, 2.319885, 1, 1, 1, 1, 1,
1.197041, -0.03057309, 2.703032, 1, 1, 1, 1, 1,
1.199682, -1.399537, 3.803204, 1, 1, 1, 1, 1,
1.200866, -1.241508, 2.525446, 1, 1, 1, 1, 1,
1.203038, -0.2525147, 1.957462, 0, 0, 1, 1, 1,
1.208711, 0.1794221, 1.381518, 1, 0, 0, 1, 1,
1.209772, 1.761107, 1.02983, 1, 0, 0, 1, 1,
1.209959, -0.6818684, 2.315586, 1, 0, 0, 1, 1,
1.212227, -1.268656, 1.178872, 1, 0, 0, 1, 1,
1.21344, -0.8773366, 4.332704, 1, 0, 0, 1, 1,
1.221347, -0.7017761, 0.2854847, 0, 0, 0, 1, 1,
1.227629, -0.286027, 2.368099, 0, 0, 0, 1, 1,
1.227906, -1.338248, 2.873159, 0, 0, 0, 1, 1,
1.228632, -0.2608149, 2.954388, 0, 0, 0, 1, 1,
1.234597, -1.256964, 2.023252, 0, 0, 0, 1, 1,
1.24751, 0.03035767, 1.769083, 0, 0, 0, 1, 1,
1.250741, -0.2677414, 1.83846, 0, 0, 0, 1, 1,
1.251039, 1.493979, -0.4270435, 1, 1, 1, 1, 1,
1.251447, -1.050461, 2.487421, 1, 1, 1, 1, 1,
1.260929, 0.8740277, 3.189465, 1, 1, 1, 1, 1,
1.267327, 1.088759, 0.2648868, 1, 1, 1, 1, 1,
1.272484, 0.1610802, 0.8312129, 1, 1, 1, 1, 1,
1.289237, -0.2886843, 1.079224, 1, 1, 1, 1, 1,
1.292548, -0.13787, 1.748536, 1, 1, 1, 1, 1,
1.297665, -1.509762, 2.8643, 1, 1, 1, 1, 1,
1.315533, 0.8431754, 1.087013, 1, 1, 1, 1, 1,
1.326374, -0.2431988, 2.703983, 1, 1, 1, 1, 1,
1.327602, -0.5504351, 2.364685, 1, 1, 1, 1, 1,
1.331026, 0.1922721, 1.39762, 1, 1, 1, 1, 1,
1.339676, -0.8861969, 2.122823, 1, 1, 1, 1, 1,
1.361826, -0.01342273, 1.717205, 1, 1, 1, 1, 1,
1.364394, -1.517333, 0.814398, 1, 1, 1, 1, 1,
1.376679, 0.1474114, 1.014356, 0, 0, 1, 1, 1,
1.378156, 1.28736, 2.111479, 1, 0, 0, 1, 1,
1.383186, -0.4860844, 3.571512, 1, 0, 0, 1, 1,
1.387351, -1.407311, 2.331656, 1, 0, 0, 1, 1,
1.393989, 0.774639, 1.406718, 1, 0, 0, 1, 1,
1.395913, 0.64834, -0.1942091, 1, 0, 0, 1, 1,
1.396702, 0.4522977, 0.7949119, 0, 0, 0, 1, 1,
1.405923, 1.7293, 1.006146, 0, 0, 0, 1, 1,
1.448687, 1.268794, 1.520092, 0, 0, 0, 1, 1,
1.449329, 0.1960549, -0.0146316, 0, 0, 0, 1, 1,
1.473738, -0.1495443, 2.049639, 0, 0, 0, 1, 1,
1.479994, -1.268881, 2.579597, 0, 0, 0, 1, 1,
1.483339, -1.298912, 1.035653, 0, 0, 0, 1, 1,
1.485855, 0.03795202, 1.408203, 1, 1, 1, 1, 1,
1.4958, 0.824994, 0.2144752, 1, 1, 1, 1, 1,
1.506278, -0.2765391, 0.3754743, 1, 1, 1, 1, 1,
1.509, 1.635501, 1.306881, 1, 1, 1, 1, 1,
1.512317, 0.03381891, 1.992615, 1, 1, 1, 1, 1,
1.51488, -0.3741997, 1.551083, 1, 1, 1, 1, 1,
1.522927, 1.237455, 0.5442615, 1, 1, 1, 1, 1,
1.523925, 1.07606, 0.6951677, 1, 1, 1, 1, 1,
1.527172, 0.17731, 2.448265, 1, 1, 1, 1, 1,
1.535134, 0.8399003, 1.385842, 1, 1, 1, 1, 1,
1.536157, -0.4513881, 1.705957, 1, 1, 1, 1, 1,
1.550336, 0.09311578, 1.285694, 1, 1, 1, 1, 1,
1.556685, -1.307355, 2.707239, 1, 1, 1, 1, 1,
1.594633, -1.036739, 1.586512, 1, 1, 1, 1, 1,
1.605986, 0.5104325, 1.8667, 1, 1, 1, 1, 1,
1.608601, -1.841253, 2.671699, 0, 0, 1, 1, 1,
1.647062, -0.2521715, 2.17729, 1, 0, 0, 1, 1,
1.657519, -1.117623, 1.33586, 1, 0, 0, 1, 1,
1.65837, -0.3675848, 1.386409, 1, 0, 0, 1, 1,
1.70931, -0.3286611, 1.96579, 1, 0, 0, 1, 1,
1.720665, 0.6694178, 0.1156004, 1, 0, 0, 1, 1,
1.726349, -1.290399, 1.93119, 0, 0, 0, 1, 1,
1.735984, 0.2484864, 2.386825, 0, 0, 0, 1, 1,
1.737371, -1.750804, 2.136684, 0, 0, 0, 1, 1,
1.7449, -0.8745179, 1.377641, 0, 0, 0, 1, 1,
1.750337, -0.6138991, 3.519727, 0, 0, 0, 1, 1,
1.754684, 1.881808, 2.264602, 0, 0, 0, 1, 1,
1.756563, -0.3789606, 1.61045, 0, 0, 0, 1, 1,
1.764034, 0.7645524, 2.488684, 1, 1, 1, 1, 1,
1.780056, 0.09583189, 2.561585, 1, 1, 1, 1, 1,
1.787485, 0.1924331, -0.3569047, 1, 1, 1, 1, 1,
1.789354, -1.543615, 2.02787, 1, 1, 1, 1, 1,
1.83305, -0.6624336, 2.969759, 1, 1, 1, 1, 1,
1.865292, -1.769747, 0.8270847, 1, 1, 1, 1, 1,
1.875921, 0.152597, 0.8387475, 1, 1, 1, 1, 1,
1.912838, -1.044534, 2.153703, 1, 1, 1, 1, 1,
1.91791, 1.328564, 2.277371, 1, 1, 1, 1, 1,
1.928239, -0.2728878, 0.860769, 1, 1, 1, 1, 1,
1.956092, 0.7040588, 1.622953, 1, 1, 1, 1, 1,
1.962711, 0.7875267, 0.2791467, 1, 1, 1, 1, 1,
1.976397, -1.183434, 2.177999, 1, 1, 1, 1, 1,
1.978119, 0.6891885, 2.215957, 1, 1, 1, 1, 1,
1.997431, 1.615037, 0.895498, 1, 1, 1, 1, 1,
2.015008, -2.158973, 3.924265, 0, 0, 1, 1, 1,
2.076096, -1.280874, 3.114249, 1, 0, 0, 1, 1,
2.079807, -0.7000135, 1.827796, 1, 0, 0, 1, 1,
2.080208, 0.2655399, 1.680608, 1, 0, 0, 1, 1,
2.111095, -0.4362062, 0.7791573, 1, 0, 0, 1, 1,
2.126868, 0.6078234, 0.3553565, 1, 0, 0, 1, 1,
2.148696, -1.074171, 0.7118044, 0, 0, 0, 1, 1,
2.181255, 1.738754, 1.40836, 0, 0, 0, 1, 1,
2.263303, 0.5265272, 0.8050854, 0, 0, 0, 1, 1,
2.285611, -1.056407, 2.324693, 0, 0, 0, 1, 1,
2.304666, 0.1347116, 1.690478, 0, 0, 0, 1, 1,
2.338913, -0.3554842, 1.19962, 0, 0, 0, 1, 1,
2.400516, -0.4892452, 0.4040491, 0, 0, 0, 1, 1,
2.481878, 0.1495813, 2.501983, 1, 1, 1, 1, 1,
2.511733, 0.0005551002, 2.093664, 1, 1, 1, 1, 1,
2.59344, 0.3843247, 0.846975, 1, 1, 1, 1, 1,
2.786186, 1.332261, 2.529202, 1, 1, 1, 1, 1,
2.851806, 1.172303, 0.5067998, 1, 1, 1, 1, 1,
3.158089, -0.7210203, 2.452805, 1, 1, 1, 1, 1,
3.196224, 1.10028, 1.532985, 1, 1, 1, 1, 1
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
var radius = 9.520153;
var distance = 33.43913;
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
mvMatrix.translate( 0.02679682, 0.3132052, -0.278183 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.43913);
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
