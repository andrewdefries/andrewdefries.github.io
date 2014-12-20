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
-3.618425, -0.3453317, -1.507633, 1, 0, 0, 1,
-2.913224, 2.022189, 2.311929, 1, 0.007843138, 0, 1,
-2.911628, 0.9588193, -0.7156419, 1, 0.01176471, 0, 1,
-2.647046, 0.7763214, -1.571076, 1, 0.01960784, 0, 1,
-2.614278, -0.5100564, -0.9376526, 1, 0.02352941, 0, 1,
-2.559799, 0.9030074, 0.5597538, 1, 0.03137255, 0, 1,
-2.438147, -0.2752721, -1.403335, 1, 0.03529412, 0, 1,
-2.343718, 0.7396144, -2.302621, 1, 0.04313726, 0, 1,
-2.343175, -0.3908071, -2.521617, 1, 0.04705882, 0, 1,
-2.325806, -0.4889935, -0.9540024, 1, 0.05490196, 0, 1,
-2.226781, 0.7997408, 0.9360468, 1, 0.05882353, 0, 1,
-2.181416, -1.658711, -0.2809398, 1, 0.06666667, 0, 1,
-2.156386, 0.6799628, 0.4883893, 1, 0.07058824, 0, 1,
-2.111279, 1.053637, -1.409897, 1, 0.07843138, 0, 1,
-2.082243, -1.0348, -3.134346, 1, 0.08235294, 0, 1,
-2.058264, 1.234758, -1.347433, 1, 0.09019608, 0, 1,
-2.016389, -1.122005, -1.983907, 1, 0.09411765, 0, 1,
-1.937718, 0.2337643, -2.66679, 1, 0.1019608, 0, 1,
-1.911152, -0.3743013, -2.523353, 1, 0.1098039, 0, 1,
-1.907088, -0.9943328, -1.500773, 1, 0.1137255, 0, 1,
-1.90557, -0.1927808, -2.061589, 1, 0.1215686, 0, 1,
-1.897761, -1.610574, -2.885883, 1, 0.1254902, 0, 1,
-1.885004, 0.3257151, -1.663437, 1, 0.1333333, 0, 1,
-1.876489, -0.03683154, -0.3550204, 1, 0.1372549, 0, 1,
-1.833852, -0.3592151, -1.666848, 1, 0.145098, 0, 1,
-1.825511, 0.7404267, -1.519288, 1, 0.1490196, 0, 1,
-1.819151, 2.059312, -1.230394, 1, 0.1568628, 0, 1,
-1.815804, 0.2208878, -0.9939826, 1, 0.1607843, 0, 1,
-1.803159, 1.468009, -1.937965, 1, 0.1686275, 0, 1,
-1.787704, -0.0470399, -1.767907, 1, 0.172549, 0, 1,
-1.781208, 0.6320785, -2.865045, 1, 0.1803922, 0, 1,
-1.773719, -1.005596, -1.607862, 1, 0.1843137, 0, 1,
-1.772807, 1.464874, -1.207068, 1, 0.1921569, 0, 1,
-1.75793, -0.3872468, -1.006499, 1, 0.1960784, 0, 1,
-1.747936, -0.3410107, -1.72027, 1, 0.2039216, 0, 1,
-1.725903, -1.108732, -2.211364, 1, 0.2117647, 0, 1,
-1.710521, -1.051527, -0.9566822, 1, 0.2156863, 0, 1,
-1.693235, 2.437521, 0.3809922, 1, 0.2235294, 0, 1,
-1.676726, 0.4769973, -3.337483, 1, 0.227451, 0, 1,
-1.673312, -0.3009229, -2.777574, 1, 0.2352941, 0, 1,
-1.657981, -0.2017126, -1.399266, 1, 0.2392157, 0, 1,
-1.653978, -0.2238562, -2.361327, 1, 0.2470588, 0, 1,
-1.650349, 2.427735, -1.420063, 1, 0.2509804, 0, 1,
-1.643514, -0.1164855, -2.777545, 1, 0.2588235, 0, 1,
-1.641339, -0.7613634, -4.467948, 1, 0.2627451, 0, 1,
-1.640836, -0.8265417, -0.6940169, 1, 0.2705882, 0, 1,
-1.620354, -0.7419642, -1.257291, 1, 0.2745098, 0, 1,
-1.620195, -0.04676088, -1.664202, 1, 0.282353, 0, 1,
-1.612447, 0.2400753, -0.9287674, 1, 0.2862745, 0, 1,
-1.597865, 0.03407579, -0.1866478, 1, 0.2941177, 0, 1,
-1.584548, 0.3759828, -1.720687, 1, 0.3019608, 0, 1,
-1.584058, 1.248524, -1.547017, 1, 0.3058824, 0, 1,
-1.560092, 0.6702081, -1.566057, 1, 0.3137255, 0, 1,
-1.559803, 0.6571404, -1.570515, 1, 0.3176471, 0, 1,
-1.538659, -0.2733899, -1.19455, 1, 0.3254902, 0, 1,
-1.527304, 0.4735484, -0.9438992, 1, 0.3294118, 0, 1,
-1.52307, -0.3074173, -2.737409, 1, 0.3372549, 0, 1,
-1.518761, -0.0241367, -2.721395, 1, 0.3411765, 0, 1,
-1.517702, 0.2905827, -0.4414277, 1, 0.3490196, 0, 1,
-1.51314, -0.1317993, -1.389623, 1, 0.3529412, 0, 1,
-1.509763, 0.4369879, -1.315798, 1, 0.3607843, 0, 1,
-1.507615, 0.2486285, 0.5038199, 1, 0.3647059, 0, 1,
-1.50484, -1.861197, -2.667343, 1, 0.372549, 0, 1,
-1.503328, -0.4421873, -1.628151, 1, 0.3764706, 0, 1,
-1.498602, -0.7383244, -1.288271, 1, 0.3843137, 0, 1,
-1.497019, -0.022237, -1.361633, 1, 0.3882353, 0, 1,
-1.49617, 0.9231959, -0.6773866, 1, 0.3960784, 0, 1,
-1.495797, -1.566522, -2.194965, 1, 0.4039216, 0, 1,
-1.491544, -0.3944502, -0.6326495, 1, 0.4078431, 0, 1,
-1.470078, 0.2233743, -0.9670424, 1, 0.4156863, 0, 1,
-1.467818, -0.8640075, -1.928478, 1, 0.4196078, 0, 1,
-1.46722, -0.2162045, -0.8681498, 1, 0.427451, 0, 1,
-1.466546, -0.4384654, -0.9248269, 1, 0.4313726, 0, 1,
-1.45568, -0.4876457, -2.099689, 1, 0.4392157, 0, 1,
-1.454121, 2.41229, 1.076581, 1, 0.4431373, 0, 1,
-1.446231, 1.410844, -1.062547, 1, 0.4509804, 0, 1,
-1.442742, -0.9940441, -1.487574, 1, 0.454902, 0, 1,
-1.439812, 1.099972, -0.6005869, 1, 0.4627451, 0, 1,
-1.436939, 0.4533515, -1.856988, 1, 0.4666667, 0, 1,
-1.408917, 2.238781, 0.4829378, 1, 0.4745098, 0, 1,
-1.407375, 0.1312917, -1.287036, 1, 0.4784314, 0, 1,
-1.406996, -1.023751, -2.338478, 1, 0.4862745, 0, 1,
-1.404553, -0.2793308, -2.481774, 1, 0.4901961, 0, 1,
-1.39627, 0.1115546, -2.505042, 1, 0.4980392, 0, 1,
-1.39247, 1.309223, -1.060941, 1, 0.5058824, 0, 1,
-1.377341, -1.552051, -3.326969, 1, 0.509804, 0, 1,
-1.371527, -0.9143372, -1.953408, 1, 0.5176471, 0, 1,
-1.35561, 0.7797475, -0.8974292, 1, 0.5215687, 0, 1,
-1.353412, 1.05572, -0.1140879, 1, 0.5294118, 0, 1,
-1.350331, -1.575638, -3.331255, 1, 0.5333334, 0, 1,
-1.347039, 0.2380494, -0.88256, 1, 0.5411765, 0, 1,
-1.337402, -0.5108148, -1.092894, 1, 0.5450981, 0, 1,
-1.336558, -0.7848361, -1.814955, 1, 0.5529412, 0, 1,
-1.335966, -0.6884982, 1.257416, 1, 0.5568628, 0, 1,
-1.335799, -0.8004112, -2.546302, 1, 0.5647059, 0, 1,
-1.319364, 0.2355938, -1.281422, 1, 0.5686275, 0, 1,
-1.315525, 0.8537599, -0.7008565, 1, 0.5764706, 0, 1,
-1.313962, 0.03078084, -0.3526657, 1, 0.5803922, 0, 1,
-1.308352, -0.5159342, -1.285532, 1, 0.5882353, 0, 1,
-1.299047, 0.7567713, -1.111424, 1, 0.5921569, 0, 1,
-1.291074, 0.1547457, -0.9733936, 1, 0.6, 0, 1,
-1.283365, -0.8976764, -1.562596, 1, 0.6078432, 0, 1,
-1.27284, 1.243428, 0.3976759, 1, 0.6117647, 0, 1,
-1.269683, -0.5416197, -2.852636, 1, 0.6196079, 0, 1,
-1.267383, 0.01141615, -0.4096003, 1, 0.6235294, 0, 1,
-1.262212, -0.8591679, -2.244291, 1, 0.6313726, 0, 1,
-1.261746, -0.8767382, -2.697849, 1, 0.6352941, 0, 1,
-1.260773, -1.288966, -2.18495, 1, 0.6431373, 0, 1,
-1.2592, -0.1691676, -1.59653, 1, 0.6470588, 0, 1,
-1.253948, 0.880488, -1.387331, 1, 0.654902, 0, 1,
-1.250679, -1.448413, -2.656859, 1, 0.6588235, 0, 1,
-1.245133, 0.1356969, -0.4173076, 1, 0.6666667, 0, 1,
-1.242979, 2.018212, -0.6281832, 1, 0.6705883, 0, 1,
-1.241975, 0.1382618, -1.806494, 1, 0.6784314, 0, 1,
-1.240363, -0.1001756, -2.293619, 1, 0.682353, 0, 1,
-1.237416, 0.06779487, -1.166095, 1, 0.6901961, 0, 1,
-1.234974, 1.293311, -1.396446, 1, 0.6941177, 0, 1,
-1.217731, 0.06577799, -1.377131, 1, 0.7019608, 0, 1,
-1.217671, -1.702544, -2.605347, 1, 0.7098039, 0, 1,
-1.208204, 0.1230876, -2.283814, 1, 0.7137255, 0, 1,
-1.201998, 0.730006, -1.776518, 1, 0.7215686, 0, 1,
-1.19924, 1.537592, -1.73739, 1, 0.7254902, 0, 1,
-1.195616, -0.4190401, -1.898951, 1, 0.7333333, 0, 1,
-1.185794, 3.315871, 0.8161894, 1, 0.7372549, 0, 1,
-1.17725, -0.2820438, -0.6709122, 1, 0.7450981, 0, 1,
-1.176964, -0.4826937, 0.1171468, 1, 0.7490196, 0, 1,
-1.156932, 0.4535282, -0.7174944, 1, 0.7568628, 0, 1,
-1.156696, 0.5377824, -0.3009064, 1, 0.7607843, 0, 1,
-1.154134, 1.054163, -1.713051, 1, 0.7686275, 0, 1,
-1.142329, 1.003071, -0.6867112, 1, 0.772549, 0, 1,
-1.140722, 0.8581932, 0.6723664, 1, 0.7803922, 0, 1,
-1.134547, 0.2404582, -2.373993, 1, 0.7843137, 0, 1,
-1.12927, 0.655074, -2.566839, 1, 0.7921569, 0, 1,
-1.127189, 1.95933, 0.7272568, 1, 0.7960784, 0, 1,
-1.126428, 0.6707796, -1.717346, 1, 0.8039216, 0, 1,
-1.126209, 0.3864113, -1.708494, 1, 0.8117647, 0, 1,
-1.123364, 0.6698605, -2.487108, 1, 0.8156863, 0, 1,
-1.119731, -2.309848, -0.9218322, 1, 0.8235294, 0, 1,
-1.102687, 1.544726, -1.001275, 1, 0.827451, 0, 1,
-1.10079, 1.0262, -1.933228, 1, 0.8352941, 0, 1,
-1.09898, 1.795279, -0.5181611, 1, 0.8392157, 0, 1,
-1.084455, 0.1608952, 0.3555931, 1, 0.8470588, 0, 1,
-1.082567, 0.4402217, -0.6776543, 1, 0.8509804, 0, 1,
-1.077249, 0.05530775, -0.231202, 1, 0.8588235, 0, 1,
-1.073743, -0.3897828, -1.906781, 1, 0.8627451, 0, 1,
-1.071991, 1.979791, -1.696264, 1, 0.8705882, 0, 1,
-1.071625, -0.04967462, -0.9838717, 1, 0.8745098, 0, 1,
-1.067847, 0.3391987, -2.252672, 1, 0.8823529, 0, 1,
-1.063257, -1.064567, -2.158369, 1, 0.8862745, 0, 1,
-1.06162, -0.9006336, -1.932823, 1, 0.8941177, 0, 1,
-1.053111, -0.9604141, -2.351465, 1, 0.8980392, 0, 1,
-1.05296, -0.193497, -2.142079, 1, 0.9058824, 0, 1,
-1.051719, 1.398012, 0.06808795, 1, 0.9137255, 0, 1,
-1.050693, 0.3526492, -0.7059681, 1, 0.9176471, 0, 1,
-1.045841, 1.237002, -0.9344094, 1, 0.9254902, 0, 1,
-1.041327, -1.848364, -3.313894, 1, 0.9294118, 0, 1,
-1.037942, 1.047171, -0.8403441, 1, 0.9372549, 0, 1,
-1.034772, -0.6787717, -1.995256, 1, 0.9411765, 0, 1,
-1.033632, -1.163504, -2.286169, 1, 0.9490196, 0, 1,
-1.019583, 1.373801, -0.7162648, 1, 0.9529412, 0, 1,
-1.01599, -0.8980432, -3.741019, 1, 0.9607843, 0, 1,
-1.013802, -1.221756, -2.367517, 1, 0.9647059, 0, 1,
-1.011998, 0.6038013, -1.745837, 1, 0.972549, 0, 1,
-1.000161, 1.446412, -1.076357, 1, 0.9764706, 0, 1,
-0.9991012, -1.508766, -2.587954, 1, 0.9843137, 0, 1,
-0.9929697, 1.111671, -0.5775763, 1, 0.9882353, 0, 1,
-0.9921693, -1.216871, -2.38121, 1, 0.9960784, 0, 1,
-0.9861821, -0.5002639, -1.552345, 0.9960784, 1, 0, 1,
-0.9840069, 1.972433, -0.4671403, 0.9921569, 1, 0, 1,
-0.9814892, -0.2411875, -1.851204, 0.9843137, 1, 0, 1,
-0.981161, -0.384736, -1.554055, 0.9803922, 1, 0, 1,
-0.9801113, 0.7392241, -0.06078874, 0.972549, 1, 0, 1,
-0.9746503, 0.02338527, -1.582433, 0.9686275, 1, 0, 1,
-0.9732163, -0.8679696, -3.172026, 0.9607843, 1, 0, 1,
-0.9718314, 1.823777, -1.489837, 0.9568627, 1, 0, 1,
-0.9705707, 1.09193, 0.4593965, 0.9490196, 1, 0, 1,
-0.9703072, -0.1041222, -1.541642, 0.945098, 1, 0, 1,
-0.9690709, 0.5242407, 0.1048374, 0.9372549, 1, 0, 1,
-0.9626938, 0.1016337, -2.431457, 0.9333333, 1, 0, 1,
-0.9533333, -0.2808685, -1.697074, 0.9254902, 1, 0, 1,
-0.9447352, 0.9362621, -1.535751, 0.9215686, 1, 0, 1,
-0.9445753, -0.4490457, -1.315232, 0.9137255, 1, 0, 1,
-0.9427377, -0.8420292, -1.770399, 0.9098039, 1, 0, 1,
-0.938508, -0.9464879, -2.987176, 0.9019608, 1, 0, 1,
-0.933986, -0.3701727, -1.946653, 0.8941177, 1, 0, 1,
-0.93268, -1.057768, -2.691816, 0.8901961, 1, 0, 1,
-0.9325879, -1.311241, -5.103228, 0.8823529, 1, 0, 1,
-0.9272835, -0.7568775, -2.017121, 0.8784314, 1, 0, 1,
-0.9252888, -1.125893, -2.621131, 0.8705882, 1, 0, 1,
-0.9089346, 1.933445, 0.3497567, 0.8666667, 1, 0, 1,
-0.9055971, -0.726835, -4.266583, 0.8588235, 1, 0, 1,
-0.9041928, -0.341131, -2.19754, 0.854902, 1, 0, 1,
-0.9001891, -0.2683823, -1.889207, 0.8470588, 1, 0, 1,
-0.8980597, 0.3276687, 0.9248165, 0.8431373, 1, 0, 1,
-0.8923512, -0.1082335, -0.1527755, 0.8352941, 1, 0, 1,
-0.8907205, 0.08758678, -3.553742, 0.8313726, 1, 0, 1,
-0.8906918, -0.3405054, -1.842055, 0.8235294, 1, 0, 1,
-0.88634, 1.258572, -0.2686433, 0.8196079, 1, 0, 1,
-0.8840572, -1.007111, -3.968298, 0.8117647, 1, 0, 1,
-0.8821412, -1.024225, -4.725632, 0.8078431, 1, 0, 1,
-0.8761399, -0.1491519, -2.471619, 0.8, 1, 0, 1,
-0.8739544, -1.330135, -2.301973, 0.7921569, 1, 0, 1,
-0.8693461, 2.554315, 0.3667368, 0.7882353, 1, 0, 1,
-0.8651549, -0.5582778, -5.447472, 0.7803922, 1, 0, 1,
-0.8648536, 0.8403013, 1.095097, 0.7764706, 1, 0, 1,
-0.8619225, -1.295578, -4.719272, 0.7686275, 1, 0, 1,
-0.8517154, 2.696791, -1.783357, 0.7647059, 1, 0, 1,
-0.8467247, -0.250615, -1.398291, 0.7568628, 1, 0, 1,
-0.8413371, -3.324172, -3.329307, 0.7529412, 1, 0, 1,
-0.8394485, -2.170761, -3.255188, 0.7450981, 1, 0, 1,
-0.8226918, -0.5114765, -2.556078, 0.7411765, 1, 0, 1,
-0.8176643, -0.4484801, -1.497581, 0.7333333, 1, 0, 1,
-0.8162782, 0.5697649, -1.914187, 0.7294118, 1, 0, 1,
-0.8148078, 0.3359615, -2.00382, 0.7215686, 1, 0, 1,
-0.8146685, 0.6277408, 0.2296924, 0.7176471, 1, 0, 1,
-0.8118669, -0.4727094, 0.1396955, 0.7098039, 1, 0, 1,
-0.8107482, 0.7444671, -1.772164, 0.7058824, 1, 0, 1,
-0.8104389, 0.8923879, 0.2848675, 0.6980392, 1, 0, 1,
-0.8092672, -0.4569166, -3.70287, 0.6901961, 1, 0, 1,
-0.8072248, -1.641459, -3.590438, 0.6862745, 1, 0, 1,
-0.8058628, -1.439098, -2.567537, 0.6784314, 1, 0, 1,
-0.8009762, -1.183667, -4.420825, 0.6745098, 1, 0, 1,
-0.7994589, -0.3284309, -2.352982, 0.6666667, 1, 0, 1,
-0.7960685, -0.8648526, -1.92135, 0.6627451, 1, 0, 1,
-0.7935565, 0.120649, -2.394759, 0.654902, 1, 0, 1,
-0.7885966, 3.04114, 0.4046194, 0.6509804, 1, 0, 1,
-0.7862104, 0.5819316, -1.786403, 0.6431373, 1, 0, 1,
-0.784968, -1.06052, -0.9119313, 0.6392157, 1, 0, 1,
-0.7847734, 0.850234, -2.113678, 0.6313726, 1, 0, 1,
-0.7843131, 0.2428089, -0.7907232, 0.627451, 1, 0, 1,
-0.7814363, 0.1797358, -4.101362, 0.6196079, 1, 0, 1,
-0.7798085, 1.103757, -1.021533, 0.6156863, 1, 0, 1,
-0.7797237, 0.7294178, -0.8222099, 0.6078432, 1, 0, 1,
-0.7739438, 0.2235337, -1.981968, 0.6039216, 1, 0, 1,
-0.7700245, 1.274641, -0.02153808, 0.5960785, 1, 0, 1,
-0.7695241, -0.5753098, -3.558422, 0.5882353, 1, 0, 1,
-0.7654787, 1.131589, -1.344197, 0.5843138, 1, 0, 1,
-0.7597268, -0.1415746, -1.009206, 0.5764706, 1, 0, 1,
-0.7536135, 1.263894, 1.517157, 0.572549, 1, 0, 1,
-0.7447134, 0.6070443, -1.702225, 0.5647059, 1, 0, 1,
-0.7323418, -0.4880437, -0.6394662, 0.5607843, 1, 0, 1,
-0.7312167, 1.054344, -2.005335, 0.5529412, 1, 0, 1,
-0.722977, -1.66188, -2.808699, 0.5490196, 1, 0, 1,
-0.7087087, 0.6278954, 0.3949058, 0.5411765, 1, 0, 1,
-0.7055706, 1.452955, -0.3814701, 0.5372549, 1, 0, 1,
-0.7034948, -1.032863, -3.62182, 0.5294118, 1, 0, 1,
-0.6996019, -0.158792, -1.763507, 0.5254902, 1, 0, 1,
-0.6967725, -0.5512084, -2.992779, 0.5176471, 1, 0, 1,
-0.6929103, -0.5445058, -2.876359, 0.5137255, 1, 0, 1,
-0.6909364, 0.2674224, -3.261754, 0.5058824, 1, 0, 1,
-0.6901865, 0.5414555, -1.375543, 0.5019608, 1, 0, 1,
-0.6849351, -0.1844751, -3.211248, 0.4941176, 1, 0, 1,
-0.6782284, 0.1614161, -2.685341, 0.4862745, 1, 0, 1,
-0.6766452, -1.186487, -1.455121, 0.4823529, 1, 0, 1,
-0.6728376, -1.647613, -2.670376, 0.4745098, 1, 0, 1,
-0.6678073, 0.1496603, -0.04664041, 0.4705882, 1, 0, 1,
-0.6625485, 2.279784, 0.3333341, 0.4627451, 1, 0, 1,
-0.6615079, 0.2465673, -1.593939, 0.4588235, 1, 0, 1,
-0.6584654, -3.025528, -1.919084, 0.4509804, 1, 0, 1,
-0.6528506, 2.11845, -0.08101497, 0.4470588, 1, 0, 1,
-0.6507926, -0.133721, -3.340172, 0.4392157, 1, 0, 1,
-0.6458667, -0.4588961, -2.88306, 0.4352941, 1, 0, 1,
-0.6448753, 1.315366, -0.08689061, 0.427451, 1, 0, 1,
-0.6411776, 0.7798113, -0.8182992, 0.4235294, 1, 0, 1,
-0.640249, 0.9782917, -1.531379, 0.4156863, 1, 0, 1,
-0.6318072, 0.2649644, -1.565381, 0.4117647, 1, 0, 1,
-0.6291823, -0.8818085, -1.676758, 0.4039216, 1, 0, 1,
-0.6241203, 0.7444149, -1.319226, 0.3960784, 1, 0, 1,
-0.6189601, -0.03077014, -1.633956, 0.3921569, 1, 0, 1,
-0.6068006, -0.1367645, -2.814902, 0.3843137, 1, 0, 1,
-0.5991176, -0.6958316, -1.911013, 0.3803922, 1, 0, 1,
-0.5970378, 0.8467695, -3.348799, 0.372549, 1, 0, 1,
-0.5956019, 2.457311, 0.8787351, 0.3686275, 1, 0, 1,
-0.5950564, -0.5971333, -1.763298, 0.3607843, 1, 0, 1,
-0.5907692, -0.7614534, -1.608985, 0.3568628, 1, 0, 1,
-0.5893495, -0.4181896, -2.712794, 0.3490196, 1, 0, 1,
-0.5861635, -0.6728194, -1.65282, 0.345098, 1, 0, 1,
-0.5806795, 2.131417, 1.028726, 0.3372549, 1, 0, 1,
-0.5785174, 0.9438629, 0.7037781, 0.3333333, 1, 0, 1,
-0.5748194, 0.4425776, -0.3333675, 0.3254902, 1, 0, 1,
-0.5732699, -1.769757, -2.101898, 0.3215686, 1, 0, 1,
-0.5708928, -1.691142, -2.386059, 0.3137255, 1, 0, 1,
-0.567664, -0.1436026, -2.528049, 0.3098039, 1, 0, 1,
-0.5639304, 0.1389692, -2.231926, 0.3019608, 1, 0, 1,
-0.5614038, -0.6436127, -0.9016809, 0.2941177, 1, 0, 1,
-0.5609449, 1.20567, 0.1091689, 0.2901961, 1, 0, 1,
-0.5582115, -1.767183, -2.11449, 0.282353, 1, 0, 1,
-0.5527966, -0.1385725, -1.888034, 0.2784314, 1, 0, 1,
-0.5517523, -0.5332838, -2.085069, 0.2705882, 1, 0, 1,
-0.5511694, -1.403972, -1.623163, 0.2666667, 1, 0, 1,
-0.5510932, -0.1795748, -2.622193, 0.2588235, 1, 0, 1,
-0.5505823, 1.273653, -1.094784, 0.254902, 1, 0, 1,
-0.5478671, 1.858607, 0.1793437, 0.2470588, 1, 0, 1,
-0.5441793, 0.41394, -1.024451, 0.2431373, 1, 0, 1,
-0.5416901, -0.1577149, -2.097333, 0.2352941, 1, 0, 1,
-0.5370293, 0.1479973, -1.076919, 0.2313726, 1, 0, 1,
-0.5357301, -0.3949445, -2.905915, 0.2235294, 1, 0, 1,
-0.5347701, 0.4760743, -1.141798, 0.2196078, 1, 0, 1,
-0.5339497, 1.459042, -2.045838, 0.2117647, 1, 0, 1,
-0.5306901, -1.436936, -0.9492438, 0.2078431, 1, 0, 1,
-0.5306543, -0.06597353, -1.068641, 0.2, 1, 0, 1,
-0.5287197, -0.3110987, -3.020723, 0.1921569, 1, 0, 1,
-0.5276604, -0.234569, -3.173977, 0.1882353, 1, 0, 1,
-0.5252426, -0.9416195, -2.945373, 0.1803922, 1, 0, 1,
-0.5215079, 1.932666, 0.4463022, 0.1764706, 1, 0, 1,
-0.5213181, -1.37189, -3.937603, 0.1686275, 1, 0, 1,
-0.5207384, 0.6082082, -3.213667, 0.1647059, 1, 0, 1,
-0.517775, 0.7156348, -0.4041037, 0.1568628, 1, 0, 1,
-0.5159767, -1.697845, -4.064634, 0.1529412, 1, 0, 1,
-0.5119586, -0.3945569, -2.875276, 0.145098, 1, 0, 1,
-0.5092312, -0.2614595, -2.704897, 0.1411765, 1, 0, 1,
-0.5089805, -0.6298993, -2.402352, 0.1333333, 1, 0, 1,
-0.505878, -0.002545057, -3.153755, 0.1294118, 1, 0, 1,
-0.5043474, 1.061274, -0.2456106, 0.1215686, 1, 0, 1,
-0.5031709, 0.1863305, -2.498638, 0.1176471, 1, 0, 1,
-0.4989099, -1.979228, -1.500361, 0.1098039, 1, 0, 1,
-0.4964621, 1.174761, 0.2506766, 0.1058824, 1, 0, 1,
-0.4879967, -0.5786272, -2.73183, 0.09803922, 1, 0, 1,
-0.4875156, -1.025665, -4.565187, 0.09019608, 1, 0, 1,
-0.4849598, 0.7081548, 0.7516459, 0.08627451, 1, 0, 1,
-0.4844124, -0.5531791, -2.414232, 0.07843138, 1, 0, 1,
-0.4835857, 0.9444007, -1.519666, 0.07450981, 1, 0, 1,
-0.4805943, 1.029556, -0.670881, 0.06666667, 1, 0, 1,
-0.4756533, 0.5625032, -1.067443, 0.0627451, 1, 0, 1,
-0.4748135, -0.9208106, -1.604967, 0.05490196, 1, 0, 1,
-0.4705497, -1.595985, -1.019496, 0.05098039, 1, 0, 1,
-0.466431, -0.1614894, -1.316633, 0.04313726, 1, 0, 1,
-0.4650895, -0.3732789, -2.107424, 0.03921569, 1, 0, 1,
-0.463379, -1.009355, -3.662135, 0.03137255, 1, 0, 1,
-0.4630665, 0.2886139, -0.6042233, 0.02745098, 1, 0, 1,
-0.4624296, 0.6368614, -0.4193108, 0.01960784, 1, 0, 1,
-0.4483717, -0.9454139, -3.419341, 0.01568628, 1, 0, 1,
-0.4442255, 2.093056, -0.08292302, 0.007843138, 1, 0, 1,
-0.4437829, 1.458103, 0.3201011, 0.003921569, 1, 0, 1,
-0.4436332, 0.3434461, -0.6134884, 0, 1, 0.003921569, 1,
-0.4417064, -1.918923, -2.440864, 0, 1, 0.01176471, 1,
-0.4386719, -1.204823, -2.344372, 0, 1, 0.01568628, 1,
-0.4344313, -0.8084244, -3.202644, 0, 1, 0.02352941, 1,
-0.4320668, -0.1287346, -1.940463, 0, 1, 0.02745098, 1,
-0.4319788, 0.7128517, -1.693729, 0, 1, 0.03529412, 1,
-0.4220372, -0.1763601, -1.058727, 0, 1, 0.03921569, 1,
-0.4208511, -0.05971253, 0.3242229, 0, 1, 0.04705882, 1,
-0.4197868, 0.1201912, -1.346826, 0, 1, 0.05098039, 1,
-0.4191274, -0.8277903, -2.241808, 0, 1, 0.05882353, 1,
-0.4184542, -0.06442015, -0.7872444, 0, 1, 0.0627451, 1,
-0.4148678, -0.653627, -1.730872, 0, 1, 0.07058824, 1,
-0.4102445, 0.1180188, -0.7530414, 0, 1, 0.07450981, 1,
-0.4075119, 0.6421356, 0.2121782, 0, 1, 0.08235294, 1,
-0.3959432, -0.6959791, -2.626424, 0, 1, 0.08627451, 1,
-0.3929307, 0.6622301, -0.6928262, 0, 1, 0.09411765, 1,
-0.3901931, -0.1679873, -1.492001, 0, 1, 0.1019608, 1,
-0.3899105, -1.235105, -2.980278, 0, 1, 0.1058824, 1,
-0.3873302, 0.6033932, -1.427731, 0, 1, 0.1137255, 1,
-0.3868342, -0.7376286, -1.654885, 0, 1, 0.1176471, 1,
-0.3867561, -0.6118013, -4.807771, 0, 1, 0.1254902, 1,
-0.3861978, 1.532463, -1.956934, 0, 1, 0.1294118, 1,
-0.3843241, 0.03631326, -0.4225001, 0, 1, 0.1372549, 1,
-0.3838658, 0.4771815, 1.042908, 0, 1, 0.1411765, 1,
-0.3742172, 0.5150952, -1.232398, 0, 1, 0.1490196, 1,
-0.3687792, -1.983123, -2.889979, 0, 1, 0.1529412, 1,
-0.3674363, 1.495234, -1.071803, 0, 1, 0.1607843, 1,
-0.3622831, -1.113333, -3.51902, 0, 1, 0.1647059, 1,
-0.3615599, 1.131062, 0.4660287, 0, 1, 0.172549, 1,
-0.3585097, 0.546453, -0.2103533, 0, 1, 0.1764706, 1,
-0.3583643, 0.3588056, -2.835409, 0, 1, 0.1843137, 1,
-0.3576161, -1.894608, -2.435074, 0, 1, 0.1882353, 1,
-0.3532487, 0.02318115, -2.432874, 0, 1, 0.1960784, 1,
-0.3496685, 0.03050219, -2.769444, 0, 1, 0.2039216, 1,
-0.3488935, 2.158834, 0.5076405, 0, 1, 0.2078431, 1,
-0.3424694, 1.934342, -0.2726419, 0, 1, 0.2156863, 1,
-0.3423529, 1.432133, 0.6248659, 0, 1, 0.2196078, 1,
-0.3411799, -0.780631, -2.966632, 0, 1, 0.227451, 1,
-0.3399702, -0.3200276, -1.730711, 0, 1, 0.2313726, 1,
-0.3386109, 0.8623809, 0.4793769, 0, 1, 0.2392157, 1,
-0.3363806, 0.4626662, 0.641858, 0, 1, 0.2431373, 1,
-0.3345621, -0.8513402, -3.637874, 0, 1, 0.2509804, 1,
-0.3305999, 0.5064539, -2.13397, 0, 1, 0.254902, 1,
-0.3279474, -0.4789879, -2.658283, 0, 1, 0.2627451, 1,
-0.32682, -0.6289975, -3.847951, 0, 1, 0.2666667, 1,
-0.3197531, 0.6520022, -0.6535246, 0, 1, 0.2745098, 1,
-0.3192688, 0.4679744, 1.476248, 0, 1, 0.2784314, 1,
-0.318846, 1.235821, 0.7832268, 0, 1, 0.2862745, 1,
-0.317073, -2.225481, -3.803014, 0, 1, 0.2901961, 1,
-0.311359, -0.5875448, -2.384911, 0, 1, 0.2980392, 1,
-0.3110406, 0.08551007, -0.7166908, 0, 1, 0.3058824, 1,
-0.3083365, -0.2576241, -1.356438, 0, 1, 0.3098039, 1,
-0.3069815, 1.197743, -0.2542412, 0, 1, 0.3176471, 1,
-0.306819, -0.7616983, -4.186759, 0, 1, 0.3215686, 1,
-0.3032764, 0.5975646, -0.5308855, 0, 1, 0.3294118, 1,
-0.2977065, 0.8944603, 1.299585, 0, 1, 0.3333333, 1,
-0.2966135, 0.4065717, -2.682902, 0, 1, 0.3411765, 1,
-0.2948184, 0.08620571, 0.1904155, 0, 1, 0.345098, 1,
-0.2903558, 0.6448632, 1.027739, 0, 1, 0.3529412, 1,
-0.2898401, -1.027132, -2.65896, 0, 1, 0.3568628, 1,
-0.2828473, -0.190671, -3.991164, 0, 1, 0.3647059, 1,
-0.2821468, -0.7827201, -4.357759, 0, 1, 0.3686275, 1,
-0.2814589, 0.1624864, -0.4386565, 0, 1, 0.3764706, 1,
-0.2812631, 0.6459116, -1.175709, 0, 1, 0.3803922, 1,
-0.280127, 0.3563068, -2.501009, 0, 1, 0.3882353, 1,
-0.2750093, -1.213921, -2.155696, 0, 1, 0.3921569, 1,
-0.2661993, 0.7479311, -0.3735176, 0, 1, 0.4, 1,
-0.2634943, 1.36551, -1.159157, 0, 1, 0.4078431, 1,
-0.2631366, 0.598811, 1.402653, 0, 1, 0.4117647, 1,
-0.262564, -0.660154, -4.722921, 0, 1, 0.4196078, 1,
-0.2617096, 1.585151, -0.0365307, 0, 1, 0.4235294, 1,
-0.2502812, -0.6141688, -2.44258, 0, 1, 0.4313726, 1,
-0.249626, 2.024985, 0.6276273, 0, 1, 0.4352941, 1,
-0.2448311, 1.337834, 0.7044294, 0, 1, 0.4431373, 1,
-0.2402495, 0.4323031, -1.395266, 0, 1, 0.4470588, 1,
-0.2401546, -0.7844433, -2.515172, 0, 1, 0.454902, 1,
-0.2328767, -1.011773, -2.168027, 0, 1, 0.4588235, 1,
-0.2325748, 1.839997, -0.4221003, 0, 1, 0.4666667, 1,
-0.2242019, -0.723276, -3.797234, 0, 1, 0.4705882, 1,
-0.2186258, 0.3615701, -2.284445, 0, 1, 0.4784314, 1,
-0.2160319, 0.01447375, 0.3957639, 0, 1, 0.4823529, 1,
-0.2152244, 1.208333, -1.292903, 0, 1, 0.4901961, 1,
-0.2132225, -0.1091217, -2.020194, 0, 1, 0.4941176, 1,
-0.21228, -1.749834, -4.420383, 0, 1, 0.5019608, 1,
-0.2073222, 0.4762757, -1.681297, 0, 1, 0.509804, 1,
-0.2056356, -0.3346965, -1.073556, 0, 1, 0.5137255, 1,
-0.2038351, -0.7790775, -2.91003, 0, 1, 0.5215687, 1,
-0.2017059, 0.2796608, -0.9355433, 0, 1, 0.5254902, 1,
-0.197366, -1.316333, -3.683116, 0, 1, 0.5333334, 1,
-0.195064, -0.8061028, -2.602435, 0, 1, 0.5372549, 1,
-0.1920834, -0.8664692, -4.259774, 0, 1, 0.5450981, 1,
-0.1890142, 1.490964, 0.6876261, 0, 1, 0.5490196, 1,
-0.1884684, -1.789075, -2.919099, 0, 1, 0.5568628, 1,
-0.1882744, 2.155408, 0.2143718, 0, 1, 0.5607843, 1,
-0.1859606, 0.5780087, 0.7265884, 0, 1, 0.5686275, 1,
-0.1832937, 1.155996, -0.8145819, 0, 1, 0.572549, 1,
-0.1819401, 1.380576, -0.7986479, 0, 1, 0.5803922, 1,
-0.180116, 1.788124, 0.4536953, 0, 1, 0.5843138, 1,
-0.1775817, -0.8303447, -3.00967, 0, 1, 0.5921569, 1,
-0.1750215, -0.9265987, -2.349615, 0, 1, 0.5960785, 1,
-0.1702581, 0.1835134, -2.997449, 0, 1, 0.6039216, 1,
-0.1694, 0.2200031, 0.2193876, 0, 1, 0.6117647, 1,
-0.1690068, 0.8548813, -1.51398, 0, 1, 0.6156863, 1,
-0.1682537, -0.03076588, -2.433636, 0, 1, 0.6235294, 1,
-0.1670264, -0.4188527, -4.654717, 0, 1, 0.627451, 1,
-0.166369, -0.6087237, -2.538047, 0, 1, 0.6352941, 1,
-0.1636223, -1.40108, -3.78941, 0, 1, 0.6392157, 1,
-0.1633603, 0.3036735, -0.4755923, 0, 1, 0.6470588, 1,
-0.160889, -1.233123, -2.782702, 0, 1, 0.6509804, 1,
-0.1579846, 0.8562827, -0.4363238, 0, 1, 0.6588235, 1,
-0.1507668, -0.1081159, -2.735395, 0, 1, 0.6627451, 1,
-0.1500802, -0.9338439, -2.216907, 0, 1, 0.6705883, 1,
-0.1474647, -0.2324511, -4.405286, 0, 1, 0.6745098, 1,
-0.1444217, -0.838138, -4.759964, 0, 1, 0.682353, 1,
-0.1439621, -1.189231, -4.305307, 0, 1, 0.6862745, 1,
-0.1389551, 0.01079251, -2.51998, 0, 1, 0.6941177, 1,
-0.1351174, -0.5883211, -1.474638, 0, 1, 0.7019608, 1,
-0.13163, 1.808767, -2.171467, 0, 1, 0.7058824, 1,
-0.1293533, -1.38465, -2.551764, 0, 1, 0.7137255, 1,
-0.1229134, -0.04329873, -2.547268, 0, 1, 0.7176471, 1,
-0.1162053, -0.4917478, -3.512192, 0, 1, 0.7254902, 1,
-0.1028736, 1.045374, 0.4316682, 0, 1, 0.7294118, 1,
-0.1011662, 0.01618621, -2.121149, 0, 1, 0.7372549, 1,
-0.09379788, 0.9701126, 0.3022182, 0, 1, 0.7411765, 1,
-0.09280302, 1.586866, 0.620501, 0, 1, 0.7490196, 1,
-0.09266807, -0.1530874, -3.064061, 0, 1, 0.7529412, 1,
-0.08785278, -0.7044145, -3.791511, 0, 1, 0.7607843, 1,
-0.08683359, 1.445889, -0.6037135, 0, 1, 0.7647059, 1,
-0.08459616, 0.2385351, -0.04366744, 0, 1, 0.772549, 1,
-0.08142874, 1.289969, -1.81193, 0, 1, 0.7764706, 1,
-0.08134774, 1.724827, 0.1927193, 0, 1, 0.7843137, 1,
-0.07734589, 1.539872, 1.42957, 0, 1, 0.7882353, 1,
-0.07490442, 0.3562016, -0.898993, 0, 1, 0.7960784, 1,
-0.07475464, -0.8049276, -3.602566, 0, 1, 0.8039216, 1,
-0.07455987, 0.2159917, 0.5354535, 0, 1, 0.8078431, 1,
-0.07298718, -0.8221352, -3.278413, 0, 1, 0.8156863, 1,
-0.0710054, 1.632719, 0.1030849, 0, 1, 0.8196079, 1,
-0.07082307, 0.3117827, 1.472134, 0, 1, 0.827451, 1,
-0.07005245, -0.5991353, -4.364394, 0, 1, 0.8313726, 1,
-0.06702966, 0.3009841, -1.065301, 0, 1, 0.8392157, 1,
-0.0643541, 2.077976, -1.130258, 0, 1, 0.8431373, 1,
-0.0609596, -1.426764, -3.46918, 0, 1, 0.8509804, 1,
-0.06086336, 0.685578, -0.8666373, 0, 1, 0.854902, 1,
-0.05657486, -0.72688, -2.354202, 0, 1, 0.8627451, 1,
-0.05598825, 0.588799, -0.8103774, 0, 1, 0.8666667, 1,
-0.05475689, -2.309599, -2.4951, 0, 1, 0.8745098, 1,
-0.05399496, 1.102868, 0.1408881, 0, 1, 0.8784314, 1,
-0.05024248, 1.239626, -1.912735, 0, 1, 0.8862745, 1,
-0.04785258, -0.05407785, -3.969959, 0, 1, 0.8901961, 1,
-0.04699991, -2.241117, -2.402451, 0, 1, 0.8980392, 1,
-0.04684238, -0.4082533, -2.754721, 0, 1, 0.9058824, 1,
-0.04470385, -0.4275208, -4.725984, 0, 1, 0.9098039, 1,
-0.03698347, 0.1887435, 0.02855186, 0, 1, 0.9176471, 1,
-0.03686782, 0.3942179, 0.3577558, 0, 1, 0.9215686, 1,
-0.03489123, 0.1462704, -0.4643317, 0, 1, 0.9294118, 1,
-0.02976879, -0.324877, -2.875944, 0, 1, 0.9333333, 1,
-0.02719283, 0.08620328, 1.056271, 0, 1, 0.9411765, 1,
-0.02477614, -0.7296519, -4.123657, 0, 1, 0.945098, 1,
-0.02323206, 0.4820777, -0.3632036, 0, 1, 0.9529412, 1,
-0.0228813, 1.204843, -0.4674391, 0, 1, 0.9568627, 1,
-0.02038242, 1.548023, 0.9333708, 0, 1, 0.9647059, 1,
-0.02011169, 1.178041, -0.3926993, 0, 1, 0.9686275, 1,
-0.01895472, -0.7776284, -3.705077, 0, 1, 0.9764706, 1,
-0.01881055, -0.3596038, -3.970016, 0, 1, 0.9803922, 1,
-0.01785951, 0.4975866, 0.09743257, 0, 1, 0.9882353, 1,
-0.01623636, 0.6667611, -0.4255164, 0, 1, 0.9921569, 1,
-0.01530784, 0.3140908, 0.6839284, 0, 1, 1, 1,
-0.01314307, 0.4794541, 0.4367091, 0, 0.9921569, 1, 1,
-0.01098717, 0.2055509, 0.4278736, 0, 0.9882353, 1, 1,
-0.009475744, -0.1173756, -2.690516, 0, 0.9803922, 1, 1,
-0.005319972, 2.098255, 0.2617452, 0, 0.9764706, 1, 1,
-0.004291823, -0.9047876, -3.206306, 0, 0.9686275, 1, 1,
-0.002402131, 0.4346609, -0.6023899, 0, 0.9647059, 1, 1,
0.01275303, 0.03884799, 1.870616, 0, 0.9568627, 1, 1,
0.01388595, 0.5250825, 0.4915861, 0, 0.9529412, 1, 1,
0.01409688, -0.8411899, 3.712394, 0, 0.945098, 1, 1,
0.01574988, 0.5043187, 2.112108, 0, 0.9411765, 1, 1,
0.0175258, 0.9756155, 3.019122, 0, 0.9333333, 1, 1,
0.02381931, 0.1088148, 1.804464, 0, 0.9294118, 1, 1,
0.02702431, -0.5990987, 2.976933, 0, 0.9215686, 1, 1,
0.02733435, -0.4610216, 1.731856, 0, 0.9176471, 1, 1,
0.02852398, -0.3191152, 3.787248, 0, 0.9098039, 1, 1,
0.03484298, -0.07429971, 2.713617, 0, 0.9058824, 1, 1,
0.03573351, 0.4343014, 0.9804096, 0, 0.8980392, 1, 1,
0.03661626, 1.653292, -1.213475, 0, 0.8901961, 1, 1,
0.0371727, 1.584198, -0.1343711, 0, 0.8862745, 1, 1,
0.0413552, 0.4951447, -0.3817222, 0, 0.8784314, 1, 1,
0.04402209, 0.1300937, -0.6797335, 0, 0.8745098, 1, 1,
0.04457953, 0.6979857, -0.3062204, 0, 0.8666667, 1, 1,
0.04702348, -0.3574347, 3.349376, 0, 0.8627451, 1, 1,
0.05131354, -1.863434, 2.126439, 0, 0.854902, 1, 1,
0.05425597, -0.02749636, 4.20135, 0, 0.8509804, 1, 1,
0.0613975, 2.224094, 2.2973, 0, 0.8431373, 1, 1,
0.06144724, -0.9343852, 3.095903, 0, 0.8392157, 1, 1,
0.06480502, -1.845117, 3.137831, 0, 0.8313726, 1, 1,
0.06606739, -0.8263139, 4.244914, 0, 0.827451, 1, 1,
0.07006621, 1.038507, -1.132573, 0, 0.8196079, 1, 1,
0.07124624, 0.9580371, -0.8242782, 0, 0.8156863, 1, 1,
0.07248826, -0.6053396, 2.821547, 0, 0.8078431, 1, 1,
0.07632377, -2.186891, 0.9541584, 0, 0.8039216, 1, 1,
0.07885772, 0.6035082, 1.376465, 0, 0.7960784, 1, 1,
0.08170897, 0.1040963, 0.656952, 0, 0.7882353, 1, 1,
0.08483233, 0.1386049, 1.632117, 0, 0.7843137, 1, 1,
0.086656, -0.5221889, 2.190329, 0, 0.7764706, 1, 1,
0.09071538, 1.55372, 0.4009559, 0, 0.772549, 1, 1,
0.0946392, -1.023511, 2.19287, 0, 0.7647059, 1, 1,
0.09529766, -0.5686846, 2.815883, 0, 0.7607843, 1, 1,
0.1032792, 0.007095856, 2.651503, 0, 0.7529412, 1, 1,
0.1035343, 1.174726, 0.1571184, 0, 0.7490196, 1, 1,
0.104292, 1.755157, -0.1711362, 0, 0.7411765, 1, 1,
0.1061029, -0.06065493, 1.967018, 0, 0.7372549, 1, 1,
0.1100572, -0.6851416, 1.965937, 0, 0.7294118, 1, 1,
0.1173353, -0.3192632, 2.927124, 0, 0.7254902, 1, 1,
0.1189063, 0.2935672, -0.3143093, 0, 0.7176471, 1, 1,
0.1191655, 1.311605, 1.646354, 0, 0.7137255, 1, 1,
0.1219196, 0.2578106, 0.1821493, 0, 0.7058824, 1, 1,
0.1222997, 1.432196, 0.7223532, 0, 0.6980392, 1, 1,
0.1277505, 0.6664921, -1.56134, 0, 0.6941177, 1, 1,
0.1287694, 0.5637434, 0.03254575, 0, 0.6862745, 1, 1,
0.1306505, -0.8303307, 3.592238, 0, 0.682353, 1, 1,
0.1317377, 0.8138838, 0.1913972, 0, 0.6745098, 1, 1,
0.1317878, 0.04278306, 1.110274, 0, 0.6705883, 1, 1,
0.1336519, -0.8546041, 4.243894, 0, 0.6627451, 1, 1,
0.1345327, 0.4991031, -1.412142, 0, 0.6588235, 1, 1,
0.1350061, -1.831881, 4.481102, 0, 0.6509804, 1, 1,
0.13572, -0.2613461, 2.742517, 0, 0.6470588, 1, 1,
0.1364913, 0.7179345, 0.09647589, 0, 0.6392157, 1, 1,
0.1424631, 0.4752351, 0.1410223, 0, 0.6352941, 1, 1,
0.142702, -0.9358601, 3.391044, 0, 0.627451, 1, 1,
0.1441222, -0.7875463, 4.471223, 0, 0.6235294, 1, 1,
0.1448037, -0.5116398, 2.776105, 0, 0.6156863, 1, 1,
0.1476332, 0.08249284, 0.03365416, 0, 0.6117647, 1, 1,
0.1486454, 0.4582494, -0.7625984, 0, 0.6039216, 1, 1,
0.1517828, -0.566232, 3.095797, 0, 0.5960785, 1, 1,
0.1524536, 0.7898584, 1.853598, 0, 0.5921569, 1, 1,
0.1537349, -1.140947, 4.666002, 0, 0.5843138, 1, 1,
0.1557139, 1.499371, 0.2464592, 0, 0.5803922, 1, 1,
0.1563811, 0.5139235, 0.03901392, 0, 0.572549, 1, 1,
0.1591414, -0.4318522, 2.384104, 0, 0.5686275, 1, 1,
0.1596286, -0.4405426, 3.744872, 0, 0.5607843, 1, 1,
0.1607955, -1.183043, 1.666442, 0, 0.5568628, 1, 1,
0.1629009, -1.166345, 3.894568, 0, 0.5490196, 1, 1,
0.1634804, 0.5765338, -0.2542781, 0, 0.5450981, 1, 1,
0.1645501, -0.8326095, 1.319367, 0, 0.5372549, 1, 1,
0.1645805, -1.207855, 2.03118, 0, 0.5333334, 1, 1,
0.1650065, 1.325668, -0.1864766, 0, 0.5254902, 1, 1,
0.1667004, 0.6732291, -0.8829305, 0, 0.5215687, 1, 1,
0.1676235, -0.9890228, 2.720873, 0, 0.5137255, 1, 1,
0.1686981, 0.6847544, 0.4443594, 0, 0.509804, 1, 1,
0.169111, 1.342336, 2.001859, 0, 0.5019608, 1, 1,
0.1709522, -0.9294958, 3.736806, 0, 0.4941176, 1, 1,
0.1719892, -0.1678759, 3.167932, 0, 0.4901961, 1, 1,
0.1732578, 1.178692, 0.1077537, 0, 0.4823529, 1, 1,
0.1735419, 0.6221592, 0.5227831, 0, 0.4784314, 1, 1,
0.1743967, 0.2883404, -0.1659861, 0, 0.4705882, 1, 1,
0.1777896, 0.9532416, -0.6215802, 0, 0.4666667, 1, 1,
0.1809163, -0.7707257, 2.861963, 0, 0.4588235, 1, 1,
0.1846442, 0.1147655, 1.595419, 0, 0.454902, 1, 1,
0.1846986, 0.8038988, -0.4169254, 0, 0.4470588, 1, 1,
0.1920161, 2.39816, 0.07776436, 0, 0.4431373, 1, 1,
0.1944621, -0.1817037, 2.17789, 0, 0.4352941, 1, 1,
0.1947837, 0.973711, -0.6249863, 0, 0.4313726, 1, 1,
0.1985376, -0.2656321, 2.888272, 0, 0.4235294, 1, 1,
0.2010272, 0.7782805, 1.324201, 0, 0.4196078, 1, 1,
0.2027701, -1.525146, 3.226508, 0, 0.4117647, 1, 1,
0.2072966, -0.1474227, 1.091042, 0, 0.4078431, 1, 1,
0.2075855, 0.4469439, 1.83368, 0, 0.4, 1, 1,
0.2076189, -0.7570038, 2.340029, 0, 0.3921569, 1, 1,
0.2089592, -1.20101, 3.617029, 0, 0.3882353, 1, 1,
0.2093483, 1.745516, 0.2359119, 0, 0.3803922, 1, 1,
0.2191037, 0.4900203, -0.5141151, 0, 0.3764706, 1, 1,
0.221045, 0.0326378, 0.69583, 0, 0.3686275, 1, 1,
0.2230638, 0.4513802, 1.260869, 0, 0.3647059, 1, 1,
0.2243879, 0.1566974, 2.015598, 0, 0.3568628, 1, 1,
0.2296361, 0.7717496, 0.4882955, 0, 0.3529412, 1, 1,
0.2373508, 1.755903, 1.684946, 0, 0.345098, 1, 1,
0.2420113, -0.9548581, 1.368076, 0, 0.3411765, 1, 1,
0.2503424, -0.3613085, 0.9762575, 0, 0.3333333, 1, 1,
0.2519206, -0.1943865, 3.776172, 0, 0.3294118, 1, 1,
0.2551472, -1.440428, 3.795627, 0, 0.3215686, 1, 1,
0.2565441, -2.837815, 1.949758, 0, 0.3176471, 1, 1,
0.2575611, -0.548825, 0.999698, 0, 0.3098039, 1, 1,
0.2677799, -1.875801, 2.948254, 0, 0.3058824, 1, 1,
0.2687192, -1.598169, 3.244367, 0, 0.2980392, 1, 1,
0.2700508, -1.973377, 3.771591, 0, 0.2901961, 1, 1,
0.2717041, 0.8149756, 0.5210289, 0, 0.2862745, 1, 1,
0.2727347, -0.7579769, 3.490237, 0, 0.2784314, 1, 1,
0.2747664, 0.2882964, 0.3058565, 0, 0.2745098, 1, 1,
0.2773804, -0.1181709, 0.2175174, 0, 0.2666667, 1, 1,
0.2774229, -0.9173563, 2.624689, 0, 0.2627451, 1, 1,
0.2784973, 0.1974244, 0.9785687, 0, 0.254902, 1, 1,
0.2794386, 0.5451165, 1.401685, 0, 0.2509804, 1, 1,
0.2817527, 2.665245, -0.1232031, 0, 0.2431373, 1, 1,
0.2844732, 0.4852394, -2.033416, 0, 0.2392157, 1, 1,
0.2941708, -1.142986, 3.241556, 0, 0.2313726, 1, 1,
0.2963757, 0.9810472, -1.49481, 0, 0.227451, 1, 1,
0.2983369, 0.9801149, -0.5285729, 0, 0.2196078, 1, 1,
0.3035555, 1.222972, -0.5793095, 0, 0.2156863, 1, 1,
0.3038366, -0.9190491, 1.811252, 0, 0.2078431, 1, 1,
0.3120764, -1.485462, 3.681133, 0, 0.2039216, 1, 1,
0.312261, 0.5562848, -0.0210269, 0, 0.1960784, 1, 1,
0.3135502, -0.5336304, 1.970503, 0, 0.1882353, 1, 1,
0.3153586, -0.2012106, 1.708386, 0, 0.1843137, 1, 1,
0.315859, 0.04597623, 0.7308285, 0, 0.1764706, 1, 1,
0.3165002, 1.558817, 1.508663, 0, 0.172549, 1, 1,
0.3176814, 0.1916575, -1.069888, 0, 0.1647059, 1, 1,
0.3178968, 0.5607132, 0.6169899, 0, 0.1607843, 1, 1,
0.3198059, -0.7386522, 1.847959, 0, 0.1529412, 1, 1,
0.3232267, 1.36491, -0.4872054, 0, 0.1490196, 1, 1,
0.3287239, -1.599213, 3.915104, 0, 0.1411765, 1, 1,
0.3297134, 0.9486843, 0.5773335, 0, 0.1372549, 1, 1,
0.3308557, 0.9312925, 0.2878596, 0, 0.1294118, 1, 1,
0.3311251, 1.979144, 1.089305, 0, 0.1254902, 1, 1,
0.3313241, 0.1627663, 0.01609047, 0, 0.1176471, 1, 1,
0.3345189, 1.08084, 0.1066463, 0, 0.1137255, 1, 1,
0.3346434, -0.8244362, 2.899088, 0, 0.1058824, 1, 1,
0.3421198, -1.397437, 2.485565, 0, 0.09803922, 1, 1,
0.3466628, 0.7125005, 0.7008587, 0, 0.09411765, 1, 1,
0.3472319, 1.064734, -0.6633311, 0, 0.08627451, 1, 1,
0.3497696, 0.6997781, 0.2886455, 0, 0.08235294, 1, 1,
0.3530789, -0.9476026, 1.870452, 0, 0.07450981, 1, 1,
0.3561253, 1.442265, -0.3291279, 0, 0.07058824, 1, 1,
0.3631254, 0.3252195, 1.007709, 0, 0.0627451, 1, 1,
0.3645478, -2.010153, 3.463985, 0, 0.05882353, 1, 1,
0.3709883, 0.1244864, 1.241556, 0, 0.05098039, 1, 1,
0.3710844, -0.3441802, 2.140004, 0, 0.04705882, 1, 1,
0.3715363, 0.1919537, 1.459772, 0, 0.03921569, 1, 1,
0.3746499, 0.2541183, 1.078712, 0, 0.03529412, 1, 1,
0.3749543, 0.7452061, 0.9416561, 0, 0.02745098, 1, 1,
0.3752621, -1.373931, 2.389939, 0, 0.02352941, 1, 1,
0.3815928, -0.9519314, 3.32462, 0, 0.01568628, 1, 1,
0.3832807, -0.8058627, 2.113098, 0, 0.01176471, 1, 1,
0.3847025, -0.4287318, 2.247041, 0, 0.003921569, 1, 1,
0.3884666, 0.821951, 0.6508114, 0.003921569, 0, 1, 1,
0.3886848, -1.233555, 2.316691, 0.007843138, 0, 1, 1,
0.3899439, -1.21404, 3.889136, 0.01568628, 0, 1, 1,
0.394261, 1.159577, 0.4868415, 0.01960784, 0, 1, 1,
0.3942794, 0.4614002, 0.9037405, 0.02745098, 0, 1, 1,
0.3959299, -0.6435384, 1.817551, 0.03137255, 0, 1, 1,
0.3970099, 0.6972399, 0.4419857, 0.03921569, 0, 1, 1,
0.3973799, -0.4405964, 1.826805, 0.04313726, 0, 1, 1,
0.4033588, -0.8503131, 3.219621, 0.05098039, 0, 1, 1,
0.404369, -1.011511, 4.310625, 0.05490196, 0, 1, 1,
0.4079909, 2.175309, 1.051758, 0.0627451, 0, 1, 1,
0.4113595, 0.5737927, 0.2575836, 0.06666667, 0, 1, 1,
0.4171096, 0.3034157, 2.51062, 0.07450981, 0, 1, 1,
0.4227528, -1.685438, 3.619638, 0.07843138, 0, 1, 1,
0.4252124, -0.4799926, 1.755163, 0.08627451, 0, 1, 1,
0.4295122, 1.178, -0.9263299, 0.09019608, 0, 1, 1,
0.429879, 1.730937, -0.5770909, 0.09803922, 0, 1, 1,
0.4324329, 0.3386046, 1.184259, 0.1058824, 0, 1, 1,
0.4335919, 0.05015077, 0.1181898, 0.1098039, 0, 1, 1,
0.4342948, 0.6744346, 0.2250001, 0.1176471, 0, 1, 1,
0.4356494, -0.8225039, 2.20236, 0.1215686, 0, 1, 1,
0.4390477, 1.663436, 0.5378512, 0.1294118, 0, 1, 1,
0.4421476, -0.06690068, 1.814755, 0.1333333, 0, 1, 1,
0.4425226, 0.8931985, 0.7792835, 0.1411765, 0, 1, 1,
0.4469393, -1.647343, 4.71946, 0.145098, 0, 1, 1,
0.4490172, -0.3671622, 1.699178, 0.1529412, 0, 1, 1,
0.450479, 1.273378, 1.650355, 0.1568628, 0, 1, 1,
0.4514098, 1.017514, 0.1007701, 0.1647059, 0, 1, 1,
0.4533352, 0.5086163, 1.771864, 0.1686275, 0, 1, 1,
0.4556483, -2.017406, 4.595737, 0.1764706, 0, 1, 1,
0.4676926, -0.5230194, 2.955345, 0.1803922, 0, 1, 1,
0.4689218, 1.21344, 2.344265, 0.1882353, 0, 1, 1,
0.4706886, -0.8272173, 3.471187, 0.1921569, 0, 1, 1,
0.4727101, 0.415628, 0.2969086, 0.2, 0, 1, 1,
0.4728802, 1.941301, 0.2627396, 0.2078431, 0, 1, 1,
0.4739525, 0.1387504, 0.7601654, 0.2117647, 0, 1, 1,
0.4751465, -0.1974777, 2.968549, 0.2196078, 0, 1, 1,
0.4754432, 1.987789, -0.5270275, 0.2235294, 0, 1, 1,
0.4764218, 0.2448981, 1.545158, 0.2313726, 0, 1, 1,
0.4765818, -0.3144243, -0.08546366, 0.2352941, 0, 1, 1,
0.4771374, 0.4475201, 1.84267, 0.2431373, 0, 1, 1,
0.4807572, -0.3297915, 2.768437, 0.2470588, 0, 1, 1,
0.4827268, 0.4122217, 1.073108, 0.254902, 0, 1, 1,
0.4863168, -1.161932, 2.054613, 0.2588235, 0, 1, 1,
0.488766, -1.032168, 2.729653, 0.2666667, 0, 1, 1,
0.4890573, -1.785734, 2.042234, 0.2705882, 0, 1, 1,
0.4920548, 0.4032137, 1.550937, 0.2784314, 0, 1, 1,
0.495221, 1.231761, 2.785653, 0.282353, 0, 1, 1,
0.4995646, 2.164013, 0.2133217, 0.2901961, 0, 1, 1,
0.4998507, 0.4638904, 0.4972157, 0.2941177, 0, 1, 1,
0.503178, 0.5989373, 0.7311455, 0.3019608, 0, 1, 1,
0.5052482, 0.6121704, 1.050726, 0.3098039, 0, 1, 1,
0.5094333, -0.7714346, 3.983026, 0.3137255, 0, 1, 1,
0.5118105, -1.015328, 2.285563, 0.3215686, 0, 1, 1,
0.5122104, 1.480049, 0.5396025, 0.3254902, 0, 1, 1,
0.5134922, 0.0136819, 1.553087, 0.3333333, 0, 1, 1,
0.5165412, -0.1989615, 2.96828, 0.3372549, 0, 1, 1,
0.5187938, -0.2420682, 3.398132, 0.345098, 0, 1, 1,
0.5200011, 1.827114, -0.08792946, 0.3490196, 0, 1, 1,
0.5214632, -1.289951, 3.177391, 0.3568628, 0, 1, 1,
0.5248321, 2.556176, -0.4962086, 0.3607843, 0, 1, 1,
0.5331025, -0.6887854, 1.592066, 0.3686275, 0, 1, 1,
0.5332754, -0.5030005, 2.134318, 0.372549, 0, 1, 1,
0.547786, 0.2036319, -0.08823824, 0.3803922, 0, 1, 1,
0.5478833, 0.4539508, 0.5973553, 0.3843137, 0, 1, 1,
0.5504004, -1.218526, 2.171746, 0.3921569, 0, 1, 1,
0.5538794, -0.6488216, 1.133565, 0.3960784, 0, 1, 1,
0.5547787, -0.9200994, 3.136369, 0.4039216, 0, 1, 1,
0.5572518, -0.3348959, 1.167679, 0.4117647, 0, 1, 1,
0.5610615, -1.466917, 2.408149, 0.4156863, 0, 1, 1,
0.5660383, 1.239418, -0.1662157, 0.4235294, 0, 1, 1,
0.5702664, -0.6988515, 3.049134, 0.427451, 0, 1, 1,
0.5710272, 1.178103, 0.4240128, 0.4352941, 0, 1, 1,
0.5713872, -0.257301, 1.26536, 0.4392157, 0, 1, 1,
0.5736514, -1.493966, 1.756593, 0.4470588, 0, 1, 1,
0.5737731, 0.1938281, 3.2888, 0.4509804, 0, 1, 1,
0.5805144, -0.7128533, 2.544667, 0.4588235, 0, 1, 1,
0.5889606, -0.2193591, 2.304405, 0.4627451, 0, 1, 1,
0.5905318, 1.270826, -0.1537979, 0.4705882, 0, 1, 1,
0.5922664, -0.1106787, 1.396763, 0.4745098, 0, 1, 1,
0.5990526, -0.3180056, 2.774383, 0.4823529, 0, 1, 1,
0.5999367, -1.534182, 3.411936, 0.4862745, 0, 1, 1,
0.6018174, -0.3075491, 2.821279, 0.4941176, 0, 1, 1,
0.6019993, -0.09542924, 1.154324, 0.5019608, 0, 1, 1,
0.6042961, 1.489858, -0.03383843, 0.5058824, 0, 1, 1,
0.6091803, 0.01145198, 0.3652467, 0.5137255, 0, 1, 1,
0.6112317, -0.7462736, 3.872145, 0.5176471, 0, 1, 1,
0.6147975, -1.287969, 2.445837, 0.5254902, 0, 1, 1,
0.617027, -0.8377254, 3.64069, 0.5294118, 0, 1, 1,
0.6196087, -0.8556105, 2.364051, 0.5372549, 0, 1, 1,
0.6230242, 0.6395859, 1.496368, 0.5411765, 0, 1, 1,
0.6253412, -1.042471, 2.641958, 0.5490196, 0, 1, 1,
0.6258987, -0.5080355, 3.417701, 0.5529412, 0, 1, 1,
0.628049, 1.995296, -0.8129463, 0.5607843, 0, 1, 1,
0.6298066, 1.670892, -0.2770677, 0.5647059, 0, 1, 1,
0.6349949, 1.146886, 0.3219506, 0.572549, 0, 1, 1,
0.6356337, 1.087353, -0.6419608, 0.5764706, 0, 1, 1,
0.6401979, -0.511597, 1.715132, 0.5843138, 0, 1, 1,
0.6436818, -0.1797873, 0.2007719, 0.5882353, 0, 1, 1,
0.6508289, 0.36676, 1.517854, 0.5960785, 0, 1, 1,
0.6513634, 1.523516, 0.7099665, 0.6039216, 0, 1, 1,
0.6542926, 1.499306, 0.04730372, 0.6078432, 0, 1, 1,
0.6553468, 1.369976, 0.1764463, 0.6156863, 0, 1, 1,
0.6587886, -1.686656, 2.191402, 0.6196079, 0, 1, 1,
0.6592421, 0.2546024, 0.5651423, 0.627451, 0, 1, 1,
0.664331, 0.162334, 2.718742, 0.6313726, 0, 1, 1,
0.6656592, -0.8697159, 1.931927, 0.6392157, 0, 1, 1,
0.6703754, -0.4464214, 3.063119, 0.6431373, 0, 1, 1,
0.6897864, -0.3407038, 3.117954, 0.6509804, 0, 1, 1,
0.6900207, -0.03442195, 3.185451, 0.654902, 0, 1, 1,
0.6951151, 0.7776492, 0.7751696, 0.6627451, 0, 1, 1,
0.7000099, -1.810136, 3.129775, 0.6666667, 0, 1, 1,
0.7024059, -0.1737592, 3.548181, 0.6745098, 0, 1, 1,
0.7026933, 0.7711371, 0.5832596, 0.6784314, 0, 1, 1,
0.7068217, 0.867704, 0.02023153, 0.6862745, 0, 1, 1,
0.7104646, 1.977816, -0.2663598, 0.6901961, 0, 1, 1,
0.7120597, 0.3087805, 1.721282, 0.6980392, 0, 1, 1,
0.7134075, -0.9803582, 2.126306, 0.7058824, 0, 1, 1,
0.719848, -0.3418268, 2.25396, 0.7098039, 0, 1, 1,
0.7206163, -0.6463701, 1.330426, 0.7176471, 0, 1, 1,
0.7233806, -0.1890919, 2.155319, 0.7215686, 0, 1, 1,
0.7349325, -2.043808, 2.563154, 0.7294118, 0, 1, 1,
0.7425671, 0.6936539, 1.455176, 0.7333333, 0, 1, 1,
0.7461793, -0.3826748, 1.364748, 0.7411765, 0, 1, 1,
0.7464207, 0.4710218, 0.7457433, 0.7450981, 0, 1, 1,
0.7519257, 0.8418078, 2.225444, 0.7529412, 0, 1, 1,
0.7618638, -1.307296, 2.47914, 0.7568628, 0, 1, 1,
0.7625965, 0.4501898, 2.190719, 0.7647059, 0, 1, 1,
0.7636341, -0.6521187, 3.541349, 0.7686275, 0, 1, 1,
0.764111, -1.992184, 4.65452, 0.7764706, 0, 1, 1,
0.7676873, -1.447685, 2.802345, 0.7803922, 0, 1, 1,
0.7761037, -0.3250961, -0.1247794, 0.7882353, 0, 1, 1,
0.7775886, -1.424292, 2.434203, 0.7921569, 0, 1, 1,
0.7788118, 0.1454287, 2.89442, 0.8, 0, 1, 1,
0.7888711, -0.9273468, 1.982274, 0.8078431, 0, 1, 1,
0.7908903, 1.94471, -1.975435, 0.8117647, 0, 1, 1,
0.7932978, -1.866977, 2.144906, 0.8196079, 0, 1, 1,
0.8012385, 1.453536, 0.2066814, 0.8235294, 0, 1, 1,
0.8114177, 1.877653, 0.3558889, 0.8313726, 0, 1, 1,
0.8116528, -1.679092, 3.368065, 0.8352941, 0, 1, 1,
0.8163567, -1.018899, 2.750209, 0.8431373, 0, 1, 1,
0.8182669, -1.568555, 2.976269, 0.8470588, 0, 1, 1,
0.8191394, -1.067181, 1.968171, 0.854902, 0, 1, 1,
0.8292325, -0.136903, 1.389354, 0.8588235, 0, 1, 1,
0.8447919, -0.7491403, 2.098616, 0.8666667, 0, 1, 1,
0.8504963, -1.235626, 2.47308, 0.8705882, 0, 1, 1,
0.8604684, -0.9168562, 1.387822, 0.8784314, 0, 1, 1,
0.8608971, -1.357187, 0.8669763, 0.8823529, 0, 1, 1,
0.8621765, 0.6497769, 1.346623, 0.8901961, 0, 1, 1,
0.8629013, 0.7036521, -0.3046992, 0.8941177, 0, 1, 1,
0.8769127, -0.3996259, 1.856866, 0.9019608, 0, 1, 1,
0.8913094, 0.8584417, 1.29843, 0.9098039, 0, 1, 1,
0.8935744, -2.417775, 2.30912, 0.9137255, 0, 1, 1,
0.8961484, 0.05675326, 2.26968, 0.9215686, 0, 1, 1,
0.9140328, 0.7031335, 1.940818, 0.9254902, 0, 1, 1,
0.9254543, 1.961528, 0.4734475, 0.9333333, 0, 1, 1,
0.9277849, 0.4468012, -0.02029746, 0.9372549, 0, 1, 1,
0.9284583, -1.350985, 1.747561, 0.945098, 0, 1, 1,
0.9345995, -2.521171, 1.085456, 0.9490196, 0, 1, 1,
0.9346707, -1.704463, 3.95897, 0.9568627, 0, 1, 1,
0.9376141, 0.1047361, 0.7973493, 0.9607843, 0, 1, 1,
0.9420453, 0.6140295, 0.2868373, 0.9686275, 0, 1, 1,
0.957398, 0.1236678, 2.71413, 0.972549, 0, 1, 1,
0.9580908, -0.6521524, 2.053477, 0.9803922, 0, 1, 1,
0.9589987, -0.7613886, 2.097864, 0.9843137, 0, 1, 1,
0.9610463, 0.1069251, 2.038326, 0.9921569, 0, 1, 1,
0.9646699, 0.2812618, 2.553137, 0.9960784, 0, 1, 1,
0.9695022, -0.7330121, 2.874, 1, 0, 0.9960784, 1,
0.9719066, 0.138951, -0.7460514, 1, 0, 0.9882353, 1,
0.9736622, 1.550662, 0.146065, 1, 0, 0.9843137, 1,
0.9756023, -1.385499, 1.904128, 1, 0, 0.9764706, 1,
0.984489, 0.3725679, 1.8653, 1, 0, 0.972549, 1,
0.987386, 1.102631, -0.7535329, 1, 0, 0.9647059, 1,
0.9929155, -0.5490352, 1.66256, 1, 0, 0.9607843, 1,
0.9940129, -0.2690269, 1.372587, 1, 0, 0.9529412, 1,
0.9947079, -0.9218705, 3.071641, 1, 0, 0.9490196, 1,
0.9972609, -0.6968118, 2.057003, 1, 0, 0.9411765, 1,
0.9997815, 1.42408, -0.00558701, 1, 0, 0.9372549, 1,
0.9999545, 0.8039424, 0.6639787, 1, 0, 0.9294118, 1,
1.0032, -0.06852334, 3.312105, 1, 0, 0.9254902, 1,
1.010092, -0.08826096, 0.8241174, 1, 0, 0.9176471, 1,
1.011327, 0.137178, 1.597667, 1, 0, 0.9137255, 1,
1.01178, 0.0581319, 1.281378, 1, 0, 0.9058824, 1,
1.014886, -2.717198, 2.644471, 1, 0, 0.9019608, 1,
1.018264, -1.057604, 0.7584008, 1, 0, 0.8941177, 1,
1.023959, -0.9259974, 1.161788, 1, 0, 0.8862745, 1,
1.02812, -0.115379, 1.344256, 1, 0, 0.8823529, 1,
1.036347, 0.2387231, 1.701435, 1, 0, 0.8745098, 1,
1.037501, 0.1196344, 3.019168, 1, 0, 0.8705882, 1,
1.042447, -0.2307763, 1.87482, 1, 0, 0.8627451, 1,
1.04369, 1.148111, 2.535334, 1, 0, 0.8588235, 1,
1.049871, 0.804463, 0.1201476, 1, 0, 0.8509804, 1,
1.052681, 1.580423, -1.857664, 1, 0, 0.8470588, 1,
1.059882, 0.6169018, 2.190142, 1, 0, 0.8392157, 1,
1.066449, -0.6802659, 0.9044235, 1, 0, 0.8352941, 1,
1.066759, 0.6730557, 0.7943113, 1, 0, 0.827451, 1,
1.067422, -1.410379, 0.7701337, 1, 0, 0.8235294, 1,
1.069626, 0.5488409, 1.696343, 1, 0, 0.8156863, 1,
1.076046, -0.939251, 2.45707, 1, 0, 0.8117647, 1,
1.078298, 0.01748337, 3.717705, 1, 0, 0.8039216, 1,
1.079855, 0.4927195, 0.01865864, 1, 0, 0.7960784, 1,
1.090412, -0.7589532, 1.707374, 1, 0, 0.7921569, 1,
1.091394, -1.116155, 2.181596, 1, 0, 0.7843137, 1,
1.094727, -0.6309633, 2.316934, 1, 0, 0.7803922, 1,
1.098831, 0.6278077, 2.134074, 1, 0, 0.772549, 1,
1.108469, 0.4825111, 2.89667, 1, 0, 0.7686275, 1,
1.117731, 0.09384277, 1.023961, 1, 0, 0.7607843, 1,
1.136923, -0.9499157, 0.06868706, 1, 0, 0.7568628, 1,
1.137697, -0.5070552, 2.304379, 1, 0, 0.7490196, 1,
1.142438, 1.573745, 1.669443, 1, 0, 0.7450981, 1,
1.143103, 0.727939, 2.621418, 1, 0, 0.7372549, 1,
1.143629, -0.512637, 1.985165, 1, 0, 0.7333333, 1,
1.144845, -0.2309341, 1.975385, 1, 0, 0.7254902, 1,
1.152561, -0.7151281, 2.028461, 1, 0, 0.7215686, 1,
1.169886, -2.010396, 2.437844, 1, 0, 0.7137255, 1,
1.171674, 0.148219, 1.582628, 1, 0, 0.7098039, 1,
1.171963, -2.403613, 1.251167, 1, 0, 0.7019608, 1,
1.177719, -0.6796246, 2.622724, 1, 0, 0.6941177, 1,
1.180004, 0.8146122, 1.424073, 1, 0, 0.6901961, 1,
1.184255, 0.5007634, 0.5221068, 1, 0, 0.682353, 1,
1.186798, -0.203271, 3.965403, 1, 0, 0.6784314, 1,
1.208994, -0.6337761, 2.918635, 1, 0, 0.6705883, 1,
1.216061, -0.960775, 1.080041, 1, 0, 0.6666667, 1,
1.223599, -0.3467096, 2.559941, 1, 0, 0.6588235, 1,
1.22402, 0.99621, 0.9231536, 1, 0, 0.654902, 1,
1.224778, 0.4644355, 0.970914, 1, 0, 0.6470588, 1,
1.235179, 0.172147, 1.912448, 1, 0, 0.6431373, 1,
1.235542, 0.1741754, 0.7211177, 1, 0, 0.6352941, 1,
1.237381, 0.5757124, 1.795416, 1, 0, 0.6313726, 1,
1.265334, -0.0190282, 1.354745, 1, 0, 0.6235294, 1,
1.267233, 0.7979215, -0.4216312, 1, 0, 0.6196079, 1,
1.26883, -0.3207447, 2.296494, 1, 0, 0.6117647, 1,
1.26913, 1.968186, 1.381639, 1, 0, 0.6078432, 1,
1.270468, -0.6422629, 1.594078, 1, 0, 0.6, 1,
1.274871, -0.3683295, 2.920691, 1, 0, 0.5921569, 1,
1.278619, 0.57248, -0.04625257, 1, 0, 0.5882353, 1,
1.287437, -0.3181757, 2.548196, 1, 0, 0.5803922, 1,
1.290419, -0.456683, 0.7752687, 1, 0, 0.5764706, 1,
1.290465, 0.1671186, 1.520302, 1, 0, 0.5686275, 1,
1.291205, -0.04847591, 1.52849, 1, 0, 0.5647059, 1,
1.297239, 0.5061584, 0.5396986, 1, 0, 0.5568628, 1,
1.303807, 2.420374, -0.8716034, 1, 0, 0.5529412, 1,
1.310906, 0.5449383, 1.653188, 1, 0, 0.5450981, 1,
1.321577, 0.4234349, 1.048539, 1, 0, 0.5411765, 1,
1.330529, 0.0637427, 1.407309, 1, 0, 0.5333334, 1,
1.364634, 0.3862463, 2.947226, 1, 0, 0.5294118, 1,
1.364793, -1.088938, 2.788599, 1, 0, 0.5215687, 1,
1.370403, 0.6776825, 0.01059914, 1, 0, 0.5176471, 1,
1.379558, 0.01416565, 4.145372, 1, 0, 0.509804, 1,
1.384438, 0.3906985, 0.61716, 1, 0, 0.5058824, 1,
1.386546, 0.7209814, 0.09878377, 1, 0, 0.4980392, 1,
1.387487, 0.5619687, 0.6868734, 1, 0, 0.4901961, 1,
1.388464, 0.5647897, 1.11939, 1, 0, 0.4862745, 1,
1.393793, 0.7593004, 1.387082, 1, 0, 0.4784314, 1,
1.400694, 0.7179599, 2.387758, 1, 0, 0.4745098, 1,
1.407412, 0.3879227, 1.80184, 1, 0, 0.4666667, 1,
1.40945, -0.5493655, 3.23614, 1, 0, 0.4627451, 1,
1.410483, -0.4831604, 2.120134, 1, 0, 0.454902, 1,
1.42568, 0.0004223737, 1.496769, 1, 0, 0.4509804, 1,
1.429405, -0.8509967, 2.011549, 1, 0, 0.4431373, 1,
1.433103, -0.6776242, 0.79638, 1, 0, 0.4392157, 1,
1.434129, -0.7749985, 3.691508, 1, 0, 0.4313726, 1,
1.437563, 1.138486, 1.5066, 1, 0, 0.427451, 1,
1.454457, 0.8095579, -0.4364639, 1, 0, 0.4196078, 1,
1.467558, 0.8771788, 0.4981682, 1, 0, 0.4156863, 1,
1.47462, 0.6670901, 0.9155527, 1, 0, 0.4078431, 1,
1.485891, 0.6085569, 2.485437, 1, 0, 0.4039216, 1,
1.487985, 1.25755, 2.622984, 1, 0, 0.3960784, 1,
1.489205, -0.7859831, 1.525755, 1, 0, 0.3882353, 1,
1.497171, -0.7370852, 3.968949, 1, 0, 0.3843137, 1,
1.517406, -0.497787, 2.825369, 1, 0, 0.3764706, 1,
1.522088, -0.3282672, 2.836691, 1, 0, 0.372549, 1,
1.528839, 1.917002, 0.7425422, 1, 0, 0.3647059, 1,
1.52939, -0.6844111, 1.103362, 1, 0, 0.3607843, 1,
1.533938, 0.2327759, 0.8743345, 1, 0, 0.3529412, 1,
1.535635, 0.4511887, 2.556673, 1, 0, 0.3490196, 1,
1.538498, 1.091923, 2.834202, 1, 0, 0.3411765, 1,
1.539311, -1.992701, 3.823169, 1, 0, 0.3372549, 1,
1.540847, 0.5848555, 2.266825, 1, 0, 0.3294118, 1,
1.544327, 1.867573, -0.4139693, 1, 0, 0.3254902, 1,
1.555963, 1.65619, -0.3400053, 1, 0, 0.3176471, 1,
1.599656, 0.08439551, 1.974406, 1, 0, 0.3137255, 1,
1.605204, -0.1644194, 2.238923, 1, 0, 0.3058824, 1,
1.611385, 0.3603489, -0.1117792, 1, 0, 0.2980392, 1,
1.613083, -0.125261, 0.6569531, 1, 0, 0.2941177, 1,
1.629921, 0.9506021, -0.5587263, 1, 0, 0.2862745, 1,
1.630699, -1.120155, 3.509879, 1, 0, 0.282353, 1,
1.642962, 1.746456, -0.4494072, 1, 0, 0.2745098, 1,
1.654506, 0.5627369, 0.3017581, 1, 0, 0.2705882, 1,
1.668521, -1.001724, 2.311991, 1, 0, 0.2627451, 1,
1.68033, 0.8361867, 1.933468, 1, 0, 0.2588235, 1,
1.688208, -0.07928412, 1.210219, 1, 0, 0.2509804, 1,
1.704875, -0.464394, 4.272125, 1, 0, 0.2470588, 1,
1.723656, -0.8386458, 2.166831, 1, 0, 0.2392157, 1,
1.725544, -1.335184, 1.064152, 1, 0, 0.2352941, 1,
1.740379, -0.533052, 2.414374, 1, 0, 0.227451, 1,
1.743908, 0.1360567, 2.697712, 1, 0, 0.2235294, 1,
1.747165, -0.7123997, 3.43286, 1, 0, 0.2156863, 1,
1.754627, 1.255357, -0.399443, 1, 0, 0.2117647, 1,
1.764207, 0.9209401, 0.02696529, 1, 0, 0.2039216, 1,
1.797341, 0.4211966, 0.9208704, 1, 0, 0.1960784, 1,
1.803342, 1.175521, 1.146877, 1, 0, 0.1921569, 1,
1.823733, -0.9822737, 2.91967, 1, 0, 0.1843137, 1,
1.840582, 0.08943692, -0.5933456, 1, 0, 0.1803922, 1,
1.841842, -0.1444479, 1.710863, 1, 0, 0.172549, 1,
1.844396, 0.4036863, 2.311183, 1, 0, 0.1686275, 1,
1.906002, -1.514142, 1.797354, 1, 0, 0.1607843, 1,
1.916233, -1.004154, 1.984087, 1, 0, 0.1568628, 1,
1.916303, -0.4049689, 1.976666, 1, 0, 0.1490196, 1,
1.991497, 0.3013477, 0.577051, 1, 0, 0.145098, 1,
1.993036, -0.3790719, 3.183036, 1, 0, 0.1372549, 1,
1.995245, 1.133322, 0.1926391, 1, 0, 0.1333333, 1,
2.021867, -1.135172, 0.8804495, 1, 0, 0.1254902, 1,
2.031327, -0.2542841, 1.050611, 1, 0, 0.1215686, 1,
2.044103, -1.515754, 4.342839, 1, 0, 0.1137255, 1,
2.050805, -0.7543304, 0.4152996, 1, 0, 0.1098039, 1,
2.068762, 1.637935, 0.5462649, 1, 0, 0.1019608, 1,
2.073815, 0.3120344, 1.497997, 1, 0, 0.09411765, 1,
2.086887, 0.8314119, 2.281954, 1, 0, 0.09019608, 1,
2.125972, -0.5339081, 0.524752, 1, 0, 0.08235294, 1,
2.187025, -1.014762, 2.469366, 1, 0, 0.07843138, 1,
2.239615, 0.03295542, 1.271667, 1, 0, 0.07058824, 1,
2.276134, -0.4791014, 2.262192, 1, 0, 0.06666667, 1,
2.314386, -1.378806, 4.36003, 1, 0, 0.05882353, 1,
2.448997, -0.9832817, 2.179353, 1, 0, 0.05490196, 1,
2.476615, 0.9065735, 0.07179954, 1, 0, 0.04705882, 1,
2.497072, -1.641833, 2.398695, 1, 0, 0.04313726, 1,
2.602855, -0.9866735, 2.001801, 1, 0, 0.03529412, 1,
2.65437, -0.9943452, 1.836042, 1, 0, 0.03137255, 1,
2.849323, 0.3754103, 1.820084, 1, 0, 0.02352941, 1,
2.973902, 1.428797, 0.388001, 1, 0, 0.01960784, 1,
3.092451, 0.545857, 1.618819, 1, 0, 0.01176471, 1,
3.710587, 1.318003, 1.864287, 1, 0, 0.007843138, 1
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
0.04608095, -4.449659, -7.170766, 0, -0.5, 0.5, 0.5,
0.04608095, -4.449659, -7.170766, 1, -0.5, 0.5, 0.5,
0.04608095, -4.449659, -7.170766, 1, 1.5, 0.5, 0.5,
0.04608095, -4.449659, -7.170766, 0, 1.5, 0.5, 0.5
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
-4.860693, -0.004150152, -7.170766, 0, -0.5, 0.5, 0.5,
-4.860693, -0.004150152, -7.170766, 1, -0.5, 0.5, 0.5,
-4.860693, -0.004150152, -7.170766, 1, 1.5, 0.5, 0.5,
-4.860693, -0.004150152, -7.170766, 0, 1.5, 0.5, 0.5
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
-4.860693, -4.449659, -0.364006, 0, -0.5, 0.5, 0.5,
-4.860693, -4.449659, -0.364006, 1, -0.5, 0.5, 0.5,
-4.860693, -4.449659, -0.364006, 1, 1.5, 0.5, 0.5,
-4.860693, -4.449659, -0.364006, 0, 1.5, 0.5, 0.5
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
-2, -3.423772, -5.599976,
2, -3.423772, -5.599976,
-2, -3.423772, -5.599976,
-2, -3.594753, -5.861774,
0, -3.423772, -5.599976,
0, -3.594753, -5.861774,
2, -3.423772, -5.599976,
2, -3.594753, -5.861774
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
"0",
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
-2, -3.936716, -6.385371, 0, -0.5, 0.5, 0.5,
-2, -3.936716, -6.385371, 1, -0.5, 0.5, 0.5,
-2, -3.936716, -6.385371, 1, 1.5, 0.5, 0.5,
-2, -3.936716, -6.385371, 0, 1.5, 0.5, 0.5,
0, -3.936716, -6.385371, 0, -0.5, 0.5, 0.5,
0, -3.936716, -6.385371, 1, -0.5, 0.5, 0.5,
0, -3.936716, -6.385371, 1, 1.5, 0.5, 0.5,
0, -3.936716, -6.385371, 0, 1.5, 0.5, 0.5,
2, -3.936716, -6.385371, 0, -0.5, 0.5, 0.5,
2, -3.936716, -6.385371, 1, -0.5, 0.5, 0.5,
2, -3.936716, -6.385371, 1, 1.5, 0.5, 0.5,
2, -3.936716, -6.385371, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.72836, -3, -5.599976,
-3.72836, 3, -5.599976,
-3.72836, -3, -5.599976,
-3.917082, -3, -5.861774,
-3.72836, -2, -5.599976,
-3.917082, -2, -5.861774,
-3.72836, -1, -5.599976,
-3.917082, -1, -5.861774,
-3.72836, 0, -5.599976,
-3.917082, 0, -5.861774,
-3.72836, 1, -5.599976,
-3.917082, 1, -5.861774,
-3.72836, 2, -5.599976,
-3.917082, 2, -5.861774,
-3.72836, 3, -5.599976,
-3.917082, 3, -5.861774
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
-4.294526, -3, -6.385371, 0, -0.5, 0.5, 0.5,
-4.294526, -3, -6.385371, 1, -0.5, 0.5, 0.5,
-4.294526, -3, -6.385371, 1, 1.5, 0.5, 0.5,
-4.294526, -3, -6.385371, 0, 1.5, 0.5, 0.5,
-4.294526, -2, -6.385371, 0, -0.5, 0.5, 0.5,
-4.294526, -2, -6.385371, 1, -0.5, 0.5, 0.5,
-4.294526, -2, -6.385371, 1, 1.5, 0.5, 0.5,
-4.294526, -2, -6.385371, 0, 1.5, 0.5, 0.5,
-4.294526, -1, -6.385371, 0, -0.5, 0.5, 0.5,
-4.294526, -1, -6.385371, 1, -0.5, 0.5, 0.5,
-4.294526, -1, -6.385371, 1, 1.5, 0.5, 0.5,
-4.294526, -1, -6.385371, 0, 1.5, 0.5, 0.5,
-4.294526, 0, -6.385371, 0, -0.5, 0.5, 0.5,
-4.294526, 0, -6.385371, 1, -0.5, 0.5, 0.5,
-4.294526, 0, -6.385371, 1, 1.5, 0.5, 0.5,
-4.294526, 0, -6.385371, 0, 1.5, 0.5, 0.5,
-4.294526, 1, -6.385371, 0, -0.5, 0.5, 0.5,
-4.294526, 1, -6.385371, 1, -0.5, 0.5, 0.5,
-4.294526, 1, -6.385371, 1, 1.5, 0.5, 0.5,
-4.294526, 1, -6.385371, 0, 1.5, 0.5, 0.5,
-4.294526, 2, -6.385371, 0, -0.5, 0.5, 0.5,
-4.294526, 2, -6.385371, 1, -0.5, 0.5, 0.5,
-4.294526, 2, -6.385371, 1, 1.5, 0.5, 0.5,
-4.294526, 2, -6.385371, 0, 1.5, 0.5, 0.5,
-4.294526, 3, -6.385371, 0, -0.5, 0.5, 0.5,
-4.294526, 3, -6.385371, 1, -0.5, 0.5, 0.5,
-4.294526, 3, -6.385371, 1, 1.5, 0.5, 0.5,
-4.294526, 3, -6.385371, 0, 1.5, 0.5, 0.5
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
-3.72836, -3.423772, -4,
-3.72836, -3.423772, 4,
-3.72836, -3.423772, -4,
-3.917082, -3.594753, -4,
-3.72836, -3.423772, -2,
-3.917082, -3.594753, -2,
-3.72836, -3.423772, 0,
-3.917082, -3.594753, 0,
-3.72836, -3.423772, 2,
-3.917082, -3.594753, 2,
-3.72836, -3.423772, 4,
-3.917082, -3.594753, 4
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
-4.294526, -3.936716, -4, 0, -0.5, 0.5, 0.5,
-4.294526, -3.936716, -4, 1, -0.5, 0.5, 0.5,
-4.294526, -3.936716, -4, 1, 1.5, 0.5, 0.5,
-4.294526, -3.936716, -4, 0, 1.5, 0.5, 0.5,
-4.294526, -3.936716, -2, 0, -0.5, 0.5, 0.5,
-4.294526, -3.936716, -2, 1, -0.5, 0.5, 0.5,
-4.294526, -3.936716, -2, 1, 1.5, 0.5, 0.5,
-4.294526, -3.936716, -2, 0, 1.5, 0.5, 0.5,
-4.294526, -3.936716, 0, 0, -0.5, 0.5, 0.5,
-4.294526, -3.936716, 0, 1, -0.5, 0.5, 0.5,
-4.294526, -3.936716, 0, 1, 1.5, 0.5, 0.5,
-4.294526, -3.936716, 0, 0, 1.5, 0.5, 0.5,
-4.294526, -3.936716, 2, 0, -0.5, 0.5, 0.5,
-4.294526, -3.936716, 2, 1, -0.5, 0.5, 0.5,
-4.294526, -3.936716, 2, 1, 1.5, 0.5, 0.5,
-4.294526, -3.936716, 2, 0, 1.5, 0.5, 0.5,
-4.294526, -3.936716, 4, 0, -0.5, 0.5, 0.5,
-4.294526, -3.936716, 4, 1, -0.5, 0.5, 0.5,
-4.294526, -3.936716, 4, 1, 1.5, 0.5, 0.5,
-4.294526, -3.936716, 4, 0, 1.5, 0.5, 0.5
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
-3.72836, -3.423772, -5.599976,
-3.72836, 3.415472, -5.599976,
-3.72836, -3.423772, 4.871964,
-3.72836, 3.415472, 4.871964,
-3.72836, -3.423772, -5.599976,
-3.72836, -3.423772, 4.871964,
-3.72836, 3.415472, -5.599976,
-3.72836, 3.415472, 4.871964,
-3.72836, -3.423772, -5.599976,
3.820522, -3.423772, -5.599976,
-3.72836, -3.423772, 4.871964,
3.820522, -3.423772, 4.871964,
-3.72836, 3.415472, -5.599976,
3.820522, 3.415472, -5.599976,
-3.72836, 3.415472, 4.871964,
3.820522, 3.415472, 4.871964,
3.820522, -3.423772, -5.599976,
3.820522, 3.415472, -5.599976,
3.820522, -3.423772, 4.871964,
3.820522, 3.415472, 4.871964,
3.820522, -3.423772, -5.599976,
3.820522, -3.423772, 4.871964,
3.820522, 3.415472, -5.599976,
3.820522, 3.415472, 4.871964
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
var radius = 7.800913;
var distance = 34.70715;
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
mvMatrix.translate( -0.04608095, 0.004150152, 0.364006 );
mvMatrix.scale( 1.117318, 1.23325, 0.8054383 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.70715);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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


