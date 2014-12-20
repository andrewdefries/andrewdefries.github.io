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
-2.987547, 1.016944, -1.606802, 1, 0, 0, 1,
-2.907554, -0.1324079, -1.94555, 1, 0.007843138, 0, 1,
-2.74052, -0.9838083, -4.302328, 1, 0.01176471, 0, 1,
-2.710739, 0.3255834, -4.236788, 1, 0.01960784, 0, 1,
-2.68366, -0.05684885, 0.08232237, 1, 0.02352941, 0, 1,
-2.563189, 1.980277, -1.207211, 1, 0.03137255, 0, 1,
-2.545346, -0.6369911, -0.6473401, 1, 0.03529412, 0, 1,
-2.535843, -0.04315067, -0.3863306, 1, 0.04313726, 0, 1,
-2.505437, -0.5147131, -1.684894, 1, 0.04705882, 0, 1,
-2.482815, -1.709206, -1.865865, 1, 0.05490196, 0, 1,
-2.470342, -1.354148, -3.214364, 1, 0.05882353, 0, 1,
-2.438053, 0.748268, -0.659785, 1, 0.06666667, 0, 1,
-2.430936, -0.3484358, -2.15604, 1, 0.07058824, 0, 1,
-2.430438, -0.5935196, -2.141946, 1, 0.07843138, 0, 1,
-2.284883, -0.5794182, -1.657947, 1, 0.08235294, 0, 1,
-2.250093, -1.738092, -2.997138, 1, 0.09019608, 0, 1,
-2.167648, -0.04619262, -1.508483, 1, 0.09411765, 0, 1,
-2.166778, 0.8485402, -1.641121, 1, 0.1019608, 0, 1,
-2.166248, 0.4108537, -2.847784, 1, 0.1098039, 0, 1,
-2.159573, 0.04254744, -2.443671, 1, 0.1137255, 0, 1,
-2.150795, -0.3899517, -2.145954, 1, 0.1215686, 0, 1,
-2.146738, 0.04072791, -3.42973, 1, 0.1254902, 0, 1,
-2.129929, 0.7014742, -0.8754871, 1, 0.1333333, 0, 1,
-2.082041, 1.584717, -0.9598567, 1, 0.1372549, 0, 1,
-2.07707, -0.06226277, -2.714972, 1, 0.145098, 0, 1,
-2.045735, 1.000697, -1.683066, 1, 0.1490196, 0, 1,
-2.04142, 0.000907755, -3.076089, 1, 0.1568628, 0, 1,
-2.035604, -0.9337136, -1.628252, 1, 0.1607843, 0, 1,
-1.999476, 0.3147393, -1.558258, 1, 0.1686275, 0, 1,
-1.915191, -0.2759332, -1.813297, 1, 0.172549, 0, 1,
-1.881515, 0.6434927, -2.293878, 1, 0.1803922, 0, 1,
-1.843499, -0.9356753, -1.939475, 1, 0.1843137, 0, 1,
-1.842535, 1.35025, -0.9593295, 1, 0.1921569, 0, 1,
-1.840721, 0.9052016, -0.9818354, 1, 0.1960784, 0, 1,
-1.835721, -0.673342, -1.510167, 1, 0.2039216, 0, 1,
-1.831638, -1.667398, -2.871534, 1, 0.2117647, 0, 1,
-1.827183, -1.242999, -2.732593, 1, 0.2156863, 0, 1,
-1.769683, 1.179693, -0.1654178, 1, 0.2235294, 0, 1,
-1.767503, 0.02784596, -3.292495, 1, 0.227451, 0, 1,
-1.759662, -1.022007, -2.684438, 1, 0.2352941, 0, 1,
-1.754966, 1.975826, -1.067463, 1, 0.2392157, 0, 1,
-1.738991, -0.7979974, -1.501357, 1, 0.2470588, 0, 1,
-1.706965, 0.1953302, -1.115788, 1, 0.2509804, 0, 1,
-1.699987, 0.3320828, -2.191232, 1, 0.2588235, 0, 1,
-1.692773, 1.87409, -1.371458, 1, 0.2627451, 0, 1,
-1.682949, -1.154649, -0.1406093, 1, 0.2705882, 0, 1,
-1.673259, 0.456481, 0.2991036, 1, 0.2745098, 0, 1,
-1.66118, 1.078958, 0.6076179, 1, 0.282353, 0, 1,
-1.659976, -0.7322907, -2.490948, 1, 0.2862745, 0, 1,
-1.659788, -0.1699385, -1.170833, 1, 0.2941177, 0, 1,
-1.657856, -0.1779267, -1.935212, 1, 0.3019608, 0, 1,
-1.657562, -0.4275652, -0.9036584, 1, 0.3058824, 0, 1,
-1.64676, 0.7629164, -1.564342, 1, 0.3137255, 0, 1,
-1.632829, 1.321393, -0.6073911, 1, 0.3176471, 0, 1,
-1.629307, -1.361204, -1.835238, 1, 0.3254902, 0, 1,
-1.623883, 0.4760367, -0.3612159, 1, 0.3294118, 0, 1,
-1.62191, 2.443531, -1.121143, 1, 0.3372549, 0, 1,
-1.604244, 0.06484883, -2.379076, 1, 0.3411765, 0, 1,
-1.600853, -0.01622491, -1.998142, 1, 0.3490196, 0, 1,
-1.600711, -0.5036585, -0.6370803, 1, 0.3529412, 0, 1,
-1.597219, -1.280446, -1.777724, 1, 0.3607843, 0, 1,
-1.592843, -2.705207, -3.501395, 1, 0.3647059, 0, 1,
-1.582931, -1.138378, -2.776459, 1, 0.372549, 0, 1,
-1.581094, -0.2538337, -1.858119, 1, 0.3764706, 0, 1,
-1.578786, 2.236408, -1.259057, 1, 0.3843137, 0, 1,
-1.568946, -0.1596537, -1.67942, 1, 0.3882353, 0, 1,
-1.564728, 0.5718398, -0.4323616, 1, 0.3960784, 0, 1,
-1.55484, 0.4129471, -1.877946, 1, 0.4039216, 0, 1,
-1.553315, 1.140468, -1.208515, 1, 0.4078431, 0, 1,
-1.53733, -1.175786, -3.455026, 1, 0.4156863, 0, 1,
-1.52989, -0.9781561, -3.389175, 1, 0.4196078, 0, 1,
-1.528545, 2.128121, 0.0996581, 1, 0.427451, 0, 1,
-1.51672, 0.9142375, 1.008305, 1, 0.4313726, 0, 1,
-1.516608, 0.9628607, -1.828395, 1, 0.4392157, 0, 1,
-1.505225, -0.925624, -0.4751778, 1, 0.4431373, 0, 1,
-1.496982, 0.06540924, -1.435151, 1, 0.4509804, 0, 1,
-1.481426, -1.408754, -4.721692, 1, 0.454902, 0, 1,
-1.477509, -1.518196, -1.1377, 1, 0.4627451, 0, 1,
-1.466909, -1.026013, -1.859673, 1, 0.4666667, 0, 1,
-1.466804, -1.077651, -1.993169, 1, 0.4745098, 0, 1,
-1.458436, 0.4830407, -0.9661692, 1, 0.4784314, 0, 1,
-1.455786, -0.3219918, -2.920337, 1, 0.4862745, 0, 1,
-1.44822, 1.257198, 0.2944925, 1, 0.4901961, 0, 1,
-1.447476, -0.1462789, -2.150471, 1, 0.4980392, 0, 1,
-1.440993, 0.07453253, -2.979862, 1, 0.5058824, 0, 1,
-1.440441, 0.1129513, -1.543052, 1, 0.509804, 0, 1,
-1.435001, -0.6458089, -1.506528, 1, 0.5176471, 0, 1,
-1.432689, 0.002911298, -3.84458, 1, 0.5215687, 0, 1,
-1.414245, -0.2273377, -0.4475144, 1, 0.5294118, 0, 1,
-1.411968, -0.05746347, -2.466274, 1, 0.5333334, 0, 1,
-1.409568, 0.6407238, -1.531536, 1, 0.5411765, 0, 1,
-1.406957, 1.254578, 0.2656644, 1, 0.5450981, 0, 1,
-1.39453, -0.2771968, -0.2224714, 1, 0.5529412, 0, 1,
-1.392844, 0.03046582, -1.03528, 1, 0.5568628, 0, 1,
-1.39225, 0.3582018, -0.9690616, 1, 0.5647059, 0, 1,
-1.379309, 0.1706974, -0.8999262, 1, 0.5686275, 0, 1,
-1.378637, -0.703502, -2.397653, 1, 0.5764706, 0, 1,
-1.37034, -0.3162417, -1.292113, 1, 0.5803922, 0, 1,
-1.361712, 0.1279295, -1.117503, 1, 0.5882353, 0, 1,
-1.350588, 0.7301815, -0.9507433, 1, 0.5921569, 0, 1,
-1.349435, 0.5881206, -1.846289, 1, 0.6, 0, 1,
-1.337464, -0.6636803, -0.5513418, 1, 0.6078432, 0, 1,
-1.337341, 0.1424271, -1.591357, 1, 0.6117647, 0, 1,
-1.336628, -0.1107649, -1.558859, 1, 0.6196079, 0, 1,
-1.334659, 1.275667, -0.6625221, 1, 0.6235294, 0, 1,
-1.322601, -1.894118, -1.640181, 1, 0.6313726, 0, 1,
-1.317865, 1.960793, -1.251758, 1, 0.6352941, 0, 1,
-1.313617, 0.5488301, -2.520478, 1, 0.6431373, 0, 1,
-1.309015, -0.6926889, -0.3970295, 1, 0.6470588, 0, 1,
-1.301521, -2.392606, -2.384871, 1, 0.654902, 0, 1,
-1.300473, 0.31369, -0.3983694, 1, 0.6588235, 0, 1,
-1.2933, 1.689594, 0.6304735, 1, 0.6666667, 0, 1,
-1.289867, 0.4032743, -3.20909, 1, 0.6705883, 0, 1,
-1.288114, -1.248082, -2.084176, 1, 0.6784314, 0, 1,
-1.282977, -0.1351506, -1.539871, 1, 0.682353, 0, 1,
-1.25313, -1.642629, -1.875939, 1, 0.6901961, 0, 1,
-1.246535, -0.2535678, -0.8530378, 1, 0.6941177, 0, 1,
-1.241257, -2.163477, -3.36919, 1, 0.7019608, 0, 1,
-1.239441, -0.1352859, 0.04276317, 1, 0.7098039, 0, 1,
-1.216358, 0.9219926, -1.227785, 1, 0.7137255, 0, 1,
-1.213231, -0.7116126, -2.809771, 1, 0.7215686, 0, 1,
-1.199415, -0.1743942, -1.88441, 1, 0.7254902, 0, 1,
-1.192307, -0.20528, -1.234635, 1, 0.7333333, 0, 1,
-1.192209, -0.2488688, -2.368004, 1, 0.7372549, 0, 1,
-1.183846, -1.103895, -2.898289, 1, 0.7450981, 0, 1,
-1.17237, -0.9175975, -2.215076, 1, 0.7490196, 0, 1,
-1.160511, -1.604246, -1.175795, 1, 0.7568628, 0, 1,
-1.152268, -1.346557, -3.948465, 1, 0.7607843, 0, 1,
-1.145014, 1.42698, -1.056116, 1, 0.7686275, 0, 1,
-1.141056, 2.027423, 1.084186, 1, 0.772549, 0, 1,
-1.139678, -0.5307421, -1.916841, 1, 0.7803922, 0, 1,
-1.126512, 0.4582687, -1.155705, 1, 0.7843137, 0, 1,
-1.11657, 0.7190867, -2.838613, 1, 0.7921569, 0, 1,
-1.113818, 0.1457863, -1.840053, 1, 0.7960784, 0, 1,
-1.112094, -0.2975735, -1.038042, 1, 0.8039216, 0, 1,
-1.110689, 0.7185984, -0.5308279, 1, 0.8117647, 0, 1,
-1.109638, -1.147321, -4.428541, 1, 0.8156863, 0, 1,
-1.109255, 2.188771, -1.287044, 1, 0.8235294, 0, 1,
-1.103767, 0.8126183, -0.9092828, 1, 0.827451, 0, 1,
-1.098544, -0.2197541, -1.892276, 1, 0.8352941, 0, 1,
-1.097373, 0.2832199, -1.228283, 1, 0.8392157, 0, 1,
-1.096249, -1.237159, -1.526323, 1, 0.8470588, 0, 1,
-1.094107, -1.003691, -2.47887, 1, 0.8509804, 0, 1,
-1.090885, 1.254473, -0.1887909, 1, 0.8588235, 0, 1,
-1.089344, -0.1146537, -0.2154795, 1, 0.8627451, 0, 1,
-1.088624, -0.3970304, -3.149233, 1, 0.8705882, 0, 1,
-1.079004, 1.971315, -0.8054958, 1, 0.8745098, 0, 1,
-1.075038, 0.451939, -1.186132, 1, 0.8823529, 0, 1,
-1.074044, -0.2411702, -3.966931, 1, 0.8862745, 0, 1,
-1.058019, 0.584081, -1.263305, 1, 0.8941177, 0, 1,
-1.053342, 1.003636, -1.810046, 1, 0.8980392, 0, 1,
-1.051555, 1.207163, -2.052787, 1, 0.9058824, 0, 1,
-1.046021, -0.04043862, -1.964463, 1, 0.9137255, 0, 1,
-1.045561, -1.035015, -1.078342, 1, 0.9176471, 0, 1,
-1.034569, 0.930508, -1.480576, 1, 0.9254902, 0, 1,
-1.032514, 0.2261794, -2.989941, 1, 0.9294118, 0, 1,
-1.031642, -1.007981, -1.572091, 1, 0.9372549, 0, 1,
-1.024411, 0.7625594, -1.316543, 1, 0.9411765, 0, 1,
-1.021099, 0.2351399, -0.8237959, 1, 0.9490196, 0, 1,
-1.01748, 0.2168929, 0.4872127, 1, 0.9529412, 0, 1,
-1.012176, 2.080487, -1.18037, 1, 0.9607843, 0, 1,
-1.008739, -0.05590224, -0.7136678, 1, 0.9647059, 0, 1,
-1.007921, -0.444622, -3.608268, 1, 0.972549, 0, 1,
-1.005437, -1.043145, -3.605573, 1, 0.9764706, 0, 1,
-1.003389, -0.1878321, -2.440174, 1, 0.9843137, 0, 1,
-0.9975355, -0.9259228, -1.91243, 1, 0.9882353, 0, 1,
-0.995103, -1.03741, -1.469472, 1, 0.9960784, 0, 1,
-0.993195, 0.626183, -1.018172, 0.9960784, 1, 0, 1,
-0.991103, -0.08851211, -1.037903, 0.9921569, 1, 0, 1,
-0.9891282, -0.05378144, -0.3794267, 0.9843137, 1, 0, 1,
-0.9831722, 0.1973788, -2.769711, 0.9803922, 1, 0, 1,
-0.9809418, 1.244411, -1.458529, 0.972549, 1, 0, 1,
-0.9764841, -1.485617, -3.260168, 0.9686275, 1, 0, 1,
-0.9707127, -0.8447086, -2.919212, 0.9607843, 1, 0, 1,
-0.9651055, 0.1695686, -3.091556, 0.9568627, 1, 0, 1,
-0.9625069, -0.05102105, -0.2440169, 0.9490196, 1, 0, 1,
-0.9580232, -0.9863291, -3.041032, 0.945098, 1, 0, 1,
-0.9544789, -0.2987701, -3.817358, 0.9372549, 1, 0, 1,
-0.9536105, -0.194661, -2.437097, 0.9333333, 1, 0, 1,
-0.9482003, -2.410879, -2.029145, 0.9254902, 1, 0, 1,
-0.9452181, 1.406667, 0.08890903, 0.9215686, 1, 0, 1,
-0.9441704, 0.849902, 0.4267494, 0.9137255, 1, 0, 1,
-0.943547, -0.4521983, -1.612376, 0.9098039, 1, 0, 1,
-0.9405145, -2.874334, -2.978263, 0.9019608, 1, 0, 1,
-0.9372022, 1.068163, -1.420265, 0.8941177, 1, 0, 1,
-0.928899, 0.8940215, -0.7233073, 0.8901961, 1, 0, 1,
-0.9283335, -0.6621256, -0.1123601, 0.8823529, 1, 0, 1,
-0.9283124, 0.1578691, -2.090142, 0.8784314, 1, 0, 1,
-0.9266888, 0.5938255, -1.784211, 0.8705882, 1, 0, 1,
-0.9168887, 1.401627, 0.6041472, 0.8666667, 1, 0, 1,
-0.9084077, 0.2237797, 0.4146353, 0.8588235, 1, 0, 1,
-0.9060473, 0.03268342, -1.663859, 0.854902, 1, 0, 1,
-0.9060364, 1.042139, -1.049353, 0.8470588, 1, 0, 1,
-0.9000047, -1.112339, -4.219401, 0.8431373, 1, 0, 1,
-0.8988543, -0.07574316, -3.5374, 0.8352941, 1, 0, 1,
-0.8943942, 0.3913637, -1.167765, 0.8313726, 1, 0, 1,
-0.8913746, 0.2583309, -1.870911, 0.8235294, 1, 0, 1,
-0.8910713, 0.3643792, 0.150358, 0.8196079, 1, 0, 1,
-0.8807856, -0.1706503, -3.429346, 0.8117647, 1, 0, 1,
-0.8789929, 0.01403533, -2.369083, 0.8078431, 1, 0, 1,
-0.8712306, 0.9894916, -1.956666, 0.8, 1, 0, 1,
-0.8654501, 0.008139583, -2.634, 0.7921569, 1, 0, 1,
-0.8569269, 0.8201383, 0.6547703, 0.7882353, 1, 0, 1,
-0.8432546, 1.361475, -0.6212636, 0.7803922, 1, 0, 1,
-0.8408991, 0.3860254, -2.781923, 0.7764706, 1, 0, 1,
-0.8390958, -0.859374, -2.370907, 0.7686275, 1, 0, 1,
-0.8385549, -1.606605, -2.591208, 0.7647059, 1, 0, 1,
-0.8365709, -1.380754, -1.486697, 0.7568628, 1, 0, 1,
-0.8354114, -0.3089035, -2.912472, 0.7529412, 1, 0, 1,
-0.8314026, 1.059643, -0.2874972, 0.7450981, 1, 0, 1,
-0.8293257, 0.05345448, -1.552017, 0.7411765, 1, 0, 1,
-0.827884, -1.172339, -2.476534, 0.7333333, 1, 0, 1,
-0.8269849, 2.292627, -0.2082732, 0.7294118, 1, 0, 1,
-0.8219887, -0.7374225, -2.918817, 0.7215686, 1, 0, 1,
-0.8204175, -0.5897599, -0.6749855, 0.7176471, 1, 0, 1,
-0.8193709, 1.63318, -2.16421, 0.7098039, 1, 0, 1,
-0.8175532, -1.389048, -1.674231, 0.7058824, 1, 0, 1,
-0.8171728, 0.4222748, -2.097564, 0.6980392, 1, 0, 1,
-0.8143772, 0.2668951, 0.007671908, 0.6901961, 1, 0, 1,
-0.8106086, 2.608925, -0.01304513, 0.6862745, 1, 0, 1,
-0.8099747, 1.227426, -0.7724229, 0.6784314, 1, 0, 1,
-0.8098814, 2.472064, 0.2858471, 0.6745098, 1, 0, 1,
-0.8071119, 1.218635, -0.05331006, 0.6666667, 1, 0, 1,
-0.796214, -1.595794, -3.351068, 0.6627451, 1, 0, 1,
-0.7927288, 0.7149212, 0.9445136, 0.654902, 1, 0, 1,
-0.7922201, -0.7148979, -2.5928, 0.6509804, 1, 0, 1,
-0.7911752, 0.6311437, -1.987015, 0.6431373, 1, 0, 1,
-0.7860155, 1.177416, -1.529501, 0.6392157, 1, 0, 1,
-0.7828103, 2.238539, -0.4733256, 0.6313726, 1, 0, 1,
-0.7822681, 0.5487497, -0.8677348, 0.627451, 1, 0, 1,
-0.7807, -0.3369687, -2.875932, 0.6196079, 1, 0, 1,
-0.780135, -1.178697, -3.899398, 0.6156863, 1, 0, 1,
-0.780116, -2.021143, -2.172567, 0.6078432, 1, 0, 1,
-0.7769539, 0.6655835, 2.011059, 0.6039216, 1, 0, 1,
-0.7745232, -1.565155, -2.308851, 0.5960785, 1, 0, 1,
-0.7728915, -0.7877224, -1.833045, 0.5882353, 1, 0, 1,
-0.7727765, -2.425457, -2.196501, 0.5843138, 1, 0, 1,
-0.7717791, -0.2391458, -2.538521, 0.5764706, 1, 0, 1,
-0.7669715, 2.859635, -0.2098919, 0.572549, 1, 0, 1,
-0.7615844, 0.7937952, -2.068211, 0.5647059, 1, 0, 1,
-0.7593913, 0.7727532, 0.2839333, 0.5607843, 1, 0, 1,
-0.7559918, -1.709009, -4.86384, 0.5529412, 1, 0, 1,
-0.7526364, 0.4308222, 0.8561991, 0.5490196, 1, 0, 1,
-0.7493182, -0.1446673, -0.7377114, 0.5411765, 1, 0, 1,
-0.7464841, 1.461129, 1.643166, 0.5372549, 1, 0, 1,
-0.7450446, 0.3745271, 0.124903, 0.5294118, 1, 0, 1,
-0.7448875, -3.713795, -3.005739, 0.5254902, 1, 0, 1,
-0.7440566, 1.114207, -1.74204, 0.5176471, 1, 0, 1,
-0.7411534, -0.3781904, -3.043688, 0.5137255, 1, 0, 1,
-0.7408826, 1.014622, -2.486497, 0.5058824, 1, 0, 1,
-0.7378025, 0.9413796, 0.5784996, 0.5019608, 1, 0, 1,
-0.7347746, 2.066305, -0.8151433, 0.4941176, 1, 0, 1,
-0.7344326, 0.07953932, -1.323494, 0.4862745, 1, 0, 1,
-0.7336363, -0.05250819, -0.1232392, 0.4823529, 1, 0, 1,
-0.7306802, 0.1457916, -2.147729, 0.4745098, 1, 0, 1,
-0.7272431, 0.6895539, -0.4300313, 0.4705882, 1, 0, 1,
-0.7255157, 0.3240838, -1.156673, 0.4627451, 1, 0, 1,
-0.7214651, -1.451572, -1.941174, 0.4588235, 1, 0, 1,
-0.7205456, 1.550646, 0.727733, 0.4509804, 1, 0, 1,
-0.7192576, 0.103675, -1.135199, 0.4470588, 1, 0, 1,
-0.7189139, 1.019511, -0.6446647, 0.4392157, 1, 0, 1,
-0.7164324, 0.3831036, -1.806268, 0.4352941, 1, 0, 1,
-0.7146958, 0.04091176, -3.436666, 0.427451, 1, 0, 1,
-0.7144774, -0.2095168, -1.503159, 0.4235294, 1, 0, 1,
-0.711992, 0.7649104, -2.138217, 0.4156863, 1, 0, 1,
-0.7100206, 0.1842143, -1.749807, 0.4117647, 1, 0, 1,
-0.7067467, -0.2745523, -3.321873, 0.4039216, 1, 0, 1,
-0.7063615, 1.02922, -2.470596, 0.3960784, 1, 0, 1,
-0.7006366, 0.5707143, -1.054227, 0.3921569, 1, 0, 1,
-0.698651, 1.589956, -0.8421982, 0.3843137, 1, 0, 1,
-0.6986456, 1.136097, -1.04134, 0.3803922, 1, 0, 1,
-0.6967022, 0.4290324, 0.003030204, 0.372549, 1, 0, 1,
-0.6929731, 0.5222259, -1.049455, 0.3686275, 1, 0, 1,
-0.6920066, -0.3038663, -2.951016, 0.3607843, 1, 0, 1,
-0.6910537, -1.114204, -3.133329, 0.3568628, 1, 0, 1,
-0.6894459, 1.235551, 0.4694941, 0.3490196, 1, 0, 1,
-0.6865637, 1.110138, 0.1914636, 0.345098, 1, 0, 1,
-0.6803607, 0.8450004, 0.6843349, 0.3372549, 1, 0, 1,
-0.678511, -0.5010455, -4.029655, 0.3333333, 1, 0, 1,
-0.6707856, -1.349849, -2.452893, 0.3254902, 1, 0, 1,
-0.6700212, -0.1390661, -2.261073, 0.3215686, 1, 0, 1,
-0.6677812, -0.4312444, -2.525116, 0.3137255, 1, 0, 1,
-0.6654762, 0.2194466, -2.636914, 0.3098039, 1, 0, 1,
-0.6630372, -0.693773, -2.232623, 0.3019608, 1, 0, 1,
-0.6566275, 1.246552, -0.3872326, 0.2941177, 1, 0, 1,
-0.6554632, 1.543676, 0.6258382, 0.2901961, 1, 0, 1,
-0.6541154, 0.2165675, -0.606868, 0.282353, 1, 0, 1,
-0.6519309, 3.196566, 1.101459, 0.2784314, 1, 0, 1,
-0.6495112, 1.105471, -2.414627, 0.2705882, 1, 0, 1,
-0.6478758, 0.495297, -1.048208, 0.2666667, 1, 0, 1,
-0.6437545, -0.177336, -1.692515, 0.2588235, 1, 0, 1,
-0.6423637, -0.09580921, -2.213125, 0.254902, 1, 0, 1,
-0.6410795, -0.117767, -1.693976, 0.2470588, 1, 0, 1,
-0.6378873, -2.35782, -2.980327, 0.2431373, 1, 0, 1,
-0.6340761, -0.6350235, -2.073018, 0.2352941, 1, 0, 1,
-0.6326922, 1.452531, -0.07140563, 0.2313726, 1, 0, 1,
-0.6257796, -1.250614, -2.895835, 0.2235294, 1, 0, 1,
-0.6252088, -0.5103273, -1.51383, 0.2196078, 1, 0, 1,
-0.6249334, 0.3477148, -1.301244, 0.2117647, 1, 0, 1,
-0.6157823, 1.680104, -0.6085598, 0.2078431, 1, 0, 1,
-0.6145267, -0.1594062, -1.620145, 0.2, 1, 0, 1,
-0.6098599, 1.212935, -0.2592864, 0.1921569, 1, 0, 1,
-0.609807, 0.4935848, 1.193727, 0.1882353, 1, 0, 1,
-0.6085429, 2.022756, -1.450928, 0.1803922, 1, 0, 1,
-0.6075342, 0.3794333, -1.050725, 0.1764706, 1, 0, 1,
-0.606678, -1.165416, -2.788427, 0.1686275, 1, 0, 1,
-0.6006559, 0.4835993, -0.3129975, 0.1647059, 1, 0, 1,
-0.5980959, -2.121487, -1.395643, 0.1568628, 1, 0, 1,
-0.5804178, -1.832071, -0.972648, 0.1529412, 1, 0, 1,
-0.5732917, 0.6233546, -0.3038282, 0.145098, 1, 0, 1,
-0.5731806, -0.7843375, -2.921982, 0.1411765, 1, 0, 1,
-0.5731271, 1.651879, -0.4100999, 0.1333333, 1, 0, 1,
-0.5693043, -0.5371186, -4.30156, 0.1294118, 1, 0, 1,
-0.5646518, 0.1242116, -1.215769, 0.1215686, 1, 0, 1,
-0.5628918, 0.6639006, 0.1201857, 0.1176471, 1, 0, 1,
-0.5601812, 0.8784405, -0.02673088, 0.1098039, 1, 0, 1,
-0.5573466, 0.2085398, -0.5011866, 0.1058824, 1, 0, 1,
-0.5559731, -1.030088, -2.117426, 0.09803922, 1, 0, 1,
-0.553728, 1.373192, 1.684595, 0.09019608, 1, 0, 1,
-0.5461422, 1.471874, -1.131491, 0.08627451, 1, 0, 1,
-0.5459218, 0.6516959, -1.334629, 0.07843138, 1, 0, 1,
-0.5440411, -1.469818, -3.571025, 0.07450981, 1, 0, 1,
-0.5434498, -0.5952379, -2.08223, 0.06666667, 1, 0, 1,
-0.5409081, -1.348346, -4.757346, 0.0627451, 1, 0, 1,
-0.540239, -0.4445986, -2.160459, 0.05490196, 1, 0, 1,
-0.5400783, 2.024897, -0.4840333, 0.05098039, 1, 0, 1,
-0.5392678, -0.07026738, -1.902014, 0.04313726, 1, 0, 1,
-0.5360935, 0.4603026, 0.3400376, 0.03921569, 1, 0, 1,
-0.5338116, -0.3745764, -3.082758, 0.03137255, 1, 0, 1,
-0.5333679, -2.541373, -2.355466, 0.02745098, 1, 0, 1,
-0.5324983, -0.8216347, -4.76315, 0.01960784, 1, 0, 1,
-0.5204468, 0.002119034, -1.02538, 0.01568628, 1, 0, 1,
-0.5199132, -1.496135, -3.442148, 0.007843138, 1, 0, 1,
-0.5156868, 0.882396, -0.9196464, 0.003921569, 1, 0, 1,
-0.5142432, -0.9663114, -3.092244, 0, 1, 0.003921569, 1,
-0.5136445, -0.7856959, -0.5505382, 0, 1, 0.01176471, 1,
-0.5076974, -0.9825116, -3.765487, 0, 1, 0.01568628, 1,
-0.5050983, -2.109138, -1.307125, 0, 1, 0.02352941, 1,
-0.4996337, -0.1811451, -1.143589, 0, 1, 0.02745098, 1,
-0.4949557, -1.209318, -0.8369652, 0, 1, 0.03529412, 1,
-0.4909523, -0.7783529, -4.166885, 0, 1, 0.03921569, 1,
-0.4888186, -0.5438545, -0.187573, 0, 1, 0.04705882, 1,
-0.4883465, -0.9172412, -2.734336, 0, 1, 0.05098039, 1,
-0.4878486, -0.1072096, -1.507447, 0, 1, 0.05882353, 1,
-0.4812096, -0.2224706, -1.524915, 0, 1, 0.0627451, 1,
-0.4734349, 0.1411846, -0.7977702, 0, 1, 0.07058824, 1,
-0.4689998, 2.260591, -0.7909294, 0, 1, 0.07450981, 1,
-0.467061, -0.008778764, -1.344298, 0, 1, 0.08235294, 1,
-0.4662126, -0.6609169, -2.42218, 0, 1, 0.08627451, 1,
-0.4590732, 0.7698401, -1.373264, 0, 1, 0.09411765, 1,
-0.4578255, 1.390938, 0.5708062, 0, 1, 0.1019608, 1,
-0.4565594, -1.531962, -2.189369, 0, 1, 0.1058824, 1,
-0.4544632, 0.03067265, -3.919427, 0, 1, 0.1137255, 1,
-0.4543252, 1.70332, -1.967008, 0, 1, 0.1176471, 1,
-0.4511036, 0.5335448, 0.04435685, 0, 1, 0.1254902, 1,
-0.4509068, 1.260299, -0.7761902, 0, 1, 0.1294118, 1,
-0.4455615, 0.8855313, -0.5310652, 0, 1, 0.1372549, 1,
-0.4358077, 0.7742582, -2.356411, 0, 1, 0.1411765, 1,
-0.4343612, -0.4194287, -2.766685, 0, 1, 0.1490196, 1,
-0.433596, -1.15511, -3.031212, 0, 1, 0.1529412, 1,
-0.4280051, 0.825402, 1.49008, 0, 1, 0.1607843, 1,
-0.4242981, 0.6657847, -0.1925123, 0, 1, 0.1647059, 1,
-0.41978, 1.11424, -1.009365, 0, 1, 0.172549, 1,
-0.4170747, 0.2366618, 0.4265301, 0, 1, 0.1764706, 1,
-0.413428, 1.735462, -0.07574748, 0, 1, 0.1843137, 1,
-0.4130474, -0.8751609, -3.427862, 0, 1, 0.1882353, 1,
-0.406756, 0.9354895, -1.108814, 0, 1, 0.1960784, 1,
-0.4066696, -2.24533, -3.12485, 0, 1, 0.2039216, 1,
-0.4062096, -0.08551466, -2.198016, 0, 1, 0.2078431, 1,
-0.4041366, -0.121659, -0.08273146, 0, 1, 0.2156863, 1,
-0.4034485, 1.208672, -0.1429036, 0, 1, 0.2196078, 1,
-0.4033843, -1.56607, -3.949048, 0, 1, 0.227451, 1,
-0.4012401, -0.6445819, -3.000676, 0, 1, 0.2313726, 1,
-0.3996927, -0.8723196, -4.015806, 0, 1, 0.2392157, 1,
-0.3950928, 0.9493, -0.5846417, 0, 1, 0.2431373, 1,
-0.3912456, -0.5804564, -1.818843, 0, 1, 0.2509804, 1,
-0.3886739, -0.4259478, -3.534376, 0, 1, 0.254902, 1,
-0.3869049, -0.7955635, -3.590833, 0, 1, 0.2627451, 1,
-0.3850072, -1.883992, -2.308574, 0, 1, 0.2666667, 1,
-0.379891, -1.821, -4.849956, 0, 1, 0.2745098, 1,
-0.3781685, 0.696898, -0.09442841, 0, 1, 0.2784314, 1,
-0.3766916, -0.1897332, -2.134961, 0, 1, 0.2862745, 1,
-0.37572, -2.884531, -3.764106, 0, 1, 0.2901961, 1,
-0.3597705, 2.002404, 1.177153, 0, 1, 0.2980392, 1,
-0.3579797, -0.5330797, -1.434749, 0, 1, 0.3058824, 1,
-0.3564633, -0.3992888, -2.481985, 0, 1, 0.3098039, 1,
-0.3544054, -1.267886, -1.288243, 0, 1, 0.3176471, 1,
-0.354364, -0.3189741, -1.040935, 0, 1, 0.3215686, 1,
-0.3542908, -0.3007377, -1.32992, 0, 1, 0.3294118, 1,
-0.3539788, 1.573908, -0.9517683, 0, 1, 0.3333333, 1,
-0.3516348, 1.221308, -1.821188, 0, 1, 0.3411765, 1,
-0.3479196, -0.1904372, -2.496907, 0, 1, 0.345098, 1,
-0.3460352, 1.523078, 2.022053, 0, 1, 0.3529412, 1,
-0.3456976, 1.026944, 0.9051666, 0, 1, 0.3568628, 1,
-0.3436977, 0.0273208, -2.261132, 0, 1, 0.3647059, 1,
-0.3425789, -1.658951, -4.227972, 0, 1, 0.3686275, 1,
-0.34019, 0.6623264, -1.791279, 0, 1, 0.3764706, 1,
-0.3355607, 0.9957252, -1.299754, 0, 1, 0.3803922, 1,
-0.3333921, -0.06319282, -0.6151983, 0, 1, 0.3882353, 1,
-0.3325443, -1.126319, -3.391153, 0, 1, 0.3921569, 1,
-0.3321941, 1.091431, 0.2894147, 0, 1, 0.4, 1,
-0.3267585, -0.6383184, -1.554213, 0, 1, 0.4078431, 1,
-0.323303, -0.4498309, -3.552819, 0, 1, 0.4117647, 1,
-0.3196056, -0.5391004, -3.208195, 0, 1, 0.4196078, 1,
-0.3168353, 0.4904605, -0.3842041, 0, 1, 0.4235294, 1,
-0.3150302, -1.385113, -3.828115, 0, 1, 0.4313726, 1,
-0.310303, -0.1674749, -1.410023, 0, 1, 0.4352941, 1,
-0.3091018, 0.2080874, -0.8701012, 0, 1, 0.4431373, 1,
-0.3075422, -0.8421589, -2.948484, 0, 1, 0.4470588, 1,
-0.3029622, 0.05237937, -1.376016, 0, 1, 0.454902, 1,
-0.3010976, 0.4498752, -1.936463, 0, 1, 0.4588235, 1,
-0.2998649, 2.036514, 0.6758685, 0, 1, 0.4666667, 1,
-0.2911128, 1.911698, 0.1074055, 0, 1, 0.4705882, 1,
-0.2868504, -1.391126, -1.441967, 0, 1, 0.4784314, 1,
-0.2853315, -0.7232374, -2.080702, 0, 1, 0.4823529, 1,
-0.2853067, -0.5620034, -4.608871, 0, 1, 0.4901961, 1,
-0.2836395, 0.7451756, 0.3231573, 0, 1, 0.4941176, 1,
-0.2825947, -0.2176811, -2.209858, 0, 1, 0.5019608, 1,
-0.2800816, 0.5251234, -0.03639038, 0, 1, 0.509804, 1,
-0.2778992, 0.5233161, 1.902283, 0, 1, 0.5137255, 1,
-0.2760141, 0.7666613, -1.092094, 0, 1, 0.5215687, 1,
-0.2748235, -0.2457342, -1.353753, 0, 1, 0.5254902, 1,
-0.2707475, -0.8462918, -4.645954, 0, 1, 0.5333334, 1,
-0.2686341, 0.1260972, -1.672729, 0, 1, 0.5372549, 1,
-0.2676595, 0.2095323, -1.126516, 0, 1, 0.5450981, 1,
-0.2672559, 1.981341, -0.6490472, 0, 1, 0.5490196, 1,
-0.2663732, -0.0870474, 1.099361, 0, 1, 0.5568628, 1,
-0.2625029, -2.154923, -2.457254, 0, 1, 0.5607843, 1,
-0.2502507, -1.851476, -2.361009, 0, 1, 0.5686275, 1,
-0.2487158, -0.6156264, -2.753373, 0, 1, 0.572549, 1,
-0.2475487, 0.1579737, -2.456072, 0, 1, 0.5803922, 1,
-0.2464496, 0.05268521, -1.508167, 0, 1, 0.5843138, 1,
-0.2460045, -0.4370045, -2.376363, 0, 1, 0.5921569, 1,
-0.2419703, 0.1703131, -1.406938, 0, 1, 0.5960785, 1,
-0.2411435, -2.310923, -1.582641, 0, 1, 0.6039216, 1,
-0.2395235, -0.2454331, -4.008847, 0, 1, 0.6117647, 1,
-0.2391416, 1.884877, -1.992402, 0, 1, 0.6156863, 1,
-0.2378105, 1.17094, -1.050968, 0, 1, 0.6235294, 1,
-0.2335017, -0.3796744, -2.733976, 0, 1, 0.627451, 1,
-0.2333711, -0.3692414, -3.539716, 0, 1, 0.6352941, 1,
-0.2276026, 0.6791996, -0.5973248, 0, 1, 0.6392157, 1,
-0.2265492, 0.4025453, 0.6890268, 0, 1, 0.6470588, 1,
-0.2202234, -1.309247, -2.803789, 0, 1, 0.6509804, 1,
-0.2188616, 1.575445, 0.9243879, 0, 1, 0.6588235, 1,
-0.2185258, 0.2749943, 0.8724802, 0, 1, 0.6627451, 1,
-0.204074, -1.234023, -2.740537, 0, 1, 0.6705883, 1,
-0.2017826, -0.8063993, -2.067902, 0, 1, 0.6745098, 1,
-0.2012855, -0.838591, -3.701863, 0, 1, 0.682353, 1,
-0.2001516, -0.9064341, -3.922743, 0, 1, 0.6862745, 1,
-0.1985494, 0.3479674, 0.1231503, 0, 1, 0.6941177, 1,
-0.1979847, 0.3724943, -0.4617682, 0, 1, 0.7019608, 1,
-0.1964583, -1.673185, -4.014407, 0, 1, 0.7058824, 1,
-0.1952902, -0.4023087, -1.601592, 0, 1, 0.7137255, 1,
-0.1852596, 1.742295, 0.04058633, 0, 1, 0.7176471, 1,
-0.1849412, 1.79256, 0.5195577, 0, 1, 0.7254902, 1,
-0.1847754, -0.8163172, -2.759973, 0, 1, 0.7294118, 1,
-0.1788444, 0.6184433, -0.08301112, 0, 1, 0.7372549, 1,
-0.178466, -0.08160537, -0.3030321, 0, 1, 0.7411765, 1,
-0.1772084, -0.938361, -2.94456, 0, 1, 0.7490196, 1,
-0.1739101, 0.07398479, -0.287387, 0, 1, 0.7529412, 1,
-0.170621, -1.339351, -3.835811, 0, 1, 0.7607843, 1,
-0.1654824, -1.961915, -5.497567, 0, 1, 0.7647059, 1,
-0.1649013, -0.04617074, -1.393898, 0, 1, 0.772549, 1,
-0.1627125, -0.6725856, -2.945602, 0, 1, 0.7764706, 1,
-0.1539714, -0.009581911, -1.738397, 0, 1, 0.7843137, 1,
-0.1508817, -1.035698, -2.743546, 0, 1, 0.7882353, 1,
-0.1479182, -0.5732034, -2.536373, 0, 1, 0.7960784, 1,
-0.14273, -0.340283, -3.093967, 0, 1, 0.8039216, 1,
-0.1407866, 0.9994287, -0.2136696, 0, 1, 0.8078431, 1,
-0.1352477, 1.428921, 1.065481, 0, 1, 0.8156863, 1,
-0.134266, -0.08107417, 0.1244908, 0, 1, 0.8196079, 1,
-0.1325131, -0.09552976, -1.27358, 0, 1, 0.827451, 1,
-0.1305342, -0.5083938, -4.005782, 0, 1, 0.8313726, 1,
-0.1303775, 0.87725, -1.370908, 0, 1, 0.8392157, 1,
-0.1287349, -1.064892, -2.417379, 0, 1, 0.8431373, 1,
-0.1260416, 1.580665, -0.5638843, 0, 1, 0.8509804, 1,
-0.125848, 1.728755, -1.237314, 0, 1, 0.854902, 1,
-0.123333, -0.1882424, -2.93248, 0, 1, 0.8627451, 1,
-0.1193889, -0.4726032, -3.303647, 0, 1, 0.8666667, 1,
-0.1175552, 0.4869674, -1.164175, 0, 1, 0.8745098, 1,
-0.1122023, 0.6546953, 0.9813187, 0, 1, 0.8784314, 1,
-0.1111519, -0.345741, -2.563801, 0, 1, 0.8862745, 1,
-0.1110676, -2.023132, -3.678492, 0, 1, 0.8901961, 1,
-0.108936, -0.8754191, -2.848315, 0, 1, 0.8980392, 1,
-0.1041606, -0.2250687, -1.907684, 0, 1, 0.9058824, 1,
-0.1010417, 1.091195, -0.2048978, 0, 1, 0.9098039, 1,
-0.1003644, -0.9019858, -3.159872, 0, 1, 0.9176471, 1,
-0.0992058, 1.020472, 0.1876747, 0, 1, 0.9215686, 1,
-0.09910095, -1.329302, -3.647293, 0, 1, 0.9294118, 1,
-0.09765446, -0.6319578, -3.6646, 0, 1, 0.9333333, 1,
-0.09463894, 0.4016842, 0.51425, 0, 1, 0.9411765, 1,
-0.09315959, 0.4233809, 0.4832272, 0, 1, 0.945098, 1,
-0.09172067, 0.9716054, 0.6374751, 0, 1, 0.9529412, 1,
-0.08899459, -0.3493834, -3.588582, 0, 1, 0.9568627, 1,
-0.08894848, -0.7551754, -1.938392, 0, 1, 0.9647059, 1,
-0.08675874, -0.450625, -4.23832, 0, 1, 0.9686275, 1,
-0.08163881, 0.8276823, -0.0946182, 0, 1, 0.9764706, 1,
-0.0782841, -0.01959671, -0.7863555, 0, 1, 0.9803922, 1,
-0.07757688, -0.1267285, -2.134277, 0, 1, 0.9882353, 1,
-0.07589044, -0.04179748, -3.809785, 0, 1, 0.9921569, 1,
-0.07584732, -1.380424, -2.470326, 0, 1, 1, 1,
-0.06806722, -0.3280353, -1.767978, 0, 0.9921569, 1, 1,
-0.06692841, 0.6998347, -0.5386644, 0, 0.9882353, 1, 1,
-0.06394983, 0.5931749, 0.6269318, 0, 0.9803922, 1, 1,
-0.05876371, -1.764622, -2.360493, 0, 0.9764706, 1, 1,
-0.05229374, -0.6339994, -3.83128, 0, 0.9686275, 1, 1,
-0.04776495, -1.022896, -1.7548, 0, 0.9647059, 1, 1,
-0.04623986, 0.1779807, -0.9976285, 0, 0.9568627, 1, 1,
-0.04051429, -2.928923, -0.8163822, 0, 0.9529412, 1, 1,
-0.03610942, 1.045669, -1.184749, 0, 0.945098, 1, 1,
-0.03607469, 0.9461901, -1.583307, 0, 0.9411765, 1, 1,
-0.03454654, 0.2784868, -0.01529903, 0, 0.9333333, 1, 1,
-0.02712629, -0.7220098, -2.792574, 0, 0.9294118, 1, 1,
-0.02532257, -0.06880283, -0.5117856, 0, 0.9215686, 1, 1,
-0.02489877, -0.7705666, -3.298885, 0, 0.9176471, 1, 1,
-0.02452483, -0.06210643, -2.987521, 0, 0.9098039, 1, 1,
-0.02346169, 0.02320267, -1.29293, 0, 0.9058824, 1, 1,
-0.02280907, -0.06340092, -2.491622, 0, 0.8980392, 1, 1,
-0.02090741, -1.172228, -2.708639, 0, 0.8901961, 1, 1,
-0.02061322, -2.182883, -3.011917, 0, 0.8862745, 1, 1,
-0.0175514, -2.366478, -3.173867, 0, 0.8784314, 1, 1,
-0.01578233, 1.108212, -0.5859245, 0, 0.8745098, 1, 1,
-0.0147351, -1.076156, -1.936061, 0, 0.8666667, 1, 1,
-0.01292823, 1.043965, 0.7053773, 0, 0.8627451, 1, 1,
-0.009038988, 0.4331909, -0.009226329, 0, 0.854902, 1, 1,
-0.007473022, 1.420999, -0.9309004, 0, 0.8509804, 1, 1,
-0.005511494, 1.57293, 1.016062, 0, 0.8431373, 1, 1,
-0.004666603, -1.857405, -1.694255, 0, 0.8392157, 1, 1,
-0.004157287, 0.2861587, 0.2393445, 0, 0.8313726, 1, 1,
-0.002632876, 1.417344, -0.08403096, 0, 0.827451, 1, 1,
0.001773116, -0.0736259, -0.1123365, 0, 0.8196079, 1, 1,
0.006092424, 1.371517, -1.1819, 0, 0.8156863, 1, 1,
0.01036285, -0.3793728, 3.026167, 0, 0.8078431, 1, 1,
0.01071513, 1.933719, -4.127132e-05, 0, 0.8039216, 1, 1,
0.01784512, 1.669226, 0.1459391, 0, 0.7960784, 1, 1,
0.0199361, 1.114788, -1.739534, 0, 0.7882353, 1, 1,
0.02290845, 0.7401299, 0.1595234, 0, 0.7843137, 1, 1,
0.02378348, 1.34811, 0.2888135, 0, 0.7764706, 1, 1,
0.02777916, 1.172339, -0.8156095, 0, 0.772549, 1, 1,
0.02980634, -0.6265241, 4.434391, 0, 0.7647059, 1, 1,
0.03129365, 0.317056, 0.1426367, 0, 0.7607843, 1, 1,
0.03513682, -0.0950433, 1.135033, 0, 0.7529412, 1, 1,
0.03807779, -0.3892592, 2.671814, 0, 0.7490196, 1, 1,
0.04074785, 0.279491, -0.937398, 0, 0.7411765, 1, 1,
0.04199993, -1.862947, 3.413213, 0, 0.7372549, 1, 1,
0.04532795, -1.752446, 2.240262, 0, 0.7294118, 1, 1,
0.04939852, -1.861744, 3.929393, 0, 0.7254902, 1, 1,
0.05095205, 0.4428451, -0.9523144, 0, 0.7176471, 1, 1,
0.05536379, 0.9639398, 0.8811747, 0, 0.7137255, 1, 1,
0.05556509, 0.833061, 0.2998731, 0, 0.7058824, 1, 1,
0.0587558, -0.9189535, 3.643805, 0, 0.6980392, 1, 1,
0.06301454, -0.6873164, 4.795955, 0, 0.6941177, 1, 1,
0.06642167, -1.173618, 3.28166, 0, 0.6862745, 1, 1,
0.06648222, 1.435828, 0.1416985, 0, 0.682353, 1, 1,
0.06735085, 0.399298, 0.08224978, 0, 0.6745098, 1, 1,
0.07089353, 0.2459261, -0.2625974, 0, 0.6705883, 1, 1,
0.07090549, 0.3480636, 0.6442106, 0, 0.6627451, 1, 1,
0.07481062, 0.4600208, 1.443321, 0, 0.6588235, 1, 1,
0.07542296, -0.02018508, 2.24522, 0, 0.6509804, 1, 1,
0.07824363, -1.045155, 3.243225, 0, 0.6470588, 1, 1,
0.07903016, -1.822709, 2.985526, 0, 0.6392157, 1, 1,
0.08062912, 0.4313838, -1.461463, 0, 0.6352941, 1, 1,
0.08235296, -0.429623, 2.29, 0, 0.627451, 1, 1,
0.08643699, 0.3898867, 0.296471, 0, 0.6235294, 1, 1,
0.09143458, -0.5194632, 2.762202, 0, 0.6156863, 1, 1,
0.1012436, -0.383578, 2.673494, 0, 0.6117647, 1, 1,
0.1103684, 0.04221212, 1.764967, 0, 0.6039216, 1, 1,
0.1147648, 0.3390618, -0.9307927, 0, 0.5960785, 1, 1,
0.115437, -1.020233, 1.74897, 0, 0.5921569, 1, 1,
0.1154488, -0.5761392, 3.802686, 0, 0.5843138, 1, 1,
0.1179563, -0.349219, 2.54979, 0, 0.5803922, 1, 1,
0.1196844, -0.3016689, -0.6856073, 0, 0.572549, 1, 1,
0.1224372, 0.7744077, 0.2382526, 0, 0.5686275, 1, 1,
0.1242864, -0.2397368, 1.112487, 0, 0.5607843, 1, 1,
0.1272638, 0.8073861, -0.2624103, 0, 0.5568628, 1, 1,
0.1302179, -1.400583, 2.948011, 0, 0.5490196, 1, 1,
0.1309428, 1.279296, -0.3609364, 0, 0.5450981, 1, 1,
0.1323242, 0.880945, -1.776281, 0, 0.5372549, 1, 1,
0.1330912, -0.7042256, 1.664503, 0, 0.5333334, 1, 1,
0.1340248, 1.350143, -0.9886854, 0, 0.5254902, 1, 1,
0.1352055, -2.353791, 2.976753, 0, 0.5215687, 1, 1,
0.1353536, -1.039219, 2.301806, 0, 0.5137255, 1, 1,
0.145319, -0.7117512, 3.044867, 0, 0.509804, 1, 1,
0.1476511, 0.9623333, 0.1211657, 0, 0.5019608, 1, 1,
0.1512096, 0.9603307, -0.9657975, 0, 0.4941176, 1, 1,
0.152139, -1.590175, 2.649224, 0, 0.4901961, 1, 1,
0.1525708, -0.3323775, 2.437835, 0, 0.4823529, 1, 1,
0.1565014, 1.095121, 0.2930453, 0, 0.4784314, 1, 1,
0.1600983, 0.5646101, -0.7057502, 0, 0.4705882, 1, 1,
0.1611037, 0.5769754, 1.116432, 0, 0.4666667, 1, 1,
0.1626291, 1.060626, 1.377932, 0, 0.4588235, 1, 1,
0.1630294, 1.555409, -0.635115, 0, 0.454902, 1, 1,
0.1644828, -0.2681403, 1.539579, 0, 0.4470588, 1, 1,
0.1655801, -0.7850808, 2.423625, 0, 0.4431373, 1, 1,
0.1690421, 0.8670692, 0.3922687, 0, 0.4352941, 1, 1,
0.1724896, 0.3761044, 0.8754538, 0, 0.4313726, 1, 1,
0.1838998, -0.7302611, 3.681877, 0, 0.4235294, 1, 1,
0.1840827, -0.3348286, 3.686351, 0, 0.4196078, 1, 1,
0.1878003, -0.09781867, 0.7609549, 0, 0.4117647, 1, 1,
0.1904315, -0.8423776, 0.7589046, 0, 0.4078431, 1, 1,
0.1906947, 0.1179529, 1.361383, 0, 0.4, 1, 1,
0.2038115, -1.694194, 4.200231, 0, 0.3921569, 1, 1,
0.2097871, 0.1197762, -0.7369179, 0, 0.3882353, 1, 1,
0.2153653, -1.175882, 3.761884, 0, 0.3803922, 1, 1,
0.2166944, -0.2280395, 1.963834, 0, 0.3764706, 1, 1,
0.2168433, -0.5343143, 1.001303, 0, 0.3686275, 1, 1,
0.2197621, -0.551, 2.970734, 0, 0.3647059, 1, 1,
0.2268899, 1.591228, -0.457012, 0, 0.3568628, 1, 1,
0.2307859, -0.469234, 1.450058, 0, 0.3529412, 1, 1,
0.234556, 0.1676922, 0.9263086, 0, 0.345098, 1, 1,
0.2358469, -0.2661703, 2.001626, 0, 0.3411765, 1, 1,
0.2448778, -0.5650471, 3.417976, 0, 0.3333333, 1, 1,
0.2452379, -0.06017528, 1.255467, 0, 0.3294118, 1, 1,
0.2485449, -0.1492361, 0.7003785, 0, 0.3215686, 1, 1,
0.2508071, 0.4137685, -0.2089446, 0, 0.3176471, 1, 1,
0.2568386, -0.5806007, 1.972801, 0, 0.3098039, 1, 1,
0.2590713, 0.2912998, 1.236828, 0, 0.3058824, 1, 1,
0.2604148, -0.7955089, 2.709134, 0, 0.2980392, 1, 1,
0.2605445, 0.1564235, 1.051322, 0, 0.2901961, 1, 1,
0.2629402, -1.031035, 3.081464, 0, 0.2862745, 1, 1,
0.2682794, 0.3451101, 0.1564135, 0, 0.2784314, 1, 1,
0.2812367, -0.5097621, 2.279711, 0, 0.2745098, 1, 1,
0.2814589, 1.413473, -0.1069304, 0, 0.2666667, 1, 1,
0.2836431, -2.206694, 2.264066, 0, 0.2627451, 1, 1,
0.2838535, 0.2038465, 0.965618, 0, 0.254902, 1, 1,
0.2871758, 0.8372844, 0.3504256, 0, 0.2509804, 1, 1,
0.2907669, 0.7805537, 2.049257, 0, 0.2431373, 1, 1,
0.2921281, -0.5859879, 2.478628, 0, 0.2392157, 1, 1,
0.2943421, 1.554691, -0.1397163, 0, 0.2313726, 1, 1,
0.2960343, -0.7244174, 2.116935, 0, 0.227451, 1, 1,
0.298514, 1.586244, -0.7859043, 0, 0.2196078, 1, 1,
0.3090789, 0.5269095, -0.8816248, 0, 0.2156863, 1, 1,
0.3100085, -0.01503055, 1.902265, 0, 0.2078431, 1, 1,
0.3100584, -0.5014763, 2.558513, 0, 0.2039216, 1, 1,
0.3115402, 0.3587969, 2.027387, 0, 0.1960784, 1, 1,
0.3179371, -0.6780544, 2.876909, 0, 0.1882353, 1, 1,
0.3208288, 1.069323, -1.255412, 0, 0.1843137, 1, 1,
0.3247602, 1.114555, 0.110075, 0, 0.1764706, 1, 1,
0.3293674, -0.2435906, 1.019686, 0, 0.172549, 1, 1,
0.3300923, 1.834274, 2.527483, 0, 0.1647059, 1, 1,
0.3339065, 0.3342707, 0.3812066, 0, 0.1607843, 1, 1,
0.3347456, -0.5644181, 1.917974, 0, 0.1529412, 1, 1,
0.3374042, -0.0802615, 0.8500981, 0, 0.1490196, 1, 1,
0.3376337, -0.4738325, 1.000813, 0, 0.1411765, 1, 1,
0.3406447, -0.4032981, 3.854242, 0, 0.1372549, 1, 1,
0.3432396, 0.2364356, 1.425632, 0, 0.1294118, 1, 1,
0.3436964, 2.346184, 1.856277, 0, 0.1254902, 1, 1,
0.3476739, -0.1068494, 1.529038, 0, 0.1176471, 1, 1,
0.3490965, 0.385312, 2.480083, 0, 0.1137255, 1, 1,
0.3533264, 0.5899171, -0.7745651, 0, 0.1058824, 1, 1,
0.3545701, 1.79479, 0.5223661, 0, 0.09803922, 1, 1,
0.3576228, -0.160823, 2.177836, 0, 0.09411765, 1, 1,
0.3618466, 0.2671815, 1.046356, 0, 0.08627451, 1, 1,
0.3650879, -1.310488, 4.146416, 0, 0.08235294, 1, 1,
0.3661923, 1.521183, -0.3113297, 0, 0.07450981, 1, 1,
0.3699406, 0.5277111, 1.086108, 0, 0.07058824, 1, 1,
0.371148, -0.6727058, 3.696693, 0, 0.0627451, 1, 1,
0.3818546, 0.4922809, 1.489698, 0, 0.05882353, 1, 1,
0.3830817, -0.08416146, 3.083723, 0, 0.05098039, 1, 1,
0.3956928, 0.9731334, -0.0922369, 0, 0.04705882, 1, 1,
0.3961864, -0.7850828, 3.187541, 0, 0.03921569, 1, 1,
0.3971344, 1.326755, -0.5551102, 0, 0.03529412, 1, 1,
0.3971624, 0.2536611, 1.465691, 0, 0.02745098, 1, 1,
0.3982408, 0.5182476, 1.40842, 0, 0.02352941, 1, 1,
0.4021455, -0.4355246, 3.033225, 0, 0.01568628, 1, 1,
0.4040982, -0.2424994, 2.082857, 0, 0.01176471, 1, 1,
0.4095684, -1.310518, 3.648622, 0, 0.003921569, 1, 1,
0.4153634, 1.462823, -0.2406218, 0.003921569, 0, 1, 1,
0.4253224, -0.4131326, 3.739446, 0.007843138, 0, 1, 1,
0.4294604, -0.4382116, 3.228979, 0.01568628, 0, 1, 1,
0.4315719, 2.692519, -0.9531778, 0.01960784, 0, 1, 1,
0.4346195, -1.443004, 2.248497, 0.02745098, 0, 1, 1,
0.4347715, -0.596368, 2.809577, 0.03137255, 0, 1, 1,
0.4354347, 1.091212, -1.055495, 0.03921569, 0, 1, 1,
0.4354789, -0.8064172, 2.390339, 0.04313726, 0, 1, 1,
0.4361813, 1.20041, 0.2394915, 0.05098039, 0, 1, 1,
0.4370145, -0.8436415, 1.734878, 0.05490196, 0, 1, 1,
0.4371872, 2.970176, 1.023696, 0.0627451, 0, 1, 1,
0.4385548, 1.492242, 0.6324839, 0.06666667, 0, 1, 1,
0.4419204, 2.739954, 0.154634, 0.07450981, 0, 1, 1,
0.452688, 1.152435, -0.1032375, 0.07843138, 0, 1, 1,
0.4591827, 2.107243, -0.04927711, 0.08627451, 0, 1, 1,
0.4708729, -0.8441409, 3.063452, 0.09019608, 0, 1, 1,
0.4717122, -1.786267, 4.071769, 0.09803922, 0, 1, 1,
0.4776272, 0.3920318, 2.194832, 0.1058824, 0, 1, 1,
0.4829317, -1.490353, 4.726233, 0.1098039, 0, 1, 1,
0.4854376, 1.239946, -0.9103789, 0.1176471, 0, 1, 1,
0.4864355, 0.6922117, 0.8068638, 0.1215686, 0, 1, 1,
0.491908, -0.2159185, 4.000451, 0.1294118, 0, 1, 1,
0.4926384, -1.876717, 1.534121, 0.1333333, 0, 1, 1,
0.4928979, -2.078176, 3.359406, 0.1411765, 0, 1, 1,
0.501057, 0.8295653, 0.03427386, 0.145098, 0, 1, 1,
0.5057638, -0.1931809, 1.615444, 0.1529412, 0, 1, 1,
0.5109495, -0.7602554, 1.765387, 0.1568628, 0, 1, 1,
0.5132659, 0.3367532, 1.453235, 0.1647059, 0, 1, 1,
0.5145223, 1.72667, 0.2567234, 0.1686275, 0, 1, 1,
0.5157437, -0.6608718, 2.262955, 0.1764706, 0, 1, 1,
0.5171419, 0.4654165, 1.286566, 0.1803922, 0, 1, 1,
0.5176691, -1.230674, 0.7946098, 0.1882353, 0, 1, 1,
0.5278348, -1.106183, 1.492526, 0.1921569, 0, 1, 1,
0.5281301, 0.3618392, 1.863353, 0.2, 0, 1, 1,
0.5290469, -1.683234, 3.116268, 0.2078431, 0, 1, 1,
0.5296751, 0.6568232, 0.955802, 0.2117647, 0, 1, 1,
0.5335912, 0.1881236, -0.07353251, 0.2196078, 0, 1, 1,
0.5358738, -0.3376432, 2.273183, 0.2235294, 0, 1, 1,
0.5363585, 0.7472535, 1.954269, 0.2313726, 0, 1, 1,
0.5376419, -0.3662398, 0.4689463, 0.2352941, 0, 1, 1,
0.543423, 0.8070441, 2.489973, 0.2431373, 0, 1, 1,
0.5444235, 0.129168, 1.237732, 0.2470588, 0, 1, 1,
0.550432, 0.6586714, 0.3465617, 0.254902, 0, 1, 1,
0.5513229, -0.6076179, 2.656285, 0.2588235, 0, 1, 1,
0.5530978, 0.9197125, -0.1349488, 0.2666667, 0, 1, 1,
0.5610766, -0.8981363, 3.623063, 0.2705882, 0, 1, 1,
0.5615205, 0.1704403, -0.05422076, 0.2784314, 0, 1, 1,
0.5648649, 2.041384, -0.5337934, 0.282353, 0, 1, 1,
0.5740008, -1.552516, 0.8390219, 0.2901961, 0, 1, 1,
0.5774897, -0.1282618, 2.117846, 0.2941177, 0, 1, 1,
0.577608, -0.05799294, 0.6296328, 0.3019608, 0, 1, 1,
0.5792528, -0.09287003, 0.970419, 0.3098039, 0, 1, 1,
0.5873113, -0.382744, 2.012642, 0.3137255, 0, 1, 1,
0.5874571, -1.516924, 1.612683, 0.3215686, 0, 1, 1,
0.5895787, -0.006492987, 0.1180312, 0.3254902, 0, 1, 1,
0.5895998, -1.139623, 2.541732, 0.3333333, 0, 1, 1,
0.591455, 0.2507084, 0.7967075, 0.3372549, 0, 1, 1,
0.5923855, 0.1140244, 3.744623, 0.345098, 0, 1, 1,
0.5950161, -0.1828621, 2.296795, 0.3490196, 0, 1, 1,
0.5955569, 1.341789, -1.551229, 0.3568628, 0, 1, 1,
0.5974764, 1.077641, 0.4671941, 0.3607843, 0, 1, 1,
0.6033858, -2.315527, 3.172439, 0.3686275, 0, 1, 1,
0.6038352, 0.2524236, 2.21915, 0.372549, 0, 1, 1,
0.6047249, 0.1853537, -0.462857, 0.3803922, 0, 1, 1,
0.6141522, -0.3725269, 0.6681731, 0.3843137, 0, 1, 1,
0.6168129, 1.029515, 1.859804, 0.3921569, 0, 1, 1,
0.6197053, -0.9713123, 4.268254, 0.3960784, 0, 1, 1,
0.6306662, -1.02564, 1.910652, 0.4039216, 0, 1, 1,
0.6312406, -0.79311, 2.918014, 0.4117647, 0, 1, 1,
0.6314422, -1.169383, 2.21376, 0.4156863, 0, 1, 1,
0.6319678, 2.101939, -1.163679, 0.4235294, 0, 1, 1,
0.6370025, -0.4542542, 2.10486, 0.427451, 0, 1, 1,
0.6382951, 0.7209866, 2.247457, 0.4352941, 0, 1, 1,
0.6387199, 1.083781, 0.3630387, 0.4392157, 0, 1, 1,
0.6451417, 1.526322, 1.625791, 0.4470588, 0, 1, 1,
0.6540555, -0.6119763, 1.159794, 0.4509804, 0, 1, 1,
0.6580232, 1.057009, 0.1094718, 0.4588235, 0, 1, 1,
0.6665269, 1.97606, 0.7082315, 0.4627451, 0, 1, 1,
0.6673359, 1.032828, 1.928926, 0.4705882, 0, 1, 1,
0.6676211, -0.1984304, 1.795803, 0.4745098, 0, 1, 1,
0.6713765, -0.7936192, 2.790603, 0.4823529, 0, 1, 1,
0.67164, -0.12934, 1.991657, 0.4862745, 0, 1, 1,
0.6747597, 0.2218862, 1.306846, 0.4941176, 0, 1, 1,
0.6750262, -0.2065662, 1.561747, 0.5019608, 0, 1, 1,
0.6799406, 1.015345, 1.254414, 0.5058824, 0, 1, 1,
0.6855148, -1.41486, 1.961919, 0.5137255, 0, 1, 1,
0.6857368, 0.2610997, 0.2632363, 0.5176471, 0, 1, 1,
0.6861575, 0.9428763, 0.8152621, 0.5254902, 0, 1, 1,
0.6921839, -0.2212975, 1.879526, 0.5294118, 0, 1, 1,
0.7046925, 0.3461756, 1.175353, 0.5372549, 0, 1, 1,
0.7077963, 1.665696, -0.4667891, 0.5411765, 0, 1, 1,
0.7100262, -1.243235, 3.638116, 0.5490196, 0, 1, 1,
0.7153731, -1.368044, 3.074907, 0.5529412, 0, 1, 1,
0.7168521, -0.4777798, 3.669163, 0.5607843, 0, 1, 1,
0.7185292, -0.2779355, 1.660523, 0.5647059, 0, 1, 1,
0.7193108, 1.700822, -0.4287067, 0.572549, 0, 1, 1,
0.7216366, 0.5584192, 0.6932433, 0.5764706, 0, 1, 1,
0.7287685, -0.06557559, -0.2834097, 0.5843138, 0, 1, 1,
0.7316357, -0.558325, 3.259034, 0.5882353, 0, 1, 1,
0.7331575, 0.696727, -0.9264573, 0.5960785, 0, 1, 1,
0.7431303, -0.6760079, 2.456689, 0.6039216, 0, 1, 1,
0.7471325, 0.6586968, -0.6463354, 0.6078432, 0, 1, 1,
0.7500786, 0.585126, 1.145915, 0.6156863, 0, 1, 1,
0.7567609, 0.1872191, -0.07555428, 0.6196079, 0, 1, 1,
0.7614106, -0.09747184, 1.537981, 0.627451, 0, 1, 1,
0.764033, 2.675447, 2.195148, 0.6313726, 0, 1, 1,
0.7739704, 0.4025313, -0.06622711, 0.6392157, 0, 1, 1,
0.7768443, -1.256745, 3.448599, 0.6431373, 0, 1, 1,
0.777064, -0.347435, 2.199468, 0.6509804, 0, 1, 1,
0.7788178, -0.5846903, 2.59086, 0.654902, 0, 1, 1,
0.7862421, 1.177372, 1.25167, 0.6627451, 0, 1, 1,
0.7932946, 0.02862069, 2.533472, 0.6666667, 0, 1, 1,
0.7987515, 1.187833, 0.7151586, 0.6745098, 0, 1, 1,
0.8043804, 0.6294544, 0.3699979, 0.6784314, 0, 1, 1,
0.8092238, -0.05629801, 0.9452913, 0.6862745, 0, 1, 1,
0.8118785, -0.9745957, 3.419495, 0.6901961, 0, 1, 1,
0.8156221, 0.8545718, 1.763589, 0.6980392, 0, 1, 1,
0.8269179, 0.2543659, 1.393385, 0.7058824, 0, 1, 1,
0.831487, -0.4887934, 2.921429, 0.7098039, 0, 1, 1,
0.8374045, -1.056132, 2.787215, 0.7176471, 0, 1, 1,
0.8391127, 1.908377, 1.441081, 0.7215686, 0, 1, 1,
0.843107, 0.003093743, 0.1440866, 0.7294118, 0, 1, 1,
0.8443939, 0.4765941, 1.265803, 0.7333333, 0, 1, 1,
0.8455256, -1.688036, 1.879506, 0.7411765, 0, 1, 1,
0.845526, 0.1758189, 3.155903, 0.7450981, 0, 1, 1,
0.8465216, -0.2484484, 2.479634, 0.7529412, 0, 1, 1,
0.8472816, 1.552056, 0.2644813, 0.7568628, 0, 1, 1,
0.849239, 0.4716758, 1.28822, 0.7647059, 0, 1, 1,
0.8519063, -1.698093, -0.1864439, 0.7686275, 0, 1, 1,
0.8532001, -0.8505738, 0.6891986, 0.7764706, 0, 1, 1,
0.8551846, 1.669209, 1.00744, 0.7803922, 0, 1, 1,
0.8578133, 1.366549, 0.3944885, 0.7882353, 0, 1, 1,
0.8623132, 1.055177, 1.670244, 0.7921569, 0, 1, 1,
0.8626804, 1.162812, 0.3193881, 0.8, 0, 1, 1,
0.8667257, 2.019441, 0.6822922, 0.8078431, 0, 1, 1,
0.8728591, -0.9168873, 2.055042, 0.8117647, 0, 1, 1,
0.8780385, -0.2343258, 1.280441, 0.8196079, 0, 1, 1,
0.893788, -2.160952, 1.787628, 0.8235294, 0, 1, 1,
0.8960692, 0.4111547, 0.1752309, 0.8313726, 0, 1, 1,
0.8982237, 0.8200344, 0.473949, 0.8352941, 0, 1, 1,
0.903135, -0.8665997, 1.698689, 0.8431373, 0, 1, 1,
0.9099833, -2.846704, 3.631784, 0.8470588, 0, 1, 1,
0.9226035, 1.916247, 0.157436, 0.854902, 0, 1, 1,
0.9303749, -0.5651674, 2.144444, 0.8588235, 0, 1, 1,
0.9341798, -1.402373, 1.462513, 0.8666667, 0, 1, 1,
0.9350764, 0.7980699, -0.3320707, 0.8705882, 0, 1, 1,
0.9363474, -0.197778, 1.493365, 0.8784314, 0, 1, 1,
0.9366856, -1.953313, 3.592123, 0.8823529, 0, 1, 1,
0.9400227, 0.03548183, 2.412648, 0.8901961, 0, 1, 1,
0.9427069, -0.4338284, 0.3773934, 0.8941177, 0, 1, 1,
0.943864, 0.4894126, -0.8833616, 0.9019608, 0, 1, 1,
0.9470189, 1.010912, 0.7646804, 0.9098039, 0, 1, 1,
0.9519638, -0.9934783, 1.254327, 0.9137255, 0, 1, 1,
0.9537722, -0.8459442, 1.254775, 0.9215686, 0, 1, 1,
0.9548877, 3.13433, 1.101708, 0.9254902, 0, 1, 1,
0.962393, 0.9211468, 0.6433791, 0.9333333, 0, 1, 1,
0.964016, -0.03395054, 1.043402, 0.9372549, 0, 1, 1,
0.9642016, -1.037243, 2.14424, 0.945098, 0, 1, 1,
0.9763166, 0.8301726, 0.380879, 0.9490196, 0, 1, 1,
0.9779331, -0.5371574, 3.144974, 0.9568627, 0, 1, 1,
0.9806325, 0.6305579, 1.882437, 0.9607843, 0, 1, 1,
0.9815882, -1.017204, 2.424323, 0.9686275, 0, 1, 1,
0.9850976, 0.9545127, 1.23182, 0.972549, 0, 1, 1,
0.9864722, -0.6644297, 3.16214, 0.9803922, 0, 1, 1,
0.987182, 0.7438513, 1.371809, 0.9843137, 0, 1, 1,
0.9904531, -1.176473, 2.531221, 0.9921569, 0, 1, 1,
0.9989875, -1.167414, 0.6439002, 0.9960784, 0, 1, 1,
1.003966, -1.111308, 0.1372742, 1, 0, 0.9960784, 1,
1.005414, 0.4078442, -0.06747375, 1, 0, 0.9882353, 1,
1.008721, -1.269245, 1.069974, 1, 0, 0.9843137, 1,
1.020993, -0.9867775, 1.790386, 1, 0, 0.9764706, 1,
1.02893, 1.754932, -0.7797846, 1, 0, 0.972549, 1,
1.033282, -2.608131, 1.982435, 1, 0, 0.9647059, 1,
1.035478, -0.5073801, 4.037576, 1, 0, 0.9607843, 1,
1.036664, 0.3295263, 3.290645, 1, 0, 0.9529412, 1,
1.037346, 1.842346, -0.1161098, 1, 0, 0.9490196, 1,
1.047395, 1.311766, 1.108363, 1, 0, 0.9411765, 1,
1.047404, 0.2938611, 2.335095, 1, 0, 0.9372549, 1,
1.058901, -1.638253, 3.329244, 1, 0, 0.9294118, 1,
1.060873, -0.4695842, 2.134151, 1, 0, 0.9254902, 1,
1.061006, 1.411109, 0.3109097, 1, 0, 0.9176471, 1,
1.061664, 0.4052837, 2.546126, 1, 0, 0.9137255, 1,
1.070979, 0.4579269, 1.982742, 1, 0, 0.9058824, 1,
1.072304, -0.4057402, 3.749679, 1, 0, 0.9019608, 1,
1.07483, -0.3341029, 2.861287, 1, 0, 0.8941177, 1,
1.08075, 1.53692, 2.336699, 1, 0, 0.8862745, 1,
1.092686, -1.650915, 3.701185, 1, 0, 0.8823529, 1,
1.094864, -0.4530813, 3.420216, 1, 0, 0.8745098, 1,
1.09844, -0.08521816, 2.482814, 1, 0, 0.8705882, 1,
1.099729, 0.6588818, 2.543867, 1, 0, 0.8627451, 1,
1.113109, -1.020376, 3.370003, 1, 0, 0.8588235, 1,
1.122373, -0.6754174, 3.994179, 1, 0, 0.8509804, 1,
1.134285, 1.539986, 1.6984, 1, 0, 0.8470588, 1,
1.143239, -0.3833086, 1.281374, 1, 0, 0.8392157, 1,
1.153055, -0.1850335, 1.639512, 1, 0, 0.8352941, 1,
1.170065, -0.3395282, 3.796549, 1, 0, 0.827451, 1,
1.174656, 1.418343, -1.487042, 1, 0, 0.8235294, 1,
1.175893, -1.792103, 2.642551, 1, 0, 0.8156863, 1,
1.180297, 0.257104, 1.423282, 1, 0, 0.8117647, 1,
1.183095, -0.6983471, 3.897145, 1, 0, 0.8039216, 1,
1.183672, -2.626686, 1.071134, 1, 0, 0.7960784, 1,
1.196463, 2.152412, -0.7554885, 1, 0, 0.7921569, 1,
1.197302, 0.2063927, 1.157913, 1, 0, 0.7843137, 1,
1.203032, -1.288658, 3.761777, 1, 0, 0.7803922, 1,
1.203941, -1.562708, 4.934422, 1, 0, 0.772549, 1,
1.20461, -0.2990807, 0.7612081, 1, 0, 0.7686275, 1,
1.213416, 1.246411, -0.5295439, 1, 0, 0.7607843, 1,
1.214519, 0.3269076, 1.391876, 1, 0, 0.7568628, 1,
1.219568, 0.941388, 1.332249, 1, 0, 0.7490196, 1,
1.220361, -0.7755091, 2.741821, 1, 0, 0.7450981, 1,
1.222893, 0.5455289, 0.6466347, 1, 0, 0.7372549, 1,
1.228484, 0.04714398, -0.1445083, 1, 0, 0.7333333, 1,
1.238836, 0.8959321, 1.137787, 1, 0, 0.7254902, 1,
1.241061, 0.5465975, 0.801895, 1, 0, 0.7215686, 1,
1.243697, 1.670875, 1.117014, 1, 0, 0.7137255, 1,
1.243716, -0.6099752, 0.8562649, 1, 0, 0.7098039, 1,
1.246892, 0.6287169, 0.9207401, 1, 0, 0.7019608, 1,
1.247676, -0.9173209, 1.589978, 1, 0, 0.6941177, 1,
1.248674, -0.2661222, 0.3070038, 1, 0, 0.6901961, 1,
1.258452, -0.3699109, 1.572899, 1, 0, 0.682353, 1,
1.258785, -1.344874, 2.702966, 1, 0, 0.6784314, 1,
1.259143, 1.441448, -0.4737557, 1, 0, 0.6705883, 1,
1.25929, -0.4651606, 2.972368, 1, 0, 0.6666667, 1,
1.262828, 0.6111386, 3.682759, 1, 0, 0.6588235, 1,
1.266008, -0.3754779, 1.952251, 1, 0, 0.654902, 1,
1.266404, -0.7489389, 0.7336013, 1, 0, 0.6470588, 1,
1.267268, 0.1445126, 1.975423, 1, 0, 0.6431373, 1,
1.26906, 1.192126, 1.15067, 1, 0, 0.6352941, 1,
1.270605, 1.598723, 0.7896564, 1, 0, 0.6313726, 1,
1.272722, 0.4026585, 0.7302784, 1, 0, 0.6235294, 1,
1.275338, -0.4006171, -0.3288363, 1, 0, 0.6196079, 1,
1.275658, -0.2810511, -0.1976989, 1, 0, 0.6117647, 1,
1.283912, 1.142845, 0.7248634, 1, 0, 0.6078432, 1,
1.291157, -0.4983814, 2.541599, 1, 0, 0.6, 1,
1.296145, 0.2286841, 1.005468, 1, 0, 0.5921569, 1,
1.301915, 0.4545771, -1.014152, 1, 0, 0.5882353, 1,
1.303581, -0.4174622, 1.172162, 1, 0, 0.5803922, 1,
1.304965, 0.3891875, 2.129884, 1, 0, 0.5764706, 1,
1.309101, -0.4894879, 1.840256, 1, 0, 0.5686275, 1,
1.324479, 0.442993, 1.887568, 1, 0, 0.5647059, 1,
1.326219, 0.3502602, 2.128766, 1, 0, 0.5568628, 1,
1.349323, 0.3343522, 0.5653469, 1, 0, 0.5529412, 1,
1.352761, -0.2225793, 1.220882, 1, 0, 0.5450981, 1,
1.358587, -0.1878941, 1.734338, 1, 0, 0.5411765, 1,
1.361082, -0.5141476, 1.993873, 1, 0, 0.5333334, 1,
1.361751, 1.471232, -1.003183, 1, 0, 0.5294118, 1,
1.376298, 0.4917065, 1.418438, 1, 0, 0.5215687, 1,
1.377855, 0.2428609, 2.241482, 1, 0, 0.5176471, 1,
1.378286, 0.4079379, 0.2472768, 1, 0, 0.509804, 1,
1.379166, 0.6981325, -1.031725, 1, 0, 0.5058824, 1,
1.383757, -0.4521163, 2.726551, 1, 0, 0.4980392, 1,
1.386815, 1.017271, 0.4753833, 1, 0, 0.4901961, 1,
1.406173, 0.7564287, 0.4207891, 1, 0, 0.4862745, 1,
1.409672, 0.9044271, 0.7755514, 1, 0, 0.4784314, 1,
1.415127, -0.5742586, 0.9179882, 1, 0, 0.4745098, 1,
1.419047, -0.1471877, 2.215165, 1, 0, 0.4666667, 1,
1.420202, -0.7266161, 0.2138228, 1, 0, 0.4627451, 1,
1.420783, 1.239562, 2.286675, 1, 0, 0.454902, 1,
1.422622, 2.006077, 1.544847, 1, 0, 0.4509804, 1,
1.441867, 0.0655577, -0.3225639, 1, 0, 0.4431373, 1,
1.454601, -0.487918, -0.7269517, 1, 0, 0.4392157, 1,
1.455122, -0.57775, 0.8453579, 1, 0, 0.4313726, 1,
1.460603, 0.4314355, 1.439955, 1, 0, 0.427451, 1,
1.461852, 2.62241, 0.650519, 1, 0, 0.4196078, 1,
1.464687, -0.5700939, 2.582993, 1, 0, 0.4156863, 1,
1.465139, 0.5586744, 1.223447, 1, 0, 0.4078431, 1,
1.466161, -0.0867612, 1.2516, 1, 0, 0.4039216, 1,
1.471207, 1.546204, 1.344217, 1, 0, 0.3960784, 1,
1.4928, 0.2883533, 0.8479572, 1, 0, 0.3882353, 1,
1.493197, -1.377598, 2.554903, 1, 0, 0.3843137, 1,
1.50748, -1.870356, 2.890862, 1, 0, 0.3764706, 1,
1.509853, -2.13233, 2.90112, 1, 0, 0.372549, 1,
1.5128, -1.707197, 2.319508, 1, 0, 0.3647059, 1,
1.515532, 0.3497226, 1.971547, 1, 0, 0.3607843, 1,
1.52887, -0.8239915, 0.8479388, 1, 0, 0.3529412, 1,
1.534161, -0.6313675, 1.764, 1, 0, 0.3490196, 1,
1.53802, 1.391693, 0.4401175, 1, 0, 0.3411765, 1,
1.556545, 0.2362647, 2.083771, 1, 0, 0.3372549, 1,
1.557847, -1.381549, 1.752656, 1, 0, 0.3294118, 1,
1.570211, -0.1458865, 3.392914, 1, 0, 0.3254902, 1,
1.572169, 0.1814614, 0.978914, 1, 0, 0.3176471, 1,
1.579985, -0.1990936, -0.03357762, 1, 0, 0.3137255, 1,
1.580467, -0.1507109, 2.37394, 1, 0, 0.3058824, 1,
1.599573, 0.8240309, 0.9677486, 1, 0, 0.2980392, 1,
1.602992, 1.081426, -0.7745531, 1, 0, 0.2941177, 1,
1.630749, -0.04993602, 1.117266, 1, 0, 0.2862745, 1,
1.634016, 1.237842, 1.570881, 1, 0, 0.282353, 1,
1.642868, -0.2291101, 2.001727, 1, 0, 0.2745098, 1,
1.64478, 2.261125, 0.6631507, 1, 0, 0.2705882, 1,
1.649547, -0.4993291, 0.631957, 1, 0, 0.2627451, 1,
1.662213, -0.2747501, 1.560823, 1, 0, 0.2588235, 1,
1.667378, -1.137148, 3.529784, 1, 0, 0.2509804, 1,
1.670796, 0.3774072, 2.620183, 1, 0, 0.2470588, 1,
1.676861, -0.08220243, 2.048514, 1, 0, 0.2392157, 1,
1.689456, 0.06064153, -0.2948914, 1, 0, 0.2352941, 1,
1.706868, -0.004462772, 3.182959, 1, 0, 0.227451, 1,
1.714156, 0.6374121, 0.04937162, 1, 0, 0.2235294, 1,
1.71664, -0.5382853, 3.843678, 1, 0, 0.2156863, 1,
1.741946, -0.3194611, 1.040586, 1, 0, 0.2117647, 1,
1.750347, -0.0629855, 0.1634678, 1, 0, 0.2039216, 1,
1.755823, 0.6674039, 1.709122, 1, 0, 0.1960784, 1,
1.784621, 1.421833, 0.9256631, 1, 0, 0.1921569, 1,
1.828413, 0.7294143, 2.05791, 1, 0, 0.1843137, 1,
1.856049, -0.2017881, 1.344444, 1, 0, 0.1803922, 1,
1.856429, 0.2210112, 1.980372, 1, 0, 0.172549, 1,
1.878712, -0.6219262, 2.062054, 1, 0, 0.1686275, 1,
1.889787, 2.256548, -0.3544134, 1, 0, 0.1607843, 1,
1.933307, -0.5909981, 1.619847, 1, 0, 0.1568628, 1,
1.949471, 0.2154931, 1.603312, 1, 0, 0.1490196, 1,
1.97415, 1.375281, 0.1436154, 1, 0, 0.145098, 1,
1.98447, -1.610746, 1.270941, 1, 0, 0.1372549, 1,
1.991346, -0.5940626, 2.055162, 1, 0, 0.1333333, 1,
1.99705, -0.1105529, 0.8090894, 1, 0, 0.1254902, 1,
1.998385, -0.2200891, 1.029178, 1, 0, 0.1215686, 1,
2.055728, 0.8049001, 0.193518, 1, 0, 0.1137255, 1,
2.094206, 0.3745378, 1.245654, 1, 0, 0.1098039, 1,
2.136463, -0.996812, 3.058645, 1, 0, 0.1019608, 1,
2.142143, -0.466321, 1.55838, 1, 0, 0.09411765, 1,
2.181177, 0.3553273, 2.658424, 1, 0, 0.09019608, 1,
2.183351, -1.506627, 3.079575, 1, 0, 0.08235294, 1,
2.207353, -0.002629074, 1.249058, 1, 0, 0.07843138, 1,
2.220822, -1.023866, 1.587438, 1, 0, 0.07058824, 1,
2.445223, -0.9932807, 4.018539, 1, 0, 0.06666667, 1,
2.457492, -0.03003713, 3.228278, 1, 0, 0.05882353, 1,
2.503376, -1.725042, 1.378167, 1, 0, 0.05490196, 1,
2.516904, 1.614719, 1.59903, 1, 0, 0.04705882, 1,
2.517548, 2.239702, 1.208974, 1, 0, 0.04313726, 1,
2.52678, -0.8410947, 0.8940722, 1, 0, 0.03529412, 1,
2.821778, 1.368982, -0.5240454, 1, 0, 0.03137255, 1,
2.902402, 2.364748, 0.610158, 1, 0, 0.02352941, 1,
2.947297, -1.487911, 1.183256, 1, 0, 0.01960784, 1,
3.118022, 0.441816, 1.958124, 1, 0, 0.01176471, 1,
3.289131, 0.5063288, 1.8215, 1, 0, 0.007843138, 1
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
0.1507924, -4.885101, -7.265789, 0, -0.5, 0.5, 0.5,
0.1507924, -4.885101, -7.265789, 1, -0.5, 0.5, 0.5,
0.1507924, -4.885101, -7.265789, 1, 1.5, 0.5, 0.5,
0.1507924, -4.885101, -7.265789, 0, 1.5, 0.5, 0.5
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
-4.051444, -0.2586144, -7.265789, 0, -0.5, 0.5, 0.5,
-4.051444, -0.2586144, -7.265789, 1, -0.5, 0.5, 0.5,
-4.051444, -0.2586144, -7.265789, 1, 1.5, 0.5, 0.5,
-4.051444, -0.2586144, -7.265789, 0, 1.5, 0.5, 0.5
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
-4.051444, -4.885101, -0.2815726, 0, -0.5, 0.5, 0.5,
-4.051444, -4.885101, -0.2815726, 1, -0.5, 0.5, 0.5,
-4.051444, -4.885101, -0.2815726, 1, 1.5, 0.5, 0.5,
-4.051444, -4.885101, -0.2815726, 0, 1.5, 0.5, 0.5
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
-2, -3.81745, -5.654047,
3, -3.81745, -5.654047,
-2, -3.81745, -5.654047,
-2, -3.995392, -5.92267,
-1, -3.81745, -5.654047,
-1, -3.995392, -5.92267,
0, -3.81745, -5.654047,
0, -3.995392, -5.92267,
1, -3.81745, -5.654047,
1, -3.995392, -5.92267,
2, -3.81745, -5.654047,
2, -3.995392, -5.92267,
3, -3.81745, -5.654047,
3, -3.995392, -5.92267
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
-2, -4.351276, -6.459918, 0, -0.5, 0.5, 0.5,
-2, -4.351276, -6.459918, 1, -0.5, 0.5, 0.5,
-2, -4.351276, -6.459918, 1, 1.5, 0.5, 0.5,
-2, -4.351276, -6.459918, 0, 1.5, 0.5, 0.5,
-1, -4.351276, -6.459918, 0, -0.5, 0.5, 0.5,
-1, -4.351276, -6.459918, 1, -0.5, 0.5, 0.5,
-1, -4.351276, -6.459918, 1, 1.5, 0.5, 0.5,
-1, -4.351276, -6.459918, 0, 1.5, 0.5, 0.5,
0, -4.351276, -6.459918, 0, -0.5, 0.5, 0.5,
0, -4.351276, -6.459918, 1, -0.5, 0.5, 0.5,
0, -4.351276, -6.459918, 1, 1.5, 0.5, 0.5,
0, -4.351276, -6.459918, 0, 1.5, 0.5, 0.5,
1, -4.351276, -6.459918, 0, -0.5, 0.5, 0.5,
1, -4.351276, -6.459918, 1, -0.5, 0.5, 0.5,
1, -4.351276, -6.459918, 1, 1.5, 0.5, 0.5,
1, -4.351276, -6.459918, 0, 1.5, 0.5, 0.5,
2, -4.351276, -6.459918, 0, -0.5, 0.5, 0.5,
2, -4.351276, -6.459918, 1, -0.5, 0.5, 0.5,
2, -4.351276, -6.459918, 1, 1.5, 0.5, 0.5,
2, -4.351276, -6.459918, 0, 1.5, 0.5, 0.5,
3, -4.351276, -6.459918, 0, -0.5, 0.5, 0.5,
3, -4.351276, -6.459918, 1, -0.5, 0.5, 0.5,
3, -4.351276, -6.459918, 1, 1.5, 0.5, 0.5,
3, -4.351276, -6.459918, 0, 1.5, 0.5, 0.5
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
-3.081697, -3, -5.654047,
-3.081697, 3, -5.654047,
-3.081697, -3, -5.654047,
-3.243321, -3, -5.92267,
-3.081697, -2, -5.654047,
-3.243321, -2, -5.92267,
-3.081697, -1, -5.654047,
-3.243321, -1, -5.92267,
-3.081697, 0, -5.654047,
-3.243321, 0, -5.92267,
-3.081697, 1, -5.654047,
-3.243321, 1, -5.92267,
-3.081697, 2, -5.654047,
-3.243321, 2, -5.92267,
-3.081697, 3, -5.654047,
-3.243321, 3, -5.92267
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
-3.56657, -3, -6.459918, 0, -0.5, 0.5, 0.5,
-3.56657, -3, -6.459918, 1, -0.5, 0.5, 0.5,
-3.56657, -3, -6.459918, 1, 1.5, 0.5, 0.5,
-3.56657, -3, -6.459918, 0, 1.5, 0.5, 0.5,
-3.56657, -2, -6.459918, 0, -0.5, 0.5, 0.5,
-3.56657, -2, -6.459918, 1, -0.5, 0.5, 0.5,
-3.56657, -2, -6.459918, 1, 1.5, 0.5, 0.5,
-3.56657, -2, -6.459918, 0, 1.5, 0.5, 0.5,
-3.56657, -1, -6.459918, 0, -0.5, 0.5, 0.5,
-3.56657, -1, -6.459918, 1, -0.5, 0.5, 0.5,
-3.56657, -1, -6.459918, 1, 1.5, 0.5, 0.5,
-3.56657, -1, -6.459918, 0, 1.5, 0.5, 0.5,
-3.56657, 0, -6.459918, 0, -0.5, 0.5, 0.5,
-3.56657, 0, -6.459918, 1, -0.5, 0.5, 0.5,
-3.56657, 0, -6.459918, 1, 1.5, 0.5, 0.5,
-3.56657, 0, -6.459918, 0, 1.5, 0.5, 0.5,
-3.56657, 1, -6.459918, 0, -0.5, 0.5, 0.5,
-3.56657, 1, -6.459918, 1, -0.5, 0.5, 0.5,
-3.56657, 1, -6.459918, 1, 1.5, 0.5, 0.5,
-3.56657, 1, -6.459918, 0, 1.5, 0.5, 0.5,
-3.56657, 2, -6.459918, 0, -0.5, 0.5, 0.5,
-3.56657, 2, -6.459918, 1, -0.5, 0.5, 0.5,
-3.56657, 2, -6.459918, 1, 1.5, 0.5, 0.5,
-3.56657, 2, -6.459918, 0, 1.5, 0.5, 0.5,
-3.56657, 3, -6.459918, 0, -0.5, 0.5, 0.5,
-3.56657, 3, -6.459918, 1, -0.5, 0.5, 0.5,
-3.56657, 3, -6.459918, 1, 1.5, 0.5, 0.5,
-3.56657, 3, -6.459918, 0, 1.5, 0.5, 0.5
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
-3.081697, -3.81745, -4,
-3.081697, -3.81745, 4,
-3.081697, -3.81745, -4,
-3.243321, -3.995392, -4,
-3.081697, -3.81745, -2,
-3.243321, -3.995392, -2,
-3.081697, -3.81745, 0,
-3.243321, -3.995392, 0,
-3.081697, -3.81745, 2,
-3.243321, -3.995392, 2,
-3.081697, -3.81745, 4,
-3.243321, -3.995392, 4
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
-3.56657, -4.351276, -4, 0, -0.5, 0.5, 0.5,
-3.56657, -4.351276, -4, 1, -0.5, 0.5, 0.5,
-3.56657, -4.351276, -4, 1, 1.5, 0.5, 0.5,
-3.56657, -4.351276, -4, 0, 1.5, 0.5, 0.5,
-3.56657, -4.351276, -2, 0, -0.5, 0.5, 0.5,
-3.56657, -4.351276, -2, 1, -0.5, 0.5, 0.5,
-3.56657, -4.351276, -2, 1, 1.5, 0.5, 0.5,
-3.56657, -4.351276, -2, 0, 1.5, 0.5, 0.5,
-3.56657, -4.351276, 0, 0, -0.5, 0.5, 0.5,
-3.56657, -4.351276, 0, 1, -0.5, 0.5, 0.5,
-3.56657, -4.351276, 0, 1, 1.5, 0.5, 0.5,
-3.56657, -4.351276, 0, 0, 1.5, 0.5, 0.5,
-3.56657, -4.351276, 2, 0, -0.5, 0.5, 0.5,
-3.56657, -4.351276, 2, 1, -0.5, 0.5, 0.5,
-3.56657, -4.351276, 2, 1, 1.5, 0.5, 0.5,
-3.56657, -4.351276, 2, 0, 1.5, 0.5, 0.5,
-3.56657, -4.351276, 4, 0, -0.5, 0.5, 0.5,
-3.56657, -4.351276, 4, 1, -0.5, 0.5, 0.5,
-3.56657, -4.351276, 4, 1, 1.5, 0.5, 0.5,
-3.56657, -4.351276, 4, 0, 1.5, 0.5, 0.5
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
-3.081697, -3.81745, -5.654047,
-3.081697, 3.300221, -5.654047,
-3.081697, -3.81745, 5.090901,
-3.081697, 3.300221, 5.090901,
-3.081697, -3.81745, -5.654047,
-3.081697, -3.81745, 5.090901,
-3.081697, 3.300221, -5.654047,
-3.081697, 3.300221, 5.090901,
-3.081697, -3.81745, -5.654047,
3.383281, -3.81745, -5.654047,
-3.081697, -3.81745, 5.090901,
3.383281, -3.81745, 5.090901,
-3.081697, 3.300221, -5.654047,
3.383281, 3.300221, -5.654047,
-3.081697, 3.300221, 5.090901,
3.383281, 3.300221, 5.090901,
3.383281, -3.81745, -5.654047,
3.383281, 3.300221, -5.654047,
3.383281, -3.81745, 5.090901,
3.383281, 3.300221, 5.090901,
3.383281, -3.81745, -5.654047,
3.383281, -3.81745, 5.090901,
3.383281, 3.300221, -5.654047,
3.383281, 3.300221, 5.090901
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
var radius = 7.699532;
var distance = 34.25608;
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
mvMatrix.translate( -0.1507924, 0.2586144, 0.2815726 );
mvMatrix.scale( 1.287689, 1.169608, 0.774772 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.25608);
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
sesamex<-read.table("sesamex.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-sesamex$V2
```

```
## Error in eval(expr, envir, enclos): object 'sesamex' not found
```

```r
y<-sesamex$V3
```

```
## Error in eval(expr, envir, enclos): object 'sesamex' not found
```

```r
z<-sesamex$V4
```

```
## Error in eval(expr, envir, enclos): object 'sesamex' not found
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
-2.987547, 1.016944, -1.606802, 0, 0, 1, 1, 1,
-2.907554, -0.1324079, -1.94555, 1, 0, 0, 1, 1,
-2.74052, -0.9838083, -4.302328, 1, 0, 0, 1, 1,
-2.710739, 0.3255834, -4.236788, 1, 0, 0, 1, 1,
-2.68366, -0.05684885, 0.08232237, 1, 0, 0, 1, 1,
-2.563189, 1.980277, -1.207211, 1, 0, 0, 1, 1,
-2.545346, -0.6369911, -0.6473401, 0, 0, 0, 1, 1,
-2.535843, -0.04315067, -0.3863306, 0, 0, 0, 1, 1,
-2.505437, -0.5147131, -1.684894, 0, 0, 0, 1, 1,
-2.482815, -1.709206, -1.865865, 0, 0, 0, 1, 1,
-2.470342, -1.354148, -3.214364, 0, 0, 0, 1, 1,
-2.438053, 0.748268, -0.659785, 0, 0, 0, 1, 1,
-2.430936, -0.3484358, -2.15604, 0, 0, 0, 1, 1,
-2.430438, -0.5935196, -2.141946, 1, 1, 1, 1, 1,
-2.284883, -0.5794182, -1.657947, 1, 1, 1, 1, 1,
-2.250093, -1.738092, -2.997138, 1, 1, 1, 1, 1,
-2.167648, -0.04619262, -1.508483, 1, 1, 1, 1, 1,
-2.166778, 0.8485402, -1.641121, 1, 1, 1, 1, 1,
-2.166248, 0.4108537, -2.847784, 1, 1, 1, 1, 1,
-2.159573, 0.04254744, -2.443671, 1, 1, 1, 1, 1,
-2.150795, -0.3899517, -2.145954, 1, 1, 1, 1, 1,
-2.146738, 0.04072791, -3.42973, 1, 1, 1, 1, 1,
-2.129929, 0.7014742, -0.8754871, 1, 1, 1, 1, 1,
-2.082041, 1.584717, -0.9598567, 1, 1, 1, 1, 1,
-2.07707, -0.06226277, -2.714972, 1, 1, 1, 1, 1,
-2.045735, 1.000697, -1.683066, 1, 1, 1, 1, 1,
-2.04142, 0.000907755, -3.076089, 1, 1, 1, 1, 1,
-2.035604, -0.9337136, -1.628252, 1, 1, 1, 1, 1,
-1.999476, 0.3147393, -1.558258, 0, 0, 1, 1, 1,
-1.915191, -0.2759332, -1.813297, 1, 0, 0, 1, 1,
-1.881515, 0.6434927, -2.293878, 1, 0, 0, 1, 1,
-1.843499, -0.9356753, -1.939475, 1, 0, 0, 1, 1,
-1.842535, 1.35025, -0.9593295, 1, 0, 0, 1, 1,
-1.840721, 0.9052016, -0.9818354, 1, 0, 0, 1, 1,
-1.835721, -0.673342, -1.510167, 0, 0, 0, 1, 1,
-1.831638, -1.667398, -2.871534, 0, 0, 0, 1, 1,
-1.827183, -1.242999, -2.732593, 0, 0, 0, 1, 1,
-1.769683, 1.179693, -0.1654178, 0, 0, 0, 1, 1,
-1.767503, 0.02784596, -3.292495, 0, 0, 0, 1, 1,
-1.759662, -1.022007, -2.684438, 0, 0, 0, 1, 1,
-1.754966, 1.975826, -1.067463, 0, 0, 0, 1, 1,
-1.738991, -0.7979974, -1.501357, 1, 1, 1, 1, 1,
-1.706965, 0.1953302, -1.115788, 1, 1, 1, 1, 1,
-1.699987, 0.3320828, -2.191232, 1, 1, 1, 1, 1,
-1.692773, 1.87409, -1.371458, 1, 1, 1, 1, 1,
-1.682949, -1.154649, -0.1406093, 1, 1, 1, 1, 1,
-1.673259, 0.456481, 0.2991036, 1, 1, 1, 1, 1,
-1.66118, 1.078958, 0.6076179, 1, 1, 1, 1, 1,
-1.659976, -0.7322907, -2.490948, 1, 1, 1, 1, 1,
-1.659788, -0.1699385, -1.170833, 1, 1, 1, 1, 1,
-1.657856, -0.1779267, -1.935212, 1, 1, 1, 1, 1,
-1.657562, -0.4275652, -0.9036584, 1, 1, 1, 1, 1,
-1.64676, 0.7629164, -1.564342, 1, 1, 1, 1, 1,
-1.632829, 1.321393, -0.6073911, 1, 1, 1, 1, 1,
-1.629307, -1.361204, -1.835238, 1, 1, 1, 1, 1,
-1.623883, 0.4760367, -0.3612159, 1, 1, 1, 1, 1,
-1.62191, 2.443531, -1.121143, 0, 0, 1, 1, 1,
-1.604244, 0.06484883, -2.379076, 1, 0, 0, 1, 1,
-1.600853, -0.01622491, -1.998142, 1, 0, 0, 1, 1,
-1.600711, -0.5036585, -0.6370803, 1, 0, 0, 1, 1,
-1.597219, -1.280446, -1.777724, 1, 0, 0, 1, 1,
-1.592843, -2.705207, -3.501395, 1, 0, 0, 1, 1,
-1.582931, -1.138378, -2.776459, 0, 0, 0, 1, 1,
-1.581094, -0.2538337, -1.858119, 0, 0, 0, 1, 1,
-1.578786, 2.236408, -1.259057, 0, 0, 0, 1, 1,
-1.568946, -0.1596537, -1.67942, 0, 0, 0, 1, 1,
-1.564728, 0.5718398, -0.4323616, 0, 0, 0, 1, 1,
-1.55484, 0.4129471, -1.877946, 0, 0, 0, 1, 1,
-1.553315, 1.140468, -1.208515, 0, 0, 0, 1, 1,
-1.53733, -1.175786, -3.455026, 1, 1, 1, 1, 1,
-1.52989, -0.9781561, -3.389175, 1, 1, 1, 1, 1,
-1.528545, 2.128121, 0.0996581, 1, 1, 1, 1, 1,
-1.51672, 0.9142375, 1.008305, 1, 1, 1, 1, 1,
-1.516608, 0.9628607, -1.828395, 1, 1, 1, 1, 1,
-1.505225, -0.925624, -0.4751778, 1, 1, 1, 1, 1,
-1.496982, 0.06540924, -1.435151, 1, 1, 1, 1, 1,
-1.481426, -1.408754, -4.721692, 1, 1, 1, 1, 1,
-1.477509, -1.518196, -1.1377, 1, 1, 1, 1, 1,
-1.466909, -1.026013, -1.859673, 1, 1, 1, 1, 1,
-1.466804, -1.077651, -1.993169, 1, 1, 1, 1, 1,
-1.458436, 0.4830407, -0.9661692, 1, 1, 1, 1, 1,
-1.455786, -0.3219918, -2.920337, 1, 1, 1, 1, 1,
-1.44822, 1.257198, 0.2944925, 1, 1, 1, 1, 1,
-1.447476, -0.1462789, -2.150471, 1, 1, 1, 1, 1,
-1.440993, 0.07453253, -2.979862, 0, 0, 1, 1, 1,
-1.440441, 0.1129513, -1.543052, 1, 0, 0, 1, 1,
-1.435001, -0.6458089, -1.506528, 1, 0, 0, 1, 1,
-1.432689, 0.002911298, -3.84458, 1, 0, 0, 1, 1,
-1.414245, -0.2273377, -0.4475144, 1, 0, 0, 1, 1,
-1.411968, -0.05746347, -2.466274, 1, 0, 0, 1, 1,
-1.409568, 0.6407238, -1.531536, 0, 0, 0, 1, 1,
-1.406957, 1.254578, 0.2656644, 0, 0, 0, 1, 1,
-1.39453, -0.2771968, -0.2224714, 0, 0, 0, 1, 1,
-1.392844, 0.03046582, -1.03528, 0, 0, 0, 1, 1,
-1.39225, 0.3582018, -0.9690616, 0, 0, 0, 1, 1,
-1.379309, 0.1706974, -0.8999262, 0, 0, 0, 1, 1,
-1.378637, -0.703502, -2.397653, 0, 0, 0, 1, 1,
-1.37034, -0.3162417, -1.292113, 1, 1, 1, 1, 1,
-1.361712, 0.1279295, -1.117503, 1, 1, 1, 1, 1,
-1.350588, 0.7301815, -0.9507433, 1, 1, 1, 1, 1,
-1.349435, 0.5881206, -1.846289, 1, 1, 1, 1, 1,
-1.337464, -0.6636803, -0.5513418, 1, 1, 1, 1, 1,
-1.337341, 0.1424271, -1.591357, 1, 1, 1, 1, 1,
-1.336628, -0.1107649, -1.558859, 1, 1, 1, 1, 1,
-1.334659, 1.275667, -0.6625221, 1, 1, 1, 1, 1,
-1.322601, -1.894118, -1.640181, 1, 1, 1, 1, 1,
-1.317865, 1.960793, -1.251758, 1, 1, 1, 1, 1,
-1.313617, 0.5488301, -2.520478, 1, 1, 1, 1, 1,
-1.309015, -0.6926889, -0.3970295, 1, 1, 1, 1, 1,
-1.301521, -2.392606, -2.384871, 1, 1, 1, 1, 1,
-1.300473, 0.31369, -0.3983694, 1, 1, 1, 1, 1,
-1.2933, 1.689594, 0.6304735, 1, 1, 1, 1, 1,
-1.289867, 0.4032743, -3.20909, 0, 0, 1, 1, 1,
-1.288114, -1.248082, -2.084176, 1, 0, 0, 1, 1,
-1.282977, -0.1351506, -1.539871, 1, 0, 0, 1, 1,
-1.25313, -1.642629, -1.875939, 1, 0, 0, 1, 1,
-1.246535, -0.2535678, -0.8530378, 1, 0, 0, 1, 1,
-1.241257, -2.163477, -3.36919, 1, 0, 0, 1, 1,
-1.239441, -0.1352859, 0.04276317, 0, 0, 0, 1, 1,
-1.216358, 0.9219926, -1.227785, 0, 0, 0, 1, 1,
-1.213231, -0.7116126, -2.809771, 0, 0, 0, 1, 1,
-1.199415, -0.1743942, -1.88441, 0, 0, 0, 1, 1,
-1.192307, -0.20528, -1.234635, 0, 0, 0, 1, 1,
-1.192209, -0.2488688, -2.368004, 0, 0, 0, 1, 1,
-1.183846, -1.103895, -2.898289, 0, 0, 0, 1, 1,
-1.17237, -0.9175975, -2.215076, 1, 1, 1, 1, 1,
-1.160511, -1.604246, -1.175795, 1, 1, 1, 1, 1,
-1.152268, -1.346557, -3.948465, 1, 1, 1, 1, 1,
-1.145014, 1.42698, -1.056116, 1, 1, 1, 1, 1,
-1.141056, 2.027423, 1.084186, 1, 1, 1, 1, 1,
-1.139678, -0.5307421, -1.916841, 1, 1, 1, 1, 1,
-1.126512, 0.4582687, -1.155705, 1, 1, 1, 1, 1,
-1.11657, 0.7190867, -2.838613, 1, 1, 1, 1, 1,
-1.113818, 0.1457863, -1.840053, 1, 1, 1, 1, 1,
-1.112094, -0.2975735, -1.038042, 1, 1, 1, 1, 1,
-1.110689, 0.7185984, -0.5308279, 1, 1, 1, 1, 1,
-1.109638, -1.147321, -4.428541, 1, 1, 1, 1, 1,
-1.109255, 2.188771, -1.287044, 1, 1, 1, 1, 1,
-1.103767, 0.8126183, -0.9092828, 1, 1, 1, 1, 1,
-1.098544, -0.2197541, -1.892276, 1, 1, 1, 1, 1,
-1.097373, 0.2832199, -1.228283, 0, 0, 1, 1, 1,
-1.096249, -1.237159, -1.526323, 1, 0, 0, 1, 1,
-1.094107, -1.003691, -2.47887, 1, 0, 0, 1, 1,
-1.090885, 1.254473, -0.1887909, 1, 0, 0, 1, 1,
-1.089344, -0.1146537, -0.2154795, 1, 0, 0, 1, 1,
-1.088624, -0.3970304, -3.149233, 1, 0, 0, 1, 1,
-1.079004, 1.971315, -0.8054958, 0, 0, 0, 1, 1,
-1.075038, 0.451939, -1.186132, 0, 0, 0, 1, 1,
-1.074044, -0.2411702, -3.966931, 0, 0, 0, 1, 1,
-1.058019, 0.584081, -1.263305, 0, 0, 0, 1, 1,
-1.053342, 1.003636, -1.810046, 0, 0, 0, 1, 1,
-1.051555, 1.207163, -2.052787, 0, 0, 0, 1, 1,
-1.046021, -0.04043862, -1.964463, 0, 0, 0, 1, 1,
-1.045561, -1.035015, -1.078342, 1, 1, 1, 1, 1,
-1.034569, 0.930508, -1.480576, 1, 1, 1, 1, 1,
-1.032514, 0.2261794, -2.989941, 1, 1, 1, 1, 1,
-1.031642, -1.007981, -1.572091, 1, 1, 1, 1, 1,
-1.024411, 0.7625594, -1.316543, 1, 1, 1, 1, 1,
-1.021099, 0.2351399, -0.8237959, 1, 1, 1, 1, 1,
-1.01748, 0.2168929, 0.4872127, 1, 1, 1, 1, 1,
-1.012176, 2.080487, -1.18037, 1, 1, 1, 1, 1,
-1.008739, -0.05590224, -0.7136678, 1, 1, 1, 1, 1,
-1.007921, -0.444622, -3.608268, 1, 1, 1, 1, 1,
-1.005437, -1.043145, -3.605573, 1, 1, 1, 1, 1,
-1.003389, -0.1878321, -2.440174, 1, 1, 1, 1, 1,
-0.9975355, -0.9259228, -1.91243, 1, 1, 1, 1, 1,
-0.995103, -1.03741, -1.469472, 1, 1, 1, 1, 1,
-0.993195, 0.626183, -1.018172, 1, 1, 1, 1, 1,
-0.991103, -0.08851211, -1.037903, 0, 0, 1, 1, 1,
-0.9891282, -0.05378144, -0.3794267, 1, 0, 0, 1, 1,
-0.9831722, 0.1973788, -2.769711, 1, 0, 0, 1, 1,
-0.9809418, 1.244411, -1.458529, 1, 0, 0, 1, 1,
-0.9764841, -1.485617, -3.260168, 1, 0, 0, 1, 1,
-0.9707127, -0.8447086, -2.919212, 1, 0, 0, 1, 1,
-0.9651055, 0.1695686, -3.091556, 0, 0, 0, 1, 1,
-0.9625069, -0.05102105, -0.2440169, 0, 0, 0, 1, 1,
-0.9580232, -0.9863291, -3.041032, 0, 0, 0, 1, 1,
-0.9544789, -0.2987701, -3.817358, 0, 0, 0, 1, 1,
-0.9536105, -0.194661, -2.437097, 0, 0, 0, 1, 1,
-0.9482003, -2.410879, -2.029145, 0, 0, 0, 1, 1,
-0.9452181, 1.406667, 0.08890903, 0, 0, 0, 1, 1,
-0.9441704, 0.849902, 0.4267494, 1, 1, 1, 1, 1,
-0.943547, -0.4521983, -1.612376, 1, 1, 1, 1, 1,
-0.9405145, -2.874334, -2.978263, 1, 1, 1, 1, 1,
-0.9372022, 1.068163, -1.420265, 1, 1, 1, 1, 1,
-0.928899, 0.8940215, -0.7233073, 1, 1, 1, 1, 1,
-0.9283335, -0.6621256, -0.1123601, 1, 1, 1, 1, 1,
-0.9283124, 0.1578691, -2.090142, 1, 1, 1, 1, 1,
-0.9266888, 0.5938255, -1.784211, 1, 1, 1, 1, 1,
-0.9168887, 1.401627, 0.6041472, 1, 1, 1, 1, 1,
-0.9084077, 0.2237797, 0.4146353, 1, 1, 1, 1, 1,
-0.9060473, 0.03268342, -1.663859, 1, 1, 1, 1, 1,
-0.9060364, 1.042139, -1.049353, 1, 1, 1, 1, 1,
-0.9000047, -1.112339, -4.219401, 1, 1, 1, 1, 1,
-0.8988543, -0.07574316, -3.5374, 1, 1, 1, 1, 1,
-0.8943942, 0.3913637, -1.167765, 1, 1, 1, 1, 1,
-0.8913746, 0.2583309, -1.870911, 0, 0, 1, 1, 1,
-0.8910713, 0.3643792, 0.150358, 1, 0, 0, 1, 1,
-0.8807856, -0.1706503, -3.429346, 1, 0, 0, 1, 1,
-0.8789929, 0.01403533, -2.369083, 1, 0, 0, 1, 1,
-0.8712306, 0.9894916, -1.956666, 1, 0, 0, 1, 1,
-0.8654501, 0.008139583, -2.634, 1, 0, 0, 1, 1,
-0.8569269, 0.8201383, 0.6547703, 0, 0, 0, 1, 1,
-0.8432546, 1.361475, -0.6212636, 0, 0, 0, 1, 1,
-0.8408991, 0.3860254, -2.781923, 0, 0, 0, 1, 1,
-0.8390958, -0.859374, -2.370907, 0, 0, 0, 1, 1,
-0.8385549, -1.606605, -2.591208, 0, 0, 0, 1, 1,
-0.8365709, -1.380754, -1.486697, 0, 0, 0, 1, 1,
-0.8354114, -0.3089035, -2.912472, 0, 0, 0, 1, 1,
-0.8314026, 1.059643, -0.2874972, 1, 1, 1, 1, 1,
-0.8293257, 0.05345448, -1.552017, 1, 1, 1, 1, 1,
-0.827884, -1.172339, -2.476534, 1, 1, 1, 1, 1,
-0.8269849, 2.292627, -0.2082732, 1, 1, 1, 1, 1,
-0.8219887, -0.7374225, -2.918817, 1, 1, 1, 1, 1,
-0.8204175, -0.5897599, -0.6749855, 1, 1, 1, 1, 1,
-0.8193709, 1.63318, -2.16421, 1, 1, 1, 1, 1,
-0.8175532, -1.389048, -1.674231, 1, 1, 1, 1, 1,
-0.8171728, 0.4222748, -2.097564, 1, 1, 1, 1, 1,
-0.8143772, 0.2668951, 0.007671908, 1, 1, 1, 1, 1,
-0.8106086, 2.608925, -0.01304513, 1, 1, 1, 1, 1,
-0.8099747, 1.227426, -0.7724229, 1, 1, 1, 1, 1,
-0.8098814, 2.472064, 0.2858471, 1, 1, 1, 1, 1,
-0.8071119, 1.218635, -0.05331006, 1, 1, 1, 1, 1,
-0.796214, -1.595794, -3.351068, 1, 1, 1, 1, 1,
-0.7927288, 0.7149212, 0.9445136, 0, 0, 1, 1, 1,
-0.7922201, -0.7148979, -2.5928, 1, 0, 0, 1, 1,
-0.7911752, 0.6311437, -1.987015, 1, 0, 0, 1, 1,
-0.7860155, 1.177416, -1.529501, 1, 0, 0, 1, 1,
-0.7828103, 2.238539, -0.4733256, 1, 0, 0, 1, 1,
-0.7822681, 0.5487497, -0.8677348, 1, 0, 0, 1, 1,
-0.7807, -0.3369687, -2.875932, 0, 0, 0, 1, 1,
-0.780135, -1.178697, -3.899398, 0, 0, 0, 1, 1,
-0.780116, -2.021143, -2.172567, 0, 0, 0, 1, 1,
-0.7769539, 0.6655835, 2.011059, 0, 0, 0, 1, 1,
-0.7745232, -1.565155, -2.308851, 0, 0, 0, 1, 1,
-0.7728915, -0.7877224, -1.833045, 0, 0, 0, 1, 1,
-0.7727765, -2.425457, -2.196501, 0, 0, 0, 1, 1,
-0.7717791, -0.2391458, -2.538521, 1, 1, 1, 1, 1,
-0.7669715, 2.859635, -0.2098919, 1, 1, 1, 1, 1,
-0.7615844, 0.7937952, -2.068211, 1, 1, 1, 1, 1,
-0.7593913, 0.7727532, 0.2839333, 1, 1, 1, 1, 1,
-0.7559918, -1.709009, -4.86384, 1, 1, 1, 1, 1,
-0.7526364, 0.4308222, 0.8561991, 1, 1, 1, 1, 1,
-0.7493182, -0.1446673, -0.7377114, 1, 1, 1, 1, 1,
-0.7464841, 1.461129, 1.643166, 1, 1, 1, 1, 1,
-0.7450446, 0.3745271, 0.124903, 1, 1, 1, 1, 1,
-0.7448875, -3.713795, -3.005739, 1, 1, 1, 1, 1,
-0.7440566, 1.114207, -1.74204, 1, 1, 1, 1, 1,
-0.7411534, -0.3781904, -3.043688, 1, 1, 1, 1, 1,
-0.7408826, 1.014622, -2.486497, 1, 1, 1, 1, 1,
-0.7378025, 0.9413796, 0.5784996, 1, 1, 1, 1, 1,
-0.7347746, 2.066305, -0.8151433, 1, 1, 1, 1, 1,
-0.7344326, 0.07953932, -1.323494, 0, 0, 1, 1, 1,
-0.7336363, -0.05250819, -0.1232392, 1, 0, 0, 1, 1,
-0.7306802, 0.1457916, -2.147729, 1, 0, 0, 1, 1,
-0.7272431, 0.6895539, -0.4300313, 1, 0, 0, 1, 1,
-0.7255157, 0.3240838, -1.156673, 1, 0, 0, 1, 1,
-0.7214651, -1.451572, -1.941174, 1, 0, 0, 1, 1,
-0.7205456, 1.550646, 0.727733, 0, 0, 0, 1, 1,
-0.7192576, 0.103675, -1.135199, 0, 0, 0, 1, 1,
-0.7189139, 1.019511, -0.6446647, 0, 0, 0, 1, 1,
-0.7164324, 0.3831036, -1.806268, 0, 0, 0, 1, 1,
-0.7146958, 0.04091176, -3.436666, 0, 0, 0, 1, 1,
-0.7144774, -0.2095168, -1.503159, 0, 0, 0, 1, 1,
-0.711992, 0.7649104, -2.138217, 0, 0, 0, 1, 1,
-0.7100206, 0.1842143, -1.749807, 1, 1, 1, 1, 1,
-0.7067467, -0.2745523, -3.321873, 1, 1, 1, 1, 1,
-0.7063615, 1.02922, -2.470596, 1, 1, 1, 1, 1,
-0.7006366, 0.5707143, -1.054227, 1, 1, 1, 1, 1,
-0.698651, 1.589956, -0.8421982, 1, 1, 1, 1, 1,
-0.6986456, 1.136097, -1.04134, 1, 1, 1, 1, 1,
-0.6967022, 0.4290324, 0.003030204, 1, 1, 1, 1, 1,
-0.6929731, 0.5222259, -1.049455, 1, 1, 1, 1, 1,
-0.6920066, -0.3038663, -2.951016, 1, 1, 1, 1, 1,
-0.6910537, -1.114204, -3.133329, 1, 1, 1, 1, 1,
-0.6894459, 1.235551, 0.4694941, 1, 1, 1, 1, 1,
-0.6865637, 1.110138, 0.1914636, 1, 1, 1, 1, 1,
-0.6803607, 0.8450004, 0.6843349, 1, 1, 1, 1, 1,
-0.678511, -0.5010455, -4.029655, 1, 1, 1, 1, 1,
-0.6707856, -1.349849, -2.452893, 1, 1, 1, 1, 1,
-0.6700212, -0.1390661, -2.261073, 0, 0, 1, 1, 1,
-0.6677812, -0.4312444, -2.525116, 1, 0, 0, 1, 1,
-0.6654762, 0.2194466, -2.636914, 1, 0, 0, 1, 1,
-0.6630372, -0.693773, -2.232623, 1, 0, 0, 1, 1,
-0.6566275, 1.246552, -0.3872326, 1, 0, 0, 1, 1,
-0.6554632, 1.543676, 0.6258382, 1, 0, 0, 1, 1,
-0.6541154, 0.2165675, -0.606868, 0, 0, 0, 1, 1,
-0.6519309, 3.196566, 1.101459, 0, 0, 0, 1, 1,
-0.6495112, 1.105471, -2.414627, 0, 0, 0, 1, 1,
-0.6478758, 0.495297, -1.048208, 0, 0, 0, 1, 1,
-0.6437545, -0.177336, -1.692515, 0, 0, 0, 1, 1,
-0.6423637, -0.09580921, -2.213125, 0, 0, 0, 1, 1,
-0.6410795, -0.117767, -1.693976, 0, 0, 0, 1, 1,
-0.6378873, -2.35782, -2.980327, 1, 1, 1, 1, 1,
-0.6340761, -0.6350235, -2.073018, 1, 1, 1, 1, 1,
-0.6326922, 1.452531, -0.07140563, 1, 1, 1, 1, 1,
-0.6257796, -1.250614, -2.895835, 1, 1, 1, 1, 1,
-0.6252088, -0.5103273, -1.51383, 1, 1, 1, 1, 1,
-0.6249334, 0.3477148, -1.301244, 1, 1, 1, 1, 1,
-0.6157823, 1.680104, -0.6085598, 1, 1, 1, 1, 1,
-0.6145267, -0.1594062, -1.620145, 1, 1, 1, 1, 1,
-0.6098599, 1.212935, -0.2592864, 1, 1, 1, 1, 1,
-0.609807, 0.4935848, 1.193727, 1, 1, 1, 1, 1,
-0.6085429, 2.022756, -1.450928, 1, 1, 1, 1, 1,
-0.6075342, 0.3794333, -1.050725, 1, 1, 1, 1, 1,
-0.606678, -1.165416, -2.788427, 1, 1, 1, 1, 1,
-0.6006559, 0.4835993, -0.3129975, 1, 1, 1, 1, 1,
-0.5980959, -2.121487, -1.395643, 1, 1, 1, 1, 1,
-0.5804178, -1.832071, -0.972648, 0, 0, 1, 1, 1,
-0.5732917, 0.6233546, -0.3038282, 1, 0, 0, 1, 1,
-0.5731806, -0.7843375, -2.921982, 1, 0, 0, 1, 1,
-0.5731271, 1.651879, -0.4100999, 1, 0, 0, 1, 1,
-0.5693043, -0.5371186, -4.30156, 1, 0, 0, 1, 1,
-0.5646518, 0.1242116, -1.215769, 1, 0, 0, 1, 1,
-0.5628918, 0.6639006, 0.1201857, 0, 0, 0, 1, 1,
-0.5601812, 0.8784405, -0.02673088, 0, 0, 0, 1, 1,
-0.5573466, 0.2085398, -0.5011866, 0, 0, 0, 1, 1,
-0.5559731, -1.030088, -2.117426, 0, 0, 0, 1, 1,
-0.553728, 1.373192, 1.684595, 0, 0, 0, 1, 1,
-0.5461422, 1.471874, -1.131491, 0, 0, 0, 1, 1,
-0.5459218, 0.6516959, -1.334629, 0, 0, 0, 1, 1,
-0.5440411, -1.469818, -3.571025, 1, 1, 1, 1, 1,
-0.5434498, -0.5952379, -2.08223, 1, 1, 1, 1, 1,
-0.5409081, -1.348346, -4.757346, 1, 1, 1, 1, 1,
-0.540239, -0.4445986, -2.160459, 1, 1, 1, 1, 1,
-0.5400783, 2.024897, -0.4840333, 1, 1, 1, 1, 1,
-0.5392678, -0.07026738, -1.902014, 1, 1, 1, 1, 1,
-0.5360935, 0.4603026, 0.3400376, 1, 1, 1, 1, 1,
-0.5338116, -0.3745764, -3.082758, 1, 1, 1, 1, 1,
-0.5333679, -2.541373, -2.355466, 1, 1, 1, 1, 1,
-0.5324983, -0.8216347, -4.76315, 1, 1, 1, 1, 1,
-0.5204468, 0.002119034, -1.02538, 1, 1, 1, 1, 1,
-0.5199132, -1.496135, -3.442148, 1, 1, 1, 1, 1,
-0.5156868, 0.882396, -0.9196464, 1, 1, 1, 1, 1,
-0.5142432, -0.9663114, -3.092244, 1, 1, 1, 1, 1,
-0.5136445, -0.7856959, -0.5505382, 1, 1, 1, 1, 1,
-0.5076974, -0.9825116, -3.765487, 0, 0, 1, 1, 1,
-0.5050983, -2.109138, -1.307125, 1, 0, 0, 1, 1,
-0.4996337, -0.1811451, -1.143589, 1, 0, 0, 1, 1,
-0.4949557, -1.209318, -0.8369652, 1, 0, 0, 1, 1,
-0.4909523, -0.7783529, -4.166885, 1, 0, 0, 1, 1,
-0.4888186, -0.5438545, -0.187573, 1, 0, 0, 1, 1,
-0.4883465, -0.9172412, -2.734336, 0, 0, 0, 1, 1,
-0.4878486, -0.1072096, -1.507447, 0, 0, 0, 1, 1,
-0.4812096, -0.2224706, -1.524915, 0, 0, 0, 1, 1,
-0.4734349, 0.1411846, -0.7977702, 0, 0, 0, 1, 1,
-0.4689998, 2.260591, -0.7909294, 0, 0, 0, 1, 1,
-0.467061, -0.008778764, -1.344298, 0, 0, 0, 1, 1,
-0.4662126, -0.6609169, -2.42218, 0, 0, 0, 1, 1,
-0.4590732, 0.7698401, -1.373264, 1, 1, 1, 1, 1,
-0.4578255, 1.390938, 0.5708062, 1, 1, 1, 1, 1,
-0.4565594, -1.531962, -2.189369, 1, 1, 1, 1, 1,
-0.4544632, 0.03067265, -3.919427, 1, 1, 1, 1, 1,
-0.4543252, 1.70332, -1.967008, 1, 1, 1, 1, 1,
-0.4511036, 0.5335448, 0.04435685, 1, 1, 1, 1, 1,
-0.4509068, 1.260299, -0.7761902, 1, 1, 1, 1, 1,
-0.4455615, 0.8855313, -0.5310652, 1, 1, 1, 1, 1,
-0.4358077, 0.7742582, -2.356411, 1, 1, 1, 1, 1,
-0.4343612, -0.4194287, -2.766685, 1, 1, 1, 1, 1,
-0.433596, -1.15511, -3.031212, 1, 1, 1, 1, 1,
-0.4280051, 0.825402, 1.49008, 1, 1, 1, 1, 1,
-0.4242981, 0.6657847, -0.1925123, 1, 1, 1, 1, 1,
-0.41978, 1.11424, -1.009365, 1, 1, 1, 1, 1,
-0.4170747, 0.2366618, 0.4265301, 1, 1, 1, 1, 1,
-0.413428, 1.735462, -0.07574748, 0, 0, 1, 1, 1,
-0.4130474, -0.8751609, -3.427862, 1, 0, 0, 1, 1,
-0.406756, 0.9354895, -1.108814, 1, 0, 0, 1, 1,
-0.4066696, -2.24533, -3.12485, 1, 0, 0, 1, 1,
-0.4062096, -0.08551466, -2.198016, 1, 0, 0, 1, 1,
-0.4041366, -0.121659, -0.08273146, 1, 0, 0, 1, 1,
-0.4034485, 1.208672, -0.1429036, 0, 0, 0, 1, 1,
-0.4033843, -1.56607, -3.949048, 0, 0, 0, 1, 1,
-0.4012401, -0.6445819, -3.000676, 0, 0, 0, 1, 1,
-0.3996927, -0.8723196, -4.015806, 0, 0, 0, 1, 1,
-0.3950928, 0.9493, -0.5846417, 0, 0, 0, 1, 1,
-0.3912456, -0.5804564, -1.818843, 0, 0, 0, 1, 1,
-0.3886739, -0.4259478, -3.534376, 0, 0, 0, 1, 1,
-0.3869049, -0.7955635, -3.590833, 1, 1, 1, 1, 1,
-0.3850072, -1.883992, -2.308574, 1, 1, 1, 1, 1,
-0.379891, -1.821, -4.849956, 1, 1, 1, 1, 1,
-0.3781685, 0.696898, -0.09442841, 1, 1, 1, 1, 1,
-0.3766916, -0.1897332, -2.134961, 1, 1, 1, 1, 1,
-0.37572, -2.884531, -3.764106, 1, 1, 1, 1, 1,
-0.3597705, 2.002404, 1.177153, 1, 1, 1, 1, 1,
-0.3579797, -0.5330797, -1.434749, 1, 1, 1, 1, 1,
-0.3564633, -0.3992888, -2.481985, 1, 1, 1, 1, 1,
-0.3544054, -1.267886, -1.288243, 1, 1, 1, 1, 1,
-0.354364, -0.3189741, -1.040935, 1, 1, 1, 1, 1,
-0.3542908, -0.3007377, -1.32992, 1, 1, 1, 1, 1,
-0.3539788, 1.573908, -0.9517683, 1, 1, 1, 1, 1,
-0.3516348, 1.221308, -1.821188, 1, 1, 1, 1, 1,
-0.3479196, -0.1904372, -2.496907, 1, 1, 1, 1, 1,
-0.3460352, 1.523078, 2.022053, 0, 0, 1, 1, 1,
-0.3456976, 1.026944, 0.9051666, 1, 0, 0, 1, 1,
-0.3436977, 0.0273208, -2.261132, 1, 0, 0, 1, 1,
-0.3425789, -1.658951, -4.227972, 1, 0, 0, 1, 1,
-0.34019, 0.6623264, -1.791279, 1, 0, 0, 1, 1,
-0.3355607, 0.9957252, -1.299754, 1, 0, 0, 1, 1,
-0.3333921, -0.06319282, -0.6151983, 0, 0, 0, 1, 1,
-0.3325443, -1.126319, -3.391153, 0, 0, 0, 1, 1,
-0.3321941, 1.091431, 0.2894147, 0, 0, 0, 1, 1,
-0.3267585, -0.6383184, -1.554213, 0, 0, 0, 1, 1,
-0.323303, -0.4498309, -3.552819, 0, 0, 0, 1, 1,
-0.3196056, -0.5391004, -3.208195, 0, 0, 0, 1, 1,
-0.3168353, 0.4904605, -0.3842041, 0, 0, 0, 1, 1,
-0.3150302, -1.385113, -3.828115, 1, 1, 1, 1, 1,
-0.310303, -0.1674749, -1.410023, 1, 1, 1, 1, 1,
-0.3091018, 0.2080874, -0.8701012, 1, 1, 1, 1, 1,
-0.3075422, -0.8421589, -2.948484, 1, 1, 1, 1, 1,
-0.3029622, 0.05237937, -1.376016, 1, 1, 1, 1, 1,
-0.3010976, 0.4498752, -1.936463, 1, 1, 1, 1, 1,
-0.2998649, 2.036514, 0.6758685, 1, 1, 1, 1, 1,
-0.2911128, 1.911698, 0.1074055, 1, 1, 1, 1, 1,
-0.2868504, -1.391126, -1.441967, 1, 1, 1, 1, 1,
-0.2853315, -0.7232374, -2.080702, 1, 1, 1, 1, 1,
-0.2853067, -0.5620034, -4.608871, 1, 1, 1, 1, 1,
-0.2836395, 0.7451756, 0.3231573, 1, 1, 1, 1, 1,
-0.2825947, -0.2176811, -2.209858, 1, 1, 1, 1, 1,
-0.2800816, 0.5251234, -0.03639038, 1, 1, 1, 1, 1,
-0.2778992, 0.5233161, 1.902283, 1, 1, 1, 1, 1,
-0.2760141, 0.7666613, -1.092094, 0, 0, 1, 1, 1,
-0.2748235, -0.2457342, -1.353753, 1, 0, 0, 1, 1,
-0.2707475, -0.8462918, -4.645954, 1, 0, 0, 1, 1,
-0.2686341, 0.1260972, -1.672729, 1, 0, 0, 1, 1,
-0.2676595, 0.2095323, -1.126516, 1, 0, 0, 1, 1,
-0.2672559, 1.981341, -0.6490472, 1, 0, 0, 1, 1,
-0.2663732, -0.0870474, 1.099361, 0, 0, 0, 1, 1,
-0.2625029, -2.154923, -2.457254, 0, 0, 0, 1, 1,
-0.2502507, -1.851476, -2.361009, 0, 0, 0, 1, 1,
-0.2487158, -0.6156264, -2.753373, 0, 0, 0, 1, 1,
-0.2475487, 0.1579737, -2.456072, 0, 0, 0, 1, 1,
-0.2464496, 0.05268521, -1.508167, 0, 0, 0, 1, 1,
-0.2460045, -0.4370045, -2.376363, 0, 0, 0, 1, 1,
-0.2419703, 0.1703131, -1.406938, 1, 1, 1, 1, 1,
-0.2411435, -2.310923, -1.582641, 1, 1, 1, 1, 1,
-0.2395235, -0.2454331, -4.008847, 1, 1, 1, 1, 1,
-0.2391416, 1.884877, -1.992402, 1, 1, 1, 1, 1,
-0.2378105, 1.17094, -1.050968, 1, 1, 1, 1, 1,
-0.2335017, -0.3796744, -2.733976, 1, 1, 1, 1, 1,
-0.2333711, -0.3692414, -3.539716, 1, 1, 1, 1, 1,
-0.2276026, 0.6791996, -0.5973248, 1, 1, 1, 1, 1,
-0.2265492, 0.4025453, 0.6890268, 1, 1, 1, 1, 1,
-0.2202234, -1.309247, -2.803789, 1, 1, 1, 1, 1,
-0.2188616, 1.575445, 0.9243879, 1, 1, 1, 1, 1,
-0.2185258, 0.2749943, 0.8724802, 1, 1, 1, 1, 1,
-0.204074, -1.234023, -2.740537, 1, 1, 1, 1, 1,
-0.2017826, -0.8063993, -2.067902, 1, 1, 1, 1, 1,
-0.2012855, -0.838591, -3.701863, 1, 1, 1, 1, 1,
-0.2001516, -0.9064341, -3.922743, 0, 0, 1, 1, 1,
-0.1985494, 0.3479674, 0.1231503, 1, 0, 0, 1, 1,
-0.1979847, 0.3724943, -0.4617682, 1, 0, 0, 1, 1,
-0.1964583, -1.673185, -4.014407, 1, 0, 0, 1, 1,
-0.1952902, -0.4023087, -1.601592, 1, 0, 0, 1, 1,
-0.1852596, 1.742295, 0.04058633, 1, 0, 0, 1, 1,
-0.1849412, 1.79256, 0.5195577, 0, 0, 0, 1, 1,
-0.1847754, -0.8163172, -2.759973, 0, 0, 0, 1, 1,
-0.1788444, 0.6184433, -0.08301112, 0, 0, 0, 1, 1,
-0.178466, -0.08160537, -0.3030321, 0, 0, 0, 1, 1,
-0.1772084, -0.938361, -2.94456, 0, 0, 0, 1, 1,
-0.1739101, 0.07398479, -0.287387, 0, 0, 0, 1, 1,
-0.170621, -1.339351, -3.835811, 0, 0, 0, 1, 1,
-0.1654824, -1.961915, -5.497567, 1, 1, 1, 1, 1,
-0.1649013, -0.04617074, -1.393898, 1, 1, 1, 1, 1,
-0.1627125, -0.6725856, -2.945602, 1, 1, 1, 1, 1,
-0.1539714, -0.009581911, -1.738397, 1, 1, 1, 1, 1,
-0.1508817, -1.035698, -2.743546, 1, 1, 1, 1, 1,
-0.1479182, -0.5732034, -2.536373, 1, 1, 1, 1, 1,
-0.14273, -0.340283, -3.093967, 1, 1, 1, 1, 1,
-0.1407866, 0.9994287, -0.2136696, 1, 1, 1, 1, 1,
-0.1352477, 1.428921, 1.065481, 1, 1, 1, 1, 1,
-0.134266, -0.08107417, 0.1244908, 1, 1, 1, 1, 1,
-0.1325131, -0.09552976, -1.27358, 1, 1, 1, 1, 1,
-0.1305342, -0.5083938, -4.005782, 1, 1, 1, 1, 1,
-0.1303775, 0.87725, -1.370908, 1, 1, 1, 1, 1,
-0.1287349, -1.064892, -2.417379, 1, 1, 1, 1, 1,
-0.1260416, 1.580665, -0.5638843, 1, 1, 1, 1, 1,
-0.125848, 1.728755, -1.237314, 0, 0, 1, 1, 1,
-0.123333, -0.1882424, -2.93248, 1, 0, 0, 1, 1,
-0.1193889, -0.4726032, -3.303647, 1, 0, 0, 1, 1,
-0.1175552, 0.4869674, -1.164175, 1, 0, 0, 1, 1,
-0.1122023, 0.6546953, 0.9813187, 1, 0, 0, 1, 1,
-0.1111519, -0.345741, -2.563801, 1, 0, 0, 1, 1,
-0.1110676, -2.023132, -3.678492, 0, 0, 0, 1, 1,
-0.108936, -0.8754191, -2.848315, 0, 0, 0, 1, 1,
-0.1041606, -0.2250687, -1.907684, 0, 0, 0, 1, 1,
-0.1010417, 1.091195, -0.2048978, 0, 0, 0, 1, 1,
-0.1003644, -0.9019858, -3.159872, 0, 0, 0, 1, 1,
-0.0992058, 1.020472, 0.1876747, 0, 0, 0, 1, 1,
-0.09910095, -1.329302, -3.647293, 0, 0, 0, 1, 1,
-0.09765446, -0.6319578, -3.6646, 1, 1, 1, 1, 1,
-0.09463894, 0.4016842, 0.51425, 1, 1, 1, 1, 1,
-0.09315959, 0.4233809, 0.4832272, 1, 1, 1, 1, 1,
-0.09172067, 0.9716054, 0.6374751, 1, 1, 1, 1, 1,
-0.08899459, -0.3493834, -3.588582, 1, 1, 1, 1, 1,
-0.08894848, -0.7551754, -1.938392, 1, 1, 1, 1, 1,
-0.08675874, -0.450625, -4.23832, 1, 1, 1, 1, 1,
-0.08163881, 0.8276823, -0.0946182, 1, 1, 1, 1, 1,
-0.0782841, -0.01959671, -0.7863555, 1, 1, 1, 1, 1,
-0.07757688, -0.1267285, -2.134277, 1, 1, 1, 1, 1,
-0.07589044, -0.04179748, -3.809785, 1, 1, 1, 1, 1,
-0.07584732, -1.380424, -2.470326, 1, 1, 1, 1, 1,
-0.06806722, -0.3280353, -1.767978, 1, 1, 1, 1, 1,
-0.06692841, 0.6998347, -0.5386644, 1, 1, 1, 1, 1,
-0.06394983, 0.5931749, 0.6269318, 1, 1, 1, 1, 1,
-0.05876371, -1.764622, -2.360493, 0, 0, 1, 1, 1,
-0.05229374, -0.6339994, -3.83128, 1, 0, 0, 1, 1,
-0.04776495, -1.022896, -1.7548, 1, 0, 0, 1, 1,
-0.04623986, 0.1779807, -0.9976285, 1, 0, 0, 1, 1,
-0.04051429, -2.928923, -0.8163822, 1, 0, 0, 1, 1,
-0.03610942, 1.045669, -1.184749, 1, 0, 0, 1, 1,
-0.03607469, 0.9461901, -1.583307, 0, 0, 0, 1, 1,
-0.03454654, 0.2784868, -0.01529903, 0, 0, 0, 1, 1,
-0.02712629, -0.7220098, -2.792574, 0, 0, 0, 1, 1,
-0.02532257, -0.06880283, -0.5117856, 0, 0, 0, 1, 1,
-0.02489877, -0.7705666, -3.298885, 0, 0, 0, 1, 1,
-0.02452483, -0.06210643, -2.987521, 0, 0, 0, 1, 1,
-0.02346169, 0.02320267, -1.29293, 0, 0, 0, 1, 1,
-0.02280907, -0.06340092, -2.491622, 1, 1, 1, 1, 1,
-0.02090741, -1.172228, -2.708639, 1, 1, 1, 1, 1,
-0.02061322, -2.182883, -3.011917, 1, 1, 1, 1, 1,
-0.0175514, -2.366478, -3.173867, 1, 1, 1, 1, 1,
-0.01578233, 1.108212, -0.5859245, 1, 1, 1, 1, 1,
-0.0147351, -1.076156, -1.936061, 1, 1, 1, 1, 1,
-0.01292823, 1.043965, 0.7053773, 1, 1, 1, 1, 1,
-0.009038988, 0.4331909, -0.009226329, 1, 1, 1, 1, 1,
-0.007473022, 1.420999, -0.9309004, 1, 1, 1, 1, 1,
-0.005511494, 1.57293, 1.016062, 1, 1, 1, 1, 1,
-0.004666603, -1.857405, -1.694255, 1, 1, 1, 1, 1,
-0.004157287, 0.2861587, 0.2393445, 1, 1, 1, 1, 1,
-0.002632876, 1.417344, -0.08403096, 1, 1, 1, 1, 1,
0.001773116, -0.0736259, -0.1123365, 1, 1, 1, 1, 1,
0.006092424, 1.371517, -1.1819, 1, 1, 1, 1, 1,
0.01036285, -0.3793728, 3.026167, 0, 0, 1, 1, 1,
0.01071513, 1.933719, -4.127132e-05, 1, 0, 0, 1, 1,
0.01784512, 1.669226, 0.1459391, 1, 0, 0, 1, 1,
0.0199361, 1.114788, -1.739534, 1, 0, 0, 1, 1,
0.02290845, 0.7401299, 0.1595234, 1, 0, 0, 1, 1,
0.02378348, 1.34811, 0.2888135, 1, 0, 0, 1, 1,
0.02777916, 1.172339, -0.8156095, 0, 0, 0, 1, 1,
0.02980634, -0.6265241, 4.434391, 0, 0, 0, 1, 1,
0.03129365, 0.317056, 0.1426367, 0, 0, 0, 1, 1,
0.03513682, -0.0950433, 1.135033, 0, 0, 0, 1, 1,
0.03807779, -0.3892592, 2.671814, 0, 0, 0, 1, 1,
0.04074785, 0.279491, -0.937398, 0, 0, 0, 1, 1,
0.04199993, -1.862947, 3.413213, 0, 0, 0, 1, 1,
0.04532795, -1.752446, 2.240262, 1, 1, 1, 1, 1,
0.04939852, -1.861744, 3.929393, 1, 1, 1, 1, 1,
0.05095205, 0.4428451, -0.9523144, 1, 1, 1, 1, 1,
0.05536379, 0.9639398, 0.8811747, 1, 1, 1, 1, 1,
0.05556509, 0.833061, 0.2998731, 1, 1, 1, 1, 1,
0.0587558, -0.9189535, 3.643805, 1, 1, 1, 1, 1,
0.06301454, -0.6873164, 4.795955, 1, 1, 1, 1, 1,
0.06642167, -1.173618, 3.28166, 1, 1, 1, 1, 1,
0.06648222, 1.435828, 0.1416985, 1, 1, 1, 1, 1,
0.06735085, 0.399298, 0.08224978, 1, 1, 1, 1, 1,
0.07089353, 0.2459261, -0.2625974, 1, 1, 1, 1, 1,
0.07090549, 0.3480636, 0.6442106, 1, 1, 1, 1, 1,
0.07481062, 0.4600208, 1.443321, 1, 1, 1, 1, 1,
0.07542296, -0.02018508, 2.24522, 1, 1, 1, 1, 1,
0.07824363, -1.045155, 3.243225, 1, 1, 1, 1, 1,
0.07903016, -1.822709, 2.985526, 0, 0, 1, 1, 1,
0.08062912, 0.4313838, -1.461463, 1, 0, 0, 1, 1,
0.08235296, -0.429623, 2.29, 1, 0, 0, 1, 1,
0.08643699, 0.3898867, 0.296471, 1, 0, 0, 1, 1,
0.09143458, -0.5194632, 2.762202, 1, 0, 0, 1, 1,
0.1012436, -0.383578, 2.673494, 1, 0, 0, 1, 1,
0.1103684, 0.04221212, 1.764967, 0, 0, 0, 1, 1,
0.1147648, 0.3390618, -0.9307927, 0, 0, 0, 1, 1,
0.115437, -1.020233, 1.74897, 0, 0, 0, 1, 1,
0.1154488, -0.5761392, 3.802686, 0, 0, 0, 1, 1,
0.1179563, -0.349219, 2.54979, 0, 0, 0, 1, 1,
0.1196844, -0.3016689, -0.6856073, 0, 0, 0, 1, 1,
0.1224372, 0.7744077, 0.2382526, 0, 0, 0, 1, 1,
0.1242864, -0.2397368, 1.112487, 1, 1, 1, 1, 1,
0.1272638, 0.8073861, -0.2624103, 1, 1, 1, 1, 1,
0.1302179, -1.400583, 2.948011, 1, 1, 1, 1, 1,
0.1309428, 1.279296, -0.3609364, 1, 1, 1, 1, 1,
0.1323242, 0.880945, -1.776281, 1, 1, 1, 1, 1,
0.1330912, -0.7042256, 1.664503, 1, 1, 1, 1, 1,
0.1340248, 1.350143, -0.9886854, 1, 1, 1, 1, 1,
0.1352055, -2.353791, 2.976753, 1, 1, 1, 1, 1,
0.1353536, -1.039219, 2.301806, 1, 1, 1, 1, 1,
0.145319, -0.7117512, 3.044867, 1, 1, 1, 1, 1,
0.1476511, 0.9623333, 0.1211657, 1, 1, 1, 1, 1,
0.1512096, 0.9603307, -0.9657975, 1, 1, 1, 1, 1,
0.152139, -1.590175, 2.649224, 1, 1, 1, 1, 1,
0.1525708, -0.3323775, 2.437835, 1, 1, 1, 1, 1,
0.1565014, 1.095121, 0.2930453, 1, 1, 1, 1, 1,
0.1600983, 0.5646101, -0.7057502, 0, 0, 1, 1, 1,
0.1611037, 0.5769754, 1.116432, 1, 0, 0, 1, 1,
0.1626291, 1.060626, 1.377932, 1, 0, 0, 1, 1,
0.1630294, 1.555409, -0.635115, 1, 0, 0, 1, 1,
0.1644828, -0.2681403, 1.539579, 1, 0, 0, 1, 1,
0.1655801, -0.7850808, 2.423625, 1, 0, 0, 1, 1,
0.1690421, 0.8670692, 0.3922687, 0, 0, 0, 1, 1,
0.1724896, 0.3761044, 0.8754538, 0, 0, 0, 1, 1,
0.1838998, -0.7302611, 3.681877, 0, 0, 0, 1, 1,
0.1840827, -0.3348286, 3.686351, 0, 0, 0, 1, 1,
0.1878003, -0.09781867, 0.7609549, 0, 0, 0, 1, 1,
0.1904315, -0.8423776, 0.7589046, 0, 0, 0, 1, 1,
0.1906947, 0.1179529, 1.361383, 0, 0, 0, 1, 1,
0.2038115, -1.694194, 4.200231, 1, 1, 1, 1, 1,
0.2097871, 0.1197762, -0.7369179, 1, 1, 1, 1, 1,
0.2153653, -1.175882, 3.761884, 1, 1, 1, 1, 1,
0.2166944, -0.2280395, 1.963834, 1, 1, 1, 1, 1,
0.2168433, -0.5343143, 1.001303, 1, 1, 1, 1, 1,
0.2197621, -0.551, 2.970734, 1, 1, 1, 1, 1,
0.2268899, 1.591228, -0.457012, 1, 1, 1, 1, 1,
0.2307859, -0.469234, 1.450058, 1, 1, 1, 1, 1,
0.234556, 0.1676922, 0.9263086, 1, 1, 1, 1, 1,
0.2358469, -0.2661703, 2.001626, 1, 1, 1, 1, 1,
0.2448778, -0.5650471, 3.417976, 1, 1, 1, 1, 1,
0.2452379, -0.06017528, 1.255467, 1, 1, 1, 1, 1,
0.2485449, -0.1492361, 0.7003785, 1, 1, 1, 1, 1,
0.2508071, 0.4137685, -0.2089446, 1, 1, 1, 1, 1,
0.2568386, -0.5806007, 1.972801, 1, 1, 1, 1, 1,
0.2590713, 0.2912998, 1.236828, 0, 0, 1, 1, 1,
0.2604148, -0.7955089, 2.709134, 1, 0, 0, 1, 1,
0.2605445, 0.1564235, 1.051322, 1, 0, 0, 1, 1,
0.2629402, -1.031035, 3.081464, 1, 0, 0, 1, 1,
0.2682794, 0.3451101, 0.1564135, 1, 0, 0, 1, 1,
0.2812367, -0.5097621, 2.279711, 1, 0, 0, 1, 1,
0.2814589, 1.413473, -0.1069304, 0, 0, 0, 1, 1,
0.2836431, -2.206694, 2.264066, 0, 0, 0, 1, 1,
0.2838535, 0.2038465, 0.965618, 0, 0, 0, 1, 1,
0.2871758, 0.8372844, 0.3504256, 0, 0, 0, 1, 1,
0.2907669, 0.7805537, 2.049257, 0, 0, 0, 1, 1,
0.2921281, -0.5859879, 2.478628, 0, 0, 0, 1, 1,
0.2943421, 1.554691, -0.1397163, 0, 0, 0, 1, 1,
0.2960343, -0.7244174, 2.116935, 1, 1, 1, 1, 1,
0.298514, 1.586244, -0.7859043, 1, 1, 1, 1, 1,
0.3090789, 0.5269095, -0.8816248, 1, 1, 1, 1, 1,
0.3100085, -0.01503055, 1.902265, 1, 1, 1, 1, 1,
0.3100584, -0.5014763, 2.558513, 1, 1, 1, 1, 1,
0.3115402, 0.3587969, 2.027387, 1, 1, 1, 1, 1,
0.3179371, -0.6780544, 2.876909, 1, 1, 1, 1, 1,
0.3208288, 1.069323, -1.255412, 1, 1, 1, 1, 1,
0.3247602, 1.114555, 0.110075, 1, 1, 1, 1, 1,
0.3293674, -0.2435906, 1.019686, 1, 1, 1, 1, 1,
0.3300923, 1.834274, 2.527483, 1, 1, 1, 1, 1,
0.3339065, 0.3342707, 0.3812066, 1, 1, 1, 1, 1,
0.3347456, -0.5644181, 1.917974, 1, 1, 1, 1, 1,
0.3374042, -0.0802615, 0.8500981, 1, 1, 1, 1, 1,
0.3376337, -0.4738325, 1.000813, 1, 1, 1, 1, 1,
0.3406447, -0.4032981, 3.854242, 0, 0, 1, 1, 1,
0.3432396, 0.2364356, 1.425632, 1, 0, 0, 1, 1,
0.3436964, 2.346184, 1.856277, 1, 0, 0, 1, 1,
0.3476739, -0.1068494, 1.529038, 1, 0, 0, 1, 1,
0.3490965, 0.385312, 2.480083, 1, 0, 0, 1, 1,
0.3533264, 0.5899171, -0.7745651, 1, 0, 0, 1, 1,
0.3545701, 1.79479, 0.5223661, 0, 0, 0, 1, 1,
0.3576228, -0.160823, 2.177836, 0, 0, 0, 1, 1,
0.3618466, 0.2671815, 1.046356, 0, 0, 0, 1, 1,
0.3650879, -1.310488, 4.146416, 0, 0, 0, 1, 1,
0.3661923, 1.521183, -0.3113297, 0, 0, 0, 1, 1,
0.3699406, 0.5277111, 1.086108, 0, 0, 0, 1, 1,
0.371148, -0.6727058, 3.696693, 0, 0, 0, 1, 1,
0.3818546, 0.4922809, 1.489698, 1, 1, 1, 1, 1,
0.3830817, -0.08416146, 3.083723, 1, 1, 1, 1, 1,
0.3956928, 0.9731334, -0.0922369, 1, 1, 1, 1, 1,
0.3961864, -0.7850828, 3.187541, 1, 1, 1, 1, 1,
0.3971344, 1.326755, -0.5551102, 1, 1, 1, 1, 1,
0.3971624, 0.2536611, 1.465691, 1, 1, 1, 1, 1,
0.3982408, 0.5182476, 1.40842, 1, 1, 1, 1, 1,
0.4021455, -0.4355246, 3.033225, 1, 1, 1, 1, 1,
0.4040982, -0.2424994, 2.082857, 1, 1, 1, 1, 1,
0.4095684, -1.310518, 3.648622, 1, 1, 1, 1, 1,
0.4153634, 1.462823, -0.2406218, 1, 1, 1, 1, 1,
0.4253224, -0.4131326, 3.739446, 1, 1, 1, 1, 1,
0.4294604, -0.4382116, 3.228979, 1, 1, 1, 1, 1,
0.4315719, 2.692519, -0.9531778, 1, 1, 1, 1, 1,
0.4346195, -1.443004, 2.248497, 1, 1, 1, 1, 1,
0.4347715, -0.596368, 2.809577, 0, 0, 1, 1, 1,
0.4354347, 1.091212, -1.055495, 1, 0, 0, 1, 1,
0.4354789, -0.8064172, 2.390339, 1, 0, 0, 1, 1,
0.4361813, 1.20041, 0.2394915, 1, 0, 0, 1, 1,
0.4370145, -0.8436415, 1.734878, 1, 0, 0, 1, 1,
0.4371872, 2.970176, 1.023696, 1, 0, 0, 1, 1,
0.4385548, 1.492242, 0.6324839, 0, 0, 0, 1, 1,
0.4419204, 2.739954, 0.154634, 0, 0, 0, 1, 1,
0.452688, 1.152435, -0.1032375, 0, 0, 0, 1, 1,
0.4591827, 2.107243, -0.04927711, 0, 0, 0, 1, 1,
0.4708729, -0.8441409, 3.063452, 0, 0, 0, 1, 1,
0.4717122, -1.786267, 4.071769, 0, 0, 0, 1, 1,
0.4776272, 0.3920318, 2.194832, 0, 0, 0, 1, 1,
0.4829317, -1.490353, 4.726233, 1, 1, 1, 1, 1,
0.4854376, 1.239946, -0.9103789, 1, 1, 1, 1, 1,
0.4864355, 0.6922117, 0.8068638, 1, 1, 1, 1, 1,
0.491908, -0.2159185, 4.000451, 1, 1, 1, 1, 1,
0.4926384, -1.876717, 1.534121, 1, 1, 1, 1, 1,
0.4928979, -2.078176, 3.359406, 1, 1, 1, 1, 1,
0.501057, 0.8295653, 0.03427386, 1, 1, 1, 1, 1,
0.5057638, -0.1931809, 1.615444, 1, 1, 1, 1, 1,
0.5109495, -0.7602554, 1.765387, 1, 1, 1, 1, 1,
0.5132659, 0.3367532, 1.453235, 1, 1, 1, 1, 1,
0.5145223, 1.72667, 0.2567234, 1, 1, 1, 1, 1,
0.5157437, -0.6608718, 2.262955, 1, 1, 1, 1, 1,
0.5171419, 0.4654165, 1.286566, 1, 1, 1, 1, 1,
0.5176691, -1.230674, 0.7946098, 1, 1, 1, 1, 1,
0.5278348, -1.106183, 1.492526, 1, 1, 1, 1, 1,
0.5281301, 0.3618392, 1.863353, 0, 0, 1, 1, 1,
0.5290469, -1.683234, 3.116268, 1, 0, 0, 1, 1,
0.5296751, 0.6568232, 0.955802, 1, 0, 0, 1, 1,
0.5335912, 0.1881236, -0.07353251, 1, 0, 0, 1, 1,
0.5358738, -0.3376432, 2.273183, 1, 0, 0, 1, 1,
0.5363585, 0.7472535, 1.954269, 1, 0, 0, 1, 1,
0.5376419, -0.3662398, 0.4689463, 0, 0, 0, 1, 1,
0.543423, 0.8070441, 2.489973, 0, 0, 0, 1, 1,
0.5444235, 0.129168, 1.237732, 0, 0, 0, 1, 1,
0.550432, 0.6586714, 0.3465617, 0, 0, 0, 1, 1,
0.5513229, -0.6076179, 2.656285, 0, 0, 0, 1, 1,
0.5530978, 0.9197125, -0.1349488, 0, 0, 0, 1, 1,
0.5610766, -0.8981363, 3.623063, 0, 0, 0, 1, 1,
0.5615205, 0.1704403, -0.05422076, 1, 1, 1, 1, 1,
0.5648649, 2.041384, -0.5337934, 1, 1, 1, 1, 1,
0.5740008, -1.552516, 0.8390219, 1, 1, 1, 1, 1,
0.5774897, -0.1282618, 2.117846, 1, 1, 1, 1, 1,
0.577608, -0.05799294, 0.6296328, 1, 1, 1, 1, 1,
0.5792528, -0.09287003, 0.970419, 1, 1, 1, 1, 1,
0.5873113, -0.382744, 2.012642, 1, 1, 1, 1, 1,
0.5874571, -1.516924, 1.612683, 1, 1, 1, 1, 1,
0.5895787, -0.006492987, 0.1180312, 1, 1, 1, 1, 1,
0.5895998, -1.139623, 2.541732, 1, 1, 1, 1, 1,
0.591455, 0.2507084, 0.7967075, 1, 1, 1, 1, 1,
0.5923855, 0.1140244, 3.744623, 1, 1, 1, 1, 1,
0.5950161, -0.1828621, 2.296795, 1, 1, 1, 1, 1,
0.5955569, 1.341789, -1.551229, 1, 1, 1, 1, 1,
0.5974764, 1.077641, 0.4671941, 1, 1, 1, 1, 1,
0.6033858, -2.315527, 3.172439, 0, 0, 1, 1, 1,
0.6038352, 0.2524236, 2.21915, 1, 0, 0, 1, 1,
0.6047249, 0.1853537, -0.462857, 1, 0, 0, 1, 1,
0.6141522, -0.3725269, 0.6681731, 1, 0, 0, 1, 1,
0.6168129, 1.029515, 1.859804, 1, 0, 0, 1, 1,
0.6197053, -0.9713123, 4.268254, 1, 0, 0, 1, 1,
0.6306662, -1.02564, 1.910652, 0, 0, 0, 1, 1,
0.6312406, -0.79311, 2.918014, 0, 0, 0, 1, 1,
0.6314422, -1.169383, 2.21376, 0, 0, 0, 1, 1,
0.6319678, 2.101939, -1.163679, 0, 0, 0, 1, 1,
0.6370025, -0.4542542, 2.10486, 0, 0, 0, 1, 1,
0.6382951, 0.7209866, 2.247457, 0, 0, 0, 1, 1,
0.6387199, 1.083781, 0.3630387, 0, 0, 0, 1, 1,
0.6451417, 1.526322, 1.625791, 1, 1, 1, 1, 1,
0.6540555, -0.6119763, 1.159794, 1, 1, 1, 1, 1,
0.6580232, 1.057009, 0.1094718, 1, 1, 1, 1, 1,
0.6665269, 1.97606, 0.7082315, 1, 1, 1, 1, 1,
0.6673359, 1.032828, 1.928926, 1, 1, 1, 1, 1,
0.6676211, -0.1984304, 1.795803, 1, 1, 1, 1, 1,
0.6713765, -0.7936192, 2.790603, 1, 1, 1, 1, 1,
0.67164, -0.12934, 1.991657, 1, 1, 1, 1, 1,
0.6747597, 0.2218862, 1.306846, 1, 1, 1, 1, 1,
0.6750262, -0.2065662, 1.561747, 1, 1, 1, 1, 1,
0.6799406, 1.015345, 1.254414, 1, 1, 1, 1, 1,
0.6855148, -1.41486, 1.961919, 1, 1, 1, 1, 1,
0.6857368, 0.2610997, 0.2632363, 1, 1, 1, 1, 1,
0.6861575, 0.9428763, 0.8152621, 1, 1, 1, 1, 1,
0.6921839, -0.2212975, 1.879526, 1, 1, 1, 1, 1,
0.7046925, 0.3461756, 1.175353, 0, 0, 1, 1, 1,
0.7077963, 1.665696, -0.4667891, 1, 0, 0, 1, 1,
0.7100262, -1.243235, 3.638116, 1, 0, 0, 1, 1,
0.7153731, -1.368044, 3.074907, 1, 0, 0, 1, 1,
0.7168521, -0.4777798, 3.669163, 1, 0, 0, 1, 1,
0.7185292, -0.2779355, 1.660523, 1, 0, 0, 1, 1,
0.7193108, 1.700822, -0.4287067, 0, 0, 0, 1, 1,
0.7216366, 0.5584192, 0.6932433, 0, 0, 0, 1, 1,
0.7287685, -0.06557559, -0.2834097, 0, 0, 0, 1, 1,
0.7316357, -0.558325, 3.259034, 0, 0, 0, 1, 1,
0.7331575, 0.696727, -0.9264573, 0, 0, 0, 1, 1,
0.7431303, -0.6760079, 2.456689, 0, 0, 0, 1, 1,
0.7471325, 0.6586968, -0.6463354, 0, 0, 0, 1, 1,
0.7500786, 0.585126, 1.145915, 1, 1, 1, 1, 1,
0.7567609, 0.1872191, -0.07555428, 1, 1, 1, 1, 1,
0.7614106, -0.09747184, 1.537981, 1, 1, 1, 1, 1,
0.764033, 2.675447, 2.195148, 1, 1, 1, 1, 1,
0.7739704, 0.4025313, -0.06622711, 1, 1, 1, 1, 1,
0.7768443, -1.256745, 3.448599, 1, 1, 1, 1, 1,
0.777064, -0.347435, 2.199468, 1, 1, 1, 1, 1,
0.7788178, -0.5846903, 2.59086, 1, 1, 1, 1, 1,
0.7862421, 1.177372, 1.25167, 1, 1, 1, 1, 1,
0.7932946, 0.02862069, 2.533472, 1, 1, 1, 1, 1,
0.7987515, 1.187833, 0.7151586, 1, 1, 1, 1, 1,
0.8043804, 0.6294544, 0.3699979, 1, 1, 1, 1, 1,
0.8092238, -0.05629801, 0.9452913, 1, 1, 1, 1, 1,
0.8118785, -0.9745957, 3.419495, 1, 1, 1, 1, 1,
0.8156221, 0.8545718, 1.763589, 1, 1, 1, 1, 1,
0.8269179, 0.2543659, 1.393385, 0, 0, 1, 1, 1,
0.831487, -0.4887934, 2.921429, 1, 0, 0, 1, 1,
0.8374045, -1.056132, 2.787215, 1, 0, 0, 1, 1,
0.8391127, 1.908377, 1.441081, 1, 0, 0, 1, 1,
0.843107, 0.003093743, 0.1440866, 1, 0, 0, 1, 1,
0.8443939, 0.4765941, 1.265803, 1, 0, 0, 1, 1,
0.8455256, -1.688036, 1.879506, 0, 0, 0, 1, 1,
0.845526, 0.1758189, 3.155903, 0, 0, 0, 1, 1,
0.8465216, -0.2484484, 2.479634, 0, 0, 0, 1, 1,
0.8472816, 1.552056, 0.2644813, 0, 0, 0, 1, 1,
0.849239, 0.4716758, 1.28822, 0, 0, 0, 1, 1,
0.8519063, -1.698093, -0.1864439, 0, 0, 0, 1, 1,
0.8532001, -0.8505738, 0.6891986, 0, 0, 0, 1, 1,
0.8551846, 1.669209, 1.00744, 1, 1, 1, 1, 1,
0.8578133, 1.366549, 0.3944885, 1, 1, 1, 1, 1,
0.8623132, 1.055177, 1.670244, 1, 1, 1, 1, 1,
0.8626804, 1.162812, 0.3193881, 1, 1, 1, 1, 1,
0.8667257, 2.019441, 0.6822922, 1, 1, 1, 1, 1,
0.8728591, -0.9168873, 2.055042, 1, 1, 1, 1, 1,
0.8780385, -0.2343258, 1.280441, 1, 1, 1, 1, 1,
0.893788, -2.160952, 1.787628, 1, 1, 1, 1, 1,
0.8960692, 0.4111547, 0.1752309, 1, 1, 1, 1, 1,
0.8982237, 0.8200344, 0.473949, 1, 1, 1, 1, 1,
0.903135, -0.8665997, 1.698689, 1, 1, 1, 1, 1,
0.9099833, -2.846704, 3.631784, 1, 1, 1, 1, 1,
0.9226035, 1.916247, 0.157436, 1, 1, 1, 1, 1,
0.9303749, -0.5651674, 2.144444, 1, 1, 1, 1, 1,
0.9341798, -1.402373, 1.462513, 1, 1, 1, 1, 1,
0.9350764, 0.7980699, -0.3320707, 0, 0, 1, 1, 1,
0.9363474, -0.197778, 1.493365, 1, 0, 0, 1, 1,
0.9366856, -1.953313, 3.592123, 1, 0, 0, 1, 1,
0.9400227, 0.03548183, 2.412648, 1, 0, 0, 1, 1,
0.9427069, -0.4338284, 0.3773934, 1, 0, 0, 1, 1,
0.943864, 0.4894126, -0.8833616, 1, 0, 0, 1, 1,
0.9470189, 1.010912, 0.7646804, 0, 0, 0, 1, 1,
0.9519638, -0.9934783, 1.254327, 0, 0, 0, 1, 1,
0.9537722, -0.8459442, 1.254775, 0, 0, 0, 1, 1,
0.9548877, 3.13433, 1.101708, 0, 0, 0, 1, 1,
0.962393, 0.9211468, 0.6433791, 0, 0, 0, 1, 1,
0.964016, -0.03395054, 1.043402, 0, 0, 0, 1, 1,
0.9642016, -1.037243, 2.14424, 0, 0, 0, 1, 1,
0.9763166, 0.8301726, 0.380879, 1, 1, 1, 1, 1,
0.9779331, -0.5371574, 3.144974, 1, 1, 1, 1, 1,
0.9806325, 0.6305579, 1.882437, 1, 1, 1, 1, 1,
0.9815882, -1.017204, 2.424323, 1, 1, 1, 1, 1,
0.9850976, 0.9545127, 1.23182, 1, 1, 1, 1, 1,
0.9864722, -0.6644297, 3.16214, 1, 1, 1, 1, 1,
0.987182, 0.7438513, 1.371809, 1, 1, 1, 1, 1,
0.9904531, -1.176473, 2.531221, 1, 1, 1, 1, 1,
0.9989875, -1.167414, 0.6439002, 1, 1, 1, 1, 1,
1.003966, -1.111308, 0.1372742, 1, 1, 1, 1, 1,
1.005414, 0.4078442, -0.06747375, 1, 1, 1, 1, 1,
1.008721, -1.269245, 1.069974, 1, 1, 1, 1, 1,
1.020993, -0.9867775, 1.790386, 1, 1, 1, 1, 1,
1.02893, 1.754932, -0.7797846, 1, 1, 1, 1, 1,
1.033282, -2.608131, 1.982435, 1, 1, 1, 1, 1,
1.035478, -0.5073801, 4.037576, 0, 0, 1, 1, 1,
1.036664, 0.3295263, 3.290645, 1, 0, 0, 1, 1,
1.037346, 1.842346, -0.1161098, 1, 0, 0, 1, 1,
1.047395, 1.311766, 1.108363, 1, 0, 0, 1, 1,
1.047404, 0.2938611, 2.335095, 1, 0, 0, 1, 1,
1.058901, -1.638253, 3.329244, 1, 0, 0, 1, 1,
1.060873, -0.4695842, 2.134151, 0, 0, 0, 1, 1,
1.061006, 1.411109, 0.3109097, 0, 0, 0, 1, 1,
1.061664, 0.4052837, 2.546126, 0, 0, 0, 1, 1,
1.070979, 0.4579269, 1.982742, 0, 0, 0, 1, 1,
1.072304, -0.4057402, 3.749679, 0, 0, 0, 1, 1,
1.07483, -0.3341029, 2.861287, 0, 0, 0, 1, 1,
1.08075, 1.53692, 2.336699, 0, 0, 0, 1, 1,
1.092686, -1.650915, 3.701185, 1, 1, 1, 1, 1,
1.094864, -0.4530813, 3.420216, 1, 1, 1, 1, 1,
1.09844, -0.08521816, 2.482814, 1, 1, 1, 1, 1,
1.099729, 0.6588818, 2.543867, 1, 1, 1, 1, 1,
1.113109, -1.020376, 3.370003, 1, 1, 1, 1, 1,
1.122373, -0.6754174, 3.994179, 1, 1, 1, 1, 1,
1.134285, 1.539986, 1.6984, 1, 1, 1, 1, 1,
1.143239, -0.3833086, 1.281374, 1, 1, 1, 1, 1,
1.153055, -0.1850335, 1.639512, 1, 1, 1, 1, 1,
1.170065, -0.3395282, 3.796549, 1, 1, 1, 1, 1,
1.174656, 1.418343, -1.487042, 1, 1, 1, 1, 1,
1.175893, -1.792103, 2.642551, 1, 1, 1, 1, 1,
1.180297, 0.257104, 1.423282, 1, 1, 1, 1, 1,
1.183095, -0.6983471, 3.897145, 1, 1, 1, 1, 1,
1.183672, -2.626686, 1.071134, 1, 1, 1, 1, 1,
1.196463, 2.152412, -0.7554885, 0, 0, 1, 1, 1,
1.197302, 0.2063927, 1.157913, 1, 0, 0, 1, 1,
1.203032, -1.288658, 3.761777, 1, 0, 0, 1, 1,
1.203941, -1.562708, 4.934422, 1, 0, 0, 1, 1,
1.20461, -0.2990807, 0.7612081, 1, 0, 0, 1, 1,
1.213416, 1.246411, -0.5295439, 1, 0, 0, 1, 1,
1.214519, 0.3269076, 1.391876, 0, 0, 0, 1, 1,
1.219568, 0.941388, 1.332249, 0, 0, 0, 1, 1,
1.220361, -0.7755091, 2.741821, 0, 0, 0, 1, 1,
1.222893, 0.5455289, 0.6466347, 0, 0, 0, 1, 1,
1.228484, 0.04714398, -0.1445083, 0, 0, 0, 1, 1,
1.238836, 0.8959321, 1.137787, 0, 0, 0, 1, 1,
1.241061, 0.5465975, 0.801895, 0, 0, 0, 1, 1,
1.243697, 1.670875, 1.117014, 1, 1, 1, 1, 1,
1.243716, -0.6099752, 0.8562649, 1, 1, 1, 1, 1,
1.246892, 0.6287169, 0.9207401, 1, 1, 1, 1, 1,
1.247676, -0.9173209, 1.589978, 1, 1, 1, 1, 1,
1.248674, -0.2661222, 0.3070038, 1, 1, 1, 1, 1,
1.258452, -0.3699109, 1.572899, 1, 1, 1, 1, 1,
1.258785, -1.344874, 2.702966, 1, 1, 1, 1, 1,
1.259143, 1.441448, -0.4737557, 1, 1, 1, 1, 1,
1.25929, -0.4651606, 2.972368, 1, 1, 1, 1, 1,
1.262828, 0.6111386, 3.682759, 1, 1, 1, 1, 1,
1.266008, -0.3754779, 1.952251, 1, 1, 1, 1, 1,
1.266404, -0.7489389, 0.7336013, 1, 1, 1, 1, 1,
1.267268, 0.1445126, 1.975423, 1, 1, 1, 1, 1,
1.26906, 1.192126, 1.15067, 1, 1, 1, 1, 1,
1.270605, 1.598723, 0.7896564, 1, 1, 1, 1, 1,
1.272722, 0.4026585, 0.7302784, 0, 0, 1, 1, 1,
1.275338, -0.4006171, -0.3288363, 1, 0, 0, 1, 1,
1.275658, -0.2810511, -0.1976989, 1, 0, 0, 1, 1,
1.283912, 1.142845, 0.7248634, 1, 0, 0, 1, 1,
1.291157, -0.4983814, 2.541599, 1, 0, 0, 1, 1,
1.296145, 0.2286841, 1.005468, 1, 0, 0, 1, 1,
1.301915, 0.4545771, -1.014152, 0, 0, 0, 1, 1,
1.303581, -0.4174622, 1.172162, 0, 0, 0, 1, 1,
1.304965, 0.3891875, 2.129884, 0, 0, 0, 1, 1,
1.309101, -0.4894879, 1.840256, 0, 0, 0, 1, 1,
1.324479, 0.442993, 1.887568, 0, 0, 0, 1, 1,
1.326219, 0.3502602, 2.128766, 0, 0, 0, 1, 1,
1.349323, 0.3343522, 0.5653469, 0, 0, 0, 1, 1,
1.352761, -0.2225793, 1.220882, 1, 1, 1, 1, 1,
1.358587, -0.1878941, 1.734338, 1, 1, 1, 1, 1,
1.361082, -0.5141476, 1.993873, 1, 1, 1, 1, 1,
1.361751, 1.471232, -1.003183, 1, 1, 1, 1, 1,
1.376298, 0.4917065, 1.418438, 1, 1, 1, 1, 1,
1.377855, 0.2428609, 2.241482, 1, 1, 1, 1, 1,
1.378286, 0.4079379, 0.2472768, 1, 1, 1, 1, 1,
1.379166, 0.6981325, -1.031725, 1, 1, 1, 1, 1,
1.383757, -0.4521163, 2.726551, 1, 1, 1, 1, 1,
1.386815, 1.017271, 0.4753833, 1, 1, 1, 1, 1,
1.406173, 0.7564287, 0.4207891, 1, 1, 1, 1, 1,
1.409672, 0.9044271, 0.7755514, 1, 1, 1, 1, 1,
1.415127, -0.5742586, 0.9179882, 1, 1, 1, 1, 1,
1.419047, -0.1471877, 2.215165, 1, 1, 1, 1, 1,
1.420202, -0.7266161, 0.2138228, 1, 1, 1, 1, 1,
1.420783, 1.239562, 2.286675, 0, 0, 1, 1, 1,
1.422622, 2.006077, 1.544847, 1, 0, 0, 1, 1,
1.441867, 0.0655577, -0.3225639, 1, 0, 0, 1, 1,
1.454601, -0.487918, -0.7269517, 1, 0, 0, 1, 1,
1.455122, -0.57775, 0.8453579, 1, 0, 0, 1, 1,
1.460603, 0.4314355, 1.439955, 1, 0, 0, 1, 1,
1.461852, 2.62241, 0.650519, 0, 0, 0, 1, 1,
1.464687, -0.5700939, 2.582993, 0, 0, 0, 1, 1,
1.465139, 0.5586744, 1.223447, 0, 0, 0, 1, 1,
1.466161, -0.0867612, 1.2516, 0, 0, 0, 1, 1,
1.471207, 1.546204, 1.344217, 0, 0, 0, 1, 1,
1.4928, 0.2883533, 0.8479572, 0, 0, 0, 1, 1,
1.493197, -1.377598, 2.554903, 0, 0, 0, 1, 1,
1.50748, -1.870356, 2.890862, 1, 1, 1, 1, 1,
1.509853, -2.13233, 2.90112, 1, 1, 1, 1, 1,
1.5128, -1.707197, 2.319508, 1, 1, 1, 1, 1,
1.515532, 0.3497226, 1.971547, 1, 1, 1, 1, 1,
1.52887, -0.8239915, 0.8479388, 1, 1, 1, 1, 1,
1.534161, -0.6313675, 1.764, 1, 1, 1, 1, 1,
1.53802, 1.391693, 0.4401175, 1, 1, 1, 1, 1,
1.556545, 0.2362647, 2.083771, 1, 1, 1, 1, 1,
1.557847, -1.381549, 1.752656, 1, 1, 1, 1, 1,
1.570211, -0.1458865, 3.392914, 1, 1, 1, 1, 1,
1.572169, 0.1814614, 0.978914, 1, 1, 1, 1, 1,
1.579985, -0.1990936, -0.03357762, 1, 1, 1, 1, 1,
1.580467, -0.1507109, 2.37394, 1, 1, 1, 1, 1,
1.599573, 0.8240309, 0.9677486, 1, 1, 1, 1, 1,
1.602992, 1.081426, -0.7745531, 1, 1, 1, 1, 1,
1.630749, -0.04993602, 1.117266, 0, 0, 1, 1, 1,
1.634016, 1.237842, 1.570881, 1, 0, 0, 1, 1,
1.642868, -0.2291101, 2.001727, 1, 0, 0, 1, 1,
1.64478, 2.261125, 0.6631507, 1, 0, 0, 1, 1,
1.649547, -0.4993291, 0.631957, 1, 0, 0, 1, 1,
1.662213, -0.2747501, 1.560823, 1, 0, 0, 1, 1,
1.667378, -1.137148, 3.529784, 0, 0, 0, 1, 1,
1.670796, 0.3774072, 2.620183, 0, 0, 0, 1, 1,
1.676861, -0.08220243, 2.048514, 0, 0, 0, 1, 1,
1.689456, 0.06064153, -0.2948914, 0, 0, 0, 1, 1,
1.706868, -0.004462772, 3.182959, 0, 0, 0, 1, 1,
1.714156, 0.6374121, 0.04937162, 0, 0, 0, 1, 1,
1.71664, -0.5382853, 3.843678, 0, 0, 0, 1, 1,
1.741946, -0.3194611, 1.040586, 1, 1, 1, 1, 1,
1.750347, -0.0629855, 0.1634678, 1, 1, 1, 1, 1,
1.755823, 0.6674039, 1.709122, 1, 1, 1, 1, 1,
1.784621, 1.421833, 0.9256631, 1, 1, 1, 1, 1,
1.828413, 0.7294143, 2.05791, 1, 1, 1, 1, 1,
1.856049, -0.2017881, 1.344444, 1, 1, 1, 1, 1,
1.856429, 0.2210112, 1.980372, 1, 1, 1, 1, 1,
1.878712, -0.6219262, 2.062054, 1, 1, 1, 1, 1,
1.889787, 2.256548, -0.3544134, 1, 1, 1, 1, 1,
1.933307, -0.5909981, 1.619847, 1, 1, 1, 1, 1,
1.949471, 0.2154931, 1.603312, 1, 1, 1, 1, 1,
1.97415, 1.375281, 0.1436154, 1, 1, 1, 1, 1,
1.98447, -1.610746, 1.270941, 1, 1, 1, 1, 1,
1.991346, -0.5940626, 2.055162, 1, 1, 1, 1, 1,
1.99705, -0.1105529, 0.8090894, 1, 1, 1, 1, 1,
1.998385, -0.2200891, 1.029178, 0, 0, 1, 1, 1,
2.055728, 0.8049001, 0.193518, 1, 0, 0, 1, 1,
2.094206, 0.3745378, 1.245654, 1, 0, 0, 1, 1,
2.136463, -0.996812, 3.058645, 1, 0, 0, 1, 1,
2.142143, -0.466321, 1.55838, 1, 0, 0, 1, 1,
2.181177, 0.3553273, 2.658424, 1, 0, 0, 1, 1,
2.183351, -1.506627, 3.079575, 0, 0, 0, 1, 1,
2.207353, -0.002629074, 1.249058, 0, 0, 0, 1, 1,
2.220822, -1.023866, 1.587438, 0, 0, 0, 1, 1,
2.445223, -0.9932807, 4.018539, 0, 0, 0, 1, 1,
2.457492, -0.03003713, 3.228278, 0, 0, 0, 1, 1,
2.503376, -1.725042, 1.378167, 0, 0, 0, 1, 1,
2.516904, 1.614719, 1.59903, 0, 0, 0, 1, 1,
2.517548, 2.239702, 1.208974, 1, 1, 1, 1, 1,
2.52678, -0.8410947, 0.8940722, 1, 1, 1, 1, 1,
2.821778, 1.368982, -0.5240454, 1, 1, 1, 1, 1,
2.902402, 2.364748, 0.610158, 1, 1, 1, 1, 1,
2.947297, -1.487911, 1.183256, 1, 1, 1, 1, 1,
3.118022, 0.441816, 1.958124, 1, 1, 1, 1, 1,
3.289131, 0.5063288, 1.8215, 1, 1, 1, 1, 1
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
var radius = 9.565135;
var distance = 33.59713;
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
mvMatrix.translate( -0.1507922, 0.2586143, 0.2815726 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.59713);
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
