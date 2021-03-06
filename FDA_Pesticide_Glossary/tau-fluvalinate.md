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
-3.107301, 0.8737115, -0.2559586, 1, 0, 0, 1,
-2.904512, 1.763308, 0.5660201, 1, 0.007843138, 0, 1,
-2.768452, 0.1532546, 0.06216516, 1, 0.01176471, 0, 1,
-2.727123, -0.0860953, -2.695348, 1, 0.01960784, 0, 1,
-2.663113, -0.06491856, -0.781331, 1, 0.02352941, 0, 1,
-2.579659, -0.4451548, -1.620666, 1, 0.03137255, 0, 1,
-2.532146, 1.383484, -2.160498, 1, 0.03529412, 0, 1,
-2.492983, -3.216559, -2.78152, 1, 0.04313726, 0, 1,
-2.470921, 0.2883981, 0.3810813, 1, 0.04705882, 0, 1,
-2.324724, -1.271472, -3.047227, 1, 0.05490196, 0, 1,
-2.286669, -1.654921, 0.2078263, 1, 0.05882353, 0, 1,
-2.283291, -0.0230981, -1.766396, 1, 0.06666667, 0, 1,
-2.242982, 0.7470464, -2.479691, 1, 0.07058824, 0, 1,
-2.204392, 0.1784943, -2.057439, 1, 0.07843138, 0, 1,
-2.176102, 2.431847, -0.8339689, 1, 0.08235294, 0, 1,
-2.166209, 0.2765752, -1.837287, 1, 0.09019608, 0, 1,
-2.13042, 0.3106794, 0.3863254, 1, 0.09411765, 0, 1,
-2.068381, -1.693824, -2.752335, 1, 0.1019608, 0, 1,
-2.065431, 0.9369867, -1.153795, 1, 0.1098039, 0, 1,
-2.056368, 1.363096, -0.8154123, 1, 0.1137255, 0, 1,
-2.020917, 1.387094, -1.725754, 1, 0.1215686, 0, 1,
-2.003232, 1.53829, -0.538278, 1, 0.1254902, 0, 1,
-1.982371, 1.420283, -0.6612526, 1, 0.1333333, 0, 1,
-1.980575, -0.9118019, -1.705845, 1, 0.1372549, 0, 1,
-1.941637, -0.7103102, -2.592273, 1, 0.145098, 0, 1,
-1.940751, -0.1530062, -1.507947, 1, 0.1490196, 0, 1,
-1.928508, -1.110129, -1.793681, 1, 0.1568628, 0, 1,
-1.880878, -1.073578, -2.463852, 1, 0.1607843, 0, 1,
-1.830329, -0.1077277, -2.212857, 1, 0.1686275, 0, 1,
-1.828583, 1.713163, -1.202189, 1, 0.172549, 0, 1,
-1.795273, -0.7522568, -3.60607, 1, 0.1803922, 0, 1,
-1.785744, -0.4764854, -2.190762, 1, 0.1843137, 0, 1,
-1.781218, -0.5279076, -1.285823, 1, 0.1921569, 0, 1,
-1.775155, 0.6440443, -0.4787459, 1, 0.1960784, 0, 1,
-1.754708, -1.868755, -2.692187, 1, 0.2039216, 0, 1,
-1.744778, -0.6002536, -2.71593, 1, 0.2117647, 0, 1,
-1.740411, -0.2872081, -2.750084, 1, 0.2156863, 0, 1,
-1.736296, 0.08042496, -3.289167, 1, 0.2235294, 0, 1,
-1.727133, 1.553884, -1.219367, 1, 0.227451, 0, 1,
-1.720231, -0.2243923, -2.843449, 1, 0.2352941, 0, 1,
-1.687934, -1.416602, -1.3384, 1, 0.2392157, 0, 1,
-1.677733, 0.5850548, 0.3629383, 1, 0.2470588, 0, 1,
-1.661988, -0.5214405, -0.8203173, 1, 0.2509804, 0, 1,
-1.64814, -0.7202283, -3.816332, 1, 0.2588235, 0, 1,
-1.637046, -0.2367331, -1.54167, 1, 0.2627451, 0, 1,
-1.63622, 0.0935438, -0.5305874, 1, 0.2705882, 0, 1,
-1.626982, -1.413622, -2.024562, 1, 0.2745098, 0, 1,
-1.618334, -0.3565389, -1.694924, 1, 0.282353, 0, 1,
-1.612033, -1.302256, -3.37354, 1, 0.2862745, 0, 1,
-1.601653, 0.6487854, 0.8708797, 1, 0.2941177, 0, 1,
-1.598266, 0.07402609, -1.381241, 1, 0.3019608, 0, 1,
-1.595311, -0.5934404, -1.952874, 1, 0.3058824, 0, 1,
-1.580446, -0.4376359, -1.539617, 1, 0.3137255, 0, 1,
-1.575983, 2.359459, 0.1650396, 1, 0.3176471, 0, 1,
-1.562486, 0.6055173, -1.11026, 1, 0.3254902, 0, 1,
-1.555401, 0.3989849, -1.773219, 1, 0.3294118, 0, 1,
-1.551425, -0.3224062, -1.194319, 1, 0.3372549, 0, 1,
-1.540342, 0.6847488, -2.865355, 1, 0.3411765, 0, 1,
-1.538198, 0.743, -0.6687037, 1, 0.3490196, 0, 1,
-1.536544, 0.2456922, -1.178885, 1, 0.3529412, 0, 1,
-1.53619, -2.095367, -2.523714, 1, 0.3607843, 0, 1,
-1.534967, -0.01948221, 0.06541646, 1, 0.3647059, 0, 1,
-1.518406, -0.5678427, 0.2545147, 1, 0.372549, 0, 1,
-1.516548, -1.071274, -1.426998, 1, 0.3764706, 0, 1,
-1.511643, 0.4251359, -2.411031, 1, 0.3843137, 0, 1,
-1.499935, -1.30147, -2.932083, 1, 0.3882353, 0, 1,
-1.496771, 0.3316559, 0.08412345, 1, 0.3960784, 0, 1,
-1.494279, 0.05868753, 0.7176298, 1, 0.4039216, 0, 1,
-1.486552, 1.837162, -0.3788828, 1, 0.4078431, 0, 1,
-1.484644, 0.9159535, -1.759413, 1, 0.4156863, 0, 1,
-1.480701, 1.809617, 1.584339, 1, 0.4196078, 0, 1,
-1.480673, 1.467768, -1.624658, 1, 0.427451, 0, 1,
-1.465672, 0.8221507, -1.474678, 1, 0.4313726, 0, 1,
-1.445325, 0.5914086, -1.383867, 1, 0.4392157, 0, 1,
-1.439818, -0.74835, -0.4326339, 1, 0.4431373, 0, 1,
-1.435142, -0.4683861, -1.576336, 1, 0.4509804, 0, 1,
-1.41966, 1.002289, -1.887916, 1, 0.454902, 0, 1,
-1.396944, -0.9167632, -2.957794, 1, 0.4627451, 0, 1,
-1.389355, 0.8487553, -1.684265, 1, 0.4666667, 0, 1,
-1.378584, 0.642304, -2.647151, 1, 0.4745098, 0, 1,
-1.376859, -1.064213, -3.148645, 1, 0.4784314, 0, 1,
-1.371999, -0.2395397, -1.119031, 1, 0.4862745, 0, 1,
-1.364848, 0.4756085, -0.0535353, 1, 0.4901961, 0, 1,
-1.35309, -0.2340016, -2.154041, 1, 0.4980392, 0, 1,
-1.345117, 0.3435538, -1.300394, 1, 0.5058824, 0, 1,
-1.341105, -0.1974444, -1.94875, 1, 0.509804, 0, 1,
-1.334713, 1.663265, -0.3042952, 1, 0.5176471, 0, 1,
-1.333107, -0.6935104, -2.696072, 1, 0.5215687, 0, 1,
-1.327528, -1.626849, -3.710634, 1, 0.5294118, 0, 1,
-1.323616, -0.4168663, -2.903352, 1, 0.5333334, 0, 1,
-1.322047, 0.6165605, -1.577879, 1, 0.5411765, 0, 1,
-1.321924, -1.195444, -0.4128331, 1, 0.5450981, 0, 1,
-1.315291, -1.151802, -1.606919, 1, 0.5529412, 0, 1,
-1.310019, -1.022886, -3.479109, 1, 0.5568628, 0, 1,
-1.309971, -1.33961, -2.527179, 1, 0.5647059, 0, 1,
-1.30697, -1.066683, -1.728809, 1, 0.5686275, 0, 1,
-1.306183, 0.2797289, -0.9974535, 1, 0.5764706, 0, 1,
-1.299789, -0.786808, -1.644871, 1, 0.5803922, 0, 1,
-1.293577, -0.6087723, -1.741668, 1, 0.5882353, 0, 1,
-1.289232, 1.473247, -0.1078441, 1, 0.5921569, 0, 1,
-1.286339, 0.1326937, -2.181536, 1, 0.6, 0, 1,
-1.280125, 0.02952992, -1.15493, 1, 0.6078432, 0, 1,
-1.274475, -0.123725, -1.667869, 1, 0.6117647, 0, 1,
-1.271294, -2.157379, -2.100106, 1, 0.6196079, 0, 1,
-1.259079, -0.05504681, -2.277545, 1, 0.6235294, 0, 1,
-1.255493, -0.07534043, -1.866745, 1, 0.6313726, 0, 1,
-1.252857, 1.536924, -0.6800634, 1, 0.6352941, 0, 1,
-1.24824, 1.270532, -2.090166, 1, 0.6431373, 0, 1,
-1.24112, 0.7043919, -0.9982883, 1, 0.6470588, 0, 1,
-1.23872, 1.439958, -2.44509, 1, 0.654902, 0, 1,
-1.238548, -1.434406, -3.545183, 1, 0.6588235, 0, 1,
-1.23389, 0.3232093, -3.07121, 1, 0.6666667, 0, 1,
-1.233012, 0.07905461, -1.275441, 1, 0.6705883, 0, 1,
-1.227655, -2.478029, -1.13482, 1, 0.6784314, 0, 1,
-1.224754, 0.2913744, -2.76561, 1, 0.682353, 0, 1,
-1.219046, 1.831056, -1.325591, 1, 0.6901961, 0, 1,
-1.217675, -0.2104637, -1.421875, 1, 0.6941177, 0, 1,
-1.215115, 0.1877149, 0.1173982, 1, 0.7019608, 0, 1,
-1.214552, -0.6385959, -3.119992, 1, 0.7098039, 0, 1,
-1.209735, 1.645319, 1.953358, 1, 0.7137255, 0, 1,
-1.208623, 1.311292, -0.7264667, 1, 0.7215686, 0, 1,
-1.200207, -0.01457594, -1.041829, 1, 0.7254902, 0, 1,
-1.195088, -1.445906, -1.517798, 1, 0.7333333, 0, 1,
-1.18112, 0.3718503, -1.092507, 1, 0.7372549, 0, 1,
-1.173111, 0.3205443, -0.5473993, 1, 0.7450981, 0, 1,
-1.171892, -0.3483434, -3.408121, 1, 0.7490196, 0, 1,
-1.152807, 0.8096411, -2.362309, 1, 0.7568628, 0, 1,
-1.151302, 1.107019, 0.5253638, 1, 0.7607843, 0, 1,
-1.143983, -0.4416674, -0.4779584, 1, 0.7686275, 0, 1,
-1.137663, -1.572201, -2.462292, 1, 0.772549, 0, 1,
-1.134517, 1.372573, -1.309164, 1, 0.7803922, 0, 1,
-1.131477, 1.205424, -0.8609585, 1, 0.7843137, 0, 1,
-1.129388, 2.116789, -0.01764769, 1, 0.7921569, 0, 1,
-1.125788, 0.3698333, -0.6979084, 1, 0.7960784, 0, 1,
-1.124653, -0.1339236, -2.510197, 1, 0.8039216, 0, 1,
-1.121815, 0.4204223, -0.7910078, 1, 0.8117647, 0, 1,
-1.115354, -1.820413, -3.641798, 1, 0.8156863, 0, 1,
-1.111413, -0.09989594, -2.473315, 1, 0.8235294, 0, 1,
-1.104462, -1.700154, -1.643201, 1, 0.827451, 0, 1,
-1.100059, 0.0730589, -1.144526, 1, 0.8352941, 0, 1,
-1.099073, -1.157089, -2.594486, 1, 0.8392157, 0, 1,
-1.098927, 0.02275769, -2.875069, 1, 0.8470588, 0, 1,
-1.094693, -0.5135772, -2.67786, 1, 0.8509804, 0, 1,
-1.079719, -0.5824373, -2.555667, 1, 0.8588235, 0, 1,
-1.076809, -1.063637, -2.0891, 1, 0.8627451, 0, 1,
-1.072103, 0.04953617, -0.5185651, 1, 0.8705882, 0, 1,
-1.060934, 0.126025, -2.240635, 1, 0.8745098, 0, 1,
-1.057987, 1.356195, -1.760427, 1, 0.8823529, 0, 1,
-1.04663, -1.574577, -2.398537, 1, 0.8862745, 0, 1,
-1.046129, -1.55567, -2.272469, 1, 0.8941177, 0, 1,
-1.042197, 1.215686, 0.4021778, 1, 0.8980392, 0, 1,
-1.036048, -0.3501467, -2.069464, 1, 0.9058824, 0, 1,
-1.033614, -1.423455, -3.085943, 1, 0.9137255, 0, 1,
-1.033351, -1.267352, -2.451377, 1, 0.9176471, 0, 1,
-1.029733, -0.2118469, -0.9475674, 1, 0.9254902, 0, 1,
-1.027627, -0.6605371, -1.301781, 1, 0.9294118, 0, 1,
-1.027107, -0.8609557, -1.930035, 1, 0.9372549, 0, 1,
-1.025128, 0.1218227, -1.019885, 1, 0.9411765, 0, 1,
-1.021686, 1.867943, 0.7575883, 1, 0.9490196, 0, 1,
-1.021006, -1.13067, -2.430203, 1, 0.9529412, 0, 1,
-1.016503, 0.1396576, -2.511445, 1, 0.9607843, 0, 1,
-1.013547, 0.2528815, -1.719075, 1, 0.9647059, 0, 1,
-1.012633, -1.726295, -0.5675242, 1, 0.972549, 0, 1,
-1.011197, -0.8303046, -2.037619, 1, 0.9764706, 0, 1,
-1.009943, -1.296316, -2.654961, 1, 0.9843137, 0, 1,
-1.009854, -1.500101, -4.234994, 1, 0.9882353, 0, 1,
-1.00831, -0.3842646, -2.645167, 1, 0.9960784, 0, 1,
-1.007604, 0.4845701, -0.8428406, 0.9960784, 1, 0, 1,
-1.004677, 0.2892008, -2.291122, 0.9921569, 1, 0, 1,
-0.9907111, 0.615701, -1.215597, 0.9843137, 1, 0, 1,
-0.9898416, -1.901503, -2.938064, 0.9803922, 1, 0, 1,
-0.9889101, 0.426191, -0.2707285, 0.972549, 1, 0, 1,
-0.9846257, -0.4569139, -1.441936, 0.9686275, 1, 0, 1,
-0.9839965, 0.8376198, -1.69918, 0.9607843, 1, 0, 1,
-0.9771798, 0.4181762, -2.385599, 0.9568627, 1, 0, 1,
-0.9549419, 0.09465439, -1.229994, 0.9490196, 1, 0, 1,
-0.9502518, 0.001317318, -1.266313, 0.945098, 1, 0, 1,
-0.9498561, -1.263931, 0.001977951, 0.9372549, 1, 0, 1,
-0.9496016, 0.7426481, 0.7271481, 0.9333333, 1, 0, 1,
-0.9480358, 0.2940988, -0.5291997, 0.9254902, 1, 0, 1,
-0.9467386, 1.588614, -1.645117, 0.9215686, 1, 0, 1,
-0.9460678, 0.07919644, -0.518738, 0.9137255, 1, 0, 1,
-0.9456875, -0.1086341, -2.615551, 0.9098039, 1, 0, 1,
-0.9444917, 1.165804, -1.160311, 0.9019608, 1, 0, 1,
-0.9406912, 1.774603, 0.3882514, 0.8941177, 1, 0, 1,
-0.9402138, -0.2006771, -2.198561, 0.8901961, 1, 0, 1,
-0.9341785, 2.046192, -0.6152456, 0.8823529, 1, 0, 1,
-0.9326019, 1.255167, -0.7587844, 0.8784314, 1, 0, 1,
-0.9282475, 1.116472, -1.832221, 0.8705882, 1, 0, 1,
-0.9125153, 0.5964632, -2.025883, 0.8666667, 1, 0, 1,
-0.9086155, 0.6799029, -1.193253, 0.8588235, 1, 0, 1,
-0.9070022, -0.4994583, -4.542868, 0.854902, 1, 0, 1,
-0.9006677, -1.352575, -1.335933, 0.8470588, 1, 0, 1,
-0.898573, -0.6239812, -1.36873, 0.8431373, 1, 0, 1,
-0.8920397, -1.496725, -4.773204, 0.8352941, 1, 0, 1,
-0.8871766, -1.272378, -2.233643, 0.8313726, 1, 0, 1,
-0.879697, -0.3383277, -1.501115, 0.8235294, 1, 0, 1,
-0.8772725, -0.06982499, -0.8082137, 0.8196079, 1, 0, 1,
-0.8745421, -0.03424704, -1.384667, 0.8117647, 1, 0, 1,
-0.8736497, 0.1826865, -1.77054, 0.8078431, 1, 0, 1,
-0.869212, -0.3014135, -2.727998, 0.8, 1, 0, 1,
-0.8689996, -0.2490767, -1.095207, 0.7921569, 1, 0, 1,
-0.867716, 0.8441581, -0.3465064, 0.7882353, 1, 0, 1,
-0.8669162, -1.049445, -3.178154, 0.7803922, 1, 0, 1,
-0.8647225, 0.05848849, -2.475817, 0.7764706, 1, 0, 1,
-0.8580666, -0.4910214, -1.939072, 0.7686275, 1, 0, 1,
-0.8487536, 0.4813848, -2.856058, 0.7647059, 1, 0, 1,
-0.8351879, -0.4139881, -1.955152, 0.7568628, 1, 0, 1,
-0.8343436, 1.2219, 0.3042138, 0.7529412, 1, 0, 1,
-0.8342829, -0.02102088, -1.835296, 0.7450981, 1, 0, 1,
-0.831338, 0.82706, -1.829097, 0.7411765, 1, 0, 1,
-0.8306741, -0.6143328, -2.469824, 0.7333333, 1, 0, 1,
-0.8249636, -0.4773828, -1.93676, 0.7294118, 1, 0, 1,
-0.8199996, -0.5493778, -2.566942, 0.7215686, 1, 0, 1,
-0.8115839, -0.7161564, -1.711759, 0.7176471, 1, 0, 1,
-0.8086135, 0.7820391, -1.724966, 0.7098039, 1, 0, 1,
-0.8063084, -0.08701179, -1.439768, 0.7058824, 1, 0, 1,
-0.8047165, -0.5435758, -2.401351, 0.6980392, 1, 0, 1,
-0.8022774, -0.1168357, -3.07019, 0.6901961, 1, 0, 1,
-0.8017828, 0.3326795, -3.179587, 0.6862745, 1, 0, 1,
-0.7988726, -0.3631912, -2.476104, 0.6784314, 1, 0, 1,
-0.7957231, -0.1418643, -1.819992, 0.6745098, 1, 0, 1,
-0.7932164, 0.3828182, -2.64658, 0.6666667, 1, 0, 1,
-0.7931562, 0.05067859, -1.67383, 0.6627451, 1, 0, 1,
-0.7885543, -0.2731671, -0.8898857, 0.654902, 1, 0, 1,
-0.7873133, -0.9571192, -2.319573, 0.6509804, 1, 0, 1,
-0.7866566, -0.8109267, -0.8918429, 0.6431373, 1, 0, 1,
-0.7828305, 0.3932919, -1.630766, 0.6392157, 1, 0, 1,
-0.7783376, -0.5124742, -1.117418, 0.6313726, 1, 0, 1,
-0.7773775, -0.9918231, -2.284746, 0.627451, 1, 0, 1,
-0.7714717, 0.8894978, -1.435215, 0.6196079, 1, 0, 1,
-0.7696552, -0.1903, -1.351212, 0.6156863, 1, 0, 1,
-0.769046, 0.2326299, -2.308439, 0.6078432, 1, 0, 1,
-0.7677308, -0.3019241, -2.391714, 0.6039216, 1, 0, 1,
-0.7657426, 0.3445645, -3.020186, 0.5960785, 1, 0, 1,
-0.7604057, 1.107213, 0.07717215, 0.5882353, 1, 0, 1,
-0.7596371, 0.02612574, -0.9486953, 0.5843138, 1, 0, 1,
-0.7591675, 0.2552634, -1.750162, 0.5764706, 1, 0, 1,
-0.7589539, 1.386762, -0.8775625, 0.572549, 1, 0, 1,
-0.7569742, -0.3553326, -3.79348, 0.5647059, 1, 0, 1,
-0.7551602, -0.8106163, -2.02242, 0.5607843, 1, 0, 1,
-0.7521142, -0.2692669, -2.286165, 0.5529412, 1, 0, 1,
-0.7510121, 0.04726097, -0.5254912, 0.5490196, 1, 0, 1,
-0.7498291, -0.9670157, -3.284985, 0.5411765, 1, 0, 1,
-0.749328, 0.2550605, -1.471538, 0.5372549, 1, 0, 1,
-0.7487905, 2.031745, -1.424004, 0.5294118, 1, 0, 1,
-0.7402967, -0.8054588, -2.998878, 0.5254902, 1, 0, 1,
-0.7389886, 0.3831843, -0.5012972, 0.5176471, 1, 0, 1,
-0.7326423, 1.177793, -2.605241, 0.5137255, 1, 0, 1,
-0.7243859, -0.2417715, -1.867314, 0.5058824, 1, 0, 1,
-0.723999, 1.53673, -0.5992988, 0.5019608, 1, 0, 1,
-0.719523, -0.742694, -3.656703, 0.4941176, 1, 0, 1,
-0.7122708, -1.233795, -3.332894, 0.4862745, 1, 0, 1,
-0.7019224, 0.3099772, 0.3467489, 0.4823529, 1, 0, 1,
-0.7018067, -1.276667, -2.038748, 0.4745098, 1, 0, 1,
-0.6844583, -0.2023015, -1.423367, 0.4705882, 1, 0, 1,
-0.678399, -0.2612254, -2.988117, 0.4627451, 1, 0, 1,
-0.6637496, -0.2043412, -3.033533, 0.4588235, 1, 0, 1,
-0.6616534, -0.02380968, -0.7786265, 0.4509804, 1, 0, 1,
-0.6602022, 0.5026936, -0.9274881, 0.4470588, 1, 0, 1,
-0.6601884, -0.269984, -1.0554, 0.4392157, 1, 0, 1,
-0.653424, -1.199468, -3.56072, 0.4352941, 1, 0, 1,
-0.6530361, -0.5597844, -1.107545, 0.427451, 1, 0, 1,
-0.6499593, 1.521437, -1.163375, 0.4235294, 1, 0, 1,
-0.6413314, 0.1033817, -2.158113, 0.4156863, 1, 0, 1,
-0.6381854, -1.516115, -2.236896, 0.4117647, 1, 0, 1,
-0.6352193, 0.07481717, -3.451204, 0.4039216, 1, 0, 1,
-0.6350325, -0.0789979, -4.904668, 0.3960784, 1, 0, 1,
-0.6336132, -0.9819916, -1.018412, 0.3921569, 1, 0, 1,
-0.6288208, -0.7190457, -1.08382, 0.3843137, 1, 0, 1,
-0.6215007, 0.4608573, -2.613069, 0.3803922, 1, 0, 1,
-0.6145344, -0.6831985, -2.030151, 0.372549, 1, 0, 1,
-0.6079708, 0.2899354, -1.774289, 0.3686275, 1, 0, 1,
-0.6077282, -0.5370393, -1.917243, 0.3607843, 1, 0, 1,
-0.6068393, -2.085052, -2.209286, 0.3568628, 1, 0, 1,
-0.6064591, 0.4680266, -1.136213, 0.3490196, 1, 0, 1,
-0.6064204, 0.06071955, -0.9159572, 0.345098, 1, 0, 1,
-0.6045005, -1.022449, -1.497286, 0.3372549, 1, 0, 1,
-0.6043049, 1.509869, -0.6707182, 0.3333333, 1, 0, 1,
-0.5994468, 1.453475, -0.2488003, 0.3254902, 1, 0, 1,
-0.5949038, -0.2568697, -3.493934, 0.3215686, 1, 0, 1,
-0.5948331, 0.4502652, -0.8520635, 0.3137255, 1, 0, 1,
-0.5945245, -1.504063, -3.8494, 0.3098039, 1, 0, 1,
-0.5941276, -0.960943, -2.909104, 0.3019608, 1, 0, 1,
-0.5925665, 1.322024, -0.3754198, 0.2941177, 1, 0, 1,
-0.5925401, -0.1819466, -2.400733, 0.2901961, 1, 0, 1,
-0.5892844, -0.6171885, -4.164001, 0.282353, 1, 0, 1,
-0.5878759, 1.258055, -1.534503, 0.2784314, 1, 0, 1,
-0.5871959, 0.5265612, -0.4676743, 0.2705882, 1, 0, 1,
-0.5867202, -0.02176979, -0.06819692, 0.2666667, 1, 0, 1,
-0.581504, -1.320716, -3.840893, 0.2588235, 1, 0, 1,
-0.5744823, -0.5084482, -3.988141, 0.254902, 1, 0, 1,
-0.56904, -0.03313162, -1.044318, 0.2470588, 1, 0, 1,
-0.567655, -0.698931, -2.246675, 0.2431373, 1, 0, 1,
-0.56721, -0.7688468, -1.552241, 0.2352941, 1, 0, 1,
-0.5630375, -0.5550744, -2.746742, 0.2313726, 1, 0, 1,
-0.562651, -1.191276, -1.95272, 0.2235294, 1, 0, 1,
-0.5604535, 1.260231, -0.5520989, 0.2196078, 1, 0, 1,
-0.5596265, 0.3992398, -0.3037517, 0.2117647, 1, 0, 1,
-0.558982, -1.294045, -3.608216, 0.2078431, 1, 0, 1,
-0.5589195, 2.116956, -1.129326, 0.2, 1, 0, 1,
-0.5587569, -0.696292, -3.515232, 0.1921569, 1, 0, 1,
-0.5584316, 0.6591464, -0.8856745, 0.1882353, 1, 0, 1,
-0.5568061, -0.9556062, -2.819982, 0.1803922, 1, 0, 1,
-0.556319, -0.5528445, -3.002208, 0.1764706, 1, 0, 1,
-0.5542538, -1.002329, -3.865335, 0.1686275, 1, 0, 1,
-0.5446898, 0.1443784, -2.353779, 0.1647059, 1, 0, 1,
-0.5409747, 2.062083, -1.272563, 0.1568628, 1, 0, 1,
-0.5407931, -0.1479438, -1.860561, 0.1529412, 1, 0, 1,
-0.5383708, 2.604095, 0.2717864, 0.145098, 1, 0, 1,
-0.5339923, -2.29344, -1.908641, 0.1411765, 1, 0, 1,
-0.5332306, -0.6146981, -4.157523, 0.1333333, 1, 0, 1,
-0.5287414, 0.04703411, -1.529451, 0.1294118, 1, 0, 1,
-0.5235839, -0.5319725, -1.846993, 0.1215686, 1, 0, 1,
-0.520834, 1.668494, 0.3237042, 0.1176471, 1, 0, 1,
-0.5131835, -1.209744, -3.194347, 0.1098039, 1, 0, 1,
-0.511154, 0.6856416, -1.686693, 0.1058824, 1, 0, 1,
-0.5084501, -1.521682, -1.16027, 0.09803922, 1, 0, 1,
-0.5025434, -0.9205181, -2.229476, 0.09019608, 1, 0, 1,
-0.4973285, 1.781901, 0.1051685, 0.08627451, 1, 0, 1,
-0.4970862, 0.3182523, 0.454874, 0.07843138, 1, 0, 1,
-0.4969832, -0.3016261, -3.052874, 0.07450981, 1, 0, 1,
-0.4944327, 0.557395, 0.1470668, 0.06666667, 1, 0, 1,
-0.4880294, 0.299008, -1.086663, 0.0627451, 1, 0, 1,
-0.4873515, -0.1162183, -2.861184, 0.05490196, 1, 0, 1,
-0.4845875, -0.7911513, -3.546357, 0.05098039, 1, 0, 1,
-0.483696, -0.4618918, -2.0332, 0.04313726, 1, 0, 1,
-0.4829001, 2.173777, 0.2064481, 0.03921569, 1, 0, 1,
-0.4811338, 0.4223414, -2.271429, 0.03137255, 1, 0, 1,
-0.4795534, 0.4386753, -1.67079, 0.02745098, 1, 0, 1,
-0.4793974, -1.619325, -2.143059, 0.01960784, 1, 0, 1,
-0.4782745, 1.014856, -1.166391, 0.01568628, 1, 0, 1,
-0.4758806, 1.78636, -1.521874, 0.007843138, 1, 0, 1,
-0.4742981, -1.589547, -1.998661, 0.003921569, 1, 0, 1,
-0.473609, 0.6818901, 1.383095, 0, 1, 0.003921569, 1,
-0.472217, 0.2260773, -1.027819, 0, 1, 0.01176471, 1,
-0.4702901, -0.4499047, -1.984783, 0, 1, 0.01568628, 1,
-0.4580687, 0.3932056, -2.010403, 0, 1, 0.02352941, 1,
-0.4543476, 1.380024, 0.3303755, 0, 1, 0.02745098, 1,
-0.4541451, -0.1313585, -1.156909, 0, 1, 0.03529412, 1,
-0.4499082, 0.07806938, -0.9946169, 0, 1, 0.03921569, 1,
-0.444094, 0.6406816, -1.849919, 0, 1, 0.04705882, 1,
-0.4413662, 0.2386896, -0.4684233, 0, 1, 0.05098039, 1,
-0.4393394, -0.1757809, -2.374094, 0, 1, 0.05882353, 1,
-0.4377517, -1.199877, -3.816916, 0, 1, 0.0627451, 1,
-0.4357459, 2.452609, -1.877059, 0, 1, 0.07058824, 1,
-0.4259075, -0.8304369, -1.678403, 0, 1, 0.07450981, 1,
-0.4173969, -0.5810313, -2.8538, 0, 1, 0.08235294, 1,
-0.4127561, -0.4514341, -1.825786, 0, 1, 0.08627451, 1,
-0.4074154, 0.7666415, 0.7793736, 0, 1, 0.09411765, 1,
-0.4059086, -1.667982, -5.20986, 0, 1, 0.1019608, 1,
-0.4011766, -1.403347, -4.27595, 0, 1, 0.1058824, 1,
-0.4003769, 0.2884245, 1.044061, 0, 1, 0.1137255, 1,
-0.3954566, 1.204964, -0.5821021, 0, 1, 0.1176471, 1,
-0.3952883, 1.04119, -1.449595, 0, 1, 0.1254902, 1,
-0.3799708, -0.6227851, -1.000501, 0, 1, 0.1294118, 1,
-0.3751188, 0.8315558, 0.4582708, 0, 1, 0.1372549, 1,
-0.3711035, 0.4437263, -0.4000875, 0, 1, 0.1411765, 1,
-0.3703549, 0.6362154, 2.217018, 0, 1, 0.1490196, 1,
-0.3624039, -0.3382545, -2.126129, 0, 1, 0.1529412, 1,
-0.3622532, 0.3777666, 0.6205727, 0, 1, 0.1607843, 1,
-0.3617646, 0.2518293, -1.715225, 0, 1, 0.1647059, 1,
-0.3613951, 1.162516, -1.842218, 0, 1, 0.172549, 1,
-0.361338, -0.4037666, -3.609749, 0, 1, 0.1764706, 1,
-0.3572052, -2.230398, -3.785634, 0, 1, 0.1843137, 1,
-0.3551989, -0.2650724, -1.957268, 0, 1, 0.1882353, 1,
-0.3535573, -0.193001, -1.885105, 0, 1, 0.1960784, 1,
-0.3482426, -0.6554348, -2.330326, 0, 1, 0.2039216, 1,
-0.3465161, -0.2525319, -2.841511, 0, 1, 0.2078431, 1,
-0.3439952, -0.7881135, -4.683706, 0, 1, 0.2156863, 1,
-0.3363384, 1.656803, 1.342231, 0, 1, 0.2196078, 1,
-0.3342135, -0.7796918, -2.9692, 0, 1, 0.227451, 1,
-0.3330588, 0.232295, -0.9312291, 0, 1, 0.2313726, 1,
-0.3328798, -0.4978093, -3.661789, 0, 1, 0.2392157, 1,
-0.3300919, -1.045024, -3.075254, 0, 1, 0.2431373, 1,
-0.3289517, 1.907559, -0.5353917, 0, 1, 0.2509804, 1,
-0.3284884, 0.6139383, 1.441326, 0, 1, 0.254902, 1,
-0.3264889, -0.6499003, -2.717847, 0, 1, 0.2627451, 1,
-0.3225413, 1.211924, -1.031657, 0, 1, 0.2666667, 1,
-0.3165478, 0.4089636, -2.168104, 0, 1, 0.2745098, 1,
-0.3153403, 0.7735884, 0.5669284, 0, 1, 0.2784314, 1,
-0.3148119, -0.5616683, -2.66854, 0, 1, 0.2862745, 1,
-0.3134747, -1.104548, -3.197606, 0, 1, 0.2901961, 1,
-0.3062951, 0.1772928, -1.177402, 0, 1, 0.2980392, 1,
-0.3056839, 0.9563331, -2.162826, 0, 1, 0.3058824, 1,
-0.3007163, -0.9775841, -3.538245, 0, 1, 0.3098039, 1,
-0.3003549, -0.2880059, -2.630093, 0, 1, 0.3176471, 1,
-0.2990412, 1.11989, 0.4693783, 0, 1, 0.3215686, 1,
-0.2958821, 1.123357, 1.261962, 0, 1, 0.3294118, 1,
-0.2945237, -1.06897, -1.436224, 0, 1, 0.3333333, 1,
-0.2938213, -0.9530019, 0.1021143, 0, 1, 0.3411765, 1,
-0.2930157, 2.037961, 0.2104311, 0, 1, 0.345098, 1,
-0.2898183, -0.1370142, -1.818477, 0, 1, 0.3529412, 1,
-0.2883605, -0.5805607, -2.928306, 0, 1, 0.3568628, 1,
-0.2814617, 1.603635, -0.1570479, 0, 1, 0.3647059, 1,
-0.2786211, -1.00336, -2.304223, 0, 1, 0.3686275, 1,
-0.2769699, 0.1636826, 0.5757191, 0, 1, 0.3764706, 1,
-0.2756164, 1.313182, -2.088703, 0, 1, 0.3803922, 1,
-0.2750067, 0.6172466, -1.64373, 0, 1, 0.3882353, 1,
-0.2744307, -0.152276, -1.958711, 0, 1, 0.3921569, 1,
-0.2710423, -0.2613975, -3.195495, 0, 1, 0.4, 1,
-0.2668731, -2.134795, -4.085758, 0, 1, 0.4078431, 1,
-0.2629623, 0.08611488, -0.6760436, 0, 1, 0.4117647, 1,
-0.2623033, 1.138997, 0.8013747, 0, 1, 0.4196078, 1,
-0.2593578, -1.99089, -3.372293, 0, 1, 0.4235294, 1,
-0.2484917, 0.9392506, -0.8192613, 0, 1, 0.4313726, 1,
-0.2413339, -2.437329, -3.455034, 0, 1, 0.4352941, 1,
-0.2362472, -1.463416, -3.478799, 0, 1, 0.4431373, 1,
-0.2240564, -0.3386769, -2.925748, 0, 1, 0.4470588, 1,
-0.2197288, -0.6084798, -0.8333954, 0, 1, 0.454902, 1,
-0.2122071, 0.8172393, 0.1052824, 0, 1, 0.4588235, 1,
-0.2111939, 0.5911486, 0.3996975, 0, 1, 0.4666667, 1,
-0.2111749, 0.2877539, -0.08645165, 0, 1, 0.4705882, 1,
-0.2111489, 1.946182, -0.2894562, 0, 1, 0.4784314, 1,
-0.206101, 1.044086, -1.040677, 0, 1, 0.4823529, 1,
-0.2024667, -0.4280574, -1.420992, 0, 1, 0.4901961, 1,
-0.2019322, 0.3135535, 0.4221171, 0, 1, 0.4941176, 1,
-0.1964325, 0.1837498, -0.5109259, 0, 1, 0.5019608, 1,
-0.1959155, 0.2042488, -0.02958863, 0, 1, 0.509804, 1,
-0.1941292, 0.5433451, 0.02563564, 0, 1, 0.5137255, 1,
-0.1883846, 0.6999139, -1.573507, 0, 1, 0.5215687, 1,
-0.1855322, -0.1583459, -1.884328, 0, 1, 0.5254902, 1,
-0.183312, -1.479666, -1.267517, 0, 1, 0.5333334, 1,
-0.1794544, 0.3833832, -3.409757, 0, 1, 0.5372549, 1,
-0.1779246, -1.748011, -3.093323, 0, 1, 0.5450981, 1,
-0.1777944, -1.305697, -3.893455, 0, 1, 0.5490196, 1,
-0.1768123, -0.2520131, -2.864618, 0, 1, 0.5568628, 1,
-0.1756589, -0.262833, -2.197563, 0, 1, 0.5607843, 1,
-0.1751763, -0.09609245, -4.132478, 0, 1, 0.5686275, 1,
-0.171031, 0.07897547, -0.1198922, 0, 1, 0.572549, 1,
-0.1698443, -1.040437, -4.408965, 0, 1, 0.5803922, 1,
-0.1684135, 0.1945746, 0.4405726, 0, 1, 0.5843138, 1,
-0.1674798, -0.2493662, -2.925629, 0, 1, 0.5921569, 1,
-0.16694, -0.8618254, -3.61275, 0, 1, 0.5960785, 1,
-0.1632762, -0.4101068, -2.079205, 0, 1, 0.6039216, 1,
-0.1622646, -0.3012261, -2.119313, 0, 1, 0.6117647, 1,
-0.1608975, 0.1151667, 0.3061365, 0, 1, 0.6156863, 1,
-0.1586365, -1.457738, -4.260375, 0, 1, 0.6235294, 1,
-0.1583899, -1.949962, -2.485271, 0, 1, 0.627451, 1,
-0.1564336, 0.2991769, 0.04177107, 0, 1, 0.6352941, 1,
-0.1540739, -0.01887422, -2.343899, 0, 1, 0.6392157, 1,
-0.154029, 1.53427, -0.2242929, 0, 1, 0.6470588, 1,
-0.1475119, -0.1613965, -0.3746043, 0, 1, 0.6509804, 1,
-0.1458395, 1.142656, -1.520249, 0, 1, 0.6588235, 1,
-0.1457022, -1.191242, -2.641704, 0, 1, 0.6627451, 1,
-0.1443747, 0.0237631, -2.921495, 0, 1, 0.6705883, 1,
-0.1428456, -1.229832, -2.550339, 0, 1, 0.6745098, 1,
-0.14134, 0.7643169, 0.2665784, 0, 1, 0.682353, 1,
-0.1412451, 0.08671588, 0.6433458, 0, 1, 0.6862745, 1,
-0.1383594, 0.6779808, -0.1141923, 0, 1, 0.6941177, 1,
-0.1373483, -1.163838, -3.968877, 0, 1, 0.7019608, 1,
-0.136034, 0.844416, 1.419809, 0, 1, 0.7058824, 1,
-0.132309, -0.8772199, -3.024645, 0, 1, 0.7137255, 1,
-0.1319744, 0.3610493, -1.910917, 0, 1, 0.7176471, 1,
-0.1304315, -0.273052, -1.517515, 0, 1, 0.7254902, 1,
-0.1299537, 0.6288362, -0.4010812, 0, 1, 0.7294118, 1,
-0.1268866, 0.5969341, -1.000985, 0, 1, 0.7372549, 1,
-0.1206946, -1.154445, -3.529569, 0, 1, 0.7411765, 1,
-0.1205353, 0.8697657, -1.212931, 0, 1, 0.7490196, 1,
-0.1129686, -0.09158896, -1.974101, 0, 1, 0.7529412, 1,
-0.1115106, 0.9575166, 1.029456, 0, 1, 0.7607843, 1,
-0.1074275, 0.345678, -2.10796, 0, 1, 0.7647059, 1,
-0.1064668, 1.00378, 0.8395673, 0, 1, 0.772549, 1,
-0.105636, -0.3236537, -3.684604, 0, 1, 0.7764706, 1,
-0.09692026, -0.7372388, -2.886028, 0, 1, 0.7843137, 1,
-0.09467673, -1.856663, -3.972606, 0, 1, 0.7882353, 1,
-0.09269077, -0.4876733, -1.947549, 0, 1, 0.7960784, 1,
-0.08644959, 1.120117, -0.2138573, 0, 1, 0.8039216, 1,
-0.08382632, 0.28458, -1.436722, 0, 1, 0.8078431, 1,
-0.08254551, -1.220984, -3.159922, 0, 1, 0.8156863, 1,
-0.08100347, 0.1808423, -0.4968369, 0, 1, 0.8196079, 1,
-0.07983425, -0.7796913, -2.877956, 0, 1, 0.827451, 1,
-0.07664755, 0.2345275, 2.244651, 0, 1, 0.8313726, 1,
-0.07585044, -0.4246247, -1.878463, 0, 1, 0.8392157, 1,
-0.07342307, -0.1143157, -2.952654, 0, 1, 0.8431373, 1,
-0.06952126, -0.9579648, -1.629659, 0, 1, 0.8509804, 1,
-0.06895578, 1.393324, -0.9517283, 0, 1, 0.854902, 1,
-0.06829338, 0.1373098, 1.119764, 0, 1, 0.8627451, 1,
-0.06773176, 0.4492424, 0.3073789, 0, 1, 0.8666667, 1,
-0.06412858, -2.73849, -1.889841, 0, 1, 0.8745098, 1,
-0.05828875, -1.657543, -0.9649623, 0, 1, 0.8784314, 1,
-0.05554846, -0.3221472, -4.882968, 0, 1, 0.8862745, 1,
-0.05492141, -0.3069206, -3.15688, 0, 1, 0.8901961, 1,
-0.05465972, -0.1380778, -2.318353, 0, 1, 0.8980392, 1,
-0.05272285, -2.44218, -3.828097, 0, 1, 0.9058824, 1,
-0.05161428, -0.2329043, -3.001698, 0, 1, 0.9098039, 1,
-0.04938301, -1.35905, -4.403113, 0, 1, 0.9176471, 1,
-0.04650205, -1.750381, -2.291017, 0, 1, 0.9215686, 1,
-0.04254179, 0.9635254, -0.1053592, 0, 1, 0.9294118, 1,
-0.04080286, 0.4048886, 0.4312639, 0, 1, 0.9333333, 1,
-0.04080046, -1.638839, -1.915557, 0, 1, 0.9411765, 1,
-0.04048044, 1.426101, 1.150801, 0, 1, 0.945098, 1,
-0.03788234, -0.3775493, -2.963831, 0, 1, 0.9529412, 1,
-0.0359439, -2.642786, -4.284243, 0, 1, 0.9568627, 1,
-0.02947086, 0.3593462, 1.973216, 0, 1, 0.9647059, 1,
-0.02791035, 1.242014, -0.3559555, 0, 1, 0.9686275, 1,
-0.0275715, -0.5774198, -3.436085, 0, 1, 0.9764706, 1,
-0.02305626, -0.1215632, -3.284917, 0, 1, 0.9803922, 1,
-0.02182682, -1.253585, -4.15436, 0, 1, 0.9882353, 1,
-0.01963362, -1.108826, -2.591644, 0, 1, 0.9921569, 1,
-0.01910569, 0.6533444, -0.8070019, 0, 1, 1, 1,
-0.01886276, 1.659257, 0.292916, 0, 0.9921569, 1, 1,
-0.01704238, -0.04299378, -2.104905, 0, 0.9882353, 1, 1,
-0.01651036, -0.6745574, -2.105308, 0, 0.9803922, 1, 1,
-0.01430555, -0.7400506, -3.987547, 0, 0.9764706, 1, 1,
-0.01399174, -0.4312535, -4.741168, 0, 0.9686275, 1, 1,
-0.01079005, 0.4192594, 0.449844, 0, 0.9647059, 1, 1,
-0.008261539, -1.344593, -4.078694, 0, 0.9568627, 1, 1,
-0.007844488, 0.01082682, 1.437289, 0, 0.9529412, 1, 1,
-0.003102953, 1.682845, -0.09021661, 0, 0.945098, 1, 1,
0.01209143, 0.7572497, 1.264845, 0, 0.9411765, 1, 1,
0.01986402, -1.094921, 3.45896, 0, 0.9333333, 1, 1,
0.02122797, 1.754713, 0.1330712, 0, 0.9294118, 1, 1,
0.02573576, 0.4783224, 0.4769728, 0, 0.9215686, 1, 1,
0.02958133, 0.7764895, 0.1764628, 0, 0.9176471, 1, 1,
0.03033661, -1.067383, 2.625762, 0, 0.9098039, 1, 1,
0.03112231, -0.6751891, 2.797814, 0, 0.9058824, 1, 1,
0.0334447, -1.094332, 3.419112, 0, 0.8980392, 1, 1,
0.0351685, 1.53633, -1.177429, 0, 0.8901961, 1, 1,
0.03559281, 2.056045, -1.697344, 0, 0.8862745, 1, 1,
0.03579876, 1.470405, 0.5099912, 0, 0.8784314, 1, 1,
0.03690693, -0.5750245, 3.186932, 0, 0.8745098, 1, 1,
0.04349399, -2.959623, 2.779795, 0, 0.8666667, 1, 1,
0.0514848, 0.5729467, 0.3787639, 0, 0.8627451, 1, 1,
0.05304144, -0.6667181, 2.605149, 0, 0.854902, 1, 1,
0.05603935, -0.5155288, 3.271019, 0, 0.8509804, 1, 1,
0.05887146, -0.7223012, 4.119414, 0, 0.8431373, 1, 1,
0.06501024, 1.499793, 0.7729571, 0, 0.8392157, 1, 1,
0.06538858, 2.146626, -0.9304498, 0, 0.8313726, 1, 1,
0.06784812, -0.9027871, 2.046417, 0, 0.827451, 1, 1,
0.06981262, -0.4831237, 2.71814, 0, 0.8196079, 1, 1,
0.07192917, 0.7880165, -0.2584809, 0, 0.8156863, 1, 1,
0.0749015, -1.487829, 2.033944, 0, 0.8078431, 1, 1,
0.07592013, -0.5296207, 4.387891, 0, 0.8039216, 1, 1,
0.08175658, 0.7868211, -1.57355, 0, 0.7960784, 1, 1,
0.08256032, -0.8778111, 5.614761, 0, 0.7882353, 1, 1,
0.08389557, 1.021879, -0.03720076, 0, 0.7843137, 1, 1,
0.08661804, 0.3446254, 0.416107, 0, 0.7764706, 1, 1,
0.08710169, 0.09314274, 1.243579, 0, 0.772549, 1, 1,
0.08935859, -0.2928731, 2.949929, 0, 0.7647059, 1, 1,
0.09797125, 1.035246, -0.1568396, 0, 0.7607843, 1, 1,
0.102484, -0.1457415, 1.470056, 0, 0.7529412, 1, 1,
0.1041671, -1.393349, 3.837698, 0, 0.7490196, 1, 1,
0.1054889, 0.1114057, 1.955866, 0, 0.7411765, 1, 1,
0.1101322, 1.221825, 0.3974874, 0, 0.7372549, 1, 1,
0.1130822, 2.002167, 1.558207, 0, 0.7294118, 1, 1,
0.1145639, -2.000429, 2.895864, 0, 0.7254902, 1, 1,
0.1175155, 0.03358389, 0.9987481, 0, 0.7176471, 1, 1,
0.1277633, 1.353305, -1.36905, 0, 0.7137255, 1, 1,
0.1332528, 1.783779, 0.7372326, 0, 0.7058824, 1, 1,
0.1335705, -0.4177054, 1.634753, 0, 0.6980392, 1, 1,
0.1347156, -0.8136764, 2.160103, 0, 0.6941177, 1, 1,
0.1368803, -1.091641, 4.395587, 0, 0.6862745, 1, 1,
0.1412972, -0.5562801, 1.146683, 0, 0.682353, 1, 1,
0.1493413, 0.3724499, -3.573966, 0, 0.6745098, 1, 1,
0.1517225, -1.567582, 3.024907, 0, 0.6705883, 1, 1,
0.1518812, -0.6819624, 3.065011, 0, 0.6627451, 1, 1,
0.1588432, 0.4398001, 0.3059652, 0, 0.6588235, 1, 1,
0.1634496, -1.574276, 1.941963, 0, 0.6509804, 1, 1,
0.1671528, 0.4966669, -0.887921, 0, 0.6470588, 1, 1,
0.1693782, -0.5369965, 2.267987, 0, 0.6392157, 1, 1,
0.169542, -0.745098, 4.284329, 0, 0.6352941, 1, 1,
0.1696715, 0.04100777, -1.231147, 0, 0.627451, 1, 1,
0.1744801, -0.4201842, 1.623953, 0, 0.6235294, 1, 1,
0.1751309, 0.4533153, 0.9330006, 0, 0.6156863, 1, 1,
0.1787632, -0.8517121, 4.600036, 0, 0.6117647, 1, 1,
0.1845863, -0.674145, 2.807487, 0, 0.6039216, 1, 1,
0.1853757, 1.140425, 0.08298407, 0, 0.5960785, 1, 1,
0.1888393, 0.1425356, 1.638956, 0, 0.5921569, 1, 1,
0.1897127, -0.8858243, 2.923525, 0, 0.5843138, 1, 1,
0.1912333, -1.49564, 3.057967, 0, 0.5803922, 1, 1,
0.1921733, 0.2435059, -1.439723, 0, 0.572549, 1, 1,
0.1941193, 0.7869661, 0.3373798, 0, 0.5686275, 1, 1,
0.1944769, -0.1488837, 2.709982, 0, 0.5607843, 1, 1,
0.2012709, 0.4342692, 0.5839319, 0, 0.5568628, 1, 1,
0.2031694, 0.9023494, -1.20623, 0, 0.5490196, 1, 1,
0.2036855, 1.241757, 0.276026, 0, 0.5450981, 1, 1,
0.2054261, 0.06261158, 1.764462, 0, 0.5372549, 1, 1,
0.2055554, -0.04292935, 1.68464, 0, 0.5333334, 1, 1,
0.208131, 0.1045148, 2.340296, 0, 0.5254902, 1, 1,
0.2174874, -1.191076, 2.655795, 0, 0.5215687, 1, 1,
0.2187613, -0.1387336, 2.833885, 0, 0.5137255, 1, 1,
0.2189049, 0.5003697, 1.102883, 0, 0.509804, 1, 1,
0.220938, -0.1407841, 1.551172, 0, 0.5019608, 1, 1,
0.2217846, 0.7188872, -0.1866262, 0, 0.4941176, 1, 1,
0.2219048, -1.183279, 1.797398, 0, 0.4901961, 1, 1,
0.2254656, 0.2941892, 1.326663, 0, 0.4823529, 1, 1,
0.2386027, -0.3214125, 3.918637, 0, 0.4784314, 1, 1,
0.2387651, -0.09672294, 1.326863, 0, 0.4705882, 1, 1,
0.2393313, -1.855334, 3.325539, 0, 0.4666667, 1, 1,
0.2410081, 0.2640113, 0.9937311, 0, 0.4588235, 1, 1,
0.2414073, -1.478283, 2.162011, 0, 0.454902, 1, 1,
0.2490646, 0.8962628, -0.5090054, 0, 0.4470588, 1, 1,
0.2496319, -2.419477, 1.846855, 0, 0.4431373, 1, 1,
0.2503877, -1.292301, 2.076732, 0, 0.4352941, 1, 1,
0.2531914, -0.5335585, 3.171285, 0, 0.4313726, 1, 1,
0.2542575, 0.5170176, 0.6721832, 0, 0.4235294, 1, 1,
0.2599875, 0.4314886, -0.9860538, 0, 0.4196078, 1, 1,
0.2606769, -0.006213854, 1.444918, 0, 0.4117647, 1, 1,
0.260958, 0.02852694, 2.330449, 0, 0.4078431, 1, 1,
0.2623014, 1.411815, 0.420059, 0, 0.4, 1, 1,
0.2683306, -1.092767, 1.584395, 0, 0.3921569, 1, 1,
0.2773405, 0.1825036, 0.7583758, 0, 0.3882353, 1, 1,
0.2779388, -0.7134242, 0.6807986, 0, 0.3803922, 1, 1,
0.2785937, 0.1331814, 2.958334, 0, 0.3764706, 1, 1,
0.2799637, -0.3680433, 3.705036, 0, 0.3686275, 1, 1,
0.2825392, 0.1986159, 0.5905359, 0, 0.3647059, 1, 1,
0.2825784, -0.651563, 3.580616, 0, 0.3568628, 1, 1,
0.2844477, 0.29441, 2.222497, 0, 0.3529412, 1, 1,
0.2873367, 0.5673394, 1.396902, 0, 0.345098, 1, 1,
0.2899932, -0.4203037, 2.70694, 0, 0.3411765, 1, 1,
0.2901086, 0.4469827, 0.6096418, 0, 0.3333333, 1, 1,
0.2903308, 0.5076232, 0.7037088, 0, 0.3294118, 1, 1,
0.2925442, -0.5026216, 3.233155, 0, 0.3215686, 1, 1,
0.2949418, 1.001744, 1.406925, 0, 0.3176471, 1, 1,
0.2989425, -1.338639, 4.465088, 0, 0.3098039, 1, 1,
0.299238, 0.3249342, 3.202957, 0, 0.3058824, 1, 1,
0.2994021, 0.6754655, 0.7911314, 0, 0.2980392, 1, 1,
0.3008896, 0.4913419, 1.763253, 0, 0.2901961, 1, 1,
0.300907, 0.7625121, -0.1530346, 0, 0.2862745, 1, 1,
0.301868, -1.532777, 4.673175, 0, 0.2784314, 1, 1,
0.3029912, 0.560212, 0.6049179, 0, 0.2745098, 1, 1,
0.3052446, -2.578752, 2.523654, 0, 0.2666667, 1, 1,
0.3088939, -0.4677549, 2.423981, 0, 0.2627451, 1, 1,
0.3097173, -1.544694, 2.988914, 0, 0.254902, 1, 1,
0.3098813, 0.06364624, 2.032998, 0, 0.2509804, 1, 1,
0.3105379, -0.09340736, 2.28933, 0, 0.2431373, 1, 1,
0.3120158, -1.274011, 1.306973, 0, 0.2392157, 1, 1,
0.3154071, 1.109406, 1.86215, 0, 0.2313726, 1, 1,
0.3160516, -2.000998, 1.838555, 0, 0.227451, 1, 1,
0.3239076, 1.154638, -1.141152, 0, 0.2196078, 1, 1,
0.3242612, -1.250379, 3.181471, 0, 0.2156863, 1, 1,
0.3244337, 1.76349, 0.7923284, 0, 0.2078431, 1, 1,
0.3279312, -0.2927442, 1.876335, 0, 0.2039216, 1, 1,
0.3301452, 1.17498, -1.682675, 0, 0.1960784, 1, 1,
0.330761, -1.771826, 2.103866, 0, 0.1882353, 1, 1,
0.3382877, -0.2265491, 4.783469, 0, 0.1843137, 1, 1,
0.3387327, -0.3959942, 1.750742, 0, 0.1764706, 1, 1,
0.3448227, -0.5200642, 2.996683, 0, 0.172549, 1, 1,
0.3457215, 0.168744, 1.639948, 0, 0.1647059, 1, 1,
0.3484745, -0.2130151, 0.9466287, 0, 0.1607843, 1, 1,
0.3515469, -0.01584211, 2.45361, 0, 0.1529412, 1, 1,
0.3539127, -0.7108541, 1.959742, 0, 0.1490196, 1, 1,
0.35722, -0.0762992, 1.591736, 0, 0.1411765, 1, 1,
0.3599879, 1.127368, 0.3772362, 0, 0.1372549, 1, 1,
0.3665311, 1.619825, -1.33041, 0, 0.1294118, 1, 1,
0.3665731, 0.973287, 0.2187082, 0, 0.1254902, 1, 1,
0.3680767, 0.8961769, -0.9603603, 0, 0.1176471, 1, 1,
0.3691242, -0.5917859, 2.781852, 0, 0.1137255, 1, 1,
0.3738775, 0.4535441, 1.090387, 0, 0.1058824, 1, 1,
0.3739589, 0.4777068, -0.3763889, 0, 0.09803922, 1, 1,
0.3757449, 2.278368, 0.3459445, 0, 0.09411765, 1, 1,
0.379234, 0.481339, 0.6571515, 0, 0.08627451, 1, 1,
0.3824215, 0.3404332, 1.691855, 0, 0.08235294, 1, 1,
0.3843225, 1.146242, -0.03222402, 0, 0.07450981, 1, 1,
0.3909331, 0.1182436, 0.7212616, 0, 0.07058824, 1, 1,
0.3938613, -1.384958, 2.055513, 0, 0.0627451, 1, 1,
0.3947123, 1.316412, 1.22868, 0, 0.05882353, 1, 1,
0.3974073, -1.474597, 2.99558, 0, 0.05098039, 1, 1,
0.3981254, -1.229367, 2.900046, 0, 0.04705882, 1, 1,
0.3988541, 0.1284468, 2.059392, 0, 0.03921569, 1, 1,
0.3996645, -0.1706489, 2.055822, 0, 0.03529412, 1, 1,
0.4000713, -0.1761048, 1.836731, 0, 0.02745098, 1, 1,
0.4077978, 0.1372885, -0.07893046, 0, 0.02352941, 1, 1,
0.4083918, 0.1755241, 0.7713387, 0, 0.01568628, 1, 1,
0.4121092, 0.8231598, 0.009890301, 0, 0.01176471, 1, 1,
0.4125173, -0.689869, 2.515432, 0, 0.003921569, 1, 1,
0.4125482, -0.860727, 3.488885, 0.003921569, 0, 1, 1,
0.4141045, 0.01507966, 1.478141, 0.007843138, 0, 1, 1,
0.4150637, 0.2173282, 2.499803, 0.01568628, 0, 1, 1,
0.4160776, 1.335196, -2.626383, 0.01960784, 0, 1, 1,
0.4171302, 0.5568762, 1.552933, 0.02745098, 0, 1, 1,
0.4200927, -1.071128, 4.134166, 0.03137255, 0, 1, 1,
0.4201115, 1.431924, 1.337895, 0.03921569, 0, 1, 1,
0.4234576, 0.3439942, 1.259355, 0.04313726, 0, 1, 1,
0.4273511, -0.1673094, 0.7757038, 0.05098039, 0, 1, 1,
0.4290513, -0.436165, 2.968588, 0.05490196, 0, 1, 1,
0.4324449, 0.2379071, 2.496205, 0.0627451, 0, 1, 1,
0.4345892, 0.02720881, 0.1925039, 0.06666667, 0, 1, 1,
0.4351149, -1.724488, 2.293599, 0.07450981, 0, 1, 1,
0.4358382, -1.679219, 3.170818, 0.07843138, 0, 1, 1,
0.4439752, -0.2228354, 2.393729, 0.08627451, 0, 1, 1,
0.4493175, -1.142815, 3.03173, 0.09019608, 0, 1, 1,
0.4502214, 0.1010647, 1.319018, 0.09803922, 0, 1, 1,
0.4540243, 1.284269, -0.8336748, 0.1058824, 0, 1, 1,
0.4559862, 0.7531489, 0.07753805, 0.1098039, 0, 1, 1,
0.4565375, -1.115524, 3.182122, 0.1176471, 0, 1, 1,
0.4580384, -0.2433172, 3.26493, 0.1215686, 0, 1, 1,
0.4609163, 1.720154, 0.6142191, 0.1294118, 0, 1, 1,
0.4652385, -1.623782, 2.744636, 0.1333333, 0, 1, 1,
0.4676805, -1.453345, 2.481792, 0.1411765, 0, 1, 1,
0.4722326, -1.270057, 1.226357, 0.145098, 0, 1, 1,
0.4743026, 1.233407, -0.1117623, 0.1529412, 0, 1, 1,
0.4770359, 0.2798011, 3.424663, 0.1568628, 0, 1, 1,
0.4888918, -0.8129419, 2.376196, 0.1647059, 0, 1, 1,
0.489568, 0.5597935, 1.253633, 0.1686275, 0, 1, 1,
0.489925, -0.8725421, 1.448085, 0.1764706, 0, 1, 1,
0.4903188, 0.109882, 2.271155, 0.1803922, 0, 1, 1,
0.4915619, -0.03108749, 1.719703, 0.1882353, 0, 1, 1,
0.4938792, -1.252689, 2.983768, 0.1921569, 0, 1, 1,
0.49453, 1.001586, 0.112423, 0.2, 0, 1, 1,
0.4960501, -0.8378017, 3.245166, 0.2078431, 0, 1, 1,
0.5009902, 0.134949, -0.3335191, 0.2117647, 0, 1, 1,
0.5021835, -1.124673, 2.618037, 0.2196078, 0, 1, 1,
0.5028076, -0.09004586, 0.4117704, 0.2235294, 0, 1, 1,
0.5058944, 0.5264173, -1.05558, 0.2313726, 0, 1, 1,
0.5061579, -1.239114, 2.616306, 0.2352941, 0, 1, 1,
0.5114169, -0.1491535, 1.706459, 0.2431373, 0, 1, 1,
0.5144173, 2.27559, -0.5391352, 0.2470588, 0, 1, 1,
0.5214683, 0.5081365, 3.067017, 0.254902, 0, 1, 1,
0.5257046, -1.281193, 2.61621, 0.2588235, 0, 1, 1,
0.5295562, -0.1229834, 2.483873, 0.2666667, 0, 1, 1,
0.530328, 2.502462, -0.289894, 0.2705882, 0, 1, 1,
0.5304946, -0.2330472, 2.36285, 0.2784314, 0, 1, 1,
0.5306937, -0.3813868, 2.204195, 0.282353, 0, 1, 1,
0.5366536, 0.02881981, 1.258718, 0.2901961, 0, 1, 1,
0.5429353, 0.4940164, -0.9152216, 0.2941177, 0, 1, 1,
0.544611, -1.543778, 3.003364, 0.3019608, 0, 1, 1,
0.5503607, 2.051657, 0.71205, 0.3098039, 0, 1, 1,
0.5506673, -0.171536, 2.487046, 0.3137255, 0, 1, 1,
0.5526862, 0.3622307, 2.576813, 0.3215686, 0, 1, 1,
0.5585091, 2.188752, -0.1983564, 0.3254902, 0, 1, 1,
0.5618628, 0.9281154, 1.621709, 0.3333333, 0, 1, 1,
0.5704078, -0.4320567, 1.580803, 0.3372549, 0, 1, 1,
0.5734633, -0.6114745, -0.1740332, 0.345098, 0, 1, 1,
0.5746739, -0.5755036, 2.215599, 0.3490196, 0, 1, 1,
0.5792677, -0.2490108, 0.5345631, 0.3568628, 0, 1, 1,
0.5822818, -1.337519, 2.250925, 0.3607843, 0, 1, 1,
0.5862508, 1.391207, -0.5416382, 0.3686275, 0, 1, 1,
0.5867556, 0.09233129, 1.944658, 0.372549, 0, 1, 1,
0.5870007, -0.4563393, 3.084018, 0.3803922, 0, 1, 1,
0.5914337, 0.8645903, 1.530043, 0.3843137, 0, 1, 1,
0.5951236, -0.3731291, 1.787961, 0.3921569, 0, 1, 1,
0.5997998, 0.4839905, 1.803035, 0.3960784, 0, 1, 1,
0.602739, 0.9445785, 2.145124, 0.4039216, 0, 1, 1,
0.603443, -0.7561438, 1.184815, 0.4117647, 0, 1, 1,
0.6062979, -0.5267492, 1.51937, 0.4156863, 0, 1, 1,
0.6084892, -0.9649318, 2.113722, 0.4235294, 0, 1, 1,
0.6102135, -0.3127468, 1.136089, 0.427451, 0, 1, 1,
0.6103168, -2.149909, 3.884053, 0.4352941, 0, 1, 1,
0.6229392, 0.7130296, 0.2090279, 0.4392157, 0, 1, 1,
0.6233725, 0.1203245, 0.4042074, 0.4470588, 0, 1, 1,
0.6240371, 0.7572637, 1.852018, 0.4509804, 0, 1, 1,
0.6317048, 0.309919, 0.7648527, 0.4588235, 0, 1, 1,
0.6379697, 0.7952606, 1.485027, 0.4627451, 0, 1, 1,
0.640327, 1.159334, 1.319091, 0.4705882, 0, 1, 1,
0.6445252, -1.831405, 3.514975, 0.4745098, 0, 1, 1,
0.6451872, -0.4450523, 2.501084, 0.4823529, 0, 1, 1,
0.6492161, 0.255914, 0.03390346, 0.4862745, 0, 1, 1,
0.6583565, -0.2685724, 2.295217, 0.4941176, 0, 1, 1,
0.6603947, -2.006734, 2.279279, 0.5019608, 0, 1, 1,
0.6637217, 1.230648, -1.717113, 0.5058824, 0, 1, 1,
0.664834, 0.3763968, 1.989005, 0.5137255, 0, 1, 1,
0.6718948, 0.5102642, 0.4991875, 0.5176471, 0, 1, 1,
0.6760015, -0.3541515, 3.491951, 0.5254902, 0, 1, 1,
0.6856267, 1.047141, 0.8272645, 0.5294118, 0, 1, 1,
0.6862389, 0.3094348, 1.852046, 0.5372549, 0, 1, 1,
0.6880551, 1.664731, 0.6914417, 0.5411765, 0, 1, 1,
0.6919729, 0.7531006, 2.215831, 0.5490196, 0, 1, 1,
0.6950605, 1.232976, 1.159321, 0.5529412, 0, 1, 1,
0.7001762, 1.012704, -0.5400436, 0.5607843, 0, 1, 1,
0.7019271, 0.5792212, 1.68661, 0.5647059, 0, 1, 1,
0.7024263, -0.8300183, 2.745042, 0.572549, 0, 1, 1,
0.7102594, 0.8543356, 2.505547, 0.5764706, 0, 1, 1,
0.7166927, 1.241386, -3.161865, 0.5843138, 0, 1, 1,
0.7185177, -2.310919, 4.483882, 0.5882353, 0, 1, 1,
0.7188149, 0.3865256, 1.925353, 0.5960785, 0, 1, 1,
0.7242199, -0.1307327, 0.1668216, 0.6039216, 0, 1, 1,
0.7286009, 0.342536, 3.535661, 0.6078432, 0, 1, 1,
0.7298166, 1.177086, 1.347832, 0.6156863, 0, 1, 1,
0.7309807, -1.379196, 2.603009, 0.6196079, 0, 1, 1,
0.7420898, 0.3912671, -0.06943835, 0.627451, 0, 1, 1,
0.747012, 0.2139347, 2.290116, 0.6313726, 0, 1, 1,
0.7488577, 1.911791, -0.8069191, 0.6392157, 0, 1, 1,
0.7530683, 0.4149679, 2.385583, 0.6431373, 0, 1, 1,
0.7531684, -0.2720487, 2.38175, 0.6509804, 0, 1, 1,
0.7574825, -0.3571631, 1.95523, 0.654902, 0, 1, 1,
0.7599134, -0.8381916, 1.657554, 0.6627451, 0, 1, 1,
0.7604948, 0.509091, 2.477872, 0.6666667, 0, 1, 1,
0.7661091, -0.4691311, 3.576157, 0.6745098, 0, 1, 1,
0.768288, -0.4640197, 3.16841, 0.6784314, 0, 1, 1,
0.7699721, 0.5912231, 2.094516, 0.6862745, 0, 1, 1,
0.7724929, 0.2999495, 1.861973, 0.6901961, 0, 1, 1,
0.7800319, 2.06814, -0.04796233, 0.6980392, 0, 1, 1,
0.784457, -0.6474028, 3.98953, 0.7058824, 0, 1, 1,
0.7851565, 1.093652, -0.08511157, 0.7098039, 0, 1, 1,
0.7858821, 1.90509, 0.7887473, 0.7176471, 0, 1, 1,
0.7916173, -1.104748, 2.660164, 0.7215686, 0, 1, 1,
0.7922862, -0.3221828, 1.841645, 0.7294118, 0, 1, 1,
0.7927176, 1.24344, 1.092589, 0.7333333, 0, 1, 1,
0.7950136, 0.3771924, 0.7358582, 0.7411765, 0, 1, 1,
0.8042461, 0.6775472, 0.6224512, 0.7450981, 0, 1, 1,
0.8048506, 3.036488, 0.9073985, 0.7529412, 0, 1, 1,
0.8060675, -1.271259, 2.485029, 0.7568628, 0, 1, 1,
0.8088605, 0.288441, 0.6924509, 0.7647059, 0, 1, 1,
0.8137355, 0.8859398, 1.488742, 0.7686275, 0, 1, 1,
0.8192706, -0.2116268, 0.9194162, 0.7764706, 0, 1, 1,
0.8316317, 0.4350013, 0.2651339, 0.7803922, 0, 1, 1,
0.8318663, 0.8923483, -1.361769, 0.7882353, 0, 1, 1,
0.8357351, 0.0574561, 0.8307745, 0.7921569, 0, 1, 1,
0.8400342, 0.003186853, 2.035842, 0.8, 0, 1, 1,
0.8534639, -1.187447, 2.416833, 0.8078431, 0, 1, 1,
0.8578928, 0.450011, 1.463812, 0.8117647, 0, 1, 1,
0.8637767, -0.8965363, 0.7510606, 0.8196079, 0, 1, 1,
0.8662866, -0.1246369, 2.026215, 0.8235294, 0, 1, 1,
0.8695964, 1.561203, 0.006748422, 0.8313726, 0, 1, 1,
0.8713403, -0.1249344, 1.436332, 0.8352941, 0, 1, 1,
0.874965, -0.372283, 1.920321, 0.8431373, 0, 1, 1,
0.8818251, -0.6990323, 2.35997, 0.8470588, 0, 1, 1,
0.8841006, 0.1845734, 1.94265, 0.854902, 0, 1, 1,
0.8918596, 0.8972437, 2.020461, 0.8588235, 0, 1, 1,
0.8919531, 0.8198723, -0.09053479, 0.8666667, 0, 1, 1,
0.9022756, 0.4487748, 2.432438, 0.8705882, 0, 1, 1,
0.902515, 2.440503, -1.119265, 0.8784314, 0, 1, 1,
0.9104348, 0.8510481, 1.729176, 0.8823529, 0, 1, 1,
0.9120046, 1.116699, -0.9055434, 0.8901961, 0, 1, 1,
0.9175754, 2.055566, 1.15359, 0.8941177, 0, 1, 1,
0.9242886, -0.6208331, 3.600491, 0.9019608, 0, 1, 1,
0.9255898, -0.5178605, 2.095652, 0.9098039, 0, 1, 1,
0.9267294, -1.101437, 3.277191, 0.9137255, 0, 1, 1,
0.9280603, -0.07722487, 1.293476, 0.9215686, 0, 1, 1,
0.9367669, 0.3715135, 1.657761, 0.9254902, 0, 1, 1,
0.939549, 0.4325441, 0.8029919, 0.9333333, 0, 1, 1,
0.9405133, 0.3897546, 1.552283, 0.9372549, 0, 1, 1,
0.9428041, 1.388819, 0.3738754, 0.945098, 0, 1, 1,
0.9532921, 0.04673703, 1.68226, 0.9490196, 0, 1, 1,
0.9577905, 0.397767, 1.04946, 0.9568627, 0, 1, 1,
0.9693965, -0.4505936, 1.829249, 0.9607843, 0, 1, 1,
0.975211, -0.8630238, 0.2452899, 0.9686275, 0, 1, 1,
0.9765383, 0.5586223, 1.295309, 0.972549, 0, 1, 1,
0.978254, -0.2788424, 1.369085, 0.9803922, 0, 1, 1,
0.9798744, 3.231339, -0.9367987, 0.9843137, 0, 1, 1,
0.9843441, -0.03752636, 2.472489, 0.9921569, 0, 1, 1,
0.9856329, 0.01381352, 2.717055, 0.9960784, 0, 1, 1,
0.9866498, 1.230689, 2.048043, 1, 0, 0.9960784, 1,
0.9893767, 0.5148061, 2.115203, 1, 0, 0.9882353, 1,
0.9930215, 0.8695477, 0.7688172, 1, 0, 0.9843137, 1,
1.000404, 0.8209122, -1.075675, 1, 0, 0.9764706, 1,
1.005995, -0.7335798, 0.6024691, 1, 0, 0.972549, 1,
1.008835, 0.3332728, 1.870925, 1, 0, 0.9647059, 1,
1.009332, -0.6964039, 3.631807, 1, 0, 0.9607843, 1,
1.016362, 0.4033105, 1.000214, 1, 0, 0.9529412, 1,
1.017625, -0.355662, 2.704762, 1, 0, 0.9490196, 1,
1.01924, -0.1426426, 2.788901, 1, 0, 0.9411765, 1,
1.021792, 1.103388, 0.1837313, 1, 0, 0.9372549, 1,
1.031461, 2.052121, -2.161304, 1, 0, 0.9294118, 1,
1.032842, 1.37285, -0.6033943, 1, 0, 0.9254902, 1,
1.033303, -0.8104343, 1.489305, 1, 0, 0.9176471, 1,
1.035223, -0.5393003, 2.898501, 1, 0, 0.9137255, 1,
1.040117, -0.2526715, 2.331037, 1, 0, 0.9058824, 1,
1.041057, -0.8713214, 2.112255, 1, 0, 0.9019608, 1,
1.042665, 0.6938264, 0.7783409, 1, 0, 0.8941177, 1,
1.051644, 2.619271, 1.765607, 1, 0, 0.8862745, 1,
1.053306, 0.4970275, 0.8323627, 1, 0, 0.8823529, 1,
1.056323, -0.4118295, 2.3982, 1, 0, 0.8745098, 1,
1.063422, 0.7301057, 1.019994, 1, 0, 0.8705882, 1,
1.075711, -0.925148, 3.055467, 1, 0, 0.8627451, 1,
1.077935, 1.096914, 1.455583, 1, 0, 0.8588235, 1,
1.080622, 0.3338083, 0.6435632, 1, 0, 0.8509804, 1,
1.082103, -0.1162087, 0.9736032, 1, 0, 0.8470588, 1,
1.093131, -0.04434946, 1.421234, 1, 0, 0.8392157, 1,
1.109442, -1.395203, 2.655162, 1, 0, 0.8352941, 1,
1.11271, 2.257933, 1.173527, 1, 0, 0.827451, 1,
1.114193, 0.6496255, -0.594657, 1, 0, 0.8235294, 1,
1.121123, 1.196383, 0.539613, 1, 0, 0.8156863, 1,
1.125934, -0.1439688, 1.632939, 1, 0, 0.8117647, 1,
1.129432, -0.3664713, 2.771465, 1, 0, 0.8039216, 1,
1.130235, 0.8935175, -0.5205138, 1, 0, 0.7960784, 1,
1.137433, -0.07150843, 0.6511881, 1, 0, 0.7921569, 1,
1.14209, 2.212849, 0.004263422, 1, 0, 0.7843137, 1,
1.150864, -0.2767393, 2.266749, 1, 0, 0.7803922, 1,
1.151026, -0.0699864, 1.222545, 1, 0, 0.772549, 1,
1.154277, 1.146203, 0.07604586, 1, 0, 0.7686275, 1,
1.161899, -1.108245, 4.423588, 1, 0, 0.7607843, 1,
1.167436, 0.3997428, 1.495561, 1, 0, 0.7568628, 1,
1.168795, -0.5858743, 3.210511, 1, 0, 0.7490196, 1,
1.176144, 0.2910688, 2.464867, 1, 0, 0.7450981, 1,
1.180076, -2.371856, 3.235661, 1, 0, 0.7372549, 1,
1.180467, 0.3744973, 1.211183, 1, 0, 0.7333333, 1,
1.192348, -1.100151, 2.169428, 1, 0, 0.7254902, 1,
1.192711, 0.7217447, 2.060097, 1, 0, 0.7215686, 1,
1.192812, 0.169922, 0.8310954, 1, 0, 0.7137255, 1,
1.209774, 2.218938, 1.297252, 1, 0, 0.7098039, 1,
1.219431, 0.5912255, 0.7854638, 1, 0, 0.7019608, 1,
1.224626, -0.009096639, 1.701007, 1, 0, 0.6941177, 1,
1.227279, 0.2930547, 2.520393, 1, 0, 0.6901961, 1,
1.239975, 1.029584, -1.479487, 1, 0, 0.682353, 1,
1.244368, 0.816048, 1.081694, 1, 0, 0.6784314, 1,
1.249522, -0.7624903, 3.079343, 1, 0, 0.6705883, 1,
1.251591, 0.1785128, 2.207587, 1, 0, 0.6666667, 1,
1.263354, 0.410271, 2.09491, 1, 0, 0.6588235, 1,
1.263424, -2.205212, 3.1417, 1, 0, 0.654902, 1,
1.26665, 0.5483466, 0.9817373, 1, 0, 0.6470588, 1,
1.266682, -1.437551, 3.092568, 1, 0, 0.6431373, 1,
1.270531, -0.03961094, 2.852858, 1, 0, 0.6352941, 1,
1.27488, -1.882524, 2.380339, 1, 0, 0.6313726, 1,
1.281445, -1.072353, 1.464652, 1, 0, 0.6235294, 1,
1.288211, -1.133312, 3.530024, 1, 0, 0.6196079, 1,
1.307009, -1.158119, 2.92375, 1, 0, 0.6117647, 1,
1.325204, 1.865249, -0.3942944, 1, 0, 0.6078432, 1,
1.335141, -1.332042, 1.654968, 1, 0, 0.6, 1,
1.340431, 0.1374478, 0.461141, 1, 0, 0.5921569, 1,
1.345735, -2.018268, 4.082715, 1, 0, 0.5882353, 1,
1.357234, 0.1061604, 2.401199, 1, 0, 0.5803922, 1,
1.364871, -0.8955793, 1.36278, 1, 0, 0.5764706, 1,
1.366938, -0.07231984, 0.4567799, 1, 0, 0.5686275, 1,
1.377194, -0.8781493, 1.819552, 1, 0, 0.5647059, 1,
1.383758, -1.652572, 1.080407, 1, 0, 0.5568628, 1,
1.385705, -0.4818347, 3.690961, 1, 0, 0.5529412, 1,
1.387408, 1.381578, 1.587271, 1, 0, 0.5450981, 1,
1.402124, 0.7284657, 1.751427, 1, 0, 0.5411765, 1,
1.403599, -0.4215204, 1.75888, 1, 0, 0.5333334, 1,
1.407683, -1.3723, 2.665114, 1, 0, 0.5294118, 1,
1.415409, -2.318827, 3.093649, 1, 0, 0.5215687, 1,
1.431208, -1.306605, 3.257217, 1, 0, 0.5176471, 1,
1.443613, 1.068, -1.822161, 1, 0, 0.509804, 1,
1.446248, -0.446969, 2.250111, 1, 0, 0.5058824, 1,
1.447321, -0.1287953, 1.175047, 1, 0, 0.4980392, 1,
1.4477, -0.5334896, 2.293674, 1, 0, 0.4901961, 1,
1.458229, -0.276251, 3.209008, 1, 0, 0.4862745, 1,
1.459349, -1.106973, 0.5580387, 1, 0, 0.4784314, 1,
1.465467, -1.246993, 1.180015, 1, 0, 0.4745098, 1,
1.467388, 0.03537058, 1.632575, 1, 0, 0.4666667, 1,
1.487336, 0.8036213, 0.3620833, 1, 0, 0.4627451, 1,
1.487912, 0.5688105, 0.2443972, 1, 0, 0.454902, 1,
1.489144, -1.176829, 0.7931262, 1, 0, 0.4509804, 1,
1.500329, -0.05808818, 1.655859, 1, 0, 0.4431373, 1,
1.510322, -0.136297, 1.352548, 1, 0, 0.4392157, 1,
1.52964, -0.3771883, 2.768412, 1, 0, 0.4313726, 1,
1.536966, -0.2102097, 1.54805, 1, 0, 0.427451, 1,
1.547756, -0.2086933, 0.05124963, 1, 0, 0.4196078, 1,
1.551251, 1.615402, 0.2929966, 1, 0, 0.4156863, 1,
1.555999, -0.2894748, 1.222543, 1, 0, 0.4078431, 1,
1.577939, -0.8101068, 1.130192, 1, 0, 0.4039216, 1,
1.596831, -0.4348491, 2.337918, 1, 0, 0.3960784, 1,
1.597349, 0.09258936, 2.328932, 1, 0, 0.3882353, 1,
1.607033, 0.5064815, 1.316066, 1, 0, 0.3843137, 1,
1.622453, 0.1679096, 0.4962791, 1, 0, 0.3764706, 1,
1.628502, -1.329975, 2.500798, 1, 0, 0.372549, 1,
1.632192, -1.054345, 2.908848, 1, 0, 0.3647059, 1,
1.63857, -0.1153678, 3.88653, 1, 0, 0.3607843, 1,
1.668649, -1.166609, 3.303349, 1, 0, 0.3529412, 1,
1.692241, -0.1590019, 2.279103, 1, 0, 0.3490196, 1,
1.713707, 0.008518161, 0.4460696, 1, 0, 0.3411765, 1,
1.742736, 0.5627993, -0.8648322, 1, 0, 0.3372549, 1,
1.747363, 1.247896, 0.1563649, 1, 0, 0.3294118, 1,
1.750109, 0.5335218, 2.682688, 1, 0, 0.3254902, 1,
1.763319, -1.322941, 2.159096, 1, 0, 0.3176471, 1,
1.784267, -1.178902, 4.042848, 1, 0, 0.3137255, 1,
1.794428, 0.5901897, 2.788759, 1, 0, 0.3058824, 1,
1.803372, 1.475522, -0.801307, 1, 0, 0.2980392, 1,
1.811052, -1.196746, 2.41743, 1, 0, 0.2941177, 1,
1.81907, 0.2500579, 1.490595, 1, 0, 0.2862745, 1,
1.820444, -0.09576188, 0.4016922, 1, 0, 0.282353, 1,
1.829967, 0.7830287, -0.06029629, 1, 0, 0.2745098, 1,
1.832392, -0.9404288, 1.682439, 1, 0, 0.2705882, 1,
1.836583, 0.2057126, 0.06393914, 1, 0, 0.2627451, 1,
1.84307, -0.3544394, 1.460867, 1, 0, 0.2588235, 1,
1.85111, -0.8591529, 3.049685, 1, 0, 0.2509804, 1,
1.862809, -0.5146853, 2.636167, 1, 0, 0.2470588, 1,
1.8639, 0.1537947, 2.176764, 1, 0, 0.2392157, 1,
1.876152, 0.6931807, -0.0103309, 1, 0, 0.2352941, 1,
1.927292, -0.09188285, 2.623902, 1, 0, 0.227451, 1,
1.93093, 2.431995, 1.954753, 1, 0, 0.2235294, 1,
1.939988, -0.1579392, 2.580145, 1, 0, 0.2156863, 1,
1.95505, -1.668947, 2.749086, 1, 0, 0.2117647, 1,
1.99403, 0.008089161, 1.828336, 1, 0, 0.2039216, 1,
1.994161, -0.3966965, 2.260267, 1, 0, 0.1960784, 1,
2.004488, -0.6633475, 2.390141, 1, 0, 0.1921569, 1,
2.025007, -0.9216865, 2.323566, 1, 0, 0.1843137, 1,
2.025298, -1.02054, 0.3450812, 1, 0, 0.1803922, 1,
2.063941, 1.28019, 0.7076632, 1, 0, 0.172549, 1,
2.064864, -0.2295183, 2.287133, 1, 0, 0.1686275, 1,
2.069995, 0.5510296, 1.453701, 1, 0, 0.1607843, 1,
2.085013, 0.2212315, -0.02513828, 1, 0, 0.1568628, 1,
2.122715, -0.4733245, 2.352468, 1, 0, 0.1490196, 1,
2.144543, -0.2702523, 1.341293, 1, 0, 0.145098, 1,
2.172884, -0.2502636, 0.5840399, 1, 0, 0.1372549, 1,
2.180614, -0.4433306, 0.6903446, 1, 0, 0.1333333, 1,
2.195351, -0.0639746, 1.899749, 1, 0, 0.1254902, 1,
2.259041, -1.186499, 1.280995, 1, 0, 0.1215686, 1,
2.290401, 1.569003, 0.8377768, 1, 0, 0.1137255, 1,
2.295974, 0.6049302, 1.482419, 1, 0, 0.1098039, 1,
2.407243, -0.09978319, 2.493188, 1, 0, 0.1019608, 1,
2.444455, -0.4017743, 2.06789, 1, 0, 0.09411765, 1,
2.485095, 1.792076, 0.4998212, 1, 0, 0.09019608, 1,
2.490136, 2.313434, 0.3953269, 1, 0, 0.08235294, 1,
2.504958, 1.504245, 2.201775, 1, 0, 0.07843138, 1,
2.541856, -0.5085196, 2.633665, 1, 0, 0.07058824, 1,
2.547537, 0.4269207, 0.6814688, 1, 0, 0.06666667, 1,
2.551478, 0.3471938, 2.804929, 1, 0, 0.05882353, 1,
2.631787, -0.3426532, 1.341323, 1, 0, 0.05490196, 1,
2.637652, 1.392218, 0.8566281, 1, 0, 0.04705882, 1,
2.692081, 0.1768643, 2.358311, 1, 0, 0.04313726, 1,
2.764161, -0.3176503, -0.06521005, 1, 0, 0.03529412, 1,
2.813397, -0.6318821, 1.636297, 1, 0, 0.03137255, 1,
2.869545, 0.5933755, 1.328322, 1, 0, 0.02352941, 1,
3.00824, -2.407595, 2.280444, 1, 0, 0.01960784, 1,
3.191502, 0.6301448, 1.670715, 1, 0, 0.01176471, 1,
3.308343, -0.3491839, 2.106725, 1, 0, 0.007843138, 1
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
0.1005212, -4.309477, -7.044633, 0, -0.5, 0.5, 0.5,
0.1005212, -4.309477, -7.044633, 1, -0.5, 0.5, 0.5,
0.1005212, -4.309477, -7.044633, 1, 1.5, 0.5, 0.5,
0.1005212, -4.309477, -7.044633, 0, 1.5, 0.5, 0.5
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
-4.194753, 0.007389903, -7.044633, 0, -0.5, 0.5, 0.5,
-4.194753, 0.007389903, -7.044633, 1, -0.5, 0.5, 0.5,
-4.194753, 0.007389903, -7.044633, 1, 1.5, 0.5, 0.5,
-4.194753, 0.007389903, -7.044633, 0, 1.5, 0.5, 0.5
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
-4.194753, -4.309477, 0.2024508, 0, -0.5, 0.5, 0.5,
-4.194753, -4.309477, 0.2024508, 1, -0.5, 0.5, 0.5,
-4.194753, -4.309477, 0.2024508, 1, 1.5, 0.5, 0.5,
-4.194753, -4.309477, 0.2024508, 0, 1.5, 0.5, 0.5
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
-3, -3.313277, -5.372229,
3, -3.313277, -5.372229,
-3, -3.313277, -5.372229,
-3, -3.479311, -5.650963,
-2, -3.313277, -5.372229,
-2, -3.479311, -5.650963,
-1, -3.313277, -5.372229,
-1, -3.479311, -5.650963,
0, -3.313277, -5.372229,
0, -3.479311, -5.650963,
1, -3.313277, -5.372229,
1, -3.479311, -5.650963,
2, -3.313277, -5.372229,
2, -3.479311, -5.650963,
3, -3.313277, -5.372229,
3, -3.479311, -5.650963
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
-3, -3.811377, -6.208431, 0, -0.5, 0.5, 0.5,
-3, -3.811377, -6.208431, 1, -0.5, 0.5, 0.5,
-3, -3.811377, -6.208431, 1, 1.5, 0.5, 0.5,
-3, -3.811377, -6.208431, 0, 1.5, 0.5, 0.5,
-2, -3.811377, -6.208431, 0, -0.5, 0.5, 0.5,
-2, -3.811377, -6.208431, 1, -0.5, 0.5, 0.5,
-2, -3.811377, -6.208431, 1, 1.5, 0.5, 0.5,
-2, -3.811377, -6.208431, 0, 1.5, 0.5, 0.5,
-1, -3.811377, -6.208431, 0, -0.5, 0.5, 0.5,
-1, -3.811377, -6.208431, 1, -0.5, 0.5, 0.5,
-1, -3.811377, -6.208431, 1, 1.5, 0.5, 0.5,
-1, -3.811377, -6.208431, 0, 1.5, 0.5, 0.5,
0, -3.811377, -6.208431, 0, -0.5, 0.5, 0.5,
0, -3.811377, -6.208431, 1, -0.5, 0.5, 0.5,
0, -3.811377, -6.208431, 1, 1.5, 0.5, 0.5,
0, -3.811377, -6.208431, 0, 1.5, 0.5, 0.5,
1, -3.811377, -6.208431, 0, -0.5, 0.5, 0.5,
1, -3.811377, -6.208431, 1, -0.5, 0.5, 0.5,
1, -3.811377, -6.208431, 1, 1.5, 0.5, 0.5,
1, -3.811377, -6.208431, 0, 1.5, 0.5, 0.5,
2, -3.811377, -6.208431, 0, -0.5, 0.5, 0.5,
2, -3.811377, -6.208431, 1, -0.5, 0.5, 0.5,
2, -3.811377, -6.208431, 1, 1.5, 0.5, 0.5,
2, -3.811377, -6.208431, 0, 1.5, 0.5, 0.5,
3, -3.811377, -6.208431, 0, -0.5, 0.5, 0.5,
3, -3.811377, -6.208431, 1, -0.5, 0.5, 0.5,
3, -3.811377, -6.208431, 1, 1.5, 0.5, 0.5,
3, -3.811377, -6.208431, 0, 1.5, 0.5, 0.5
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
-3.203536, -3, -5.372229,
-3.203536, 3, -5.372229,
-3.203536, -3, -5.372229,
-3.368738, -3, -5.650963,
-3.203536, -2, -5.372229,
-3.368738, -2, -5.650963,
-3.203536, -1, -5.372229,
-3.368738, -1, -5.650963,
-3.203536, 0, -5.372229,
-3.368738, 0, -5.650963,
-3.203536, 1, -5.372229,
-3.368738, 1, -5.650963,
-3.203536, 2, -5.372229,
-3.368738, 2, -5.650963,
-3.203536, 3, -5.372229,
-3.368738, 3, -5.650963
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
-3.699144, -3, -6.208431, 0, -0.5, 0.5, 0.5,
-3.699144, -3, -6.208431, 1, -0.5, 0.5, 0.5,
-3.699144, -3, -6.208431, 1, 1.5, 0.5, 0.5,
-3.699144, -3, -6.208431, 0, 1.5, 0.5, 0.5,
-3.699144, -2, -6.208431, 0, -0.5, 0.5, 0.5,
-3.699144, -2, -6.208431, 1, -0.5, 0.5, 0.5,
-3.699144, -2, -6.208431, 1, 1.5, 0.5, 0.5,
-3.699144, -2, -6.208431, 0, 1.5, 0.5, 0.5,
-3.699144, -1, -6.208431, 0, -0.5, 0.5, 0.5,
-3.699144, -1, -6.208431, 1, -0.5, 0.5, 0.5,
-3.699144, -1, -6.208431, 1, 1.5, 0.5, 0.5,
-3.699144, -1, -6.208431, 0, 1.5, 0.5, 0.5,
-3.699144, 0, -6.208431, 0, -0.5, 0.5, 0.5,
-3.699144, 0, -6.208431, 1, -0.5, 0.5, 0.5,
-3.699144, 0, -6.208431, 1, 1.5, 0.5, 0.5,
-3.699144, 0, -6.208431, 0, 1.5, 0.5, 0.5,
-3.699144, 1, -6.208431, 0, -0.5, 0.5, 0.5,
-3.699144, 1, -6.208431, 1, -0.5, 0.5, 0.5,
-3.699144, 1, -6.208431, 1, 1.5, 0.5, 0.5,
-3.699144, 1, -6.208431, 0, 1.5, 0.5, 0.5,
-3.699144, 2, -6.208431, 0, -0.5, 0.5, 0.5,
-3.699144, 2, -6.208431, 1, -0.5, 0.5, 0.5,
-3.699144, 2, -6.208431, 1, 1.5, 0.5, 0.5,
-3.699144, 2, -6.208431, 0, 1.5, 0.5, 0.5,
-3.699144, 3, -6.208431, 0, -0.5, 0.5, 0.5,
-3.699144, 3, -6.208431, 1, -0.5, 0.5, 0.5,
-3.699144, 3, -6.208431, 1, 1.5, 0.5, 0.5,
-3.699144, 3, -6.208431, 0, 1.5, 0.5, 0.5
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
-3.203536, -3.313277, -4,
-3.203536, -3.313277, 4,
-3.203536, -3.313277, -4,
-3.368738, -3.479311, -4,
-3.203536, -3.313277, -2,
-3.368738, -3.479311, -2,
-3.203536, -3.313277, 0,
-3.368738, -3.479311, 0,
-3.203536, -3.313277, 2,
-3.368738, -3.479311, 2,
-3.203536, -3.313277, 4,
-3.368738, -3.479311, 4
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
-3.699144, -3.811377, -4, 0, -0.5, 0.5, 0.5,
-3.699144, -3.811377, -4, 1, -0.5, 0.5, 0.5,
-3.699144, -3.811377, -4, 1, 1.5, 0.5, 0.5,
-3.699144, -3.811377, -4, 0, 1.5, 0.5, 0.5,
-3.699144, -3.811377, -2, 0, -0.5, 0.5, 0.5,
-3.699144, -3.811377, -2, 1, -0.5, 0.5, 0.5,
-3.699144, -3.811377, -2, 1, 1.5, 0.5, 0.5,
-3.699144, -3.811377, -2, 0, 1.5, 0.5, 0.5,
-3.699144, -3.811377, 0, 0, -0.5, 0.5, 0.5,
-3.699144, -3.811377, 0, 1, -0.5, 0.5, 0.5,
-3.699144, -3.811377, 0, 1, 1.5, 0.5, 0.5,
-3.699144, -3.811377, 0, 0, 1.5, 0.5, 0.5,
-3.699144, -3.811377, 2, 0, -0.5, 0.5, 0.5,
-3.699144, -3.811377, 2, 1, -0.5, 0.5, 0.5,
-3.699144, -3.811377, 2, 1, 1.5, 0.5, 0.5,
-3.699144, -3.811377, 2, 0, 1.5, 0.5, 0.5,
-3.699144, -3.811377, 4, 0, -0.5, 0.5, 0.5,
-3.699144, -3.811377, 4, 1, -0.5, 0.5, 0.5,
-3.699144, -3.811377, 4, 1, 1.5, 0.5, 0.5,
-3.699144, -3.811377, 4, 0, 1.5, 0.5, 0.5
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
-3.203536, -3.313277, -5.372229,
-3.203536, 3.328057, -5.372229,
-3.203536, -3.313277, 5.777131,
-3.203536, 3.328057, 5.777131,
-3.203536, -3.313277, -5.372229,
-3.203536, -3.313277, 5.777131,
-3.203536, 3.328057, -5.372229,
-3.203536, 3.328057, 5.777131,
-3.203536, -3.313277, -5.372229,
3.404578, -3.313277, -5.372229,
-3.203536, -3.313277, 5.777131,
3.404578, -3.313277, 5.777131,
-3.203536, 3.328057, -5.372229,
3.404578, 3.328057, -5.372229,
-3.203536, 3.328057, 5.777131,
3.404578, 3.328057, 5.777131,
3.404578, -3.313277, -5.372229,
3.404578, 3.328057, -5.372229,
3.404578, -3.313277, 5.777131,
3.404578, 3.328057, 5.777131,
3.404578, -3.313277, -5.372229,
3.404578, -3.313277, 5.777131,
3.404578, 3.328057, -5.372229,
3.404578, 3.328057, 5.777131
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
var radius = 7.776391;
var distance = 34.59805;
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
mvMatrix.translate( -0.1005212, -0.007389903, -0.2024508 );
mvMatrix.scale( 1.272373, 1.266009, 0.7541228 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.59805);
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
tau-fluvalinate<-read.table("tau-fluvalinate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-tau-fluvalinate$V2
```

```
## Error in eval(expr, envir, enclos): object 'tau' not found
```

```r
y<-tau-fluvalinate$V3
```

```
## Error in eval(expr, envir, enclos): object 'tau' not found
```

```r
z<-tau-fluvalinate$V4
```

```
## Error in eval(expr, envir, enclos): object 'tau' not found
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
-3.107301, 0.8737115, -0.2559586, 0, 0, 1, 1, 1,
-2.904512, 1.763308, 0.5660201, 1, 0, 0, 1, 1,
-2.768452, 0.1532546, 0.06216516, 1, 0, 0, 1, 1,
-2.727123, -0.0860953, -2.695348, 1, 0, 0, 1, 1,
-2.663113, -0.06491856, -0.781331, 1, 0, 0, 1, 1,
-2.579659, -0.4451548, -1.620666, 1, 0, 0, 1, 1,
-2.532146, 1.383484, -2.160498, 0, 0, 0, 1, 1,
-2.492983, -3.216559, -2.78152, 0, 0, 0, 1, 1,
-2.470921, 0.2883981, 0.3810813, 0, 0, 0, 1, 1,
-2.324724, -1.271472, -3.047227, 0, 0, 0, 1, 1,
-2.286669, -1.654921, 0.2078263, 0, 0, 0, 1, 1,
-2.283291, -0.0230981, -1.766396, 0, 0, 0, 1, 1,
-2.242982, 0.7470464, -2.479691, 0, 0, 0, 1, 1,
-2.204392, 0.1784943, -2.057439, 1, 1, 1, 1, 1,
-2.176102, 2.431847, -0.8339689, 1, 1, 1, 1, 1,
-2.166209, 0.2765752, -1.837287, 1, 1, 1, 1, 1,
-2.13042, 0.3106794, 0.3863254, 1, 1, 1, 1, 1,
-2.068381, -1.693824, -2.752335, 1, 1, 1, 1, 1,
-2.065431, 0.9369867, -1.153795, 1, 1, 1, 1, 1,
-2.056368, 1.363096, -0.8154123, 1, 1, 1, 1, 1,
-2.020917, 1.387094, -1.725754, 1, 1, 1, 1, 1,
-2.003232, 1.53829, -0.538278, 1, 1, 1, 1, 1,
-1.982371, 1.420283, -0.6612526, 1, 1, 1, 1, 1,
-1.980575, -0.9118019, -1.705845, 1, 1, 1, 1, 1,
-1.941637, -0.7103102, -2.592273, 1, 1, 1, 1, 1,
-1.940751, -0.1530062, -1.507947, 1, 1, 1, 1, 1,
-1.928508, -1.110129, -1.793681, 1, 1, 1, 1, 1,
-1.880878, -1.073578, -2.463852, 1, 1, 1, 1, 1,
-1.830329, -0.1077277, -2.212857, 0, 0, 1, 1, 1,
-1.828583, 1.713163, -1.202189, 1, 0, 0, 1, 1,
-1.795273, -0.7522568, -3.60607, 1, 0, 0, 1, 1,
-1.785744, -0.4764854, -2.190762, 1, 0, 0, 1, 1,
-1.781218, -0.5279076, -1.285823, 1, 0, 0, 1, 1,
-1.775155, 0.6440443, -0.4787459, 1, 0, 0, 1, 1,
-1.754708, -1.868755, -2.692187, 0, 0, 0, 1, 1,
-1.744778, -0.6002536, -2.71593, 0, 0, 0, 1, 1,
-1.740411, -0.2872081, -2.750084, 0, 0, 0, 1, 1,
-1.736296, 0.08042496, -3.289167, 0, 0, 0, 1, 1,
-1.727133, 1.553884, -1.219367, 0, 0, 0, 1, 1,
-1.720231, -0.2243923, -2.843449, 0, 0, 0, 1, 1,
-1.687934, -1.416602, -1.3384, 0, 0, 0, 1, 1,
-1.677733, 0.5850548, 0.3629383, 1, 1, 1, 1, 1,
-1.661988, -0.5214405, -0.8203173, 1, 1, 1, 1, 1,
-1.64814, -0.7202283, -3.816332, 1, 1, 1, 1, 1,
-1.637046, -0.2367331, -1.54167, 1, 1, 1, 1, 1,
-1.63622, 0.0935438, -0.5305874, 1, 1, 1, 1, 1,
-1.626982, -1.413622, -2.024562, 1, 1, 1, 1, 1,
-1.618334, -0.3565389, -1.694924, 1, 1, 1, 1, 1,
-1.612033, -1.302256, -3.37354, 1, 1, 1, 1, 1,
-1.601653, 0.6487854, 0.8708797, 1, 1, 1, 1, 1,
-1.598266, 0.07402609, -1.381241, 1, 1, 1, 1, 1,
-1.595311, -0.5934404, -1.952874, 1, 1, 1, 1, 1,
-1.580446, -0.4376359, -1.539617, 1, 1, 1, 1, 1,
-1.575983, 2.359459, 0.1650396, 1, 1, 1, 1, 1,
-1.562486, 0.6055173, -1.11026, 1, 1, 1, 1, 1,
-1.555401, 0.3989849, -1.773219, 1, 1, 1, 1, 1,
-1.551425, -0.3224062, -1.194319, 0, 0, 1, 1, 1,
-1.540342, 0.6847488, -2.865355, 1, 0, 0, 1, 1,
-1.538198, 0.743, -0.6687037, 1, 0, 0, 1, 1,
-1.536544, 0.2456922, -1.178885, 1, 0, 0, 1, 1,
-1.53619, -2.095367, -2.523714, 1, 0, 0, 1, 1,
-1.534967, -0.01948221, 0.06541646, 1, 0, 0, 1, 1,
-1.518406, -0.5678427, 0.2545147, 0, 0, 0, 1, 1,
-1.516548, -1.071274, -1.426998, 0, 0, 0, 1, 1,
-1.511643, 0.4251359, -2.411031, 0, 0, 0, 1, 1,
-1.499935, -1.30147, -2.932083, 0, 0, 0, 1, 1,
-1.496771, 0.3316559, 0.08412345, 0, 0, 0, 1, 1,
-1.494279, 0.05868753, 0.7176298, 0, 0, 0, 1, 1,
-1.486552, 1.837162, -0.3788828, 0, 0, 0, 1, 1,
-1.484644, 0.9159535, -1.759413, 1, 1, 1, 1, 1,
-1.480701, 1.809617, 1.584339, 1, 1, 1, 1, 1,
-1.480673, 1.467768, -1.624658, 1, 1, 1, 1, 1,
-1.465672, 0.8221507, -1.474678, 1, 1, 1, 1, 1,
-1.445325, 0.5914086, -1.383867, 1, 1, 1, 1, 1,
-1.439818, -0.74835, -0.4326339, 1, 1, 1, 1, 1,
-1.435142, -0.4683861, -1.576336, 1, 1, 1, 1, 1,
-1.41966, 1.002289, -1.887916, 1, 1, 1, 1, 1,
-1.396944, -0.9167632, -2.957794, 1, 1, 1, 1, 1,
-1.389355, 0.8487553, -1.684265, 1, 1, 1, 1, 1,
-1.378584, 0.642304, -2.647151, 1, 1, 1, 1, 1,
-1.376859, -1.064213, -3.148645, 1, 1, 1, 1, 1,
-1.371999, -0.2395397, -1.119031, 1, 1, 1, 1, 1,
-1.364848, 0.4756085, -0.0535353, 1, 1, 1, 1, 1,
-1.35309, -0.2340016, -2.154041, 1, 1, 1, 1, 1,
-1.345117, 0.3435538, -1.300394, 0, 0, 1, 1, 1,
-1.341105, -0.1974444, -1.94875, 1, 0, 0, 1, 1,
-1.334713, 1.663265, -0.3042952, 1, 0, 0, 1, 1,
-1.333107, -0.6935104, -2.696072, 1, 0, 0, 1, 1,
-1.327528, -1.626849, -3.710634, 1, 0, 0, 1, 1,
-1.323616, -0.4168663, -2.903352, 1, 0, 0, 1, 1,
-1.322047, 0.6165605, -1.577879, 0, 0, 0, 1, 1,
-1.321924, -1.195444, -0.4128331, 0, 0, 0, 1, 1,
-1.315291, -1.151802, -1.606919, 0, 0, 0, 1, 1,
-1.310019, -1.022886, -3.479109, 0, 0, 0, 1, 1,
-1.309971, -1.33961, -2.527179, 0, 0, 0, 1, 1,
-1.30697, -1.066683, -1.728809, 0, 0, 0, 1, 1,
-1.306183, 0.2797289, -0.9974535, 0, 0, 0, 1, 1,
-1.299789, -0.786808, -1.644871, 1, 1, 1, 1, 1,
-1.293577, -0.6087723, -1.741668, 1, 1, 1, 1, 1,
-1.289232, 1.473247, -0.1078441, 1, 1, 1, 1, 1,
-1.286339, 0.1326937, -2.181536, 1, 1, 1, 1, 1,
-1.280125, 0.02952992, -1.15493, 1, 1, 1, 1, 1,
-1.274475, -0.123725, -1.667869, 1, 1, 1, 1, 1,
-1.271294, -2.157379, -2.100106, 1, 1, 1, 1, 1,
-1.259079, -0.05504681, -2.277545, 1, 1, 1, 1, 1,
-1.255493, -0.07534043, -1.866745, 1, 1, 1, 1, 1,
-1.252857, 1.536924, -0.6800634, 1, 1, 1, 1, 1,
-1.24824, 1.270532, -2.090166, 1, 1, 1, 1, 1,
-1.24112, 0.7043919, -0.9982883, 1, 1, 1, 1, 1,
-1.23872, 1.439958, -2.44509, 1, 1, 1, 1, 1,
-1.238548, -1.434406, -3.545183, 1, 1, 1, 1, 1,
-1.23389, 0.3232093, -3.07121, 1, 1, 1, 1, 1,
-1.233012, 0.07905461, -1.275441, 0, 0, 1, 1, 1,
-1.227655, -2.478029, -1.13482, 1, 0, 0, 1, 1,
-1.224754, 0.2913744, -2.76561, 1, 0, 0, 1, 1,
-1.219046, 1.831056, -1.325591, 1, 0, 0, 1, 1,
-1.217675, -0.2104637, -1.421875, 1, 0, 0, 1, 1,
-1.215115, 0.1877149, 0.1173982, 1, 0, 0, 1, 1,
-1.214552, -0.6385959, -3.119992, 0, 0, 0, 1, 1,
-1.209735, 1.645319, 1.953358, 0, 0, 0, 1, 1,
-1.208623, 1.311292, -0.7264667, 0, 0, 0, 1, 1,
-1.200207, -0.01457594, -1.041829, 0, 0, 0, 1, 1,
-1.195088, -1.445906, -1.517798, 0, 0, 0, 1, 1,
-1.18112, 0.3718503, -1.092507, 0, 0, 0, 1, 1,
-1.173111, 0.3205443, -0.5473993, 0, 0, 0, 1, 1,
-1.171892, -0.3483434, -3.408121, 1, 1, 1, 1, 1,
-1.152807, 0.8096411, -2.362309, 1, 1, 1, 1, 1,
-1.151302, 1.107019, 0.5253638, 1, 1, 1, 1, 1,
-1.143983, -0.4416674, -0.4779584, 1, 1, 1, 1, 1,
-1.137663, -1.572201, -2.462292, 1, 1, 1, 1, 1,
-1.134517, 1.372573, -1.309164, 1, 1, 1, 1, 1,
-1.131477, 1.205424, -0.8609585, 1, 1, 1, 1, 1,
-1.129388, 2.116789, -0.01764769, 1, 1, 1, 1, 1,
-1.125788, 0.3698333, -0.6979084, 1, 1, 1, 1, 1,
-1.124653, -0.1339236, -2.510197, 1, 1, 1, 1, 1,
-1.121815, 0.4204223, -0.7910078, 1, 1, 1, 1, 1,
-1.115354, -1.820413, -3.641798, 1, 1, 1, 1, 1,
-1.111413, -0.09989594, -2.473315, 1, 1, 1, 1, 1,
-1.104462, -1.700154, -1.643201, 1, 1, 1, 1, 1,
-1.100059, 0.0730589, -1.144526, 1, 1, 1, 1, 1,
-1.099073, -1.157089, -2.594486, 0, 0, 1, 1, 1,
-1.098927, 0.02275769, -2.875069, 1, 0, 0, 1, 1,
-1.094693, -0.5135772, -2.67786, 1, 0, 0, 1, 1,
-1.079719, -0.5824373, -2.555667, 1, 0, 0, 1, 1,
-1.076809, -1.063637, -2.0891, 1, 0, 0, 1, 1,
-1.072103, 0.04953617, -0.5185651, 1, 0, 0, 1, 1,
-1.060934, 0.126025, -2.240635, 0, 0, 0, 1, 1,
-1.057987, 1.356195, -1.760427, 0, 0, 0, 1, 1,
-1.04663, -1.574577, -2.398537, 0, 0, 0, 1, 1,
-1.046129, -1.55567, -2.272469, 0, 0, 0, 1, 1,
-1.042197, 1.215686, 0.4021778, 0, 0, 0, 1, 1,
-1.036048, -0.3501467, -2.069464, 0, 0, 0, 1, 1,
-1.033614, -1.423455, -3.085943, 0, 0, 0, 1, 1,
-1.033351, -1.267352, -2.451377, 1, 1, 1, 1, 1,
-1.029733, -0.2118469, -0.9475674, 1, 1, 1, 1, 1,
-1.027627, -0.6605371, -1.301781, 1, 1, 1, 1, 1,
-1.027107, -0.8609557, -1.930035, 1, 1, 1, 1, 1,
-1.025128, 0.1218227, -1.019885, 1, 1, 1, 1, 1,
-1.021686, 1.867943, 0.7575883, 1, 1, 1, 1, 1,
-1.021006, -1.13067, -2.430203, 1, 1, 1, 1, 1,
-1.016503, 0.1396576, -2.511445, 1, 1, 1, 1, 1,
-1.013547, 0.2528815, -1.719075, 1, 1, 1, 1, 1,
-1.012633, -1.726295, -0.5675242, 1, 1, 1, 1, 1,
-1.011197, -0.8303046, -2.037619, 1, 1, 1, 1, 1,
-1.009943, -1.296316, -2.654961, 1, 1, 1, 1, 1,
-1.009854, -1.500101, -4.234994, 1, 1, 1, 1, 1,
-1.00831, -0.3842646, -2.645167, 1, 1, 1, 1, 1,
-1.007604, 0.4845701, -0.8428406, 1, 1, 1, 1, 1,
-1.004677, 0.2892008, -2.291122, 0, 0, 1, 1, 1,
-0.9907111, 0.615701, -1.215597, 1, 0, 0, 1, 1,
-0.9898416, -1.901503, -2.938064, 1, 0, 0, 1, 1,
-0.9889101, 0.426191, -0.2707285, 1, 0, 0, 1, 1,
-0.9846257, -0.4569139, -1.441936, 1, 0, 0, 1, 1,
-0.9839965, 0.8376198, -1.69918, 1, 0, 0, 1, 1,
-0.9771798, 0.4181762, -2.385599, 0, 0, 0, 1, 1,
-0.9549419, 0.09465439, -1.229994, 0, 0, 0, 1, 1,
-0.9502518, 0.001317318, -1.266313, 0, 0, 0, 1, 1,
-0.9498561, -1.263931, 0.001977951, 0, 0, 0, 1, 1,
-0.9496016, 0.7426481, 0.7271481, 0, 0, 0, 1, 1,
-0.9480358, 0.2940988, -0.5291997, 0, 0, 0, 1, 1,
-0.9467386, 1.588614, -1.645117, 0, 0, 0, 1, 1,
-0.9460678, 0.07919644, -0.518738, 1, 1, 1, 1, 1,
-0.9456875, -0.1086341, -2.615551, 1, 1, 1, 1, 1,
-0.9444917, 1.165804, -1.160311, 1, 1, 1, 1, 1,
-0.9406912, 1.774603, 0.3882514, 1, 1, 1, 1, 1,
-0.9402138, -0.2006771, -2.198561, 1, 1, 1, 1, 1,
-0.9341785, 2.046192, -0.6152456, 1, 1, 1, 1, 1,
-0.9326019, 1.255167, -0.7587844, 1, 1, 1, 1, 1,
-0.9282475, 1.116472, -1.832221, 1, 1, 1, 1, 1,
-0.9125153, 0.5964632, -2.025883, 1, 1, 1, 1, 1,
-0.9086155, 0.6799029, -1.193253, 1, 1, 1, 1, 1,
-0.9070022, -0.4994583, -4.542868, 1, 1, 1, 1, 1,
-0.9006677, -1.352575, -1.335933, 1, 1, 1, 1, 1,
-0.898573, -0.6239812, -1.36873, 1, 1, 1, 1, 1,
-0.8920397, -1.496725, -4.773204, 1, 1, 1, 1, 1,
-0.8871766, -1.272378, -2.233643, 1, 1, 1, 1, 1,
-0.879697, -0.3383277, -1.501115, 0, 0, 1, 1, 1,
-0.8772725, -0.06982499, -0.8082137, 1, 0, 0, 1, 1,
-0.8745421, -0.03424704, -1.384667, 1, 0, 0, 1, 1,
-0.8736497, 0.1826865, -1.77054, 1, 0, 0, 1, 1,
-0.869212, -0.3014135, -2.727998, 1, 0, 0, 1, 1,
-0.8689996, -0.2490767, -1.095207, 1, 0, 0, 1, 1,
-0.867716, 0.8441581, -0.3465064, 0, 0, 0, 1, 1,
-0.8669162, -1.049445, -3.178154, 0, 0, 0, 1, 1,
-0.8647225, 0.05848849, -2.475817, 0, 0, 0, 1, 1,
-0.8580666, -0.4910214, -1.939072, 0, 0, 0, 1, 1,
-0.8487536, 0.4813848, -2.856058, 0, 0, 0, 1, 1,
-0.8351879, -0.4139881, -1.955152, 0, 0, 0, 1, 1,
-0.8343436, 1.2219, 0.3042138, 0, 0, 0, 1, 1,
-0.8342829, -0.02102088, -1.835296, 1, 1, 1, 1, 1,
-0.831338, 0.82706, -1.829097, 1, 1, 1, 1, 1,
-0.8306741, -0.6143328, -2.469824, 1, 1, 1, 1, 1,
-0.8249636, -0.4773828, -1.93676, 1, 1, 1, 1, 1,
-0.8199996, -0.5493778, -2.566942, 1, 1, 1, 1, 1,
-0.8115839, -0.7161564, -1.711759, 1, 1, 1, 1, 1,
-0.8086135, 0.7820391, -1.724966, 1, 1, 1, 1, 1,
-0.8063084, -0.08701179, -1.439768, 1, 1, 1, 1, 1,
-0.8047165, -0.5435758, -2.401351, 1, 1, 1, 1, 1,
-0.8022774, -0.1168357, -3.07019, 1, 1, 1, 1, 1,
-0.8017828, 0.3326795, -3.179587, 1, 1, 1, 1, 1,
-0.7988726, -0.3631912, -2.476104, 1, 1, 1, 1, 1,
-0.7957231, -0.1418643, -1.819992, 1, 1, 1, 1, 1,
-0.7932164, 0.3828182, -2.64658, 1, 1, 1, 1, 1,
-0.7931562, 0.05067859, -1.67383, 1, 1, 1, 1, 1,
-0.7885543, -0.2731671, -0.8898857, 0, 0, 1, 1, 1,
-0.7873133, -0.9571192, -2.319573, 1, 0, 0, 1, 1,
-0.7866566, -0.8109267, -0.8918429, 1, 0, 0, 1, 1,
-0.7828305, 0.3932919, -1.630766, 1, 0, 0, 1, 1,
-0.7783376, -0.5124742, -1.117418, 1, 0, 0, 1, 1,
-0.7773775, -0.9918231, -2.284746, 1, 0, 0, 1, 1,
-0.7714717, 0.8894978, -1.435215, 0, 0, 0, 1, 1,
-0.7696552, -0.1903, -1.351212, 0, 0, 0, 1, 1,
-0.769046, 0.2326299, -2.308439, 0, 0, 0, 1, 1,
-0.7677308, -0.3019241, -2.391714, 0, 0, 0, 1, 1,
-0.7657426, 0.3445645, -3.020186, 0, 0, 0, 1, 1,
-0.7604057, 1.107213, 0.07717215, 0, 0, 0, 1, 1,
-0.7596371, 0.02612574, -0.9486953, 0, 0, 0, 1, 1,
-0.7591675, 0.2552634, -1.750162, 1, 1, 1, 1, 1,
-0.7589539, 1.386762, -0.8775625, 1, 1, 1, 1, 1,
-0.7569742, -0.3553326, -3.79348, 1, 1, 1, 1, 1,
-0.7551602, -0.8106163, -2.02242, 1, 1, 1, 1, 1,
-0.7521142, -0.2692669, -2.286165, 1, 1, 1, 1, 1,
-0.7510121, 0.04726097, -0.5254912, 1, 1, 1, 1, 1,
-0.7498291, -0.9670157, -3.284985, 1, 1, 1, 1, 1,
-0.749328, 0.2550605, -1.471538, 1, 1, 1, 1, 1,
-0.7487905, 2.031745, -1.424004, 1, 1, 1, 1, 1,
-0.7402967, -0.8054588, -2.998878, 1, 1, 1, 1, 1,
-0.7389886, 0.3831843, -0.5012972, 1, 1, 1, 1, 1,
-0.7326423, 1.177793, -2.605241, 1, 1, 1, 1, 1,
-0.7243859, -0.2417715, -1.867314, 1, 1, 1, 1, 1,
-0.723999, 1.53673, -0.5992988, 1, 1, 1, 1, 1,
-0.719523, -0.742694, -3.656703, 1, 1, 1, 1, 1,
-0.7122708, -1.233795, -3.332894, 0, 0, 1, 1, 1,
-0.7019224, 0.3099772, 0.3467489, 1, 0, 0, 1, 1,
-0.7018067, -1.276667, -2.038748, 1, 0, 0, 1, 1,
-0.6844583, -0.2023015, -1.423367, 1, 0, 0, 1, 1,
-0.678399, -0.2612254, -2.988117, 1, 0, 0, 1, 1,
-0.6637496, -0.2043412, -3.033533, 1, 0, 0, 1, 1,
-0.6616534, -0.02380968, -0.7786265, 0, 0, 0, 1, 1,
-0.6602022, 0.5026936, -0.9274881, 0, 0, 0, 1, 1,
-0.6601884, -0.269984, -1.0554, 0, 0, 0, 1, 1,
-0.653424, -1.199468, -3.56072, 0, 0, 0, 1, 1,
-0.6530361, -0.5597844, -1.107545, 0, 0, 0, 1, 1,
-0.6499593, 1.521437, -1.163375, 0, 0, 0, 1, 1,
-0.6413314, 0.1033817, -2.158113, 0, 0, 0, 1, 1,
-0.6381854, -1.516115, -2.236896, 1, 1, 1, 1, 1,
-0.6352193, 0.07481717, -3.451204, 1, 1, 1, 1, 1,
-0.6350325, -0.0789979, -4.904668, 1, 1, 1, 1, 1,
-0.6336132, -0.9819916, -1.018412, 1, 1, 1, 1, 1,
-0.6288208, -0.7190457, -1.08382, 1, 1, 1, 1, 1,
-0.6215007, 0.4608573, -2.613069, 1, 1, 1, 1, 1,
-0.6145344, -0.6831985, -2.030151, 1, 1, 1, 1, 1,
-0.6079708, 0.2899354, -1.774289, 1, 1, 1, 1, 1,
-0.6077282, -0.5370393, -1.917243, 1, 1, 1, 1, 1,
-0.6068393, -2.085052, -2.209286, 1, 1, 1, 1, 1,
-0.6064591, 0.4680266, -1.136213, 1, 1, 1, 1, 1,
-0.6064204, 0.06071955, -0.9159572, 1, 1, 1, 1, 1,
-0.6045005, -1.022449, -1.497286, 1, 1, 1, 1, 1,
-0.6043049, 1.509869, -0.6707182, 1, 1, 1, 1, 1,
-0.5994468, 1.453475, -0.2488003, 1, 1, 1, 1, 1,
-0.5949038, -0.2568697, -3.493934, 0, 0, 1, 1, 1,
-0.5948331, 0.4502652, -0.8520635, 1, 0, 0, 1, 1,
-0.5945245, -1.504063, -3.8494, 1, 0, 0, 1, 1,
-0.5941276, -0.960943, -2.909104, 1, 0, 0, 1, 1,
-0.5925665, 1.322024, -0.3754198, 1, 0, 0, 1, 1,
-0.5925401, -0.1819466, -2.400733, 1, 0, 0, 1, 1,
-0.5892844, -0.6171885, -4.164001, 0, 0, 0, 1, 1,
-0.5878759, 1.258055, -1.534503, 0, 0, 0, 1, 1,
-0.5871959, 0.5265612, -0.4676743, 0, 0, 0, 1, 1,
-0.5867202, -0.02176979, -0.06819692, 0, 0, 0, 1, 1,
-0.581504, -1.320716, -3.840893, 0, 0, 0, 1, 1,
-0.5744823, -0.5084482, -3.988141, 0, 0, 0, 1, 1,
-0.56904, -0.03313162, -1.044318, 0, 0, 0, 1, 1,
-0.567655, -0.698931, -2.246675, 1, 1, 1, 1, 1,
-0.56721, -0.7688468, -1.552241, 1, 1, 1, 1, 1,
-0.5630375, -0.5550744, -2.746742, 1, 1, 1, 1, 1,
-0.562651, -1.191276, -1.95272, 1, 1, 1, 1, 1,
-0.5604535, 1.260231, -0.5520989, 1, 1, 1, 1, 1,
-0.5596265, 0.3992398, -0.3037517, 1, 1, 1, 1, 1,
-0.558982, -1.294045, -3.608216, 1, 1, 1, 1, 1,
-0.5589195, 2.116956, -1.129326, 1, 1, 1, 1, 1,
-0.5587569, -0.696292, -3.515232, 1, 1, 1, 1, 1,
-0.5584316, 0.6591464, -0.8856745, 1, 1, 1, 1, 1,
-0.5568061, -0.9556062, -2.819982, 1, 1, 1, 1, 1,
-0.556319, -0.5528445, -3.002208, 1, 1, 1, 1, 1,
-0.5542538, -1.002329, -3.865335, 1, 1, 1, 1, 1,
-0.5446898, 0.1443784, -2.353779, 1, 1, 1, 1, 1,
-0.5409747, 2.062083, -1.272563, 1, 1, 1, 1, 1,
-0.5407931, -0.1479438, -1.860561, 0, 0, 1, 1, 1,
-0.5383708, 2.604095, 0.2717864, 1, 0, 0, 1, 1,
-0.5339923, -2.29344, -1.908641, 1, 0, 0, 1, 1,
-0.5332306, -0.6146981, -4.157523, 1, 0, 0, 1, 1,
-0.5287414, 0.04703411, -1.529451, 1, 0, 0, 1, 1,
-0.5235839, -0.5319725, -1.846993, 1, 0, 0, 1, 1,
-0.520834, 1.668494, 0.3237042, 0, 0, 0, 1, 1,
-0.5131835, -1.209744, -3.194347, 0, 0, 0, 1, 1,
-0.511154, 0.6856416, -1.686693, 0, 0, 0, 1, 1,
-0.5084501, -1.521682, -1.16027, 0, 0, 0, 1, 1,
-0.5025434, -0.9205181, -2.229476, 0, 0, 0, 1, 1,
-0.4973285, 1.781901, 0.1051685, 0, 0, 0, 1, 1,
-0.4970862, 0.3182523, 0.454874, 0, 0, 0, 1, 1,
-0.4969832, -0.3016261, -3.052874, 1, 1, 1, 1, 1,
-0.4944327, 0.557395, 0.1470668, 1, 1, 1, 1, 1,
-0.4880294, 0.299008, -1.086663, 1, 1, 1, 1, 1,
-0.4873515, -0.1162183, -2.861184, 1, 1, 1, 1, 1,
-0.4845875, -0.7911513, -3.546357, 1, 1, 1, 1, 1,
-0.483696, -0.4618918, -2.0332, 1, 1, 1, 1, 1,
-0.4829001, 2.173777, 0.2064481, 1, 1, 1, 1, 1,
-0.4811338, 0.4223414, -2.271429, 1, 1, 1, 1, 1,
-0.4795534, 0.4386753, -1.67079, 1, 1, 1, 1, 1,
-0.4793974, -1.619325, -2.143059, 1, 1, 1, 1, 1,
-0.4782745, 1.014856, -1.166391, 1, 1, 1, 1, 1,
-0.4758806, 1.78636, -1.521874, 1, 1, 1, 1, 1,
-0.4742981, -1.589547, -1.998661, 1, 1, 1, 1, 1,
-0.473609, 0.6818901, 1.383095, 1, 1, 1, 1, 1,
-0.472217, 0.2260773, -1.027819, 1, 1, 1, 1, 1,
-0.4702901, -0.4499047, -1.984783, 0, 0, 1, 1, 1,
-0.4580687, 0.3932056, -2.010403, 1, 0, 0, 1, 1,
-0.4543476, 1.380024, 0.3303755, 1, 0, 0, 1, 1,
-0.4541451, -0.1313585, -1.156909, 1, 0, 0, 1, 1,
-0.4499082, 0.07806938, -0.9946169, 1, 0, 0, 1, 1,
-0.444094, 0.6406816, -1.849919, 1, 0, 0, 1, 1,
-0.4413662, 0.2386896, -0.4684233, 0, 0, 0, 1, 1,
-0.4393394, -0.1757809, -2.374094, 0, 0, 0, 1, 1,
-0.4377517, -1.199877, -3.816916, 0, 0, 0, 1, 1,
-0.4357459, 2.452609, -1.877059, 0, 0, 0, 1, 1,
-0.4259075, -0.8304369, -1.678403, 0, 0, 0, 1, 1,
-0.4173969, -0.5810313, -2.8538, 0, 0, 0, 1, 1,
-0.4127561, -0.4514341, -1.825786, 0, 0, 0, 1, 1,
-0.4074154, 0.7666415, 0.7793736, 1, 1, 1, 1, 1,
-0.4059086, -1.667982, -5.20986, 1, 1, 1, 1, 1,
-0.4011766, -1.403347, -4.27595, 1, 1, 1, 1, 1,
-0.4003769, 0.2884245, 1.044061, 1, 1, 1, 1, 1,
-0.3954566, 1.204964, -0.5821021, 1, 1, 1, 1, 1,
-0.3952883, 1.04119, -1.449595, 1, 1, 1, 1, 1,
-0.3799708, -0.6227851, -1.000501, 1, 1, 1, 1, 1,
-0.3751188, 0.8315558, 0.4582708, 1, 1, 1, 1, 1,
-0.3711035, 0.4437263, -0.4000875, 1, 1, 1, 1, 1,
-0.3703549, 0.6362154, 2.217018, 1, 1, 1, 1, 1,
-0.3624039, -0.3382545, -2.126129, 1, 1, 1, 1, 1,
-0.3622532, 0.3777666, 0.6205727, 1, 1, 1, 1, 1,
-0.3617646, 0.2518293, -1.715225, 1, 1, 1, 1, 1,
-0.3613951, 1.162516, -1.842218, 1, 1, 1, 1, 1,
-0.361338, -0.4037666, -3.609749, 1, 1, 1, 1, 1,
-0.3572052, -2.230398, -3.785634, 0, 0, 1, 1, 1,
-0.3551989, -0.2650724, -1.957268, 1, 0, 0, 1, 1,
-0.3535573, -0.193001, -1.885105, 1, 0, 0, 1, 1,
-0.3482426, -0.6554348, -2.330326, 1, 0, 0, 1, 1,
-0.3465161, -0.2525319, -2.841511, 1, 0, 0, 1, 1,
-0.3439952, -0.7881135, -4.683706, 1, 0, 0, 1, 1,
-0.3363384, 1.656803, 1.342231, 0, 0, 0, 1, 1,
-0.3342135, -0.7796918, -2.9692, 0, 0, 0, 1, 1,
-0.3330588, 0.232295, -0.9312291, 0, 0, 0, 1, 1,
-0.3328798, -0.4978093, -3.661789, 0, 0, 0, 1, 1,
-0.3300919, -1.045024, -3.075254, 0, 0, 0, 1, 1,
-0.3289517, 1.907559, -0.5353917, 0, 0, 0, 1, 1,
-0.3284884, 0.6139383, 1.441326, 0, 0, 0, 1, 1,
-0.3264889, -0.6499003, -2.717847, 1, 1, 1, 1, 1,
-0.3225413, 1.211924, -1.031657, 1, 1, 1, 1, 1,
-0.3165478, 0.4089636, -2.168104, 1, 1, 1, 1, 1,
-0.3153403, 0.7735884, 0.5669284, 1, 1, 1, 1, 1,
-0.3148119, -0.5616683, -2.66854, 1, 1, 1, 1, 1,
-0.3134747, -1.104548, -3.197606, 1, 1, 1, 1, 1,
-0.3062951, 0.1772928, -1.177402, 1, 1, 1, 1, 1,
-0.3056839, 0.9563331, -2.162826, 1, 1, 1, 1, 1,
-0.3007163, -0.9775841, -3.538245, 1, 1, 1, 1, 1,
-0.3003549, -0.2880059, -2.630093, 1, 1, 1, 1, 1,
-0.2990412, 1.11989, 0.4693783, 1, 1, 1, 1, 1,
-0.2958821, 1.123357, 1.261962, 1, 1, 1, 1, 1,
-0.2945237, -1.06897, -1.436224, 1, 1, 1, 1, 1,
-0.2938213, -0.9530019, 0.1021143, 1, 1, 1, 1, 1,
-0.2930157, 2.037961, 0.2104311, 1, 1, 1, 1, 1,
-0.2898183, -0.1370142, -1.818477, 0, 0, 1, 1, 1,
-0.2883605, -0.5805607, -2.928306, 1, 0, 0, 1, 1,
-0.2814617, 1.603635, -0.1570479, 1, 0, 0, 1, 1,
-0.2786211, -1.00336, -2.304223, 1, 0, 0, 1, 1,
-0.2769699, 0.1636826, 0.5757191, 1, 0, 0, 1, 1,
-0.2756164, 1.313182, -2.088703, 1, 0, 0, 1, 1,
-0.2750067, 0.6172466, -1.64373, 0, 0, 0, 1, 1,
-0.2744307, -0.152276, -1.958711, 0, 0, 0, 1, 1,
-0.2710423, -0.2613975, -3.195495, 0, 0, 0, 1, 1,
-0.2668731, -2.134795, -4.085758, 0, 0, 0, 1, 1,
-0.2629623, 0.08611488, -0.6760436, 0, 0, 0, 1, 1,
-0.2623033, 1.138997, 0.8013747, 0, 0, 0, 1, 1,
-0.2593578, -1.99089, -3.372293, 0, 0, 0, 1, 1,
-0.2484917, 0.9392506, -0.8192613, 1, 1, 1, 1, 1,
-0.2413339, -2.437329, -3.455034, 1, 1, 1, 1, 1,
-0.2362472, -1.463416, -3.478799, 1, 1, 1, 1, 1,
-0.2240564, -0.3386769, -2.925748, 1, 1, 1, 1, 1,
-0.2197288, -0.6084798, -0.8333954, 1, 1, 1, 1, 1,
-0.2122071, 0.8172393, 0.1052824, 1, 1, 1, 1, 1,
-0.2111939, 0.5911486, 0.3996975, 1, 1, 1, 1, 1,
-0.2111749, 0.2877539, -0.08645165, 1, 1, 1, 1, 1,
-0.2111489, 1.946182, -0.2894562, 1, 1, 1, 1, 1,
-0.206101, 1.044086, -1.040677, 1, 1, 1, 1, 1,
-0.2024667, -0.4280574, -1.420992, 1, 1, 1, 1, 1,
-0.2019322, 0.3135535, 0.4221171, 1, 1, 1, 1, 1,
-0.1964325, 0.1837498, -0.5109259, 1, 1, 1, 1, 1,
-0.1959155, 0.2042488, -0.02958863, 1, 1, 1, 1, 1,
-0.1941292, 0.5433451, 0.02563564, 1, 1, 1, 1, 1,
-0.1883846, 0.6999139, -1.573507, 0, 0, 1, 1, 1,
-0.1855322, -0.1583459, -1.884328, 1, 0, 0, 1, 1,
-0.183312, -1.479666, -1.267517, 1, 0, 0, 1, 1,
-0.1794544, 0.3833832, -3.409757, 1, 0, 0, 1, 1,
-0.1779246, -1.748011, -3.093323, 1, 0, 0, 1, 1,
-0.1777944, -1.305697, -3.893455, 1, 0, 0, 1, 1,
-0.1768123, -0.2520131, -2.864618, 0, 0, 0, 1, 1,
-0.1756589, -0.262833, -2.197563, 0, 0, 0, 1, 1,
-0.1751763, -0.09609245, -4.132478, 0, 0, 0, 1, 1,
-0.171031, 0.07897547, -0.1198922, 0, 0, 0, 1, 1,
-0.1698443, -1.040437, -4.408965, 0, 0, 0, 1, 1,
-0.1684135, 0.1945746, 0.4405726, 0, 0, 0, 1, 1,
-0.1674798, -0.2493662, -2.925629, 0, 0, 0, 1, 1,
-0.16694, -0.8618254, -3.61275, 1, 1, 1, 1, 1,
-0.1632762, -0.4101068, -2.079205, 1, 1, 1, 1, 1,
-0.1622646, -0.3012261, -2.119313, 1, 1, 1, 1, 1,
-0.1608975, 0.1151667, 0.3061365, 1, 1, 1, 1, 1,
-0.1586365, -1.457738, -4.260375, 1, 1, 1, 1, 1,
-0.1583899, -1.949962, -2.485271, 1, 1, 1, 1, 1,
-0.1564336, 0.2991769, 0.04177107, 1, 1, 1, 1, 1,
-0.1540739, -0.01887422, -2.343899, 1, 1, 1, 1, 1,
-0.154029, 1.53427, -0.2242929, 1, 1, 1, 1, 1,
-0.1475119, -0.1613965, -0.3746043, 1, 1, 1, 1, 1,
-0.1458395, 1.142656, -1.520249, 1, 1, 1, 1, 1,
-0.1457022, -1.191242, -2.641704, 1, 1, 1, 1, 1,
-0.1443747, 0.0237631, -2.921495, 1, 1, 1, 1, 1,
-0.1428456, -1.229832, -2.550339, 1, 1, 1, 1, 1,
-0.14134, 0.7643169, 0.2665784, 1, 1, 1, 1, 1,
-0.1412451, 0.08671588, 0.6433458, 0, 0, 1, 1, 1,
-0.1383594, 0.6779808, -0.1141923, 1, 0, 0, 1, 1,
-0.1373483, -1.163838, -3.968877, 1, 0, 0, 1, 1,
-0.136034, 0.844416, 1.419809, 1, 0, 0, 1, 1,
-0.132309, -0.8772199, -3.024645, 1, 0, 0, 1, 1,
-0.1319744, 0.3610493, -1.910917, 1, 0, 0, 1, 1,
-0.1304315, -0.273052, -1.517515, 0, 0, 0, 1, 1,
-0.1299537, 0.6288362, -0.4010812, 0, 0, 0, 1, 1,
-0.1268866, 0.5969341, -1.000985, 0, 0, 0, 1, 1,
-0.1206946, -1.154445, -3.529569, 0, 0, 0, 1, 1,
-0.1205353, 0.8697657, -1.212931, 0, 0, 0, 1, 1,
-0.1129686, -0.09158896, -1.974101, 0, 0, 0, 1, 1,
-0.1115106, 0.9575166, 1.029456, 0, 0, 0, 1, 1,
-0.1074275, 0.345678, -2.10796, 1, 1, 1, 1, 1,
-0.1064668, 1.00378, 0.8395673, 1, 1, 1, 1, 1,
-0.105636, -0.3236537, -3.684604, 1, 1, 1, 1, 1,
-0.09692026, -0.7372388, -2.886028, 1, 1, 1, 1, 1,
-0.09467673, -1.856663, -3.972606, 1, 1, 1, 1, 1,
-0.09269077, -0.4876733, -1.947549, 1, 1, 1, 1, 1,
-0.08644959, 1.120117, -0.2138573, 1, 1, 1, 1, 1,
-0.08382632, 0.28458, -1.436722, 1, 1, 1, 1, 1,
-0.08254551, -1.220984, -3.159922, 1, 1, 1, 1, 1,
-0.08100347, 0.1808423, -0.4968369, 1, 1, 1, 1, 1,
-0.07983425, -0.7796913, -2.877956, 1, 1, 1, 1, 1,
-0.07664755, 0.2345275, 2.244651, 1, 1, 1, 1, 1,
-0.07585044, -0.4246247, -1.878463, 1, 1, 1, 1, 1,
-0.07342307, -0.1143157, -2.952654, 1, 1, 1, 1, 1,
-0.06952126, -0.9579648, -1.629659, 1, 1, 1, 1, 1,
-0.06895578, 1.393324, -0.9517283, 0, 0, 1, 1, 1,
-0.06829338, 0.1373098, 1.119764, 1, 0, 0, 1, 1,
-0.06773176, 0.4492424, 0.3073789, 1, 0, 0, 1, 1,
-0.06412858, -2.73849, -1.889841, 1, 0, 0, 1, 1,
-0.05828875, -1.657543, -0.9649623, 1, 0, 0, 1, 1,
-0.05554846, -0.3221472, -4.882968, 1, 0, 0, 1, 1,
-0.05492141, -0.3069206, -3.15688, 0, 0, 0, 1, 1,
-0.05465972, -0.1380778, -2.318353, 0, 0, 0, 1, 1,
-0.05272285, -2.44218, -3.828097, 0, 0, 0, 1, 1,
-0.05161428, -0.2329043, -3.001698, 0, 0, 0, 1, 1,
-0.04938301, -1.35905, -4.403113, 0, 0, 0, 1, 1,
-0.04650205, -1.750381, -2.291017, 0, 0, 0, 1, 1,
-0.04254179, 0.9635254, -0.1053592, 0, 0, 0, 1, 1,
-0.04080286, 0.4048886, 0.4312639, 1, 1, 1, 1, 1,
-0.04080046, -1.638839, -1.915557, 1, 1, 1, 1, 1,
-0.04048044, 1.426101, 1.150801, 1, 1, 1, 1, 1,
-0.03788234, -0.3775493, -2.963831, 1, 1, 1, 1, 1,
-0.0359439, -2.642786, -4.284243, 1, 1, 1, 1, 1,
-0.02947086, 0.3593462, 1.973216, 1, 1, 1, 1, 1,
-0.02791035, 1.242014, -0.3559555, 1, 1, 1, 1, 1,
-0.0275715, -0.5774198, -3.436085, 1, 1, 1, 1, 1,
-0.02305626, -0.1215632, -3.284917, 1, 1, 1, 1, 1,
-0.02182682, -1.253585, -4.15436, 1, 1, 1, 1, 1,
-0.01963362, -1.108826, -2.591644, 1, 1, 1, 1, 1,
-0.01910569, 0.6533444, -0.8070019, 1, 1, 1, 1, 1,
-0.01886276, 1.659257, 0.292916, 1, 1, 1, 1, 1,
-0.01704238, -0.04299378, -2.104905, 1, 1, 1, 1, 1,
-0.01651036, -0.6745574, -2.105308, 1, 1, 1, 1, 1,
-0.01430555, -0.7400506, -3.987547, 0, 0, 1, 1, 1,
-0.01399174, -0.4312535, -4.741168, 1, 0, 0, 1, 1,
-0.01079005, 0.4192594, 0.449844, 1, 0, 0, 1, 1,
-0.008261539, -1.344593, -4.078694, 1, 0, 0, 1, 1,
-0.007844488, 0.01082682, 1.437289, 1, 0, 0, 1, 1,
-0.003102953, 1.682845, -0.09021661, 1, 0, 0, 1, 1,
0.01209143, 0.7572497, 1.264845, 0, 0, 0, 1, 1,
0.01986402, -1.094921, 3.45896, 0, 0, 0, 1, 1,
0.02122797, 1.754713, 0.1330712, 0, 0, 0, 1, 1,
0.02573576, 0.4783224, 0.4769728, 0, 0, 0, 1, 1,
0.02958133, 0.7764895, 0.1764628, 0, 0, 0, 1, 1,
0.03033661, -1.067383, 2.625762, 0, 0, 0, 1, 1,
0.03112231, -0.6751891, 2.797814, 0, 0, 0, 1, 1,
0.0334447, -1.094332, 3.419112, 1, 1, 1, 1, 1,
0.0351685, 1.53633, -1.177429, 1, 1, 1, 1, 1,
0.03559281, 2.056045, -1.697344, 1, 1, 1, 1, 1,
0.03579876, 1.470405, 0.5099912, 1, 1, 1, 1, 1,
0.03690693, -0.5750245, 3.186932, 1, 1, 1, 1, 1,
0.04349399, -2.959623, 2.779795, 1, 1, 1, 1, 1,
0.0514848, 0.5729467, 0.3787639, 1, 1, 1, 1, 1,
0.05304144, -0.6667181, 2.605149, 1, 1, 1, 1, 1,
0.05603935, -0.5155288, 3.271019, 1, 1, 1, 1, 1,
0.05887146, -0.7223012, 4.119414, 1, 1, 1, 1, 1,
0.06501024, 1.499793, 0.7729571, 1, 1, 1, 1, 1,
0.06538858, 2.146626, -0.9304498, 1, 1, 1, 1, 1,
0.06784812, -0.9027871, 2.046417, 1, 1, 1, 1, 1,
0.06981262, -0.4831237, 2.71814, 1, 1, 1, 1, 1,
0.07192917, 0.7880165, -0.2584809, 1, 1, 1, 1, 1,
0.0749015, -1.487829, 2.033944, 0, 0, 1, 1, 1,
0.07592013, -0.5296207, 4.387891, 1, 0, 0, 1, 1,
0.08175658, 0.7868211, -1.57355, 1, 0, 0, 1, 1,
0.08256032, -0.8778111, 5.614761, 1, 0, 0, 1, 1,
0.08389557, 1.021879, -0.03720076, 1, 0, 0, 1, 1,
0.08661804, 0.3446254, 0.416107, 1, 0, 0, 1, 1,
0.08710169, 0.09314274, 1.243579, 0, 0, 0, 1, 1,
0.08935859, -0.2928731, 2.949929, 0, 0, 0, 1, 1,
0.09797125, 1.035246, -0.1568396, 0, 0, 0, 1, 1,
0.102484, -0.1457415, 1.470056, 0, 0, 0, 1, 1,
0.1041671, -1.393349, 3.837698, 0, 0, 0, 1, 1,
0.1054889, 0.1114057, 1.955866, 0, 0, 0, 1, 1,
0.1101322, 1.221825, 0.3974874, 0, 0, 0, 1, 1,
0.1130822, 2.002167, 1.558207, 1, 1, 1, 1, 1,
0.1145639, -2.000429, 2.895864, 1, 1, 1, 1, 1,
0.1175155, 0.03358389, 0.9987481, 1, 1, 1, 1, 1,
0.1277633, 1.353305, -1.36905, 1, 1, 1, 1, 1,
0.1332528, 1.783779, 0.7372326, 1, 1, 1, 1, 1,
0.1335705, -0.4177054, 1.634753, 1, 1, 1, 1, 1,
0.1347156, -0.8136764, 2.160103, 1, 1, 1, 1, 1,
0.1368803, -1.091641, 4.395587, 1, 1, 1, 1, 1,
0.1412972, -0.5562801, 1.146683, 1, 1, 1, 1, 1,
0.1493413, 0.3724499, -3.573966, 1, 1, 1, 1, 1,
0.1517225, -1.567582, 3.024907, 1, 1, 1, 1, 1,
0.1518812, -0.6819624, 3.065011, 1, 1, 1, 1, 1,
0.1588432, 0.4398001, 0.3059652, 1, 1, 1, 1, 1,
0.1634496, -1.574276, 1.941963, 1, 1, 1, 1, 1,
0.1671528, 0.4966669, -0.887921, 1, 1, 1, 1, 1,
0.1693782, -0.5369965, 2.267987, 0, 0, 1, 1, 1,
0.169542, -0.745098, 4.284329, 1, 0, 0, 1, 1,
0.1696715, 0.04100777, -1.231147, 1, 0, 0, 1, 1,
0.1744801, -0.4201842, 1.623953, 1, 0, 0, 1, 1,
0.1751309, 0.4533153, 0.9330006, 1, 0, 0, 1, 1,
0.1787632, -0.8517121, 4.600036, 1, 0, 0, 1, 1,
0.1845863, -0.674145, 2.807487, 0, 0, 0, 1, 1,
0.1853757, 1.140425, 0.08298407, 0, 0, 0, 1, 1,
0.1888393, 0.1425356, 1.638956, 0, 0, 0, 1, 1,
0.1897127, -0.8858243, 2.923525, 0, 0, 0, 1, 1,
0.1912333, -1.49564, 3.057967, 0, 0, 0, 1, 1,
0.1921733, 0.2435059, -1.439723, 0, 0, 0, 1, 1,
0.1941193, 0.7869661, 0.3373798, 0, 0, 0, 1, 1,
0.1944769, -0.1488837, 2.709982, 1, 1, 1, 1, 1,
0.2012709, 0.4342692, 0.5839319, 1, 1, 1, 1, 1,
0.2031694, 0.9023494, -1.20623, 1, 1, 1, 1, 1,
0.2036855, 1.241757, 0.276026, 1, 1, 1, 1, 1,
0.2054261, 0.06261158, 1.764462, 1, 1, 1, 1, 1,
0.2055554, -0.04292935, 1.68464, 1, 1, 1, 1, 1,
0.208131, 0.1045148, 2.340296, 1, 1, 1, 1, 1,
0.2174874, -1.191076, 2.655795, 1, 1, 1, 1, 1,
0.2187613, -0.1387336, 2.833885, 1, 1, 1, 1, 1,
0.2189049, 0.5003697, 1.102883, 1, 1, 1, 1, 1,
0.220938, -0.1407841, 1.551172, 1, 1, 1, 1, 1,
0.2217846, 0.7188872, -0.1866262, 1, 1, 1, 1, 1,
0.2219048, -1.183279, 1.797398, 1, 1, 1, 1, 1,
0.2254656, 0.2941892, 1.326663, 1, 1, 1, 1, 1,
0.2386027, -0.3214125, 3.918637, 1, 1, 1, 1, 1,
0.2387651, -0.09672294, 1.326863, 0, 0, 1, 1, 1,
0.2393313, -1.855334, 3.325539, 1, 0, 0, 1, 1,
0.2410081, 0.2640113, 0.9937311, 1, 0, 0, 1, 1,
0.2414073, -1.478283, 2.162011, 1, 0, 0, 1, 1,
0.2490646, 0.8962628, -0.5090054, 1, 0, 0, 1, 1,
0.2496319, -2.419477, 1.846855, 1, 0, 0, 1, 1,
0.2503877, -1.292301, 2.076732, 0, 0, 0, 1, 1,
0.2531914, -0.5335585, 3.171285, 0, 0, 0, 1, 1,
0.2542575, 0.5170176, 0.6721832, 0, 0, 0, 1, 1,
0.2599875, 0.4314886, -0.9860538, 0, 0, 0, 1, 1,
0.2606769, -0.006213854, 1.444918, 0, 0, 0, 1, 1,
0.260958, 0.02852694, 2.330449, 0, 0, 0, 1, 1,
0.2623014, 1.411815, 0.420059, 0, 0, 0, 1, 1,
0.2683306, -1.092767, 1.584395, 1, 1, 1, 1, 1,
0.2773405, 0.1825036, 0.7583758, 1, 1, 1, 1, 1,
0.2779388, -0.7134242, 0.6807986, 1, 1, 1, 1, 1,
0.2785937, 0.1331814, 2.958334, 1, 1, 1, 1, 1,
0.2799637, -0.3680433, 3.705036, 1, 1, 1, 1, 1,
0.2825392, 0.1986159, 0.5905359, 1, 1, 1, 1, 1,
0.2825784, -0.651563, 3.580616, 1, 1, 1, 1, 1,
0.2844477, 0.29441, 2.222497, 1, 1, 1, 1, 1,
0.2873367, 0.5673394, 1.396902, 1, 1, 1, 1, 1,
0.2899932, -0.4203037, 2.70694, 1, 1, 1, 1, 1,
0.2901086, 0.4469827, 0.6096418, 1, 1, 1, 1, 1,
0.2903308, 0.5076232, 0.7037088, 1, 1, 1, 1, 1,
0.2925442, -0.5026216, 3.233155, 1, 1, 1, 1, 1,
0.2949418, 1.001744, 1.406925, 1, 1, 1, 1, 1,
0.2989425, -1.338639, 4.465088, 1, 1, 1, 1, 1,
0.299238, 0.3249342, 3.202957, 0, 0, 1, 1, 1,
0.2994021, 0.6754655, 0.7911314, 1, 0, 0, 1, 1,
0.3008896, 0.4913419, 1.763253, 1, 0, 0, 1, 1,
0.300907, 0.7625121, -0.1530346, 1, 0, 0, 1, 1,
0.301868, -1.532777, 4.673175, 1, 0, 0, 1, 1,
0.3029912, 0.560212, 0.6049179, 1, 0, 0, 1, 1,
0.3052446, -2.578752, 2.523654, 0, 0, 0, 1, 1,
0.3088939, -0.4677549, 2.423981, 0, 0, 0, 1, 1,
0.3097173, -1.544694, 2.988914, 0, 0, 0, 1, 1,
0.3098813, 0.06364624, 2.032998, 0, 0, 0, 1, 1,
0.3105379, -0.09340736, 2.28933, 0, 0, 0, 1, 1,
0.3120158, -1.274011, 1.306973, 0, 0, 0, 1, 1,
0.3154071, 1.109406, 1.86215, 0, 0, 0, 1, 1,
0.3160516, -2.000998, 1.838555, 1, 1, 1, 1, 1,
0.3239076, 1.154638, -1.141152, 1, 1, 1, 1, 1,
0.3242612, -1.250379, 3.181471, 1, 1, 1, 1, 1,
0.3244337, 1.76349, 0.7923284, 1, 1, 1, 1, 1,
0.3279312, -0.2927442, 1.876335, 1, 1, 1, 1, 1,
0.3301452, 1.17498, -1.682675, 1, 1, 1, 1, 1,
0.330761, -1.771826, 2.103866, 1, 1, 1, 1, 1,
0.3382877, -0.2265491, 4.783469, 1, 1, 1, 1, 1,
0.3387327, -0.3959942, 1.750742, 1, 1, 1, 1, 1,
0.3448227, -0.5200642, 2.996683, 1, 1, 1, 1, 1,
0.3457215, 0.168744, 1.639948, 1, 1, 1, 1, 1,
0.3484745, -0.2130151, 0.9466287, 1, 1, 1, 1, 1,
0.3515469, -0.01584211, 2.45361, 1, 1, 1, 1, 1,
0.3539127, -0.7108541, 1.959742, 1, 1, 1, 1, 1,
0.35722, -0.0762992, 1.591736, 1, 1, 1, 1, 1,
0.3599879, 1.127368, 0.3772362, 0, 0, 1, 1, 1,
0.3665311, 1.619825, -1.33041, 1, 0, 0, 1, 1,
0.3665731, 0.973287, 0.2187082, 1, 0, 0, 1, 1,
0.3680767, 0.8961769, -0.9603603, 1, 0, 0, 1, 1,
0.3691242, -0.5917859, 2.781852, 1, 0, 0, 1, 1,
0.3738775, 0.4535441, 1.090387, 1, 0, 0, 1, 1,
0.3739589, 0.4777068, -0.3763889, 0, 0, 0, 1, 1,
0.3757449, 2.278368, 0.3459445, 0, 0, 0, 1, 1,
0.379234, 0.481339, 0.6571515, 0, 0, 0, 1, 1,
0.3824215, 0.3404332, 1.691855, 0, 0, 0, 1, 1,
0.3843225, 1.146242, -0.03222402, 0, 0, 0, 1, 1,
0.3909331, 0.1182436, 0.7212616, 0, 0, 0, 1, 1,
0.3938613, -1.384958, 2.055513, 0, 0, 0, 1, 1,
0.3947123, 1.316412, 1.22868, 1, 1, 1, 1, 1,
0.3974073, -1.474597, 2.99558, 1, 1, 1, 1, 1,
0.3981254, -1.229367, 2.900046, 1, 1, 1, 1, 1,
0.3988541, 0.1284468, 2.059392, 1, 1, 1, 1, 1,
0.3996645, -0.1706489, 2.055822, 1, 1, 1, 1, 1,
0.4000713, -0.1761048, 1.836731, 1, 1, 1, 1, 1,
0.4077978, 0.1372885, -0.07893046, 1, 1, 1, 1, 1,
0.4083918, 0.1755241, 0.7713387, 1, 1, 1, 1, 1,
0.4121092, 0.8231598, 0.009890301, 1, 1, 1, 1, 1,
0.4125173, -0.689869, 2.515432, 1, 1, 1, 1, 1,
0.4125482, -0.860727, 3.488885, 1, 1, 1, 1, 1,
0.4141045, 0.01507966, 1.478141, 1, 1, 1, 1, 1,
0.4150637, 0.2173282, 2.499803, 1, 1, 1, 1, 1,
0.4160776, 1.335196, -2.626383, 1, 1, 1, 1, 1,
0.4171302, 0.5568762, 1.552933, 1, 1, 1, 1, 1,
0.4200927, -1.071128, 4.134166, 0, 0, 1, 1, 1,
0.4201115, 1.431924, 1.337895, 1, 0, 0, 1, 1,
0.4234576, 0.3439942, 1.259355, 1, 0, 0, 1, 1,
0.4273511, -0.1673094, 0.7757038, 1, 0, 0, 1, 1,
0.4290513, -0.436165, 2.968588, 1, 0, 0, 1, 1,
0.4324449, 0.2379071, 2.496205, 1, 0, 0, 1, 1,
0.4345892, 0.02720881, 0.1925039, 0, 0, 0, 1, 1,
0.4351149, -1.724488, 2.293599, 0, 0, 0, 1, 1,
0.4358382, -1.679219, 3.170818, 0, 0, 0, 1, 1,
0.4439752, -0.2228354, 2.393729, 0, 0, 0, 1, 1,
0.4493175, -1.142815, 3.03173, 0, 0, 0, 1, 1,
0.4502214, 0.1010647, 1.319018, 0, 0, 0, 1, 1,
0.4540243, 1.284269, -0.8336748, 0, 0, 0, 1, 1,
0.4559862, 0.7531489, 0.07753805, 1, 1, 1, 1, 1,
0.4565375, -1.115524, 3.182122, 1, 1, 1, 1, 1,
0.4580384, -0.2433172, 3.26493, 1, 1, 1, 1, 1,
0.4609163, 1.720154, 0.6142191, 1, 1, 1, 1, 1,
0.4652385, -1.623782, 2.744636, 1, 1, 1, 1, 1,
0.4676805, -1.453345, 2.481792, 1, 1, 1, 1, 1,
0.4722326, -1.270057, 1.226357, 1, 1, 1, 1, 1,
0.4743026, 1.233407, -0.1117623, 1, 1, 1, 1, 1,
0.4770359, 0.2798011, 3.424663, 1, 1, 1, 1, 1,
0.4888918, -0.8129419, 2.376196, 1, 1, 1, 1, 1,
0.489568, 0.5597935, 1.253633, 1, 1, 1, 1, 1,
0.489925, -0.8725421, 1.448085, 1, 1, 1, 1, 1,
0.4903188, 0.109882, 2.271155, 1, 1, 1, 1, 1,
0.4915619, -0.03108749, 1.719703, 1, 1, 1, 1, 1,
0.4938792, -1.252689, 2.983768, 1, 1, 1, 1, 1,
0.49453, 1.001586, 0.112423, 0, 0, 1, 1, 1,
0.4960501, -0.8378017, 3.245166, 1, 0, 0, 1, 1,
0.5009902, 0.134949, -0.3335191, 1, 0, 0, 1, 1,
0.5021835, -1.124673, 2.618037, 1, 0, 0, 1, 1,
0.5028076, -0.09004586, 0.4117704, 1, 0, 0, 1, 1,
0.5058944, 0.5264173, -1.05558, 1, 0, 0, 1, 1,
0.5061579, -1.239114, 2.616306, 0, 0, 0, 1, 1,
0.5114169, -0.1491535, 1.706459, 0, 0, 0, 1, 1,
0.5144173, 2.27559, -0.5391352, 0, 0, 0, 1, 1,
0.5214683, 0.5081365, 3.067017, 0, 0, 0, 1, 1,
0.5257046, -1.281193, 2.61621, 0, 0, 0, 1, 1,
0.5295562, -0.1229834, 2.483873, 0, 0, 0, 1, 1,
0.530328, 2.502462, -0.289894, 0, 0, 0, 1, 1,
0.5304946, -0.2330472, 2.36285, 1, 1, 1, 1, 1,
0.5306937, -0.3813868, 2.204195, 1, 1, 1, 1, 1,
0.5366536, 0.02881981, 1.258718, 1, 1, 1, 1, 1,
0.5429353, 0.4940164, -0.9152216, 1, 1, 1, 1, 1,
0.544611, -1.543778, 3.003364, 1, 1, 1, 1, 1,
0.5503607, 2.051657, 0.71205, 1, 1, 1, 1, 1,
0.5506673, -0.171536, 2.487046, 1, 1, 1, 1, 1,
0.5526862, 0.3622307, 2.576813, 1, 1, 1, 1, 1,
0.5585091, 2.188752, -0.1983564, 1, 1, 1, 1, 1,
0.5618628, 0.9281154, 1.621709, 1, 1, 1, 1, 1,
0.5704078, -0.4320567, 1.580803, 1, 1, 1, 1, 1,
0.5734633, -0.6114745, -0.1740332, 1, 1, 1, 1, 1,
0.5746739, -0.5755036, 2.215599, 1, 1, 1, 1, 1,
0.5792677, -0.2490108, 0.5345631, 1, 1, 1, 1, 1,
0.5822818, -1.337519, 2.250925, 1, 1, 1, 1, 1,
0.5862508, 1.391207, -0.5416382, 0, 0, 1, 1, 1,
0.5867556, 0.09233129, 1.944658, 1, 0, 0, 1, 1,
0.5870007, -0.4563393, 3.084018, 1, 0, 0, 1, 1,
0.5914337, 0.8645903, 1.530043, 1, 0, 0, 1, 1,
0.5951236, -0.3731291, 1.787961, 1, 0, 0, 1, 1,
0.5997998, 0.4839905, 1.803035, 1, 0, 0, 1, 1,
0.602739, 0.9445785, 2.145124, 0, 0, 0, 1, 1,
0.603443, -0.7561438, 1.184815, 0, 0, 0, 1, 1,
0.6062979, -0.5267492, 1.51937, 0, 0, 0, 1, 1,
0.6084892, -0.9649318, 2.113722, 0, 0, 0, 1, 1,
0.6102135, -0.3127468, 1.136089, 0, 0, 0, 1, 1,
0.6103168, -2.149909, 3.884053, 0, 0, 0, 1, 1,
0.6229392, 0.7130296, 0.2090279, 0, 0, 0, 1, 1,
0.6233725, 0.1203245, 0.4042074, 1, 1, 1, 1, 1,
0.6240371, 0.7572637, 1.852018, 1, 1, 1, 1, 1,
0.6317048, 0.309919, 0.7648527, 1, 1, 1, 1, 1,
0.6379697, 0.7952606, 1.485027, 1, 1, 1, 1, 1,
0.640327, 1.159334, 1.319091, 1, 1, 1, 1, 1,
0.6445252, -1.831405, 3.514975, 1, 1, 1, 1, 1,
0.6451872, -0.4450523, 2.501084, 1, 1, 1, 1, 1,
0.6492161, 0.255914, 0.03390346, 1, 1, 1, 1, 1,
0.6583565, -0.2685724, 2.295217, 1, 1, 1, 1, 1,
0.6603947, -2.006734, 2.279279, 1, 1, 1, 1, 1,
0.6637217, 1.230648, -1.717113, 1, 1, 1, 1, 1,
0.664834, 0.3763968, 1.989005, 1, 1, 1, 1, 1,
0.6718948, 0.5102642, 0.4991875, 1, 1, 1, 1, 1,
0.6760015, -0.3541515, 3.491951, 1, 1, 1, 1, 1,
0.6856267, 1.047141, 0.8272645, 1, 1, 1, 1, 1,
0.6862389, 0.3094348, 1.852046, 0, 0, 1, 1, 1,
0.6880551, 1.664731, 0.6914417, 1, 0, 0, 1, 1,
0.6919729, 0.7531006, 2.215831, 1, 0, 0, 1, 1,
0.6950605, 1.232976, 1.159321, 1, 0, 0, 1, 1,
0.7001762, 1.012704, -0.5400436, 1, 0, 0, 1, 1,
0.7019271, 0.5792212, 1.68661, 1, 0, 0, 1, 1,
0.7024263, -0.8300183, 2.745042, 0, 0, 0, 1, 1,
0.7102594, 0.8543356, 2.505547, 0, 0, 0, 1, 1,
0.7166927, 1.241386, -3.161865, 0, 0, 0, 1, 1,
0.7185177, -2.310919, 4.483882, 0, 0, 0, 1, 1,
0.7188149, 0.3865256, 1.925353, 0, 0, 0, 1, 1,
0.7242199, -0.1307327, 0.1668216, 0, 0, 0, 1, 1,
0.7286009, 0.342536, 3.535661, 0, 0, 0, 1, 1,
0.7298166, 1.177086, 1.347832, 1, 1, 1, 1, 1,
0.7309807, -1.379196, 2.603009, 1, 1, 1, 1, 1,
0.7420898, 0.3912671, -0.06943835, 1, 1, 1, 1, 1,
0.747012, 0.2139347, 2.290116, 1, 1, 1, 1, 1,
0.7488577, 1.911791, -0.8069191, 1, 1, 1, 1, 1,
0.7530683, 0.4149679, 2.385583, 1, 1, 1, 1, 1,
0.7531684, -0.2720487, 2.38175, 1, 1, 1, 1, 1,
0.7574825, -0.3571631, 1.95523, 1, 1, 1, 1, 1,
0.7599134, -0.8381916, 1.657554, 1, 1, 1, 1, 1,
0.7604948, 0.509091, 2.477872, 1, 1, 1, 1, 1,
0.7661091, -0.4691311, 3.576157, 1, 1, 1, 1, 1,
0.768288, -0.4640197, 3.16841, 1, 1, 1, 1, 1,
0.7699721, 0.5912231, 2.094516, 1, 1, 1, 1, 1,
0.7724929, 0.2999495, 1.861973, 1, 1, 1, 1, 1,
0.7800319, 2.06814, -0.04796233, 1, 1, 1, 1, 1,
0.784457, -0.6474028, 3.98953, 0, 0, 1, 1, 1,
0.7851565, 1.093652, -0.08511157, 1, 0, 0, 1, 1,
0.7858821, 1.90509, 0.7887473, 1, 0, 0, 1, 1,
0.7916173, -1.104748, 2.660164, 1, 0, 0, 1, 1,
0.7922862, -0.3221828, 1.841645, 1, 0, 0, 1, 1,
0.7927176, 1.24344, 1.092589, 1, 0, 0, 1, 1,
0.7950136, 0.3771924, 0.7358582, 0, 0, 0, 1, 1,
0.8042461, 0.6775472, 0.6224512, 0, 0, 0, 1, 1,
0.8048506, 3.036488, 0.9073985, 0, 0, 0, 1, 1,
0.8060675, -1.271259, 2.485029, 0, 0, 0, 1, 1,
0.8088605, 0.288441, 0.6924509, 0, 0, 0, 1, 1,
0.8137355, 0.8859398, 1.488742, 0, 0, 0, 1, 1,
0.8192706, -0.2116268, 0.9194162, 0, 0, 0, 1, 1,
0.8316317, 0.4350013, 0.2651339, 1, 1, 1, 1, 1,
0.8318663, 0.8923483, -1.361769, 1, 1, 1, 1, 1,
0.8357351, 0.0574561, 0.8307745, 1, 1, 1, 1, 1,
0.8400342, 0.003186853, 2.035842, 1, 1, 1, 1, 1,
0.8534639, -1.187447, 2.416833, 1, 1, 1, 1, 1,
0.8578928, 0.450011, 1.463812, 1, 1, 1, 1, 1,
0.8637767, -0.8965363, 0.7510606, 1, 1, 1, 1, 1,
0.8662866, -0.1246369, 2.026215, 1, 1, 1, 1, 1,
0.8695964, 1.561203, 0.006748422, 1, 1, 1, 1, 1,
0.8713403, -0.1249344, 1.436332, 1, 1, 1, 1, 1,
0.874965, -0.372283, 1.920321, 1, 1, 1, 1, 1,
0.8818251, -0.6990323, 2.35997, 1, 1, 1, 1, 1,
0.8841006, 0.1845734, 1.94265, 1, 1, 1, 1, 1,
0.8918596, 0.8972437, 2.020461, 1, 1, 1, 1, 1,
0.8919531, 0.8198723, -0.09053479, 1, 1, 1, 1, 1,
0.9022756, 0.4487748, 2.432438, 0, 0, 1, 1, 1,
0.902515, 2.440503, -1.119265, 1, 0, 0, 1, 1,
0.9104348, 0.8510481, 1.729176, 1, 0, 0, 1, 1,
0.9120046, 1.116699, -0.9055434, 1, 0, 0, 1, 1,
0.9175754, 2.055566, 1.15359, 1, 0, 0, 1, 1,
0.9242886, -0.6208331, 3.600491, 1, 0, 0, 1, 1,
0.9255898, -0.5178605, 2.095652, 0, 0, 0, 1, 1,
0.9267294, -1.101437, 3.277191, 0, 0, 0, 1, 1,
0.9280603, -0.07722487, 1.293476, 0, 0, 0, 1, 1,
0.9367669, 0.3715135, 1.657761, 0, 0, 0, 1, 1,
0.939549, 0.4325441, 0.8029919, 0, 0, 0, 1, 1,
0.9405133, 0.3897546, 1.552283, 0, 0, 0, 1, 1,
0.9428041, 1.388819, 0.3738754, 0, 0, 0, 1, 1,
0.9532921, 0.04673703, 1.68226, 1, 1, 1, 1, 1,
0.9577905, 0.397767, 1.04946, 1, 1, 1, 1, 1,
0.9693965, -0.4505936, 1.829249, 1, 1, 1, 1, 1,
0.975211, -0.8630238, 0.2452899, 1, 1, 1, 1, 1,
0.9765383, 0.5586223, 1.295309, 1, 1, 1, 1, 1,
0.978254, -0.2788424, 1.369085, 1, 1, 1, 1, 1,
0.9798744, 3.231339, -0.9367987, 1, 1, 1, 1, 1,
0.9843441, -0.03752636, 2.472489, 1, 1, 1, 1, 1,
0.9856329, 0.01381352, 2.717055, 1, 1, 1, 1, 1,
0.9866498, 1.230689, 2.048043, 1, 1, 1, 1, 1,
0.9893767, 0.5148061, 2.115203, 1, 1, 1, 1, 1,
0.9930215, 0.8695477, 0.7688172, 1, 1, 1, 1, 1,
1.000404, 0.8209122, -1.075675, 1, 1, 1, 1, 1,
1.005995, -0.7335798, 0.6024691, 1, 1, 1, 1, 1,
1.008835, 0.3332728, 1.870925, 1, 1, 1, 1, 1,
1.009332, -0.6964039, 3.631807, 0, 0, 1, 1, 1,
1.016362, 0.4033105, 1.000214, 1, 0, 0, 1, 1,
1.017625, -0.355662, 2.704762, 1, 0, 0, 1, 1,
1.01924, -0.1426426, 2.788901, 1, 0, 0, 1, 1,
1.021792, 1.103388, 0.1837313, 1, 0, 0, 1, 1,
1.031461, 2.052121, -2.161304, 1, 0, 0, 1, 1,
1.032842, 1.37285, -0.6033943, 0, 0, 0, 1, 1,
1.033303, -0.8104343, 1.489305, 0, 0, 0, 1, 1,
1.035223, -0.5393003, 2.898501, 0, 0, 0, 1, 1,
1.040117, -0.2526715, 2.331037, 0, 0, 0, 1, 1,
1.041057, -0.8713214, 2.112255, 0, 0, 0, 1, 1,
1.042665, 0.6938264, 0.7783409, 0, 0, 0, 1, 1,
1.051644, 2.619271, 1.765607, 0, 0, 0, 1, 1,
1.053306, 0.4970275, 0.8323627, 1, 1, 1, 1, 1,
1.056323, -0.4118295, 2.3982, 1, 1, 1, 1, 1,
1.063422, 0.7301057, 1.019994, 1, 1, 1, 1, 1,
1.075711, -0.925148, 3.055467, 1, 1, 1, 1, 1,
1.077935, 1.096914, 1.455583, 1, 1, 1, 1, 1,
1.080622, 0.3338083, 0.6435632, 1, 1, 1, 1, 1,
1.082103, -0.1162087, 0.9736032, 1, 1, 1, 1, 1,
1.093131, -0.04434946, 1.421234, 1, 1, 1, 1, 1,
1.109442, -1.395203, 2.655162, 1, 1, 1, 1, 1,
1.11271, 2.257933, 1.173527, 1, 1, 1, 1, 1,
1.114193, 0.6496255, -0.594657, 1, 1, 1, 1, 1,
1.121123, 1.196383, 0.539613, 1, 1, 1, 1, 1,
1.125934, -0.1439688, 1.632939, 1, 1, 1, 1, 1,
1.129432, -0.3664713, 2.771465, 1, 1, 1, 1, 1,
1.130235, 0.8935175, -0.5205138, 1, 1, 1, 1, 1,
1.137433, -0.07150843, 0.6511881, 0, 0, 1, 1, 1,
1.14209, 2.212849, 0.004263422, 1, 0, 0, 1, 1,
1.150864, -0.2767393, 2.266749, 1, 0, 0, 1, 1,
1.151026, -0.0699864, 1.222545, 1, 0, 0, 1, 1,
1.154277, 1.146203, 0.07604586, 1, 0, 0, 1, 1,
1.161899, -1.108245, 4.423588, 1, 0, 0, 1, 1,
1.167436, 0.3997428, 1.495561, 0, 0, 0, 1, 1,
1.168795, -0.5858743, 3.210511, 0, 0, 0, 1, 1,
1.176144, 0.2910688, 2.464867, 0, 0, 0, 1, 1,
1.180076, -2.371856, 3.235661, 0, 0, 0, 1, 1,
1.180467, 0.3744973, 1.211183, 0, 0, 0, 1, 1,
1.192348, -1.100151, 2.169428, 0, 0, 0, 1, 1,
1.192711, 0.7217447, 2.060097, 0, 0, 0, 1, 1,
1.192812, 0.169922, 0.8310954, 1, 1, 1, 1, 1,
1.209774, 2.218938, 1.297252, 1, 1, 1, 1, 1,
1.219431, 0.5912255, 0.7854638, 1, 1, 1, 1, 1,
1.224626, -0.009096639, 1.701007, 1, 1, 1, 1, 1,
1.227279, 0.2930547, 2.520393, 1, 1, 1, 1, 1,
1.239975, 1.029584, -1.479487, 1, 1, 1, 1, 1,
1.244368, 0.816048, 1.081694, 1, 1, 1, 1, 1,
1.249522, -0.7624903, 3.079343, 1, 1, 1, 1, 1,
1.251591, 0.1785128, 2.207587, 1, 1, 1, 1, 1,
1.263354, 0.410271, 2.09491, 1, 1, 1, 1, 1,
1.263424, -2.205212, 3.1417, 1, 1, 1, 1, 1,
1.26665, 0.5483466, 0.9817373, 1, 1, 1, 1, 1,
1.266682, -1.437551, 3.092568, 1, 1, 1, 1, 1,
1.270531, -0.03961094, 2.852858, 1, 1, 1, 1, 1,
1.27488, -1.882524, 2.380339, 1, 1, 1, 1, 1,
1.281445, -1.072353, 1.464652, 0, 0, 1, 1, 1,
1.288211, -1.133312, 3.530024, 1, 0, 0, 1, 1,
1.307009, -1.158119, 2.92375, 1, 0, 0, 1, 1,
1.325204, 1.865249, -0.3942944, 1, 0, 0, 1, 1,
1.335141, -1.332042, 1.654968, 1, 0, 0, 1, 1,
1.340431, 0.1374478, 0.461141, 1, 0, 0, 1, 1,
1.345735, -2.018268, 4.082715, 0, 0, 0, 1, 1,
1.357234, 0.1061604, 2.401199, 0, 0, 0, 1, 1,
1.364871, -0.8955793, 1.36278, 0, 0, 0, 1, 1,
1.366938, -0.07231984, 0.4567799, 0, 0, 0, 1, 1,
1.377194, -0.8781493, 1.819552, 0, 0, 0, 1, 1,
1.383758, -1.652572, 1.080407, 0, 0, 0, 1, 1,
1.385705, -0.4818347, 3.690961, 0, 0, 0, 1, 1,
1.387408, 1.381578, 1.587271, 1, 1, 1, 1, 1,
1.402124, 0.7284657, 1.751427, 1, 1, 1, 1, 1,
1.403599, -0.4215204, 1.75888, 1, 1, 1, 1, 1,
1.407683, -1.3723, 2.665114, 1, 1, 1, 1, 1,
1.415409, -2.318827, 3.093649, 1, 1, 1, 1, 1,
1.431208, -1.306605, 3.257217, 1, 1, 1, 1, 1,
1.443613, 1.068, -1.822161, 1, 1, 1, 1, 1,
1.446248, -0.446969, 2.250111, 1, 1, 1, 1, 1,
1.447321, -0.1287953, 1.175047, 1, 1, 1, 1, 1,
1.4477, -0.5334896, 2.293674, 1, 1, 1, 1, 1,
1.458229, -0.276251, 3.209008, 1, 1, 1, 1, 1,
1.459349, -1.106973, 0.5580387, 1, 1, 1, 1, 1,
1.465467, -1.246993, 1.180015, 1, 1, 1, 1, 1,
1.467388, 0.03537058, 1.632575, 1, 1, 1, 1, 1,
1.487336, 0.8036213, 0.3620833, 1, 1, 1, 1, 1,
1.487912, 0.5688105, 0.2443972, 0, 0, 1, 1, 1,
1.489144, -1.176829, 0.7931262, 1, 0, 0, 1, 1,
1.500329, -0.05808818, 1.655859, 1, 0, 0, 1, 1,
1.510322, -0.136297, 1.352548, 1, 0, 0, 1, 1,
1.52964, -0.3771883, 2.768412, 1, 0, 0, 1, 1,
1.536966, -0.2102097, 1.54805, 1, 0, 0, 1, 1,
1.547756, -0.2086933, 0.05124963, 0, 0, 0, 1, 1,
1.551251, 1.615402, 0.2929966, 0, 0, 0, 1, 1,
1.555999, -0.2894748, 1.222543, 0, 0, 0, 1, 1,
1.577939, -0.8101068, 1.130192, 0, 0, 0, 1, 1,
1.596831, -0.4348491, 2.337918, 0, 0, 0, 1, 1,
1.597349, 0.09258936, 2.328932, 0, 0, 0, 1, 1,
1.607033, 0.5064815, 1.316066, 0, 0, 0, 1, 1,
1.622453, 0.1679096, 0.4962791, 1, 1, 1, 1, 1,
1.628502, -1.329975, 2.500798, 1, 1, 1, 1, 1,
1.632192, -1.054345, 2.908848, 1, 1, 1, 1, 1,
1.63857, -0.1153678, 3.88653, 1, 1, 1, 1, 1,
1.668649, -1.166609, 3.303349, 1, 1, 1, 1, 1,
1.692241, -0.1590019, 2.279103, 1, 1, 1, 1, 1,
1.713707, 0.008518161, 0.4460696, 1, 1, 1, 1, 1,
1.742736, 0.5627993, -0.8648322, 1, 1, 1, 1, 1,
1.747363, 1.247896, 0.1563649, 1, 1, 1, 1, 1,
1.750109, 0.5335218, 2.682688, 1, 1, 1, 1, 1,
1.763319, -1.322941, 2.159096, 1, 1, 1, 1, 1,
1.784267, -1.178902, 4.042848, 1, 1, 1, 1, 1,
1.794428, 0.5901897, 2.788759, 1, 1, 1, 1, 1,
1.803372, 1.475522, -0.801307, 1, 1, 1, 1, 1,
1.811052, -1.196746, 2.41743, 1, 1, 1, 1, 1,
1.81907, 0.2500579, 1.490595, 0, 0, 1, 1, 1,
1.820444, -0.09576188, 0.4016922, 1, 0, 0, 1, 1,
1.829967, 0.7830287, -0.06029629, 1, 0, 0, 1, 1,
1.832392, -0.9404288, 1.682439, 1, 0, 0, 1, 1,
1.836583, 0.2057126, 0.06393914, 1, 0, 0, 1, 1,
1.84307, -0.3544394, 1.460867, 1, 0, 0, 1, 1,
1.85111, -0.8591529, 3.049685, 0, 0, 0, 1, 1,
1.862809, -0.5146853, 2.636167, 0, 0, 0, 1, 1,
1.8639, 0.1537947, 2.176764, 0, 0, 0, 1, 1,
1.876152, 0.6931807, -0.0103309, 0, 0, 0, 1, 1,
1.927292, -0.09188285, 2.623902, 0, 0, 0, 1, 1,
1.93093, 2.431995, 1.954753, 0, 0, 0, 1, 1,
1.939988, -0.1579392, 2.580145, 0, 0, 0, 1, 1,
1.95505, -1.668947, 2.749086, 1, 1, 1, 1, 1,
1.99403, 0.008089161, 1.828336, 1, 1, 1, 1, 1,
1.994161, -0.3966965, 2.260267, 1, 1, 1, 1, 1,
2.004488, -0.6633475, 2.390141, 1, 1, 1, 1, 1,
2.025007, -0.9216865, 2.323566, 1, 1, 1, 1, 1,
2.025298, -1.02054, 0.3450812, 1, 1, 1, 1, 1,
2.063941, 1.28019, 0.7076632, 1, 1, 1, 1, 1,
2.064864, -0.2295183, 2.287133, 1, 1, 1, 1, 1,
2.069995, 0.5510296, 1.453701, 1, 1, 1, 1, 1,
2.085013, 0.2212315, -0.02513828, 1, 1, 1, 1, 1,
2.122715, -0.4733245, 2.352468, 1, 1, 1, 1, 1,
2.144543, -0.2702523, 1.341293, 1, 1, 1, 1, 1,
2.172884, -0.2502636, 0.5840399, 1, 1, 1, 1, 1,
2.180614, -0.4433306, 0.6903446, 1, 1, 1, 1, 1,
2.195351, -0.0639746, 1.899749, 1, 1, 1, 1, 1,
2.259041, -1.186499, 1.280995, 0, 0, 1, 1, 1,
2.290401, 1.569003, 0.8377768, 1, 0, 0, 1, 1,
2.295974, 0.6049302, 1.482419, 1, 0, 0, 1, 1,
2.407243, -0.09978319, 2.493188, 1, 0, 0, 1, 1,
2.444455, -0.4017743, 2.06789, 1, 0, 0, 1, 1,
2.485095, 1.792076, 0.4998212, 1, 0, 0, 1, 1,
2.490136, 2.313434, 0.3953269, 0, 0, 0, 1, 1,
2.504958, 1.504245, 2.201775, 0, 0, 0, 1, 1,
2.541856, -0.5085196, 2.633665, 0, 0, 0, 1, 1,
2.547537, 0.4269207, 0.6814688, 0, 0, 0, 1, 1,
2.551478, 0.3471938, 2.804929, 0, 0, 0, 1, 1,
2.631787, -0.3426532, 1.341323, 0, 0, 0, 1, 1,
2.637652, 1.392218, 0.8566281, 0, 0, 0, 1, 1,
2.692081, 0.1768643, 2.358311, 1, 1, 1, 1, 1,
2.764161, -0.3176503, -0.06521005, 1, 1, 1, 1, 1,
2.813397, -0.6318821, 1.636297, 1, 1, 1, 1, 1,
2.869545, 0.5933755, 1.328322, 1, 1, 1, 1, 1,
3.00824, -2.407595, 2.280444, 1, 1, 1, 1, 1,
3.191502, 0.6301448, 1.670715, 1, 1, 1, 1, 1,
3.308343, -0.3491839, 2.106725, 1, 1, 1, 1, 1
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
var radius = 9.631455;
var distance = 33.83008;
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
mvMatrix.translate( -0.1005213, -0.007390022, -0.2024508 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.83008);
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
