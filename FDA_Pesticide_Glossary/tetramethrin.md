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
-3.361468, 1.198619, -0.8665878, 1, 0, 0, 1,
-3.184695, 1.309361, -1.329777, 1, 0.007843138, 0, 1,
-3.164253, -1.698002, -1.741215, 1, 0.01176471, 0, 1,
-2.92308, -0.6703196, -2.472609, 1, 0.01960784, 0, 1,
-2.76703, -1.605952, -1.080366, 1, 0.02352941, 0, 1,
-2.500918, 1.056747, -0.8614185, 1, 0.03137255, 0, 1,
-2.472782, 0.8639157, -0.7657703, 1, 0.03529412, 0, 1,
-2.417251, 0.7286485, -1.310202, 1, 0.04313726, 0, 1,
-2.337641, 2.044293, 0.739737, 1, 0.04705882, 0, 1,
-2.268043, -1.017432, -2.294646, 1, 0.05490196, 0, 1,
-2.267007, 0.2600276, 0.0004200214, 1, 0.05882353, 0, 1,
-2.231695, -0.02498487, -2.087268, 1, 0.06666667, 0, 1,
-2.225773, 1.793185, -0.512603, 1, 0.07058824, 0, 1,
-2.217367, 1.983597, -0.5218718, 1, 0.07843138, 0, 1,
-2.151473, 0.3388202, -2.258608, 1, 0.08235294, 0, 1,
-2.151253, -1.384368, -1.323371, 1, 0.09019608, 0, 1,
-2.115401, 0.7931893, -1.930036, 1, 0.09411765, 0, 1,
-2.096769, 0.5620188, -1.467413, 1, 0.1019608, 0, 1,
-2.092721, -2.551238, -1.113794, 1, 0.1098039, 0, 1,
-2.06059, -0.1073656, -0.3597699, 1, 0.1137255, 0, 1,
-2.054022, 1.56308, -1.555879, 1, 0.1215686, 0, 1,
-2.028139, -1.205757, -1.201218, 1, 0.1254902, 0, 1,
-2.022182, -1.078969, -1.306249, 1, 0.1333333, 0, 1,
-1.998647, 1.452234, -1.852396, 1, 0.1372549, 0, 1,
-1.992296, -1.34916, -1.006193, 1, 0.145098, 0, 1,
-1.982934, -0.278718, -3.522612, 1, 0.1490196, 0, 1,
-1.969321, -1.300361, -2.400674, 1, 0.1568628, 0, 1,
-1.956451, -0.343252, -1.549293, 1, 0.1607843, 0, 1,
-1.95002, -0.9694398, -1.224724, 1, 0.1686275, 0, 1,
-1.896468, -2.552265, -3.312142, 1, 0.172549, 0, 1,
-1.894964, -0.5962221, -2.572392, 1, 0.1803922, 0, 1,
-1.89306, 0.4955929, -1.210081, 1, 0.1843137, 0, 1,
-1.888171, -1.256045, -2.542014, 1, 0.1921569, 0, 1,
-1.85992, -0.7307119, -1.558885, 1, 0.1960784, 0, 1,
-1.845237, 1.013845, -2.344108, 1, 0.2039216, 0, 1,
-1.815643, -1.760569, -3.154476, 1, 0.2117647, 0, 1,
-1.807472, 0.7865844, -2.790362, 1, 0.2156863, 0, 1,
-1.779841, -0.7698136, -2.389488, 1, 0.2235294, 0, 1,
-1.755878, -0.8322476, -1.248444, 1, 0.227451, 0, 1,
-1.749104, 2.364561, -1.525095, 1, 0.2352941, 0, 1,
-1.733523, 0.1991642, 0.2286453, 1, 0.2392157, 0, 1,
-1.72733, -0.03784845, -1.946715, 1, 0.2470588, 0, 1,
-1.7235, 0.2056077, -1.835336, 1, 0.2509804, 0, 1,
-1.720172, -2.053728, -3.52837, 1, 0.2588235, 0, 1,
-1.695448, 0.7803197, -1.25933, 1, 0.2627451, 0, 1,
-1.680755, -0.3561958, 1.033542, 1, 0.2705882, 0, 1,
-1.671947, 0.3749347, -2.194985, 1, 0.2745098, 0, 1,
-1.663648, 0.3930884, -2.818425, 1, 0.282353, 0, 1,
-1.658982, 0.06345241, -3.310888, 1, 0.2862745, 0, 1,
-1.657132, 0.1165401, -1.757828, 1, 0.2941177, 0, 1,
-1.654141, -0.9333327, -3.930952, 1, 0.3019608, 0, 1,
-1.65294, 0.2903488, -2.184669, 1, 0.3058824, 0, 1,
-1.646345, -0.1414148, -2.622105, 1, 0.3137255, 0, 1,
-1.645118, 0.1089801, -1.040874, 1, 0.3176471, 0, 1,
-1.644829, 0.7583308, -1.919169, 1, 0.3254902, 0, 1,
-1.634143, 2.561695, -1.178458, 1, 0.3294118, 0, 1,
-1.62763, -0.5441794, -1.127623, 1, 0.3372549, 0, 1,
-1.622883, 1.579198, 0.2652316, 1, 0.3411765, 0, 1,
-1.612619, 2.379388, 0.2332082, 1, 0.3490196, 0, 1,
-1.606641, 0.5956509, -2.155627, 1, 0.3529412, 0, 1,
-1.596376, 2.004119, -0.681466, 1, 0.3607843, 0, 1,
-1.592789, -0.3313416, -1.230147, 1, 0.3647059, 0, 1,
-1.586817, -0.3257019, -1.20623, 1, 0.372549, 0, 1,
-1.578567, -1.195886, -1.713249, 1, 0.3764706, 0, 1,
-1.574622, 1.681986, -0.5850607, 1, 0.3843137, 0, 1,
-1.572171, -1.544473, -1.489705, 1, 0.3882353, 0, 1,
-1.55462, 0.2437521, -0.6938254, 1, 0.3960784, 0, 1,
-1.552519, -0.2152755, -1.754093, 1, 0.4039216, 0, 1,
-1.552413, -0.3101621, -0.6789352, 1, 0.4078431, 0, 1,
-1.549713, 1.081268, -0.4292674, 1, 0.4156863, 0, 1,
-1.547272, -1.400716, -3.384381, 1, 0.4196078, 0, 1,
-1.546758, -0.1419992, -2.15813, 1, 0.427451, 0, 1,
-1.540769, -0.478012, -1.733497, 1, 0.4313726, 0, 1,
-1.538774, 1.088241, -2.063234, 1, 0.4392157, 0, 1,
-1.519629, -0.7231945, -2.98122, 1, 0.4431373, 0, 1,
-1.514276, 0.9045097, -0.909569, 1, 0.4509804, 0, 1,
-1.508142, -2.449148, -4.478735, 1, 0.454902, 0, 1,
-1.480454, -1.172227, -2.634235, 1, 0.4627451, 0, 1,
-1.478269, 0.4494475, -2.801499, 1, 0.4666667, 0, 1,
-1.455708, -0.5833238, -1.183517, 1, 0.4745098, 0, 1,
-1.455061, 0.7182191, -1.957464, 1, 0.4784314, 0, 1,
-1.451185, 0.4251027, -0.7806611, 1, 0.4862745, 0, 1,
-1.451125, 0.5038008, -2.521582, 1, 0.4901961, 0, 1,
-1.44343, -1.170168, -3.343812, 1, 0.4980392, 0, 1,
-1.423405, 0.9184224, -1.81464, 1, 0.5058824, 0, 1,
-1.419685, 0.7042271, -1.416145, 1, 0.509804, 0, 1,
-1.412567, -0.1671105, -4.022416, 1, 0.5176471, 0, 1,
-1.410311, 1.95777, -0.7455902, 1, 0.5215687, 0, 1,
-1.408986, 1.263997, -0.7245986, 1, 0.5294118, 0, 1,
-1.391682, 1.201641, -0.8054934, 1, 0.5333334, 0, 1,
-1.383795, -1.267783, -3.198762, 1, 0.5411765, 0, 1,
-1.373047, -0.5759431, -0.6813013, 1, 0.5450981, 0, 1,
-1.36581, 0.2481998, -0.7049048, 1, 0.5529412, 0, 1,
-1.364921, -0.654964, -2.165689, 1, 0.5568628, 0, 1,
-1.363435, 0.367372, -2.051047, 1, 0.5647059, 0, 1,
-1.338321, -0.2754111, -1.836793, 1, 0.5686275, 0, 1,
-1.335443, -0.7800998, -2.554879, 1, 0.5764706, 0, 1,
-1.314807, 0.9807941, 0.3067534, 1, 0.5803922, 0, 1,
-1.311804, -0.1336116, -2.443313, 1, 0.5882353, 0, 1,
-1.299818, 0.3923092, -1.147889, 1, 0.5921569, 0, 1,
-1.295213, -0.5591885, -3.006843, 1, 0.6, 0, 1,
-1.294384, 0.4769299, -1.558946, 1, 0.6078432, 0, 1,
-1.292456, 0.162157, -2.131029, 1, 0.6117647, 0, 1,
-1.289454, 0.1067949, -2.019733, 1, 0.6196079, 0, 1,
-1.285583, -0.4187263, -1.619747, 1, 0.6235294, 0, 1,
-1.282898, -0.4087339, -2.206998, 1, 0.6313726, 0, 1,
-1.271463, 2.739408, 2.472466, 1, 0.6352941, 0, 1,
-1.243323, 1.55574, -0.3657155, 1, 0.6431373, 0, 1,
-1.233841, -0.9540982, -3.894864, 1, 0.6470588, 0, 1,
-1.228626, -0.6436048, -2.826867, 1, 0.654902, 0, 1,
-1.22568, 0.1149909, -1.168448, 1, 0.6588235, 0, 1,
-1.220222, 2.604866, -1.760705, 1, 0.6666667, 0, 1,
-1.215799, 0.5223192, -1.081219, 1, 0.6705883, 0, 1,
-1.213968, -0.3753504, -2.836238, 1, 0.6784314, 0, 1,
-1.211602, -0.8232785, -2.061424, 1, 0.682353, 0, 1,
-1.207947, -0.5328401, -4.104607, 1, 0.6901961, 0, 1,
-1.202966, 0.07321826, -1.370695, 1, 0.6941177, 0, 1,
-1.200038, -0.2667777, -0.7771962, 1, 0.7019608, 0, 1,
-1.199703, 0.4797743, -1.647788, 1, 0.7098039, 0, 1,
-1.19608, 0.07881913, -1.147782, 1, 0.7137255, 0, 1,
-1.187232, -0.6077221, -3.035304, 1, 0.7215686, 0, 1,
-1.184609, -0.4017072, -1.348943, 1, 0.7254902, 0, 1,
-1.184024, 1.276869, -0.3667078, 1, 0.7333333, 0, 1,
-1.183352, -1.561131, -1.746702, 1, 0.7372549, 0, 1,
-1.18259, -0.6709489, -0.4091851, 1, 0.7450981, 0, 1,
-1.175846, 0.3379386, -1.708499, 1, 0.7490196, 0, 1,
-1.173852, -0.2375821, -1.696027, 1, 0.7568628, 0, 1,
-1.168691, -0.5868741, -1.806088, 1, 0.7607843, 0, 1,
-1.167798, 0.6616133, -1.766127, 1, 0.7686275, 0, 1,
-1.163834, 0.06740829, 0.1174645, 1, 0.772549, 0, 1,
-1.16345, 0.1539262, -1.986202, 1, 0.7803922, 0, 1,
-1.161041, -0.5651423, -3.521835, 1, 0.7843137, 0, 1,
-1.160739, -0.8633224, -4.103101, 1, 0.7921569, 0, 1,
-1.158668, 0.1533046, -2.063565, 1, 0.7960784, 0, 1,
-1.152381, 0.8707542, -1.263353, 1, 0.8039216, 0, 1,
-1.142817, -0.8006486, -2.868427, 1, 0.8117647, 0, 1,
-1.134622, 1.675856, -0.6375886, 1, 0.8156863, 0, 1,
-1.131956, 0.2982255, -1.087004, 1, 0.8235294, 0, 1,
-1.12264, 0.1669961, -3.606508, 1, 0.827451, 0, 1,
-1.121543, 0.4394861, -0.9059531, 1, 0.8352941, 0, 1,
-1.111399, 0.4665, -0.4648809, 1, 0.8392157, 0, 1,
-1.109343, 1.349349, -1.058765, 1, 0.8470588, 0, 1,
-1.096799, 2.003958, -1.720697, 1, 0.8509804, 0, 1,
-1.089726, -0.008944219, -1.0144, 1, 0.8588235, 0, 1,
-1.085593, 0.7587322, 0.4923725, 1, 0.8627451, 0, 1,
-1.08006, -1.297733, -2.51295, 1, 0.8705882, 0, 1,
-1.078218, 0.00889645, -1.493962, 1, 0.8745098, 0, 1,
-1.061292, 1.998915, 0.002140003, 1, 0.8823529, 0, 1,
-1.060332, 0.4460034, -1.560148, 1, 0.8862745, 0, 1,
-1.045535, -0.7579816, -2.660263, 1, 0.8941177, 0, 1,
-1.04125, 0.469818, 0.8388062, 1, 0.8980392, 0, 1,
-1.032865, 0.3445234, -1.23839, 1, 0.9058824, 0, 1,
-1.024697, 1.027557, 0.3943596, 1, 0.9137255, 0, 1,
-1.017799, 0.461393, -2.262201, 1, 0.9176471, 0, 1,
-1.007879, -1.13371, -2.515733, 1, 0.9254902, 0, 1,
-0.9961642, 1.41548, 0.1802262, 1, 0.9294118, 0, 1,
-0.9937565, 1.338663, 0.9825853, 1, 0.9372549, 0, 1,
-0.9886544, 1.231682, -0.5482068, 1, 0.9411765, 0, 1,
-0.9832974, 1.101211, -0.5529751, 1, 0.9490196, 0, 1,
-0.9788271, -0.2766534, -1.314883, 1, 0.9529412, 0, 1,
-0.9708094, -1.246055, -1.886407, 1, 0.9607843, 0, 1,
-0.9569768, -1.512103, -2.905016, 1, 0.9647059, 0, 1,
-0.9519182, 0.2793459, -0.9646597, 1, 0.972549, 0, 1,
-0.9500265, 0.01478367, -2.407961, 1, 0.9764706, 0, 1,
-0.9496657, -0.6367724, -1.263676, 1, 0.9843137, 0, 1,
-0.9493079, 0.4880073, -1.586306, 1, 0.9882353, 0, 1,
-0.9435965, 0.6767466, -0.3178421, 1, 0.9960784, 0, 1,
-0.941874, 1.120321, -0.4462778, 0.9960784, 1, 0, 1,
-0.9394324, -0.606473, -2.447464, 0.9921569, 1, 0, 1,
-0.9328445, 0.5542352, -1.920153, 0.9843137, 1, 0, 1,
-0.9266619, 0.09373212, -1.671005, 0.9803922, 1, 0, 1,
-0.9241792, 0.9656486, -0.2004186, 0.972549, 1, 0, 1,
-0.918402, 0.3787698, -2.26754, 0.9686275, 1, 0, 1,
-0.9080007, -0.8937698, -1.861174, 0.9607843, 1, 0, 1,
-0.9068451, 1.181741, -0.9970614, 0.9568627, 1, 0, 1,
-0.906259, 0.8715996, -1.168226, 0.9490196, 1, 0, 1,
-0.9060861, -0.09421389, -0.9068159, 0.945098, 1, 0, 1,
-0.8962009, -1.003933, -2.14257, 0.9372549, 1, 0, 1,
-0.8951566, -0.1243043, 0.4142646, 0.9333333, 1, 0, 1,
-0.8943205, 2.169267, -0.2915147, 0.9254902, 1, 0, 1,
-0.8934909, -0.4111755, -2.584409, 0.9215686, 1, 0, 1,
-0.8901176, -0.9424236, -1.611221, 0.9137255, 1, 0, 1,
-0.8879684, 0.9506685, -1.932935, 0.9098039, 1, 0, 1,
-0.8872826, -0.2219342, -1.170813, 0.9019608, 1, 0, 1,
-0.8853554, -0.8129894, -2.041977, 0.8941177, 1, 0, 1,
-0.8848279, -0.1633742, -0.1949447, 0.8901961, 1, 0, 1,
-0.8821438, -1.184576, -3.58161, 0.8823529, 1, 0, 1,
-0.8742442, 0.4169435, -2.076442, 0.8784314, 1, 0, 1,
-0.8662768, -0.1790563, -1.383222, 0.8705882, 1, 0, 1,
-0.8599519, -0.1218985, -2.118383, 0.8666667, 1, 0, 1,
-0.8565133, 0.700368, -1.582659, 0.8588235, 1, 0, 1,
-0.8537418, -0.06175879, -1.059483, 0.854902, 1, 0, 1,
-0.8520406, -0.6722804, -1.981752, 0.8470588, 1, 0, 1,
-0.8516098, 1.461764, -0.9611471, 0.8431373, 1, 0, 1,
-0.850395, -1.189922, -3.929423, 0.8352941, 1, 0, 1,
-0.84907, 0.650768, -1.845266, 0.8313726, 1, 0, 1,
-0.8408849, 0.8810059, -1.208466, 0.8235294, 1, 0, 1,
-0.840685, -1.617855, -2.948241, 0.8196079, 1, 0, 1,
-0.8392268, 1.032021, -1.027501, 0.8117647, 1, 0, 1,
-0.8391464, -0.8579536, -3.600084, 0.8078431, 1, 0, 1,
-0.8304747, -1.049325, -2.858912, 0.8, 1, 0, 1,
-0.8299609, -0.2466768, -1.048236, 0.7921569, 1, 0, 1,
-0.829904, -0.006785148, -2.074059, 0.7882353, 1, 0, 1,
-0.8215632, 0.9487636, 0.4970696, 0.7803922, 1, 0, 1,
-0.8213624, 0.2051794, -0.8431966, 0.7764706, 1, 0, 1,
-0.8205413, 0.7902012, -1.713015, 0.7686275, 1, 0, 1,
-0.8066984, -1.821333, -2.364074, 0.7647059, 1, 0, 1,
-0.8065017, -1.20251, -2.348487, 0.7568628, 1, 0, 1,
-0.796356, -0.5343578, -1.424374, 0.7529412, 1, 0, 1,
-0.7958612, -0.6547288, -3.426953, 0.7450981, 1, 0, 1,
-0.7928757, 1.145826, -0.3106222, 0.7411765, 1, 0, 1,
-0.7919496, -1.38224, 0.6566214, 0.7333333, 1, 0, 1,
-0.7768495, -0.7738371, -1.726597, 0.7294118, 1, 0, 1,
-0.776203, -0.2028733, -1.069278, 0.7215686, 1, 0, 1,
-0.7625427, -0.8150901, -2.378563, 0.7176471, 1, 0, 1,
-0.7620316, 2.207322, -0.6388922, 0.7098039, 1, 0, 1,
-0.7605988, 0.8975338, -0.8296983, 0.7058824, 1, 0, 1,
-0.7560933, 0.387116, -1.197967, 0.6980392, 1, 0, 1,
-0.7525819, -0.4587945, -2.527642, 0.6901961, 1, 0, 1,
-0.7491373, -0.4528185, -1.957736, 0.6862745, 1, 0, 1,
-0.746042, -0.2741389, -1.736233, 0.6784314, 1, 0, 1,
-0.740342, 0.4145211, -2.426762, 0.6745098, 1, 0, 1,
-0.7401125, 0.432033, -1.802222, 0.6666667, 1, 0, 1,
-0.7397193, -0.1118089, -2.665936, 0.6627451, 1, 0, 1,
-0.7366302, 0.3678842, 0.9364777, 0.654902, 1, 0, 1,
-0.7326037, 0.8687415, -1.455975, 0.6509804, 1, 0, 1,
-0.729542, -0.4143583, -1.647698, 0.6431373, 1, 0, 1,
-0.7258217, -0.8067386, -2.383098, 0.6392157, 1, 0, 1,
-0.7155616, -0.0804444, -1.419666, 0.6313726, 1, 0, 1,
-0.7055683, -0.5790324, -2.676182, 0.627451, 1, 0, 1,
-0.7030521, -1.242437, -3.697786, 0.6196079, 1, 0, 1,
-0.7002169, -0.8611771, -2.114307, 0.6156863, 1, 0, 1,
-0.6973533, -0.5124441, -1.389959, 0.6078432, 1, 0, 1,
-0.6972576, -0.2472151, -1.207284, 0.6039216, 1, 0, 1,
-0.691825, 0.3405329, -0.6157743, 0.5960785, 1, 0, 1,
-0.691737, 0.4361943, -1.910989, 0.5882353, 1, 0, 1,
-0.6861648, 1.405693, -0.8251092, 0.5843138, 1, 0, 1,
-0.6731831, -0.06140643, -1.682042, 0.5764706, 1, 0, 1,
-0.666647, -0.723711, -3.946157, 0.572549, 1, 0, 1,
-0.6643903, -0.3132079, -1.232783, 0.5647059, 1, 0, 1,
-0.6602358, -0.6136415, -1.655371, 0.5607843, 1, 0, 1,
-0.6534604, -0.9403632, -2.962452, 0.5529412, 1, 0, 1,
-0.6520478, -1.16078, -3.164577, 0.5490196, 1, 0, 1,
-0.6483123, 1.518724, -1.182543, 0.5411765, 1, 0, 1,
-0.6472801, 0.327318, -0.4433365, 0.5372549, 1, 0, 1,
-0.6464186, 1.558914, -1.009484, 0.5294118, 1, 0, 1,
-0.6412564, -0.8923702, -3.30043, 0.5254902, 1, 0, 1,
-0.6398456, 0.5068017, -1.580742, 0.5176471, 1, 0, 1,
-0.6395763, -0.1487506, -0.8700576, 0.5137255, 1, 0, 1,
-0.6386175, 0.4088076, -1.344074, 0.5058824, 1, 0, 1,
-0.6315976, -1.39524, -4.757594, 0.5019608, 1, 0, 1,
-0.6211237, -0.3296396, -0.732161, 0.4941176, 1, 0, 1,
-0.6184024, 0.5144451, -3.111258, 0.4862745, 1, 0, 1,
-0.6182665, 0.6429878, -0.8990456, 0.4823529, 1, 0, 1,
-0.6150038, -1.035878, -1.068516, 0.4745098, 1, 0, 1,
-0.6096501, 0.6204031, 0.7436324, 0.4705882, 1, 0, 1,
-0.6084481, -1.537283, -3.032568, 0.4627451, 1, 0, 1,
-0.6044939, -0.1131556, -1.462065, 0.4588235, 1, 0, 1,
-0.6001197, -0.4235103, -1.61699, 0.4509804, 1, 0, 1,
-0.5964919, -0.8617706, -2.560429, 0.4470588, 1, 0, 1,
-0.5959941, 0.6092921, -1.000878, 0.4392157, 1, 0, 1,
-0.5911871, 1.286751, -1.868751, 0.4352941, 1, 0, 1,
-0.5911686, 2.806902, -1.767552, 0.427451, 1, 0, 1,
-0.5876887, -0.9257691, -3.719004, 0.4235294, 1, 0, 1,
-0.5848495, -1.432564, -2.788804, 0.4156863, 1, 0, 1,
-0.5847777, -0.1970513, -0.2931111, 0.4117647, 1, 0, 1,
-0.5795098, -1.060213, -3.657598, 0.4039216, 1, 0, 1,
-0.5645561, 0.3074717, -0.4764732, 0.3960784, 1, 0, 1,
-0.5639174, -0.1373689, -1.868905, 0.3921569, 1, 0, 1,
-0.5632711, -0.5115481, -4.056581, 0.3843137, 1, 0, 1,
-0.561419, 0.06553083, -2.140965, 0.3803922, 1, 0, 1,
-0.5611544, 0.9737945, -0.6336105, 0.372549, 1, 0, 1,
-0.5546277, 0.2495097, -2.594562, 0.3686275, 1, 0, 1,
-0.5520768, 1.326463, 0.1788797, 0.3607843, 1, 0, 1,
-0.5508485, 1.318677, 0.2219266, 0.3568628, 1, 0, 1,
-0.5462195, 0.9603789, -2.018689, 0.3490196, 1, 0, 1,
-0.5419872, 1.131301, 0.7718008, 0.345098, 1, 0, 1,
-0.5412167, -0.9231128, -4.14986, 0.3372549, 1, 0, 1,
-0.539357, 0.1193753, -1.411885, 0.3333333, 1, 0, 1,
-0.5332536, -0.9270859, -3.14348, 0.3254902, 1, 0, 1,
-0.5263774, -1.124369, -3.174594, 0.3215686, 1, 0, 1,
-0.5237474, -0.6588386, -1.841904, 0.3137255, 1, 0, 1,
-0.518959, 0.3529003, -0.4750205, 0.3098039, 1, 0, 1,
-0.5155599, 1.169987, -0.3611971, 0.3019608, 1, 0, 1,
-0.5154214, 1.761034, -0.1534059, 0.2941177, 1, 0, 1,
-0.5134377, 1.198057, 0.5063673, 0.2901961, 1, 0, 1,
-0.5134147, 0.7897167, -0.8752167, 0.282353, 1, 0, 1,
-0.5075948, 0.9270428, -1.389635, 0.2784314, 1, 0, 1,
-0.5067604, 0.526458, -0.6334152, 0.2705882, 1, 0, 1,
-0.5046504, -0.314763, -3.373901, 0.2666667, 1, 0, 1,
-0.5044832, 2.112971, 0.3876561, 0.2588235, 1, 0, 1,
-0.5018865, -0.3919819, -2.052679, 0.254902, 1, 0, 1,
-0.4963355, 1.131025, -0.9483304, 0.2470588, 1, 0, 1,
-0.495137, 0.6873633, -1.190254, 0.2431373, 1, 0, 1,
-0.4938982, -2.446502, -3.437364, 0.2352941, 1, 0, 1,
-0.4936319, -0.8146339, -3.00637, 0.2313726, 1, 0, 1,
-0.4929489, -0.3363733, -2.015016, 0.2235294, 1, 0, 1,
-0.4921039, -0.4550763, -2.389454, 0.2196078, 1, 0, 1,
-0.4918435, 0.5368984, -0.3192469, 0.2117647, 1, 0, 1,
-0.4850582, -0.5457931, -1.75831, 0.2078431, 1, 0, 1,
-0.4801641, 0.20896, -1.4698, 0.2, 1, 0, 1,
-0.4799399, 1.83382, 0.01507995, 0.1921569, 1, 0, 1,
-0.4787624, 1.785871, 1.150614, 0.1882353, 1, 0, 1,
-0.4739629, -0.1768994, -1.88787, 0.1803922, 1, 0, 1,
-0.4677279, 0.9701987, -2.145362, 0.1764706, 1, 0, 1,
-0.4674794, 2.040321, -0.1278295, 0.1686275, 1, 0, 1,
-0.4645839, 0.2005489, -1.940076, 0.1647059, 1, 0, 1,
-0.4639967, -0.3151732, -1.191604, 0.1568628, 1, 0, 1,
-0.4632263, 0.356746, -1.39049, 0.1529412, 1, 0, 1,
-0.4626138, 0.1402104, -0.4800321, 0.145098, 1, 0, 1,
-0.4592721, -0.1266531, -2.701546, 0.1411765, 1, 0, 1,
-0.4589227, -0.8429395, -2.797919, 0.1333333, 1, 0, 1,
-0.4577189, 1.46986, -0.4078001, 0.1294118, 1, 0, 1,
-0.4543043, 0.1759117, -1.222932, 0.1215686, 1, 0, 1,
-0.4508611, -1.292742, -2.270858, 0.1176471, 1, 0, 1,
-0.4498629, -0.05540887, -2.195054, 0.1098039, 1, 0, 1,
-0.4491705, 0.269167, -0.1986324, 0.1058824, 1, 0, 1,
-0.4472871, -1.326194, -1.781128, 0.09803922, 1, 0, 1,
-0.4457881, -0.1838104, -2.705159, 0.09019608, 1, 0, 1,
-0.4416195, 1.558752, -1.372547, 0.08627451, 1, 0, 1,
-0.4414682, -0.03792729, -2.244679, 0.07843138, 1, 0, 1,
-0.4389522, 1.326392, 0.4102153, 0.07450981, 1, 0, 1,
-0.437502, 0.5872632, -1.008377, 0.06666667, 1, 0, 1,
-0.4355912, 0.255628, 0.7097336, 0.0627451, 1, 0, 1,
-0.4334469, -0.2393295, -1.111767, 0.05490196, 1, 0, 1,
-0.4301954, 0.2341945, -0.4736768, 0.05098039, 1, 0, 1,
-0.4283873, 0.4648472, -1.4673, 0.04313726, 1, 0, 1,
-0.4272947, 0.3091452, -0.9194667, 0.03921569, 1, 0, 1,
-0.4211213, 0.01135771, -0.860655, 0.03137255, 1, 0, 1,
-0.420324, 1.117832, -1.339415, 0.02745098, 1, 0, 1,
-0.4190237, 0.5515857, -3.239646, 0.01960784, 1, 0, 1,
-0.4171109, 0.4751958, 0.3369866, 0.01568628, 1, 0, 1,
-0.4167627, -0.5914623, -2.741696, 0.007843138, 1, 0, 1,
-0.41554, -0.022528, -1.301921, 0.003921569, 1, 0, 1,
-0.4152121, 1.681051, 1.11059, 0, 1, 0.003921569, 1,
-0.414876, 0.3280836, -1.280274, 0, 1, 0.01176471, 1,
-0.41426, -0.4030975, -1.514686, 0, 1, 0.01568628, 1,
-0.4136012, 0.1506215, -0.005735305, 0, 1, 0.02352941, 1,
-0.4095747, -0.08908839, -1.747751, 0, 1, 0.02745098, 1,
-0.4060706, -0.470771, -2.799828, 0, 1, 0.03529412, 1,
-0.4026879, 0.3960002, -0.8639289, 0, 1, 0.03921569, 1,
-0.4011107, -0.9149995, -3.569902, 0, 1, 0.04705882, 1,
-0.4000719, -0.1662751, 0.1114016, 0, 1, 0.05098039, 1,
-0.3987792, 0.4545887, -0.3735473, 0, 1, 0.05882353, 1,
-0.3972907, -1.213754, -2.000471, 0, 1, 0.0627451, 1,
-0.3941385, -0.5116953, -2.14832, 0, 1, 0.07058824, 1,
-0.3895947, -0.04410026, -0.2218968, 0, 1, 0.07450981, 1,
-0.3790794, -0.5516387, -2.344906, 0, 1, 0.08235294, 1,
-0.373273, 0.5587448, -1.152189, 0, 1, 0.08627451, 1,
-0.3663456, 0.1920656, -2.48773, 0, 1, 0.09411765, 1,
-0.3633134, 0.2596906, -0.4384092, 0, 1, 0.1019608, 1,
-0.3630694, -0.8426327, -2.744713, 0, 1, 0.1058824, 1,
-0.3619851, 0.1506486, -1.938165, 0, 1, 0.1137255, 1,
-0.3558654, 1.028139, 0.4661466, 0, 1, 0.1176471, 1,
-0.3537419, -1.537169, -2.151519, 0, 1, 0.1254902, 1,
-0.3490816, -1.793976, -3.546743, 0, 1, 0.1294118, 1,
-0.3433328, -0.2581657, -2.19688, 0, 1, 0.1372549, 1,
-0.3432908, 1.60762, -0.1644741, 0, 1, 0.1411765, 1,
-0.3421494, -1.039043, -3.000957, 0, 1, 0.1490196, 1,
-0.3404246, -0.07308759, -2.169998, 0, 1, 0.1529412, 1,
-0.3402514, 0.2647036, 0.8120492, 0, 1, 0.1607843, 1,
-0.3387087, 0.1062988, -1.813423, 0, 1, 0.1647059, 1,
-0.3316627, -0.6414482, -2.91159, 0, 1, 0.172549, 1,
-0.3314677, -0.2895134, -2.327562, 0, 1, 0.1764706, 1,
-0.3303923, 0.3920266, 0.4494597, 0, 1, 0.1843137, 1,
-0.3295835, -0.3609822, -2.138404, 0, 1, 0.1882353, 1,
-0.3284666, 0.4492722, -0.8795767, 0, 1, 0.1960784, 1,
-0.3247072, -0.4538041, -2.706904, 0, 1, 0.2039216, 1,
-0.3243903, 0.1455856, -1.82797, 0, 1, 0.2078431, 1,
-0.3235446, 1.56474, 0.7033498, 0, 1, 0.2156863, 1,
-0.3222204, -0.7372642, -2.999102, 0, 1, 0.2196078, 1,
-0.3174582, -0.2404023, -1.691544, 0, 1, 0.227451, 1,
-0.315826, -0.4832657, -3.161105, 0, 1, 0.2313726, 1,
-0.3132778, 0.6511535, -0.6802266, 0, 1, 0.2392157, 1,
-0.3130337, -0.05979987, -1.795587, 0, 1, 0.2431373, 1,
-0.3124147, 0.4027774, -0.8591557, 0, 1, 0.2509804, 1,
-0.3103303, 0.2236276, -4.109851, 0, 1, 0.254902, 1,
-0.30766, 0.7709772, -0.910035, 0, 1, 0.2627451, 1,
-0.3011039, 1.75587, -1.04073, 0, 1, 0.2666667, 1,
-0.2983, -0.438206, -1.438254, 0, 1, 0.2745098, 1,
-0.2976457, 0.9000503, 0.6429702, 0, 1, 0.2784314, 1,
-0.2972113, -1.474146, -5.594937, 0, 1, 0.2862745, 1,
-0.2958505, -1.276337, -1.935753, 0, 1, 0.2901961, 1,
-0.2927885, -0.009251768, -1.304019, 0, 1, 0.2980392, 1,
-0.2905658, -0.5816832, -3.493371, 0, 1, 0.3058824, 1,
-0.290363, -0.8286868, -2.912269, 0, 1, 0.3098039, 1,
-0.2899511, 0.4493047, -1.243797, 0, 1, 0.3176471, 1,
-0.2896026, -0.9723847, -2.962111, 0, 1, 0.3215686, 1,
-0.2859266, 1.061501, -0.1062348, 0, 1, 0.3294118, 1,
-0.2831138, -0.07946675, -3.388404, 0, 1, 0.3333333, 1,
-0.2822533, -0.288034, -2.223051, 0, 1, 0.3411765, 1,
-0.2790329, 0.5180007, 0.4168429, 0, 1, 0.345098, 1,
-0.2773529, -0.00494032, -1.691772, 0, 1, 0.3529412, 1,
-0.2751634, -0.6344145, -3.641714, 0, 1, 0.3568628, 1,
-0.2671902, 0.3080375, 0.9388034, 0, 1, 0.3647059, 1,
-0.2633344, 0.3394874, -1.121412, 0, 1, 0.3686275, 1,
-0.2624372, 0.06857126, -1.001711, 0, 1, 0.3764706, 1,
-0.2610835, -0.004774427, -0.5876545, 0, 1, 0.3803922, 1,
-0.2609358, -0.9513649, -3.239017, 0, 1, 0.3882353, 1,
-0.2602111, 0.5345684, -1.22326, 0, 1, 0.3921569, 1,
-0.2590658, 0.5734004, -1.488578, 0, 1, 0.4, 1,
-0.2579937, 0.5866351, 0.7076981, 0, 1, 0.4078431, 1,
-0.2565175, -0.1679533, -4.258096, 0, 1, 0.4117647, 1,
-0.2554148, -1.177036, -1.497341, 0, 1, 0.4196078, 1,
-0.2540955, -0.5144876, -3.572208, 0, 1, 0.4235294, 1,
-0.2531098, -0.2882647, -1.23368, 0, 1, 0.4313726, 1,
-0.2487633, 1.706424, -0.3151281, 0, 1, 0.4352941, 1,
-0.2468559, 1.392633, -0.2695947, 0, 1, 0.4431373, 1,
-0.2424166, 0.6786059, -1.451981, 0, 1, 0.4470588, 1,
-0.2405575, 0.2604139, -0.6644324, 0, 1, 0.454902, 1,
-0.240473, -0.3750454, -3.276964, 0, 1, 0.4588235, 1,
-0.2370857, 0.3444462, -3.597849, 0, 1, 0.4666667, 1,
-0.2363472, -1.548759, -3.084346, 0, 1, 0.4705882, 1,
-0.2349431, 0.7288553, -1.485674, 0, 1, 0.4784314, 1,
-0.2345237, -1.965294, -1.627233, 0, 1, 0.4823529, 1,
-0.227744, -2.048053, -1.500055, 0, 1, 0.4901961, 1,
-0.2212045, 0.943706, 0.9189563, 0, 1, 0.4941176, 1,
-0.2211983, -0.9293871, -2.91594, 0, 1, 0.5019608, 1,
-0.2211682, -0.07544223, -2.572582, 0, 1, 0.509804, 1,
-0.2206899, -0.8332993, -4.146776, 0, 1, 0.5137255, 1,
-0.2181994, 0.3986055, 0.07628714, 0, 1, 0.5215687, 1,
-0.217739, -1.627713, -2.58596, 0, 1, 0.5254902, 1,
-0.2150805, -1.628698, -3.654675, 0, 1, 0.5333334, 1,
-0.2146398, -0.542381, -2.759195, 0, 1, 0.5372549, 1,
-0.2137984, -0.0462897, -1.435128, 0, 1, 0.5450981, 1,
-0.2031363, -0.6414913, -2.998526, 0, 1, 0.5490196, 1,
-0.2029318, -0.7629646, -5.017446, 0, 1, 0.5568628, 1,
-0.2017138, 1.339959, -0.9596949, 0, 1, 0.5607843, 1,
-0.2016678, -1.058632, -2.299066, 0, 1, 0.5686275, 1,
-0.2003802, 0.03211648, -1.986201, 0, 1, 0.572549, 1,
-0.1988762, -0.5523756, -1.823569, 0, 1, 0.5803922, 1,
-0.1965228, 1.209852, 0.3102845, 0, 1, 0.5843138, 1,
-0.1901333, -1.01996, -3.67424, 0, 1, 0.5921569, 1,
-0.1878418, -0.841092, -2.763385, 0, 1, 0.5960785, 1,
-0.1834239, 0.03174328, -1.069577, 0, 1, 0.6039216, 1,
-0.1812771, 0.3902774, 0.09503115, 0, 1, 0.6117647, 1,
-0.1706812, 1.13264, 1.1997, 0, 1, 0.6156863, 1,
-0.1673544, -0.9597501, -2.001789, 0, 1, 0.6235294, 1,
-0.1663876, 0.6148137, -1.753323, 0, 1, 0.627451, 1,
-0.1616688, -0.2136652, -0.8176405, 0, 1, 0.6352941, 1,
-0.161317, -0.9892746, -1.675205, 0, 1, 0.6392157, 1,
-0.1583825, 0.6834874, -1.467974, 0, 1, 0.6470588, 1,
-0.1569434, 0.4037385, -0.9102377, 0, 1, 0.6509804, 1,
-0.1558645, 0.8907993, -1.266161, 0, 1, 0.6588235, 1,
-0.1529987, -2.155114, -4.766511, 0, 1, 0.6627451, 1,
-0.1447395, 0.5489818, 0.4782318, 0, 1, 0.6705883, 1,
-0.144675, -0.8149776, -2.872939, 0, 1, 0.6745098, 1,
-0.1440514, 0.192626, 1.058261, 0, 1, 0.682353, 1,
-0.1423621, 0.2865693, -0.2157586, 0, 1, 0.6862745, 1,
-0.1391969, -0.7039759, -3.921814, 0, 1, 0.6941177, 1,
-0.1378854, -0.7015109, -1.961193, 0, 1, 0.7019608, 1,
-0.1331749, -0.3176931, -2.311769, 0, 1, 0.7058824, 1,
-0.1323419, -0.7364987, -4.830688, 0, 1, 0.7137255, 1,
-0.1286021, -2.001848, -2.010224, 0, 1, 0.7176471, 1,
-0.1259763, -0.6483309, -1.553205, 0, 1, 0.7254902, 1,
-0.1259074, 1.853977, -1.076221, 0, 1, 0.7294118, 1,
-0.1237701, -1.401077, -4.062356, 0, 1, 0.7372549, 1,
-0.1223924, -2.591581, -3.085922, 0, 1, 0.7411765, 1,
-0.1166486, -0.5406733, -2.129169, 0, 1, 0.7490196, 1,
-0.1156294, -0.1423459, -3.482915, 0, 1, 0.7529412, 1,
-0.1137357, -0.2995593, -3.028507, 0, 1, 0.7607843, 1,
-0.1135892, -0.5725492, -2.151628, 0, 1, 0.7647059, 1,
-0.1110425, 0.3156782, -0.1050861, 0, 1, 0.772549, 1,
-0.1062296, 1.357824, -0.503428, 0, 1, 0.7764706, 1,
-0.1046107, 1.070083, -0.2868433, 0, 1, 0.7843137, 1,
-0.1027463, 0.4610187, 1.239683, 0, 1, 0.7882353, 1,
-0.1015228, -1.086014, -4.170048, 0, 1, 0.7960784, 1,
-0.09988283, 0.7358505, 0.08016184, 0, 1, 0.8039216, 1,
-0.09644123, 0.02133658, -1.893412, 0, 1, 0.8078431, 1,
-0.09429466, -1.745242, -1.626137, 0, 1, 0.8156863, 1,
-0.09348919, -0.03407469, -1.842147, 0, 1, 0.8196079, 1,
-0.08862676, 0.1351628, -1.418012, 0, 1, 0.827451, 1,
-0.08717258, -0.5103167, -3.881945, 0, 1, 0.8313726, 1,
-0.08469673, -0.03226734, -0.8990586, 0, 1, 0.8392157, 1,
-0.0844048, -0.725455, -3.241067, 0, 1, 0.8431373, 1,
-0.08193468, -0.02930366, -0.7983365, 0, 1, 0.8509804, 1,
-0.08147454, 1.324783, 0.9441752, 0, 1, 0.854902, 1,
-0.07252444, -0.9780532, -2.192097, 0, 1, 0.8627451, 1,
-0.07199306, 0.7706872, 1.065777, 0, 1, 0.8666667, 1,
-0.06975568, -0.4095013, -4.3792, 0, 1, 0.8745098, 1,
-0.06190388, 1.143926, -1.03728, 0, 1, 0.8784314, 1,
-0.05584106, 1.973124, -0.5686275, 0, 1, 0.8862745, 1,
-0.05138255, -0.3120968, -3.01867, 0, 1, 0.8901961, 1,
-0.05079236, 0.6832766, -0.3670724, 0, 1, 0.8980392, 1,
-0.04374432, 1.225354, -0.2231801, 0, 1, 0.9058824, 1,
-0.04199995, -0.2010319, -3.265597, 0, 1, 0.9098039, 1,
-0.04044077, -0.4732441, -2.072572, 0, 1, 0.9176471, 1,
-0.03728056, 1.381922, -0.1045657, 0, 1, 0.9215686, 1,
-0.03611597, -0.2787696, -2.609971, 0, 1, 0.9294118, 1,
-0.03155304, -0.4623548, -2.607686, 0, 1, 0.9333333, 1,
-0.03001923, 0.03620248, -2.520009, 0, 1, 0.9411765, 1,
-0.0281591, 0.8005942, -0.3902113, 0, 1, 0.945098, 1,
-0.02517015, 0.1139361, 0.5477382, 0, 1, 0.9529412, 1,
-0.02481652, 0.2630481, 0.02938664, 0, 1, 0.9568627, 1,
-0.023598, -0.6470487, -2.797695, 0, 1, 0.9647059, 1,
-0.0214369, -0.4994758, -3.193868, 0, 1, 0.9686275, 1,
-0.01861404, 0.1283538, -1.075526, 0, 1, 0.9764706, 1,
-0.01581602, -0.3174614, -4.660401, 0, 1, 0.9803922, 1,
-0.009300439, 0.2052132, 0.337085, 0, 1, 0.9882353, 1,
-0.008582421, -0.6237417, -3.131979, 0, 1, 0.9921569, 1,
-0.008097287, -0.4239103, -3.089023, 0, 1, 1, 1,
-0.006649539, -1.31736, -4.531165, 0, 0.9921569, 1, 1,
-0.005610341, -0.8743694, -1.431718, 0, 0.9882353, 1, 1,
-0.004323624, -0.3686191, -3.631748, 0, 0.9803922, 1, 1,
-0.001506594, -0.51539, -3.580145, 0, 0.9764706, 1, 1,
0.001369848, -1.955499, 2.688099, 0, 0.9686275, 1, 1,
0.003609051, -0.3152905, 2.158249, 0, 0.9647059, 1, 1,
0.004263497, 1.167397, 1.765471, 0, 0.9568627, 1, 1,
0.01102558, 0.9780263, -0.4671666, 0, 0.9529412, 1, 1,
0.01254008, 0.2002906, 0.4077814, 0, 0.945098, 1, 1,
0.01345789, -0.2481244, 3.31145, 0, 0.9411765, 1, 1,
0.01409504, 0.09160363, 2.196091, 0, 0.9333333, 1, 1,
0.01690967, -0.2691411, 1.666255, 0, 0.9294118, 1, 1,
0.02295695, -0.6890501, 2.688512, 0, 0.9215686, 1, 1,
0.02577129, -0.2970777, 1.915947, 0, 0.9176471, 1, 1,
0.03573599, 0.3436806, 0.304557, 0, 0.9098039, 1, 1,
0.03616209, -0.263045, 3.111756, 0, 0.9058824, 1, 1,
0.03768787, -0.6143658, 4.1315, 0, 0.8980392, 1, 1,
0.03783029, -1.82477, 2.95453, 0, 0.8901961, 1, 1,
0.04121567, -0.5557631, 4.17797, 0, 0.8862745, 1, 1,
0.04281001, -0.03352629, 3.306772, 0, 0.8784314, 1, 1,
0.04894067, 0.3486339, 0.9844097, 0, 0.8745098, 1, 1,
0.05135909, -0.4136166, 2.788158, 0, 0.8666667, 1, 1,
0.05502776, 0.3715089, -0.7798302, 0, 0.8627451, 1, 1,
0.05876222, -0.5219022, 5.067029, 0, 0.854902, 1, 1,
0.05935932, 0.5660484, -0.7214002, 0, 0.8509804, 1, 1,
0.05979735, 0.0867391, -0.1051836, 0, 0.8431373, 1, 1,
0.07357402, -1.240458, 2.825904, 0, 0.8392157, 1, 1,
0.0767379, 0.9244192, -0.2595802, 0, 0.8313726, 1, 1,
0.07694435, 1.364138, -0.6435847, 0, 0.827451, 1, 1,
0.07927645, 0.1062405, 0.8101746, 0, 0.8196079, 1, 1,
0.07991421, -1.050998, 3.877943, 0, 0.8156863, 1, 1,
0.08035674, 0.01850991, 1.890938, 0, 0.8078431, 1, 1,
0.08388969, -0.2013918, 2.953338, 0, 0.8039216, 1, 1,
0.08676907, 0.4520724, 0.03319814, 0, 0.7960784, 1, 1,
0.08768034, 1.417153, -0.219019, 0, 0.7882353, 1, 1,
0.08776028, -0.9018605, 3.29791, 0, 0.7843137, 1, 1,
0.08923687, -0.3900526, 1.524828, 0, 0.7764706, 1, 1,
0.09422337, -1.547644, 3.392992, 0, 0.772549, 1, 1,
0.09537286, -0.2851996, 3.679729, 0, 0.7647059, 1, 1,
0.09543528, 1.857775, -0.8472003, 0, 0.7607843, 1, 1,
0.09569338, -0.2091611, 3.473619, 0, 0.7529412, 1, 1,
0.09829983, -0.446714, 3.096207, 0, 0.7490196, 1, 1,
0.09864143, 0.02427069, 1.220315, 0, 0.7411765, 1, 1,
0.1024959, 0.3337487, 1.826496, 0, 0.7372549, 1, 1,
0.1026121, 0.03347262, -0.2935766, 0, 0.7294118, 1, 1,
0.1026387, -0.6217773, 4.440991, 0, 0.7254902, 1, 1,
0.1057023, 0.6015092, 0.590786, 0, 0.7176471, 1, 1,
0.1080227, -1.426161, 2.709139, 0, 0.7137255, 1, 1,
0.1080944, 1.280759, -0.7785726, 0, 0.7058824, 1, 1,
0.1156366, 2.809576, -0.1327509, 0, 0.6980392, 1, 1,
0.118696, 1.009965, 0.6053138, 0, 0.6941177, 1, 1,
0.1210667, -0.7705609, 1.740775, 0, 0.6862745, 1, 1,
0.1235204, -0.3647276, 3.964437, 0, 0.682353, 1, 1,
0.1252029, -1.066265, 3.44103, 0, 0.6745098, 1, 1,
0.1293996, -0.276805, 1.976611, 0, 0.6705883, 1, 1,
0.1319211, -0.7203338, 3.405108, 0, 0.6627451, 1, 1,
0.1349912, -1.054574, 2.9492, 0, 0.6588235, 1, 1,
0.1390098, 0.7916753, 0.1232885, 0, 0.6509804, 1, 1,
0.1392529, -1.253118, 2.210326, 0, 0.6470588, 1, 1,
0.1417861, 0.8340809, 0.8353096, 0, 0.6392157, 1, 1,
0.1430421, -0.9401813, 4.572772, 0, 0.6352941, 1, 1,
0.1438185, -0.656646, 2.788425, 0, 0.627451, 1, 1,
0.1448367, -1.366481, 4.614272, 0, 0.6235294, 1, 1,
0.1472669, -0.2779939, 2.327492, 0, 0.6156863, 1, 1,
0.1480432, 0.4092105, -0.6158937, 0, 0.6117647, 1, 1,
0.1485855, -1.555667, 0.9538699, 0, 0.6039216, 1, 1,
0.1561986, -0.9855173, 3.355734, 0, 0.5960785, 1, 1,
0.1585274, 0.5561065, -1.483901, 0, 0.5921569, 1, 1,
0.1604594, -0.2025215, 2.526468, 0, 0.5843138, 1, 1,
0.1634423, -0.1819127, 3.683431, 0, 0.5803922, 1, 1,
0.173376, 0.134259, -0.4021138, 0, 0.572549, 1, 1,
0.1746579, 0.2208979, -1.001402, 0, 0.5686275, 1, 1,
0.1750222, 1.345573, 0.5598677, 0, 0.5607843, 1, 1,
0.1778141, 0.7325599, 1.179518, 0, 0.5568628, 1, 1,
0.1835207, -0.5283335, 0.4483579, 0, 0.5490196, 1, 1,
0.1850772, -1.045848, 2.710554, 0, 0.5450981, 1, 1,
0.1861512, -0.09680396, 2.309506, 0, 0.5372549, 1, 1,
0.1867681, -0.8981307, 4.453394, 0, 0.5333334, 1, 1,
0.1898601, 0.2683961, 1.116232, 0, 0.5254902, 1, 1,
0.1942454, 0.2633524, -0.5765734, 0, 0.5215687, 1, 1,
0.1963314, -0.7978235, 1.631317, 0, 0.5137255, 1, 1,
0.1974087, 2.151783, 0.3054542, 0, 0.509804, 1, 1,
0.2052787, 0.9669707, -0.9116461, 0, 0.5019608, 1, 1,
0.2128835, -0.7781321, 3.0607, 0, 0.4941176, 1, 1,
0.2131009, -0.005017065, 1.32153, 0, 0.4901961, 1, 1,
0.2156529, -1.643009, 3.439621, 0, 0.4823529, 1, 1,
0.2229905, 0.8319816, 1.773281, 0, 0.4784314, 1, 1,
0.2238384, 1.029821, 0.5336424, 0, 0.4705882, 1, 1,
0.2280186, -0.5753805, 4.65873, 0, 0.4666667, 1, 1,
0.2295311, 0.2360444, 0.9314395, 0, 0.4588235, 1, 1,
0.2322162, -0.401943, 2.482865, 0, 0.454902, 1, 1,
0.2337181, 1.152153, 1.29108, 0, 0.4470588, 1, 1,
0.2352622, 1.299456, 0.1181262, 0, 0.4431373, 1, 1,
0.2369703, -0.8610317, 3.053669, 0, 0.4352941, 1, 1,
0.2414075, -0.8562328, 4.173299, 0, 0.4313726, 1, 1,
0.250872, 0.1304509, 2.132451, 0, 0.4235294, 1, 1,
0.2525508, -0.7542496, 2.856395, 0, 0.4196078, 1, 1,
0.2530148, 0.1614952, 0.9873455, 0, 0.4117647, 1, 1,
0.2536035, 0.9023936, -1.113539, 0, 0.4078431, 1, 1,
0.253821, -0.3590055, 3.160832, 0, 0.4, 1, 1,
0.2547638, 0.1031775, 3.701063, 0, 0.3921569, 1, 1,
0.2548915, 1.350032, 1.207494, 0, 0.3882353, 1, 1,
0.2550593, 2.129309, 0.9359102, 0, 0.3803922, 1, 1,
0.2552436, -2.313468, 2.555327, 0, 0.3764706, 1, 1,
0.2554129, 0.9340845, -0.2015667, 0, 0.3686275, 1, 1,
0.2586232, -0.7465922, 3.494588, 0, 0.3647059, 1, 1,
0.2631251, -0.2737047, 1.529535, 0, 0.3568628, 1, 1,
0.2692866, 1.84771, -0.4474785, 0, 0.3529412, 1, 1,
0.2702424, 0.1672828, -0.967923, 0, 0.345098, 1, 1,
0.274285, -2.195126, 2.839803, 0, 0.3411765, 1, 1,
0.2749908, 0.9700766, 0.3274105, 0, 0.3333333, 1, 1,
0.2760184, 0.7410472, 0.5368388, 0, 0.3294118, 1, 1,
0.2778513, -0.04276641, 1.721388, 0, 0.3215686, 1, 1,
0.278088, -0.3594204, 1.054717, 0, 0.3176471, 1, 1,
0.2833638, -0.4994799, 4.294313, 0, 0.3098039, 1, 1,
0.2839123, -0.8332316, 3.558712, 0, 0.3058824, 1, 1,
0.2849263, -0.8416199, 3.94979, 0, 0.2980392, 1, 1,
0.2857841, -0.08762274, 2.586556, 0, 0.2901961, 1, 1,
0.287286, 0.2660777, 2.030303, 0, 0.2862745, 1, 1,
0.2897597, 0.5378321, 1.03881, 0, 0.2784314, 1, 1,
0.291295, 0.8779836, -0.6504521, 0, 0.2745098, 1, 1,
0.2999298, -0.2607243, 4.160421, 0, 0.2666667, 1, 1,
0.3067023, 0.5379329, -0.3799416, 0, 0.2627451, 1, 1,
0.3107674, -0.9985043, 2.801389, 0, 0.254902, 1, 1,
0.319088, 0.419513, 1.422267, 0, 0.2509804, 1, 1,
0.3328778, 1.080781, -0.1398024, 0, 0.2431373, 1, 1,
0.3330919, -1.301754, 1.789686, 0, 0.2392157, 1, 1,
0.3349768, -0.9143551, 2.419464, 0, 0.2313726, 1, 1,
0.3378243, 1.048019, -0.08650624, 0, 0.227451, 1, 1,
0.3389841, -0.7125503, 1.476464, 0, 0.2196078, 1, 1,
0.342067, 0.5901176, 0.518521, 0, 0.2156863, 1, 1,
0.343436, 1.426863, 0.4950447, 0, 0.2078431, 1, 1,
0.3463112, -0.03783101, 2.51467, 0, 0.2039216, 1, 1,
0.3503205, 1.137983, 0.9662309, 0, 0.1960784, 1, 1,
0.353213, 0.8934554, -0.07500653, 0, 0.1882353, 1, 1,
0.3588591, 0.3628277, 1.067737, 0, 0.1843137, 1, 1,
0.3687561, 1.954118, 0.7576326, 0, 0.1764706, 1, 1,
0.3744471, -1.722417, 3.629687, 0, 0.172549, 1, 1,
0.3752099, -1.027223, 0.3142592, 0, 0.1647059, 1, 1,
0.3795723, -2.178796, 3.588901, 0, 0.1607843, 1, 1,
0.3807442, 2.288744, 1.117514, 0, 0.1529412, 1, 1,
0.3847124, -0.6480399, 3.729339, 0, 0.1490196, 1, 1,
0.3860362, -0.5700992, 3.067317, 0, 0.1411765, 1, 1,
0.3865018, -0.3625403, 2.349786, 0, 0.1372549, 1, 1,
0.387529, 0.9021668, 0.09214322, 0, 0.1294118, 1, 1,
0.3910342, 0.8173499, -1.410259, 0, 0.1254902, 1, 1,
0.3926872, -0.7796222, 2.448994, 0, 0.1176471, 1, 1,
0.393269, -1.035871, 5.500083, 0, 0.1137255, 1, 1,
0.3952381, 2.103976, 0.8073214, 0, 0.1058824, 1, 1,
0.3983502, -1.722901, 3.578281, 0, 0.09803922, 1, 1,
0.3996058, -0.9709573, 4.40292, 0, 0.09411765, 1, 1,
0.40096, -0.9296531, 4.036556, 0, 0.08627451, 1, 1,
0.4033434, -0.695786, 3.236847, 0, 0.08235294, 1, 1,
0.4069091, 0.4222269, 1.36846, 0, 0.07450981, 1, 1,
0.408494, 0.9070544, 0.1775638, 0, 0.07058824, 1, 1,
0.410604, -0.736634, 2.568122, 0, 0.0627451, 1, 1,
0.4122007, 0.2085535, 1.822248, 0, 0.05882353, 1, 1,
0.4139615, -1.671236, 2.792444, 0, 0.05098039, 1, 1,
0.4169182, 0.2405596, 1.24247, 0, 0.04705882, 1, 1,
0.4205308, 1.087861, 1.476056, 0, 0.03921569, 1, 1,
0.4253988, 1.060063, 1.167011, 0, 0.03529412, 1, 1,
0.4270641, -0.7600201, 2.355457, 0, 0.02745098, 1, 1,
0.4276634, 0.7485102, -0.564862, 0, 0.02352941, 1, 1,
0.4290766, -0.2707899, 2.145547, 0, 0.01568628, 1, 1,
0.4296481, 0.6756386, 0.7286112, 0, 0.01176471, 1, 1,
0.4299428, -2.216374, 1.997899, 0, 0.003921569, 1, 1,
0.4331606, 0.325001, -0.2095077, 0.003921569, 0, 1, 1,
0.4372633, -0.6653827, 1.013153, 0.007843138, 0, 1, 1,
0.4386864, -0.2327229, 2.601301, 0.01568628, 0, 1, 1,
0.4420212, -0.9240314, 0.1786173, 0.01960784, 0, 1, 1,
0.4428965, 0.1695331, 2.672212, 0.02745098, 0, 1, 1,
0.444093, 0.4201239, 1.092395, 0.03137255, 0, 1, 1,
0.4487576, 0.1954007, 0.9604401, 0.03921569, 0, 1, 1,
0.4500212, -0.2737747, 2.020637, 0.04313726, 0, 1, 1,
0.4507153, -0.0007818923, 2.245385, 0.05098039, 0, 1, 1,
0.4523827, -0.3924645, 2.854739, 0.05490196, 0, 1, 1,
0.4591719, 0.07133171, 0.5733927, 0.0627451, 0, 1, 1,
0.4599767, 0.006552169, 1.74143, 0.06666667, 0, 1, 1,
0.4662784, 1.078932, 1.171397, 0.07450981, 0, 1, 1,
0.4680375, -0.2713434, 1.479944, 0.07843138, 0, 1, 1,
0.4680926, 1.089214, -0.3834333, 0.08627451, 0, 1, 1,
0.4710776, -1.025792, 2.347165, 0.09019608, 0, 1, 1,
0.4723902, -0.844806, 2.637823, 0.09803922, 0, 1, 1,
0.4741547, -1.183988, 3.212078, 0.1058824, 0, 1, 1,
0.4751337, -0.0164324, 2.720009, 0.1098039, 0, 1, 1,
0.4792047, 0.5931965, 1.27469, 0.1176471, 0, 1, 1,
0.4818451, -0.02216669, 0.5779589, 0.1215686, 0, 1, 1,
0.4854685, 1.012012, 0.4943877, 0.1294118, 0, 1, 1,
0.5020301, 0.1862084, 2.433908, 0.1333333, 0, 1, 1,
0.5027999, -0.7716054, 1.304255, 0.1411765, 0, 1, 1,
0.5057551, -1.922909, 2.112077, 0.145098, 0, 1, 1,
0.506024, -1.483922, 2.92231, 0.1529412, 0, 1, 1,
0.5096082, -0.7406598, 2.282319, 0.1568628, 0, 1, 1,
0.5101978, 1.269416, 0.9241691, 0.1647059, 0, 1, 1,
0.5183016, -0.7687587, 1.899211, 0.1686275, 0, 1, 1,
0.520362, 0.5213846, 1.661078, 0.1764706, 0, 1, 1,
0.5208672, 0.8583663, 0.1586729, 0.1803922, 0, 1, 1,
0.5355934, 2.449031, 1.738356, 0.1882353, 0, 1, 1,
0.5379823, -0.4994616, 3.344529, 0.1921569, 0, 1, 1,
0.540606, 1.752584, 0.2443788, 0.2, 0, 1, 1,
0.5437512, 0.676116, 2.152142, 0.2078431, 0, 1, 1,
0.5543159, -0.5697616, 2.159237, 0.2117647, 0, 1, 1,
0.5605913, -0.7020167, 1.073393, 0.2196078, 0, 1, 1,
0.5609223, 0.8240378, 0.150853, 0.2235294, 0, 1, 1,
0.5690151, 0.3523566, -0.192664, 0.2313726, 0, 1, 1,
0.5716624, 0.9033735, 0.7005345, 0.2352941, 0, 1, 1,
0.5736478, -1.987854, 3.931502, 0.2431373, 0, 1, 1,
0.5753092, 0.2515889, 0.0416134, 0.2470588, 0, 1, 1,
0.5760283, 0.7022729, 2.072229, 0.254902, 0, 1, 1,
0.5770111, 1.691907, -0.4898397, 0.2588235, 0, 1, 1,
0.581453, -0.7799332, 2.948237, 0.2666667, 0, 1, 1,
0.5836302, -0.1845644, 3.065971, 0.2705882, 0, 1, 1,
0.5849806, -0.1372077, 3.276521, 0.2784314, 0, 1, 1,
0.5851699, 0.3096105, 1.263595, 0.282353, 0, 1, 1,
0.5891005, 0.1624807, 2.117118, 0.2901961, 0, 1, 1,
0.5900578, -0.6676522, 1.818454, 0.2941177, 0, 1, 1,
0.5907741, 0.4776897, 1.220383, 0.3019608, 0, 1, 1,
0.5975756, -1.07051, 1.916262, 0.3098039, 0, 1, 1,
0.6007127, 0.9102163, 0.2879828, 0.3137255, 0, 1, 1,
0.6009837, 0.04500682, 1.011239, 0.3215686, 0, 1, 1,
0.6010698, -0.9792432, 3.095134, 0.3254902, 0, 1, 1,
0.6113871, -0.747201, 1.70855, 0.3333333, 0, 1, 1,
0.6131532, -0.8097878, 3.693844, 0.3372549, 0, 1, 1,
0.6156025, 1.298315, 2.0371, 0.345098, 0, 1, 1,
0.6183814, -2.88193, 1.583246, 0.3490196, 0, 1, 1,
0.6199517, -0.9479169, 1.72028, 0.3568628, 0, 1, 1,
0.622845, -0.5458415, 2.11031, 0.3607843, 0, 1, 1,
0.623687, -0.4613922, 1.165468, 0.3686275, 0, 1, 1,
0.6243815, 0.9500693, 0.5202261, 0.372549, 0, 1, 1,
0.6325575, 0.5731554, 0.2266074, 0.3803922, 0, 1, 1,
0.6329393, 1.095871, 0.8924848, 0.3843137, 0, 1, 1,
0.6337219, 1.058896, 1.984486, 0.3921569, 0, 1, 1,
0.6357791, -0.1442483, 1.14456, 0.3960784, 0, 1, 1,
0.6365061, -1.001416, 3.829556, 0.4039216, 0, 1, 1,
0.6382583, 0.01091767, 1.776469, 0.4117647, 0, 1, 1,
0.6392999, 0.6520552, -0.3694324, 0.4156863, 0, 1, 1,
0.641692, 0.4952012, 1.562307, 0.4235294, 0, 1, 1,
0.6475555, -0.5505111, 1.915848, 0.427451, 0, 1, 1,
0.6480374, -0.9732366, 3.610941, 0.4352941, 0, 1, 1,
0.6480904, 0.212011, 1.161462, 0.4392157, 0, 1, 1,
0.6483805, 0.1838144, 0.8719304, 0.4470588, 0, 1, 1,
0.653206, 0.5721985, 1.384177, 0.4509804, 0, 1, 1,
0.6542252, -0.614247, 1.637491, 0.4588235, 0, 1, 1,
0.6543943, -0.1480018, 2.016514, 0.4627451, 0, 1, 1,
0.6577337, -0.008484067, 1.029581, 0.4705882, 0, 1, 1,
0.6598272, 0.5176067, 0.8525591, 0.4745098, 0, 1, 1,
0.6612142, -0.8253247, 2.269703, 0.4823529, 0, 1, 1,
0.6622078, -1.72691, 1.66644, 0.4862745, 0, 1, 1,
0.6660091, 1.504335, -0.5243047, 0.4941176, 0, 1, 1,
0.6685609, 0.1854957, 0.5854362, 0.5019608, 0, 1, 1,
0.6690083, -0.578014, 3.329783, 0.5058824, 0, 1, 1,
0.6751869, -0.5077186, 3.325499, 0.5137255, 0, 1, 1,
0.6842409, 0.5394759, 0.9562206, 0.5176471, 0, 1, 1,
0.6869501, 0.410115, 0.7837889, 0.5254902, 0, 1, 1,
0.6869748, 1.234753, 0.7713027, 0.5294118, 0, 1, 1,
0.6883464, -0.1539647, 2.171129, 0.5372549, 0, 1, 1,
0.6954832, 1.070425, 0.3120391, 0.5411765, 0, 1, 1,
0.6983564, 0.3810661, 0.9698291, 0.5490196, 0, 1, 1,
0.7002272, -0.7052493, 1.01138, 0.5529412, 0, 1, 1,
0.7007935, 0.5397044, -0.4672542, 0.5607843, 0, 1, 1,
0.7031826, 0.4951366, -0.2169628, 0.5647059, 0, 1, 1,
0.7039015, 0.4926431, 1.725, 0.572549, 0, 1, 1,
0.7046016, 0.387243, 0.9556985, 0.5764706, 0, 1, 1,
0.7048833, -0.405945, 2.32522, 0.5843138, 0, 1, 1,
0.7053055, -0.6456455, 5.580195, 0.5882353, 0, 1, 1,
0.7091693, 0.6057068, 1.822765, 0.5960785, 0, 1, 1,
0.7093056, -1.319537, 2.201601, 0.6039216, 0, 1, 1,
0.7106107, -0.5511414, 1.815273, 0.6078432, 0, 1, 1,
0.7117612, -0.2689514, 2.522351, 0.6156863, 0, 1, 1,
0.7155181, 1.951838, 0.2315605, 0.6196079, 0, 1, 1,
0.7173942, 0.5843647, -0.02941236, 0.627451, 0, 1, 1,
0.7212626, 0.3124885, 1.302518, 0.6313726, 0, 1, 1,
0.7216225, -0.4179419, 2.107239, 0.6392157, 0, 1, 1,
0.7216399, -0.1616023, 0.4779395, 0.6431373, 0, 1, 1,
0.7254765, -0.5613484, 4.220733, 0.6509804, 0, 1, 1,
0.727058, -1.619192, 1.865115, 0.654902, 0, 1, 1,
0.7271547, -1.526421, 2.822584, 0.6627451, 0, 1, 1,
0.7331024, -0.4870588, 1.551831, 0.6666667, 0, 1, 1,
0.7362491, -1.024975, 3.314748, 0.6745098, 0, 1, 1,
0.7377837, -0.7688841, 2.346094, 0.6784314, 0, 1, 1,
0.7392646, -0.2799825, 2.384509, 0.6862745, 0, 1, 1,
0.7436547, 0.33033, 2.549361, 0.6901961, 0, 1, 1,
0.7442503, -0.5365559, 1.886689, 0.6980392, 0, 1, 1,
0.7442567, 0.5812921, 0.940931, 0.7058824, 0, 1, 1,
0.7460821, -0.03410404, 1.144938, 0.7098039, 0, 1, 1,
0.7490658, 0.7624348, -0.5882269, 0.7176471, 0, 1, 1,
0.7517895, -0.1642092, -0.2393039, 0.7215686, 0, 1, 1,
0.7531428, 0.1433322, 2.057997, 0.7294118, 0, 1, 1,
0.7532046, 0.8664634, 0.8650125, 0.7333333, 0, 1, 1,
0.7535839, 0.1289167, 0.3231978, 0.7411765, 0, 1, 1,
0.7555931, -1.12291, 2.291627, 0.7450981, 0, 1, 1,
0.7603481, -0.6574898, 1.258829, 0.7529412, 0, 1, 1,
0.760716, 0.4261659, 1.211497, 0.7568628, 0, 1, 1,
0.7670173, 1.148188, 0.4250087, 0.7647059, 0, 1, 1,
0.7675623, 0.21848, 2.05259, 0.7686275, 0, 1, 1,
0.7723486, -0.2257632, 1.78264, 0.7764706, 0, 1, 1,
0.7764593, 0.1726237, 3.081486, 0.7803922, 0, 1, 1,
0.77865, -0.5997514, 1.129688, 0.7882353, 0, 1, 1,
0.7864324, -0.8363994, 2.993859, 0.7921569, 0, 1, 1,
0.7942909, 2.178037, -0.8213537, 0.8, 0, 1, 1,
0.7946564, 0.4388996, 0.1236788, 0.8078431, 0, 1, 1,
0.7948329, -0.4981643, 2.794599, 0.8117647, 0, 1, 1,
0.7997986, 0.2793652, 1.864918, 0.8196079, 0, 1, 1,
0.8087631, 0.3285215, 1.13371, 0.8235294, 0, 1, 1,
0.8118626, -2.219625, 2.81965, 0.8313726, 0, 1, 1,
0.8138768, 0.9046502, 2.30391, 0.8352941, 0, 1, 1,
0.8235163, -0.185344, 1.700612, 0.8431373, 0, 1, 1,
0.8296846, 1.600103, 2.003256, 0.8470588, 0, 1, 1,
0.8307857, -0.01623001, 1.587046, 0.854902, 0, 1, 1,
0.8336411, 1.885304, 2.089276, 0.8588235, 0, 1, 1,
0.8347011, 1.165305, 0.05287532, 0.8666667, 0, 1, 1,
0.8363408, -1.464253, 2.904185, 0.8705882, 0, 1, 1,
0.8416089, 2.161017, 1.142346, 0.8784314, 0, 1, 1,
0.8426604, -1.247629, 2.388682, 0.8823529, 0, 1, 1,
0.8441329, 0.3815565, 3.412871, 0.8901961, 0, 1, 1,
0.8551981, 1.242011, -0.04464847, 0.8941177, 0, 1, 1,
0.8570266, -1.592302, 1.889316, 0.9019608, 0, 1, 1,
0.8583448, 1.083481, 0.7842396, 0.9098039, 0, 1, 1,
0.8593594, -1.833484, 1.175595, 0.9137255, 0, 1, 1,
0.8652489, 1.176128, -1.047909, 0.9215686, 0, 1, 1,
0.8655784, 0.4024811, 3.233736, 0.9254902, 0, 1, 1,
0.8686422, 0.5342509, 1.65096, 0.9333333, 0, 1, 1,
0.8706667, 0.882674, -0.3301598, 0.9372549, 0, 1, 1,
0.8851334, -1.314274, 2.26854, 0.945098, 0, 1, 1,
0.8924327, 0.2040423, 1.137787, 0.9490196, 0, 1, 1,
0.8927461, 0.2990606, 0.6317335, 0.9568627, 0, 1, 1,
0.8992209, -1.78117, 1.447453, 0.9607843, 0, 1, 1,
0.9034782, -0.9409471, 1.822319, 0.9686275, 0, 1, 1,
0.9043028, 0.9419546, 2.983221, 0.972549, 0, 1, 1,
0.9088024, 1.805659, 0.7678726, 0.9803922, 0, 1, 1,
0.9145445, -1.225427, 3.735988, 0.9843137, 0, 1, 1,
0.9171495, -0.08275407, 0.01034947, 0.9921569, 0, 1, 1,
0.9226952, -0.5900042, 2.176224, 0.9960784, 0, 1, 1,
0.9323297, 0.00495765, 2.595904, 1, 0, 0.9960784, 1,
0.9328047, 0.3280688, 0.1953397, 1, 0, 0.9882353, 1,
0.943906, -0.6673308, 3.141364, 1, 0, 0.9843137, 1,
0.9444023, -1.880694, 3.49793, 1, 0, 0.9764706, 1,
0.9479928, 0.7129707, 0.2765093, 1, 0, 0.972549, 1,
0.9484214, 0.3031996, 1.219437, 1, 0, 0.9647059, 1,
0.9563255, -0.8013325, 3.179377, 1, 0, 0.9607843, 1,
0.9567748, 0.1471333, 2.215141, 1, 0, 0.9529412, 1,
0.9583825, 2.834053, 0.1664632, 1, 0, 0.9490196, 1,
0.9587803, -0.2715641, 2.238688, 1, 0, 0.9411765, 1,
0.9647957, 0.3867583, 1.090906, 1, 0, 0.9372549, 1,
0.9769562, -1.464644, 4.509802, 1, 0, 0.9294118, 1,
0.9870341, -0.7904235, 2.473741, 1, 0, 0.9254902, 1,
0.9892303, -0.9276809, 2.538823, 1, 0, 0.9176471, 1,
0.9898154, -0.3642382, 1.661645, 1, 0, 0.9137255, 1,
0.993946, 0.6391942, 1.489237, 1, 0, 0.9058824, 1,
0.9995442, -0.3390514, 1.1454, 1, 0, 0.9019608, 1,
0.9995965, 0.4251437, 1.569648, 1, 0, 0.8941177, 1,
1.002978, 0.2993738, -0.09718125, 1, 0, 0.8862745, 1,
1.006955, 0.9875693, 1.932957, 1, 0, 0.8823529, 1,
1.007471, 0.07832663, 0.4811691, 1, 0, 0.8745098, 1,
1.013273, 0.5786345, 2.421153, 1, 0, 0.8705882, 1,
1.014116, -1.217546, 2.595588, 1, 0, 0.8627451, 1,
1.014968, -0.8187709, 2.49782, 1, 0, 0.8588235, 1,
1.0152, 0.2599903, 0.637153, 1, 0, 0.8509804, 1,
1.023644, 1.141234, -0.5522916, 1, 0, 0.8470588, 1,
1.025882, -0.2773777, 1.253825, 1, 0, 0.8392157, 1,
1.027459, -1.328082, 2.469308, 1, 0, 0.8352941, 1,
1.040955, -0.3678823, -0.7049376, 1, 0, 0.827451, 1,
1.042743, -2.061905, 3.02164, 1, 0, 0.8235294, 1,
1.046603, -1.987134, 4.3149, 1, 0, 0.8156863, 1,
1.050546, 1.266868, 1.226498, 1, 0, 0.8117647, 1,
1.053662, -0.306518, 1.196911, 1, 0, 0.8039216, 1,
1.055489, -0.06454169, 1.569818, 1, 0, 0.7960784, 1,
1.057644, 0.0148431, 2.192886, 1, 0, 0.7921569, 1,
1.066018, 0.2921346, 2.185272, 1, 0, 0.7843137, 1,
1.066142, 0.4448555, -0.2677227, 1, 0, 0.7803922, 1,
1.092833, -0.5030188, 2.045812, 1, 0, 0.772549, 1,
1.094833, -1.23383, 1.86882, 1, 0, 0.7686275, 1,
1.099892, -0.4108045, 4.161003, 1, 0, 0.7607843, 1,
1.101215, -1.144848, 3.28657, 1, 0, 0.7568628, 1,
1.107827, -1.279833, 2.727942, 1, 0, 0.7490196, 1,
1.111457, -0.8274491, 1.983818, 1, 0, 0.7450981, 1,
1.112178, 1.915487, 0.3051649, 1, 0, 0.7372549, 1,
1.118125, -0.7480738, 1.219657, 1, 0, 0.7333333, 1,
1.127193, 0.1203365, 0.7268787, 1, 0, 0.7254902, 1,
1.133426, -0.7715914, 3.144063, 1, 0, 0.7215686, 1,
1.146255, 0.4260801, 1.30681, 1, 0, 0.7137255, 1,
1.146966, -1.71936, 2.548905, 1, 0, 0.7098039, 1,
1.14849, 1.529868, -0.0805279, 1, 0, 0.7019608, 1,
1.152649, 0.7356918, 0.3945721, 1, 0, 0.6941177, 1,
1.153605, -1.317317, 2.88344, 1, 0, 0.6901961, 1,
1.15496, 1.239307, 0.1354872, 1, 0, 0.682353, 1,
1.157461, 0.1751142, 1.172107, 1, 0, 0.6784314, 1,
1.165386, 0.6251054, 1.367039, 1, 0, 0.6705883, 1,
1.17545, 1.822515, -0.2521895, 1, 0, 0.6666667, 1,
1.177784, -0.1121446, 0.867066, 1, 0, 0.6588235, 1,
1.183199, 0.01184938, 0.9032313, 1, 0, 0.654902, 1,
1.183732, 0.5742906, 0.6268618, 1, 0, 0.6470588, 1,
1.185289, 0.7573234, 1.799688, 1, 0, 0.6431373, 1,
1.188727, -0.31094, 1.5278, 1, 0, 0.6352941, 1,
1.196002, -0.6146731, 2.638589, 1, 0, 0.6313726, 1,
1.196579, 1.422523, 0.2276448, 1, 0, 0.6235294, 1,
1.203721, 1.145428, -1.417206, 1, 0, 0.6196079, 1,
1.203749, 0.6029535, 0.8093384, 1, 0, 0.6117647, 1,
1.206178, 0.3139734, 3.632551, 1, 0, 0.6078432, 1,
1.23379, 0.4325577, 1.086728, 1, 0, 0.6, 1,
1.246645, 1.905336, 0.2300726, 1, 0, 0.5921569, 1,
1.251213, 0.0579941, 3.283104, 1, 0, 0.5882353, 1,
1.251393, 1.377497, 0.5061721, 1, 0, 0.5803922, 1,
1.251757, 0.3563069, 1.751903, 1, 0, 0.5764706, 1,
1.253326, -1.71555, 1.635596, 1, 0, 0.5686275, 1,
1.253727, -1.048435, 1.464354, 1, 0, 0.5647059, 1,
1.254827, -1.220374, 3.969588, 1, 0, 0.5568628, 1,
1.271865, -0.4084417, 3.231594, 1, 0, 0.5529412, 1,
1.273951, -0.7015041, 2.497632, 1, 0, 0.5450981, 1,
1.276659, 2.077547, -1.940795, 1, 0, 0.5411765, 1,
1.281604, -2.537645, 3.136024, 1, 0, 0.5333334, 1,
1.293925, -0.1990302, 2.108677, 1, 0, 0.5294118, 1,
1.294219, 1.526613, 1.769488, 1, 0, 0.5215687, 1,
1.295559, 2.392467, -0.2655974, 1, 0, 0.5176471, 1,
1.295862, -0.1162762, 0.9277895, 1, 0, 0.509804, 1,
1.30355, -0.3538671, 2.173719, 1, 0, 0.5058824, 1,
1.30533, 0.4932667, 2.660379, 1, 0, 0.4980392, 1,
1.321038, -0.2822278, 1.829746, 1, 0, 0.4901961, 1,
1.322741, -0.3682501, 1.602396, 1, 0, 0.4862745, 1,
1.32639, 0.7279045, -0.05708025, 1, 0, 0.4784314, 1,
1.338215, 0.6257365, 2.649814, 1, 0, 0.4745098, 1,
1.340177, 0.0613517, 3.458834, 1, 0, 0.4666667, 1,
1.344173, 1.194671, 1.498254, 1, 0, 0.4627451, 1,
1.348346, -1.001728, 2.295314, 1, 0, 0.454902, 1,
1.362464, -0.5920112, 2.319129, 1, 0, 0.4509804, 1,
1.363763, -0.01492584, 0.8025073, 1, 0, 0.4431373, 1,
1.37028, -0.071351, 1.821099, 1, 0, 0.4392157, 1,
1.383106, 0.6113631, 1.802398, 1, 0, 0.4313726, 1,
1.391868, -0.5233717, 1.093111, 1, 0, 0.427451, 1,
1.394084, -1.065628, 2.61418, 1, 0, 0.4196078, 1,
1.396485, 0.1948988, 1.892389, 1, 0, 0.4156863, 1,
1.398355, -0.6183649, 0.6208495, 1, 0, 0.4078431, 1,
1.398618, 1.19768, 0.7156966, 1, 0, 0.4039216, 1,
1.400001, 1.404298, 2.269016, 1, 0, 0.3960784, 1,
1.409411, -0.3960415, 1.47067, 1, 0, 0.3882353, 1,
1.410623, -0.8121182, 0.198258, 1, 0, 0.3843137, 1,
1.421216, 3.529535, 0.580431, 1, 0, 0.3764706, 1,
1.42492, -0.8797652, 2.449008, 1, 0, 0.372549, 1,
1.430908, -0.1474913, 0.5025634, 1, 0, 0.3647059, 1,
1.431784, 1.033724, -0.9729154, 1, 0, 0.3607843, 1,
1.441413, 2.4717, -0.2734804, 1, 0, 0.3529412, 1,
1.454221, 0.7243814, 2.49962, 1, 0, 0.3490196, 1,
1.457295, -0.006951444, 1.613569, 1, 0, 0.3411765, 1,
1.462684, -0.8640175, 2.701682, 1, 0, 0.3372549, 1,
1.490099, 0.1082854, 0.6354017, 1, 0, 0.3294118, 1,
1.496653, -0.4384282, 0.9523028, 1, 0, 0.3254902, 1,
1.528426, 0.5044459, -1.073291, 1, 0, 0.3176471, 1,
1.55362, -0.2602607, 0.393827, 1, 0, 0.3137255, 1,
1.556755, 1.311501, 0.530337, 1, 0, 0.3058824, 1,
1.558647, 0.5340952, 0.5536693, 1, 0, 0.2980392, 1,
1.561116, 0.2407392, 0.2799667, 1, 0, 0.2941177, 1,
1.569503, -1.355674, 1.464412, 1, 0, 0.2862745, 1,
1.574132, 0.7905855, 2.265365, 1, 0, 0.282353, 1,
1.589159, 0.8491926, 1.369111, 1, 0, 0.2745098, 1,
1.592419, -0.4022806, 0.9535726, 1, 0, 0.2705882, 1,
1.601354, -0.8772445, 3.552037, 1, 0, 0.2627451, 1,
1.617458, 1.138242, 2.379088, 1, 0, 0.2588235, 1,
1.620617, -1.096747, 1.522588, 1, 0, 0.2509804, 1,
1.625481, 0.248713, -0.01296979, 1, 0, 0.2470588, 1,
1.646133, -0.7033575, 1.829678, 1, 0, 0.2392157, 1,
1.652281, 1.006076, 1.482011, 1, 0, 0.2352941, 1,
1.652544, 1.549606, 0.9345417, 1, 0, 0.227451, 1,
1.658954, -0.3646353, 2.729604, 1, 0, 0.2235294, 1,
1.662372, 0.8926727, 1.316, 1, 0, 0.2156863, 1,
1.670638, -0.6770241, 3.340357, 1, 0, 0.2117647, 1,
1.697473, -0.08639669, 0.7759134, 1, 0, 0.2039216, 1,
1.704795, -0.01221913, 3.776851, 1, 0, 0.1960784, 1,
1.761781, 0.1495288, 1.700006, 1, 0, 0.1921569, 1,
1.771239, 0.4821886, 2.301654, 1, 0, 0.1843137, 1,
1.778428, 1.700047, 2.005368, 1, 0, 0.1803922, 1,
1.78111, 1.320372, 0.7940011, 1, 0, 0.172549, 1,
1.807866, -0.9216465, 2.615013, 1, 0, 0.1686275, 1,
1.817183, -1.395631, 3.621933, 1, 0, 0.1607843, 1,
1.823618, 1.640977, 1.698724, 1, 0, 0.1568628, 1,
1.849186, 0.2241053, 4.542351, 1, 0, 0.1490196, 1,
1.87211, 0.505307, 1.92846, 1, 0, 0.145098, 1,
1.872497, -0.8326045, 1.1791, 1, 0, 0.1372549, 1,
1.9223, 0.09542377, 2.028479, 1, 0, 0.1333333, 1,
1.922823, 0.1860414, 0.06981127, 1, 0, 0.1254902, 1,
1.926381, -1.035411, 1.342255, 1, 0, 0.1215686, 1,
1.934234, -0.7611133, 1.897505, 1, 0, 0.1137255, 1,
1.964482, 1.903963, 1.663967, 1, 0, 0.1098039, 1,
1.977276, 0.5996722, 1.62555, 1, 0, 0.1019608, 1,
2.026537, -0.8826846, 3.433785, 1, 0, 0.09411765, 1,
2.032063, -0.4197295, 0.7691205, 1, 0, 0.09019608, 1,
2.087503, -0.4013872, 3.952522, 1, 0, 0.08235294, 1,
2.182357, -0.1055297, 0.6521717, 1, 0, 0.07843138, 1,
2.244048, -0.1292011, 1.933141, 1, 0, 0.07058824, 1,
2.246343, -0.7620416, 4.062745, 1, 0, 0.06666667, 1,
2.257583, -0.7001395, 1.472102, 1, 0, 0.05882353, 1,
2.267572, -1.131556, -0.247668, 1, 0, 0.05490196, 1,
2.295378, 0.4718803, 2.026976, 1, 0, 0.04705882, 1,
2.30093, -1.284026, 0.9633591, 1, 0, 0.04313726, 1,
2.449369, 0.6203911, 3.830585, 1, 0, 0.03529412, 1,
2.472495, 1.957128, 0.8022976, 1, 0, 0.03137255, 1,
2.666389, 0.9005598, 2.866383, 1, 0, 0.02352941, 1,
2.710579, -0.1035963, 1.61468, 1, 0, 0.01960784, 1,
2.891691, -1.398968, 1.015985, 1, 0, 0.01176471, 1,
2.928041, 1.471138, 0.7231751, 1, 0, 0.007843138, 1
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
-0.2167138, -3.968673, -7.489122, 0, -0.5, 0.5, 0.5,
-0.2167138, -3.968673, -7.489122, 1, -0.5, 0.5, 0.5,
-0.2167138, -3.968673, -7.489122, 1, 1.5, 0.5, 0.5,
-0.2167138, -3.968673, -7.489122, 0, 1.5, 0.5, 0.5
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
-4.42754, 0.3238028, -7.489122, 0, -0.5, 0.5, 0.5,
-4.42754, 0.3238028, -7.489122, 1, -0.5, 0.5, 0.5,
-4.42754, 0.3238028, -7.489122, 1, 1.5, 0.5, 0.5,
-4.42754, 0.3238028, -7.489122, 0, 1.5, 0.5, 0.5
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
-4.42754, -3.968673, -0.007370949, 0, -0.5, 0.5, 0.5,
-4.42754, -3.968673, -0.007370949, 1, -0.5, 0.5, 0.5,
-4.42754, -3.968673, -0.007370949, 1, 1.5, 0.5, 0.5,
-4.42754, -3.968673, -0.007370949, 0, 1.5, 0.5, 0.5
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
-3, -2.978101, -5.762564,
2, -2.978101, -5.762564,
-3, -2.978101, -5.762564,
-3, -3.143197, -6.050324,
-2, -2.978101, -5.762564,
-2, -3.143197, -6.050324,
-1, -2.978101, -5.762564,
-1, -3.143197, -6.050324,
0, -2.978101, -5.762564,
0, -3.143197, -6.050324,
1, -2.978101, -5.762564,
1, -3.143197, -6.050324,
2, -2.978101, -5.762564,
2, -3.143197, -6.050324
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
-3, -3.473387, -6.625844, 0, -0.5, 0.5, 0.5,
-3, -3.473387, -6.625844, 1, -0.5, 0.5, 0.5,
-3, -3.473387, -6.625844, 1, 1.5, 0.5, 0.5,
-3, -3.473387, -6.625844, 0, 1.5, 0.5, 0.5,
-2, -3.473387, -6.625844, 0, -0.5, 0.5, 0.5,
-2, -3.473387, -6.625844, 1, -0.5, 0.5, 0.5,
-2, -3.473387, -6.625844, 1, 1.5, 0.5, 0.5,
-2, -3.473387, -6.625844, 0, 1.5, 0.5, 0.5,
-1, -3.473387, -6.625844, 0, -0.5, 0.5, 0.5,
-1, -3.473387, -6.625844, 1, -0.5, 0.5, 0.5,
-1, -3.473387, -6.625844, 1, 1.5, 0.5, 0.5,
-1, -3.473387, -6.625844, 0, 1.5, 0.5, 0.5,
0, -3.473387, -6.625844, 0, -0.5, 0.5, 0.5,
0, -3.473387, -6.625844, 1, -0.5, 0.5, 0.5,
0, -3.473387, -6.625844, 1, 1.5, 0.5, 0.5,
0, -3.473387, -6.625844, 0, 1.5, 0.5, 0.5,
1, -3.473387, -6.625844, 0, -0.5, 0.5, 0.5,
1, -3.473387, -6.625844, 1, -0.5, 0.5, 0.5,
1, -3.473387, -6.625844, 1, 1.5, 0.5, 0.5,
1, -3.473387, -6.625844, 0, 1.5, 0.5, 0.5,
2, -3.473387, -6.625844, 0, -0.5, 0.5, 0.5,
2, -3.473387, -6.625844, 1, -0.5, 0.5, 0.5,
2, -3.473387, -6.625844, 1, 1.5, 0.5, 0.5,
2, -3.473387, -6.625844, 0, 1.5, 0.5, 0.5
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
-3.455811, -2, -5.762564,
-3.455811, 3, -5.762564,
-3.455811, -2, -5.762564,
-3.617766, -2, -6.050324,
-3.455811, -1, -5.762564,
-3.617766, -1, -6.050324,
-3.455811, 0, -5.762564,
-3.617766, 0, -6.050324,
-3.455811, 1, -5.762564,
-3.617766, 1, -6.050324,
-3.455811, 2, -5.762564,
-3.617766, 2, -6.050324,
-3.455811, 3, -5.762564,
-3.617766, 3, -6.050324
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
-3.941675, -2, -6.625844, 0, -0.5, 0.5, 0.5,
-3.941675, -2, -6.625844, 1, -0.5, 0.5, 0.5,
-3.941675, -2, -6.625844, 1, 1.5, 0.5, 0.5,
-3.941675, -2, -6.625844, 0, 1.5, 0.5, 0.5,
-3.941675, -1, -6.625844, 0, -0.5, 0.5, 0.5,
-3.941675, -1, -6.625844, 1, -0.5, 0.5, 0.5,
-3.941675, -1, -6.625844, 1, 1.5, 0.5, 0.5,
-3.941675, -1, -6.625844, 0, 1.5, 0.5, 0.5,
-3.941675, 0, -6.625844, 0, -0.5, 0.5, 0.5,
-3.941675, 0, -6.625844, 1, -0.5, 0.5, 0.5,
-3.941675, 0, -6.625844, 1, 1.5, 0.5, 0.5,
-3.941675, 0, -6.625844, 0, 1.5, 0.5, 0.5,
-3.941675, 1, -6.625844, 0, -0.5, 0.5, 0.5,
-3.941675, 1, -6.625844, 1, -0.5, 0.5, 0.5,
-3.941675, 1, -6.625844, 1, 1.5, 0.5, 0.5,
-3.941675, 1, -6.625844, 0, 1.5, 0.5, 0.5,
-3.941675, 2, -6.625844, 0, -0.5, 0.5, 0.5,
-3.941675, 2, -6.625844, 1, -0.5, 0.5, 0.5,
-3.941675, 2, -6.625844, 1, 1.5, 0.5, 0.5,
-3.941675, 2, -6.625844, 0, 1.5, 0.5, 0.5,
-3.941675, 3, -6.625844, 0, -0.5, 0.5, 0.5,
-3.941675, 3, -6.625844, 1, -0.5, 0.5, 0.5,
-3.941675, 3, -6.625844, 1, 1.5, 0.5, 0.5,
-3.941675, 3, -6.625844, 0, 1.5, 0.5, 0.5
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
-3.455811, -2.978101, -4,
-3.455811, -2.978101, 4,
-3.455811, -2.978101, -4,
-3.617766, -3.143197, -4,
-3.455811, -2.978101, -2,
-3.617766, -3.143197, -2,
-3.455811, -2.978101, 0,
-3.617766, -3.143197, 0,
-3.455811, -2.978101, 2,
-3.617766, -3.143197, 2,
-3.455811, -2.978101, 4,
-3.617766, -3.143197, 4
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
-3.941675, -3.473387, -4, 0, -0.5, 0.5, 0.5,
-3.941675, -3.473387, -4, 1, -0.5, 0.5, 0.5,
-3.941675, -3.473387, -4, 1, 1.5, 0.5, 0.5,
-3.941675, -3.473387, -4, 0, 1.5, 0.5, 0.5,
-3.941675, -3.473387, -2, 0, -0.5, 0.5, 0.5,
-3.941675, -3.473387, -2, 1, -0.5, 0.5, 0.5,
-3.941675, -3.473387, -2, 1, 1.5, 0.5, 0.5,
-3.941675, -3.473387, -2, 0, 1.5, 0.5, 0.5,
-3.941675, -3.473387, 0, 0, -0.5, 0.5, 0.5,
-3.941675, -3.473387, 0, 1, -0.5, 0.5, 0.5,
-3.941675, -3.473387, 0, 1, 1.5, 0.5, 0.5,
-3.941675, -3.473387, 0, 0, 1.5, 0.5, 0.5,
-3.941675, -3.473387, 2, 0, -0.5, 0.5, 0.5,
-3.941675, -3.473387, 2, 1, -0.5, 0.5, 0.5,
-3.941675, -3.473387, 2, 1, 1.5, 0.5, 0.5,
-3.941675, -3.473387, 2, 0, 1.5, 0.5, 0.5,
-3.941675, -3.473387, 4, 0, -0.5, 0.5, 0.5,
-3.941675, -3.473387, 4, 1, -0.5, 0.5, 0.5,
-3.941675, -3.473387, 4, 1, 1.5, 0.5, 0.5,
-3.941675, -3.473387, 4, 0, 1.5, 0.5, 0.5
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
-3.455811, -2.978101, -5.762564,
-3.455811, 3.625707, -5.762564,
-3.455811, -2.978101, 5.747822,
-3.455811, 3.625707, 5.747822,
-3.455811, -2.978101, -5.762564,
-3.455811, -2.978101, 5.747822,
-3.455811, 3.625707, -5.762564,
-3.455811, 3.625707, 5.747822,
-3.455811, -2.978101, -5.762564,
3.022383, -2.978101, -5.762564,
-3.455811, -2.978101, 5.747822,
3.022383, -2.978101, 5.747822,
-3.455811, 3.625707, -5.762564,
3.022383, 3.625707, -5.762564,
-3.455811, 3.625707, 5.747822,
3.022383, 3.625707, 5.747822,
3.022383, -2.978101, -5.762564,
3.022383, 3.625707, -5.762564,
3.022383, -2.978101, 5.747822,
3.022383, 3.625707, 5.747822,
3.022383, -2.978101, -5.762564,
3.022383, -2.978101, 5.747822,
3.022383, 3.625707, -5.762564,
3.022383, 3.625707, 5.747822
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
var radius = 7.885327;
var distance = 35.08271;
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
mvMatrix.translate( 0.2167138, -0.3238028, 0.007370949 );
mvMatrix.scale( 1.316072, 1.291038, 0.7407023 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.08271);
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
tetramethrin<-read.table("tetramethrin.xyz")
```

```
## Error in read.table("tetramethrin.xyz"): no lines available in input
```

```r
x<-tetramethrin$V2
```

```
## Error in eval(expr, envir, enclos): object 'tetramethrin' not found
```

```r
y<-tetramethrin$V3
```

```
## Error in eval(expr, envir, enclos): object 'tetramethrin' not found
```

```r
z<-tetramethrin$V4
```

```
## Error in eval(expr, envir, enclos): object 'tetramethrin' not found
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
-3.361468, 1.198619, -0.8665878, 0, 0, 1, 1, 1,
-3.184695, 1.309361, -1.329777, 1, 0, 0, 1, 1,
-3.164253, -1.698002, -1.741215, 1, 0, 0, 1, 1,
-2.92308, -0.6703196, -2.472609, 1, 0, 0, 1, 1,
-2.76703, -1.605952, -1.080366, 1, 0, 0, 1, 1,
-2.500918, 1.056747, -0.8614185, 1, 0, 0, 1, 1,
-2.472782, 0.8639157, -0.7657703, 0, 0, 0, 1, 1,
-2.417251, 0.7286485, -1.310202, 0, 0, 0, 1, 1,
-2.337641, 2.044293, 0.739737, 0, 0, 0, 1, 1,
-2.268043, -1.017432, -2.294646, 0, 0, 0, 1, 1,
-2.267007, 0.2600276, 0.0004200214, 0, 0, 0, 1, 1,
-2.231695, -0.02498487, -2.087268, 0, 0, 0, 1, 1,
-2.225773, 1.793185, -0.512603, 0, 0, 0, 1, 1,
-2.217367, 1.983597, -0.5218718, 1, 1, 1, 1, 1,
-2.151473, 0.3388202, -2.258608, 1, 1, 1, 1, 1,
-2.151253, -1.384368, -1.323371, 1, 1, 1, 1, 1,
-2.115401, 0.7931893, -1.930036, 1, 1, 1, 1, 1,
-2.096769, 0.5620188, -1.467413, 1, 1, 1, 1, 1,
-2.092721, -2.551238, -1.113794, 1, 1, 1, 1, 1,
-2.06059, -0.1073656, -0.3597699, 1, 1, 1, 1, 1,
-2.054022, 1.56308, -1.555879, 1, 1, 1, 1, 1,
-2.028139, -1.205757, -1.201218, 1, 1, 1, 1, 1,
-2.022182, -1.078969, -1.306249, 1, 1, 1, 1, 1,
-1.998647, 1.452234, -1.852396, 1, 1, 1, 1, 1,
-1.992296, -1.34916, -1.006193, 1, 1, 1, 1, 1,
-1.982934, -0.278718, -3.522612, 1, 1, 1, 1, 1,
-1.969321, -1.300361, -2.400674, 1, 1, 1, 1, 1,
-1.956451, -0.343252, -1.549293, 1, 1, 1, 1, 1,
-1.95002, -0.9694398, -1.224724, 0, 0, 1, 1, 1,
-1.896468, -2.552265, -3.312142, 1, 0, 0, 1, 1,
-1.894964, -0.5962221, -2.572392, 1, 0, 0, 1, 1,
-1.89306, 0.4955929, -1.210081, 1, 0, 0, 1, 1,
-1.888171, -1.256045, -2.542014, 1, 0, 0, 1, 1,
-1.85992, -0.7307119, -1.558885, 1, 0, 0, 1, 1,
-1.845237, 1.013845, -2.344108, 0, 0, 0, 1, 1,
-1.815643, -1.760569, -3.154476, 0, 0, 0, 1, 1,
-1.807472, 0.7865844, -2.790362, 0, 0, 0, 1, 1,
-1.779841, -0.7698136, -2.389488, 0, 0, 0, 1, 1,
-1.755878, -0.8322476, -1.248444, 0, 0, 0, 1, 1,
-1.749104, 2.364561, -1.525095, 0, 0, 0, 1, 1,
-1.733523, 0.1991642, 0.2286453, 0, 0, 0, 1, 1,
-1.72733, -0.03784845, -1.946715, 1, 1, 1, 1, 1,
-1.7235, 0.2056077, -1.835336, 1, 1, 1, 1, 1,
-1.720172, -2.053728, -3.52837, 1, 1, 1, 1, 1,
-1.695448, 0.7803197, -1.25933, 1, 1, 1, 1, 1,
-1.680755, -0.3561958, 1.033542, 1, 1, 1, 1, 1,
-1.671947, 0.3749347, -2.194985, 1, 1, 1, 1, 1,
-1.663648, 0.3930884, -2.818425, 1, 1, 1, 1, 1,
-1.658982, 0.06345241, -3.310888, 1, 1, 1, 1, 1,
-1.657132, 0.1165401, -1.757828, 1, 1, 1, 1, 1,
-1.654141, -0.9333327, -3.930952, 1, 1, 1, 1, 1,
-1.65294, 0.2903488, -2.184669, 1, 1, 1, 1, 1,
-1.646345, -0.1414148, -2.622105, 1, 1, 1, 1, 1,
-1.645118, 0.1089801, -1.040874, 1, 1, 1, 1, 1,
-1.644829, 0.7583308, -1.919169, 1, 1, 1, 1, 1,
-1.634143, 2.561695, -1.178458, 1, 1, 1, 1, 1,
-1.62763, -0.5441794, -1.127623, 0, 0, 1, 1, 1,
-1.622883, 1.579198, 0.2652316, 1, 0, 0, 1, 1,
-1.612619, 2.379388, 0.2332082, 1, 0, 0, 1, 1,
-1.606641, 0.5956509, -2.155627, 1, 0, 0, 1, 1,
-1.596376, 2.004119, -0.681466, 1, 0, 0, 1, 1,
-1.592789, -0.3313416, -1.230147, 1, 0, 0, 1, 1,
-1.586817, -0.3257019, -1.20623, 0, 0, 0, 1, 1,
-1.578567, -1.195886, -1.713249, 0, 0, 0, 1, 1,
-1.574622, 1.681986, -0.5850607, 0, 0, 0, 1, 1,
-1.572171, -1.544473, -1.489705, 0, 0, 0, 1, 1,
-1.55462, 0.2437521, -0.6938254, 0, 0, 0, 1, 1,
-1.552519, -0.2152755, -1.754093, 0, 0, 0, 1, 1,
-1.552413, -0.3101621, -0.6789352, 0, 0, 0, 1, 1,
-1.549713, 1.081268, -0.4292674, 1, 1, 1, 1, 1,
-1.547272, -1.400716, -3.384381, 1, 1, 1, 1, 1,
-1.546758, -0.1419992, -2.15813, 1, 1, 1, 1, 1,
-1.540769, -0.478012, -1.733497, 1, 1, 1, 1, 1,
-1.538774, 1.088241, -2.063234, 1, 1, 1, 1, 1,
-1.519629, -0.7231945, -2.98122, 1, 1, 1, 1, 1,
-1.514276, 0.9045097, -0.909569, 1, 1, 1, 1, 1,
-1.508142, -2.449148, -4.478735, 1, 1, 1, 1, 1,
-1.480454, -1.172227, -2.634235, 1, 1, 1, 1, 1,
-1.478269, 0.4494475, -2.801499, 1, 1, 1, 1, 1,
-1.455708, -0.5833238, -1.183517, 1, 1, 1, 1, 1,
-1.455061, 0.7182191, -1.957464, 1, 1, 1, 1, 1,
-1.451185, 0.4251027, -0.7806611, 1, 1, 1, 1, 1,
-1.451125, 0.5038008, -2.521582, 1, 1, 1, 1, 1,
-1.44343, -1.170168, -3.343812, 1, 1, 1, 1, 1,
-1.423405, 0.9184224, -1.81464, 0, 0, 1, 1, 1,
-1.419685, 0.7042271, -1.416145, 1, 0, 0, 1, 1,
-1.412567, -0.1671105, -4.022416, 1, 0, 0, 1, 1,
-1.410311, 1.95777, -0.7455902, 1, 0, 0, 1, 1,
-1.408986, 1.263997, -0.7245986, 1, 0, 0, 1, 1,
-1.391682, 1.201641, -0.8054934, 1, 0, 0, 1, 1,
-1.383795, -1.267783, -3.198762, 0, 0, 0, 1, 1,
-1.373047, -0.5759431, -0.6813013, 0, 0, 0, 1, 1,
-1.36581, 0.2481998, -0.7049048, 0, 0, 0, 1, 1,
-1.364921, -0.654964, -2.165689, 0, 0, 0, 1, 1,
-1.363435, 0.367372, -2.051047, 0, 0, 0, 1, 1,
-1.338321, -0.2754111, -1.836793, 0, 0, 0, 1, 1,
-1.335443, -0.7800998, -2.554879, 0, 0, 0, 1, 1,
-1.314807, 0.9807941, 0.3067534, 1, 1, 1, 1, 1,
-1.311804, -0.1336116, -2.443313, 1, 1, 1, 1, 1,
-1.299818, 0.3923092, -1.147889, 1, 1, 1, 1, 1,
-1.295213, -0.5591885, -3.006843, 1, 1, 1, 1, 1,
-1.294384, 0.4769299, -1.558946, 1, 1, 1, 1, 1,
-1.292456, 0.162157, -2.131029, 1, 1, 1, 1, 1,
-1.289454, 0.1067949, -2.019733, 1, 1, 1, 1, 1,
-1.285583, -0.4187263, -1.619747, 1, 1, 1, 1, 1,
-1.282898, -0.4087339, -2.206998, 1, 1, 1, 1, 1,
-1.271463, 2.739408, 2.472466, 1, 1, 1, 1, 1,
-1.243323, 1.55574, -0.3657155, 1, 1, 1, 1, 1,
-1.233841, -0.9540982, -3.894864, 1, 1, 1, 1, 1,
-1.228626, -0.6436048, -2.826867, 1, 1, 1, 1, 1,
-1.22568, 0.1149909, -1.168448, 1, 1, 1, 1, 1,
-1.220222, 2.604866, -1.760705, 1, 1, 1, 1, 1,
-1.215799, 0.5223192, -1.081219, 0, 0, 1, 1, 1,
-1.213968, -0.3753504, -2.836238, 1, 0, 0, 1, 1,
-1.211602, -0.8232785, -2.061424, 1, 0, 0, 1, 1,
-1.207947, -0.5328401, -4.104607, 1, 0, 0, 1, 1,
-1.202966, 0.07321826, -1.370695, 1, 0, 0, 1, 1,
-1.200038, -0.2667777, -0.7771962, 1, 0, 0, 1, 1,
-1.199703, 0.4797743, -1.647788, 0, 0, 0, 1, 1,
-1.19608, 0.07881913, -1.147782, 0, 0, 0, 1, 1,
-1.187232, -0.6077221, -3.035304, 0, 0, 0, 1, 1,
-1.184609, -0.4017072, -1.348943, 0, 0, 0, 1, 1,
-1.184024, 1.276869, -0.3667078, 0, 0, 0, 1, 1,
-1.183352, -1.561131, -1.746702, 0, 0, 0, 1, 1,
-1.18259, -0.6709489, -0.4091851, 0, 0, 0, 1, 1,
-1.175846, 0.3379386, -1.708499, 1, 1, 1, 1, 1,
-1.173852, -0.2375821, -1.696027, 1, 1, 1, 1, 1,
-1.168691, -0.5868741, -1.806088, 1, 1, 1, 1, 1,
-1.167798, 0.6616133, -1.766127, 1, 1, 1, 1, 1,
-1.163834, 0.06740829, 0.1174645, 1, 1, 1, 1, 1,
-1.16345, 0.1539262, -1.986202, 1, 1, 1, 1, 1,
-1.161041, -0.5651423, -3.521835, 1, 1, 1, 1, 1,
-1.160739, -0.8633224, -4.103101, 1, 1, 1, 1, 1,
-1.158668, 0.1533046, -2.063565, 1, 1, 1, 1, 1,
-1.152381, 0.8707542, -1.263353, 1, 1, 1, 1, 1,
-1.142817, -0.8006486, -2.868427, 1, 1, 1, 1, 1,
-1.134622, 1.675856, -0.6375886, 1, 1, 1, 1, 1,
-1.131956, 0.2982255, -1.087004, 1, 1, 1, 1, 1,
-1.12264, 0.1669961, -3.606508, 1, 1, 1, 1, 1,
-1.121543, 0.4394861, -0.9059531, 1, 1, 1, 1, 1,
-1.111399, 0.4665, -0.4648809, 0, 0, 1, 1, 1,
-1.109343, 1.349349, -1.058765, 1, 0, 0, 1, 1,
-1.096799, 2.003958, -1.720697, 1, 0, 0, 1, 1,
-1.089726, -0.008944219, -1.0144, 1, 0, 0, 1, 1,
-1.085593, 0.7587322, 0.4923725, 1, 0, 0, 1, 1,
-1.08006, -1.297733, -2.51295, 1, 0, 0, 1, 1,
-1.078218, 0.00889645, -1.493962, 0, 0, 0, 1, 1,
-1.061292, 1.998915, 0.002140003, 0, 0, 0, 1, 1,
-1.060332, 0.4460034, -1.560148, 0, 0, 0, 1, 1,
-1.045535, -0.7579816, -2.660263, 0, 0, 0, 1, 1,
-1.04125, 0.469818, 0.8388062, 0, 0, 0, 1, 1,
-1.032865, 0.3445234, -1.23839, 0, 0, 0, 1, 1,
-1.024697, 1.027557, 0.3943596, 0, 0, 0, 1, 1,
-1.017799, 0.461393, -2.262201, 1, 1, 1, 1, 1,
-1.007879, -1.13371, -2.515733, 1, 1, 1, 1, 1,
-0.9961642, 1.41548, 0.1802262, 1, 1, 1, 1, 1,
-0.9937565, 1.338663, 0.9825853, 1, 1, 1, 1, 1,
-0.9886544, 1.231682, -0.5482068, 1, 1, 1, 1, 1,
-0.9832974, 1.101211, -0.5529751, 1, 1, 1, 1, 1,
-0.9788271, -0.2766534, -1.314883, 1, 1, 1, 1, 1,
-0.9708094, -1.246055, -1.886407, 1, 1, 1, 1, 1,
-0.9569768, -1.512103, -2.905016, 1, 1, 1, 1, 1,
-0.9519182, 0.2793459, -0.9646597, 1, 1, 1, 1, 1,
-0.9500265, 0.01478367, -2.407961, 1, 1, 1, 1, 1,
-0.9496657, -0.6367724, -1.263676, 1, 1, 1, 1, 1,
-0.9493079, 0.4880073, -1.586306, 1, 1, 1, 1, 1,
-0.9435965, 0.6767466, -0.3178421, 1, 1, 1, 1, 1,
-0.941874, 1.120321, -0.4462778, 1, 1, 1, 1, 1,
-0.9394324, -0.606473, -2.447464, 0, 0, 1, 1, 1,
-0.9328445, 0.5542352, -1.920153, 1, 0, 0, 1, 1,
-0.9266619, 0.09373212, -1.671005, 1, 0, 0, 1, 1,
-0.9241792, 0.9656486, -0.2004186, 1, 0, 0, 1, 1,
-0.918402, 0.3787698, -2.26754, 1, 0, 0, 1, 1,
-0.9080007, -0.8937698, -1.861174, 1, 0, 0, 1, 1,
-0.9068451, 1.181741, -0.9970614, 0, 0, 0, 1, 1,
-0.906259, 0.8715996, -1.168226, 0, 0, 0, 1, 1,
-0.9060861, -0.09421389, -0.9068159, 0, 0, 0, 1, 1,
-0.8962009, -1.003933, -2.14257, 0, 0, 0, 1, 1,
-0.8951566, -0.1243043, 0.4142646, 0, 0, 0, 1, 1,
-0.8943205, 2.169267, -0.2915147, 0, 0, 0, 1, 1,
-0.8934909, -0.4111755, -2.584409, 0, 0, 0, 1, 1,
-0.8901176, -0.9424236, -1.611221, 1, 1, 1, 1, 1,
-0.8879684, 0.9506685, -1.932935, 1, 1, 1, 1, 1,
-0.8872826, -0.2219342, -1.170813, 1, 1, 1, 1, 1,
-0.8853554, -0.8129894, -2.041977, 1, 1, 1, 1, 1,
-0.8848279, -0.1633742, -0.1949447, 1, 1, 1, 1, 1,
-0.8821438, -1.184576, -3.58161, 1, 1, 1, 1, 1,
-0.8742442, 0.4169435, -2.076442, 1, 1, 1, 1, 1,
-0.8662768, -0.1790563, -1.383222, 1, 1, 1, 1, 1,
-0.8599519, -0.1218985, -2.118383, 1, 1, 1, 1, 1,
-0.8565133, 0.700368, -1.582659, 1, 1, 1, 1, 1,
-0.8537418, -0.06175879, -1.059483, 1, 1, 1, 1, 1,
-0.8520406, -0.6722804, -1.981752, 1, 1, 1, 1, 1,
-0.8516098, 1.461764, -0.9611471, 1, 1, 1, 1, 1,
-0.850395, -1.189922, -3.929423, 1, 1, 1, 1, 1,
-0.84907, 0.650768, -1.845266, 1, 1, 1, 1, 1,
-0.8408849, 0.8810059, -1.208466, 0, 0, 1, 1, 1,
-0.840685, -1.617855, -2.948241, 1, 0, 0, 1, 1,
-0.8392268, 1.032021, -1.027501, 1, 0, 0, 1, 1,
-0.8391464, -0.8579536, -3.600084, 1, 0, 0, 1, 1,
-0.8304747, -1.049325, -2.858912, 1, 0, 0, 1, 1,
-0.8299609, -0.2466768, -1.048236, 1, 0, 0, 1, 1,
-0.829904, -0.006785148, -2.074059, 0, 0, 0, 1, 1,
-0.8215632, 0.9487636, 0.4970696, 0, 0, 0, 1, 1,
-0.8213624, 0.2051794, -0.8431966, 0, 0, 0, 1, 1,
-0.8205413, 0.7902012, -1.713015, 0, 0, 0, 1, 1,
-0.8066984, -1.821333, -2.364074, 0, 0, 0, 1, 1,
-0.8065017, -1.20251, -2.348487, 0, 0, 0, 1, 1,
-0.796356, -0.5343578, -1.424374, 0, 0, 0, 1, 1,
-0.7958612, -0.6547288, -3.426953, 1, 1, 1, 1, 1,
-0.7928757, 1.145826, -0.3106222, 1, 1, 1, 1, 1,
-0.7919496, -1.38224, 0.6566214, 1, 1, 1, 1, 1,
-0.7768495, -0.7738371, -1.726597, 1, 1, 1, 1, 1,
-0.776203, -0.2028733, -1.069278, 1, 1, 1, 1, 1,
-0.7625427, -0.8150901, -2.378563, 1, 1, 1, 1, 1,
-0.7620316, 2.207322, -0.6388922, 1, 1, 1, 1, 1,
-0.7605988, 0.8975338, -0.8296983, 1, 1, 1, 1, 1,
-0.7560933, 0.387116, -1.197967, 1, 1, 1, 1, 1,
-0.7525819, -0.4587945, -2.527642, 1, 1, 1, 1, 1,
-0.7491373, -0.4528185, -1.957736, 1, 1, 1, 1, 1,
-0.746042, -0.2741389, -1.736233, 1, 1, 1, 1, 1,
-0.740342, 0.4145211, -2.426762, 1, 1, 1, 1, 1,
-0.7401125, 0.432033, -1.802222, 1, 1, 1, 1, 1,
-0.7397193, -0.1118089, -2.665936, 1, 1, 1, 1, 1,
-0.7366302, 0.3678842, 0.9364777, 0, 0, 1, 1, 1,
-0.7326037, 0.8687415, -1.455975, 1, 0, 0, 1, 1,
-0.729542, -0.4143583, -1.647698, 1, 0, 0, 1, 1,
-0.7258217, -0.8067386, -2.383098, 1, 0, 0, 1, 1,
-0.7155616, -0.0804444, -1.419666, 1, 0, 0, 1, 1,
-0.7055683, -0.5790324, -2.676182, 1, 0, 0, 1, 1,
-0.7030521, -1.242437, -3.697786, 0, 0, 0, 1, 1,
-0.7002169, -0.8611771, -2.114307, 0, 0, 0, 1, 1,
-0.6973533, -0.5124441, -1.389959, 0, 0, 0, 1, 1,
-0.6972576, -0.2472151, -1.207284, 0, 0, 0, 1, 1,
-0.691825, 0.3405329, -0.6157743, 0, 0, 0, 1, 1,
-0.691737, 0.4361943, -1.910989, 0, 0, 0, 1, 1,
-0.6861648, 1.405693, -0.8251092, 0, 0, 0, 1, 1,
-0.6731831, -0.06140643, -1.682042, 1, 1, 1, 1, 1,
-0.666647, -0.723711, -3.946157, 1, 1, 1, 1, 1,
-0.6643903, -0.3132079, -1.232783, 1, 1, 1, 1, 1,
-0.6602358, -0.6136415, -1.655371, 1, 1, 1, 1, 1,
-0.6534604, -0.9403632, -2.962452, 1, 1, 1, 1, 1,
-0.6520478, -1.16078, -3.164577, 1, 1, 1, 1, 1,
-0.6483123, 1.518724, -1.182543, 1, 1, 1, 1, 1,
-0.6472801, 0.327318, -0.4433365, 1, 1, 1, 1, 1,
-0.6464186, 1.558914, -1.009484, 1, 1, 1, 1, 1,
-0.6412564, -0.8923702, -3.30043, 1, 1, 1, 1, 1,
-0.6398456, 0.5068017, -1.580742, 1, 1, 1, 1, 1,
-0.6395763, -0.1487506, -0.8700576, 1, 1, 1, 1, 1,
-0.6386175, 0.4088076, -1.344074, 1, 1, 1, 1, 1,
-0.6315976, -1.39524, -4.757594, 1, 1, 1, 1, 1,
-0.6211237, -0.3296396, -0.732161, 1, 1, 1, 1, 1,
-0.6184024, 0.5144451, -3.111258, 0, 0, 1, 1, 1,
-0.6182665, 0.6429878, -0.8990456, 1, 0, 0, 1, 1,
-0.6150038, -1.035878, -1.068516, 1, 0, 0, 1, 1,
-0.6096501, 0.6204031, 0.7436324, 1, 0, 0, 1, 1,
-0.6084481, -1.537283, -3.032568, 1, 0, 0, 1, 1,
-0.6044939, -0.1131556, -1.462065, 1, 0, 0, 1, 1,
-0.6001197, -0.4235103, -1.61699, 0, 0, 0, 1, 1,
-0.5964919, -0.8617706, -2.560429, 0, 0, 0, 1, 1,
-0.5959941, 0.6092921, -1.000878, 0, 0, 0, 1, 1,
-0.5911871, 1.286751, -1.868751, 0, 0, 0, 1, 1,
-0.5911686, 2.806902, -1.767552, 0, 0, 0, 1, 1,
-0.5876887, -0.9257691, -3.719004, 0, 0, 0, 1, 1,
-0.5848495, -1.432564, -2.788804, 0, 0, 0, 1, 1,
-0.5847777, -0.1970513, -0.2931111, 1, 1, 1, 1, 1,
-0.5795098, -1.060213, -3.657598, 1, 1, 1, 1, 1,
-0.5645561, 0.3074717, -0.4764732, 1, 1, 1, 1, 1,
-0.5639174, -0.1373689, -1.868905, 1, 1, 1, 1, 1,
-0.5632711, -0.5115481, -4.056581, 1, 1, 1, 1, 1,
-0.561419, 0.06553083, -2.140965, 1, 1, 1, 1, 1,
-0.5611544, 0.9737945, -0.6336105, 1, 1, 1, 1, 1,
-0.5546277, 0.2495097, -2.594562, 1, 1, 1, 1, 1,
-0.5520768, 1.326463, 0.1788797, 1, 1, 1, 1, 1,
-0.5508485, 1.318677, 0.2219266, 1, 1, 1, 1, 1,
-0.5462195, 0.9603789, -2.018689, 1, 1, 1, 1, 1,
-0.5419872, 1.131301, 0.7718008, 1, 1, 1, 1, 1,
-0.5412167, -0.9231128, -4.14986, 1, 1, 1, 1, 1,
-0.539357, 0.1193753, -1.411885, 1, 1, 1, 1, 1,
-0.5332536, -0.9270859, -3.14348, 1, 1, 1, 1, 1,
-0.5263774, -1.124369, -3.174594, 0, 0, 1, 1, 1,
-0.5237474, -0.6588386, -1.841904, 1, 0, 0, 1, 1,
-0.518959, 0.3529003, -0.4750205, 1, 0, 0, 1, 1,
-0.5155599, 1.169987, -0.3611971, 1, 0, 0, 1, 1,
-0.5154214, 1.761034, -0.1534059, 1, 0, 0, 1, 1,
-0.5134377, 1.198057, 0.5063673, 1, 0, 0, 1, 1,
-0.5134147, 0.7897167, -0.8752167, 0, 0, 0, 1, 1,
-0.5075948, 0.9270428, -1.389635, 0, 0, 0, 1, 1,
-0.5067604, 0.526458, -0.6334152, 0, 0, 0, 1, 1,
-0.5046504, -0.314763, -3.373901, 0, 0, 0, 1, 1,
-0.5044832, 2.112971, 0.3876561, 0, 0, 0, 1, 1,
-0.5018865, -0.3919819, -2.052679, 0, 0, 0, 1, 1,
-0.4963355, 1.131025, -0.9483304, 0, 0, 0, 1, 1,
-0.495137, 0.6873633, -1.190254, 1, 1, 1, 1, 1,
-0.4938982, -2.446502, -3.437364, 1, 1, 1, 1, 1,
-0.4936319, -0.8146339, -3.00637, 1, 1, 1, 1, 1,
-0.4929489, -0.3363733, -2.015016, 1, 1, 1, 1, 1,
-0.4921039, -0.4550763, -2.389454, 1, 1, 1, 1, 1,
-0.4918435, 0.5368984, -0.3192469, 1, 1, 1, 1, 1,
-0.4850582, -0.5457931, -1.75831, 1, 1, 1, 1, 1,
-0.4801641, 0.20896, -1.4698, 1, 1, 1, 1, 1,
-0.4799399, 1.83382, 0.01507995, 1, 1, 1, 1, 1,
-0.4787624, 1.785871, 1.150614, 1, 1, 1, 1, 1,
-0.4739629, -0.1768994, -1.88787, 1, 1, 1, 1, 1,
-0.4677279, 0.9701987, -2.145362, 1, 1, 1, 1, 1,
-0.4674794, 2.040321, -0.1278295, 1, 1, 1, 1, 1,
-0.4645839, 0.2005489, -1.940076, 1, 1, 1, 1, 1,
-0.4639967, -0.3151732, -1.191604, 1, 1, 1, 1, 1,
-0.4632263, 0.356746, -1.39049, 0, 0, 1, 1, 1,
-0.4626138, 0.1402104, -0.4800321, 1, 0, 0, 1, 1,
-0.4592721, -0.1266531, -2.701546, 1, 0, 0, 1, 1,
-0.4589227, -0.8429395, -2.797919, 1, 0, 0, 1, 1,
-0.4577189, 1.46986, -0.4078001, 1, 0, 0, 1, 1,
-0.4543043, 0.1759117, -1.222932, 1, 0, 0, 1, 1,
-0.4508611, -1.292742, -2.270858, 0, 0, 0, 1, 1,
-0.4498629, -0.05540887, -2.195054, 0, 0, 0, 1, 1,
-0.4491705, 0.269167, -0.1986324, 0, 0, 0, 1, 1,
-0.4472871, -1.326194, -1.781128, 0, 0, 0, 1, 1,
-0.4457881, -0.1838104, -2.705159, 0, 0, 0, 1, 1,
-0.4416195, 1.558752, -1.372547, 0, 0, 0, 1, 1,
-0.4414682, -0.03792729, -2.244679, 0, 0, 0, 1, 1,
-0.4389522, 1.326392, 0.4102153, 1, 1, 1, 1, 1,
-0.437502, 0.5872632, -1.008377, 1, 1, 1, 1, 1,
-0.4355912, 0.255628, 0.7097336, 1, 1, 1, 1, 1,
-0.4334469, -0.2393295, -1.111767, 1, 1, 1, 1, 1,
-0.4301954, 0.2341945, -0.4736768, 1, 1, 1, 1, 1,
-0.4283873, 0.4648472, -1.4673, 1, 1, 1, 1, 1,
-0.4272947, 0.3091452, -0.9194667, 1, 1, 1, 1, 1,
-0.4211213, 0.01135771, -0.860655, 1, 1, 1, 1, 1,
-0.420324, 1.117832, -1.339415, 1, 1, 1, 1, 1,
-0.4190237, 0.5515857, -3.239646, 1, 1, 1, 1, 1,
-0.4171109, 0.4751958, 0.3369866, 1, 1, 1, 1, 1,
-0.4167627, -0.5914623, -2.741696, 1, 1, 1, 1, 1,
-0.41554, -0.022528, -1.301921, 1, 1, 1, 1, 1,
-0.4152121, 1.681051, 1.11059, 1, 1, 1, 1, 1,
-0.414876, 0.3280836, -1.280274, 1, 1, 1, 1, 1,
-0.41426, -0.4030975, -1.514686, 0, 0, 1, 1, 1,
-0.4136012, 0.1506215, -0.005735305, 1, 0, 0, 1, 1,
-0.4095747, -0.08908839, -1.747751, 1, 0, 0, 1, 1,
-0.4060706, -0.470771, -2.799828, 1, 0, 0, 1, 1,
-0.4026879, 0.3960002, -0.8639289, 1, 0, 0, 1, 1,
-0.4011107, -0.9149995, -3.569902, 1, 0, 0, 1, 1,
-0.4000719, -0.1662751, 0.1114016, 0, 0, 0, 1, 1,
-0.3987792, 0.4545887, -0.3735473, 0, 0, 0, 1, 1,
-0.3972907, -1.213754, -2.000471, 0, 0, 0, 1, 1,
-0.3941385, -0.5116953, -2.14832, 0, 0, 0, 1, 1,
-0.3895947, -0.04410026, -0.2218968, 0, 0, 0, 1, 1,
-0.3790794, -0.5516387, -2.344906, 0, 0, 0, 1, 1,
-0.373273, 0.5587448, -1.152189, 0, 0, 0, 1, 1,
-0.3663456, 0.1920656, -2.48773, 1, 1, 1, 1, 1,
-0.3633134, 0.2596906, -0.4384092, 1, 1, 1, 1, 1,
-0.3630694, -0.8426327, -2.744713, 1, 1, 1, 1, 1,
-0.3619851, 0.1506486, -1.938165, 1, 1, 1, 1, 1,
-0.3558654, 1.028139, 0.4661466, 1, 1, 1, 1, 1,
-0.3537419, -1.537169, -2.151519, 1, 1, 1, 1, 1,
-0.3490816, -1.793976, -3.546743, 1, 1, 1, 1, 1,
-0.3433328, -0.2581657, -2.19688, 1, 1, 1, 1, 1,
-0.3432908, 1.60762, -0.1644741, 1, 1, 1, 1, 1,
-0.3421494, -1.039043, -3.000957, 1, 1, 1, 1, 1,
-0.3404246, -0.07308759, -2.169998, 1, 1, 1, 1, 1,
-0.3402514, 0.2647036, 0.8120492, 1, 1, 1, 1, 1,
-0.3387087, 0.1062988, -1.813423, 1, 1, 1, 1, 1,
-0.3316627, -0.6414482, -2.91159, 1, 1, 1, 1, 1,
-0.3314677, -0.2895134, -2.327562, 1, 1, 1, 1, 1,
-0.3303923, 0.3920266, 0.4494597, 0, 0, 1, 1, 1,
-0.3295835, -0.3609822, -2.138404, 1, 0, 0, 1, 1,
-0.3284666, 0.4492722, -0.8795767, 1, 0, 0, 1, 1,
-0.3247072, -0.4538041, -2.706904, 1, 0, 0, 1, 1,
-0.3243903, 0.1455856, -1.82797, 1, 0, 0, 1, 1,
-0.3235446, 1.56474, 0.7033498, 1, 0, 0, 1, 1,
-0.3222204, -0.7372642, -2.999102, 0, 0, 0, 1, 1,
-0.3174582, -0.2404023, -1.691544, 0, 0, 0, 1, 1,
-0.315826, -0.4832657, -3.161105, 0, 0, 0, 1, 1,
-0.3132778, 0.6511535, -0.6802266, 0, 0, 0, 1, 1,
-0.3130337, -0.05979987, -1.795587, 0, 0, 0, 1, 1,
-0.3124147, 0.4027774, -0.8591557, 0, 0, 0, 1, 1,
-0.3103303, 0.2236276, -4.109851, 0, 0, 0, 1, 1,
-0.30766, 0.7709772, -0.910035, 1, 1, 1, 1, 1,
-0.3011039, 1.75587, -1.04073, 1, 1, 1, 1, 1,
-0.2983, -0.438206, -1.438254, 1, 1, 1, 1, 1,
-0.2976457, 0.9000503, 0.6429702, 1, 1, 1, 1, 1,
-0.2972113, -1.474146, -5.594937, 1, 1, 1, 1, 1,
-0.2958505, -1.276337, -1.935753, 1, 1, 1, 1, 1,
-0.2927885, -0.009251768, -1.304019, 1, 1, 1, 1, 1,
-0.2905658, -0.5816832, -3.493371, 1, 1, 1, 1, 1,
-0.290363, -0.8286868, -2.912269, 1, 1, 1, 1, 1,
-0.2899511, 0.4493047, -1.243797, 1, 1, 1, 1, 1,
-0.2896026, -0.9723847, -2.962111, 1, 1, 1, 1, 1,
-0.2859266, 1.061501, -0.1062348, 1, 1, 1, 1, 1,
-0.2831138, -0.07946675, -3.388404, 1, 1, 1, 1, 1,
-0.2822533, -0.288034, -2.223051, 1, 1, 1, 1, 1,
-0.2790329, 0.5180007, 0.4168429, 1, 1, 1, 1, 1,
-0.2773529, -0.00494032, -1.691772, 0, 0, 1, 1, 1,
-0.2751634, -0.6344145, -3.641714, 1, 0, 0, 1, 1,
-0.2671902, 0.3080375, 0.9388034, 1, 0, 0, 1, 1,
-0.2633344, 0.3394874, -1.121412, 1, 0, 0, 1, 1,
-0.2624372, 0.06857126, -1.001711, 1, 0, 0, 1, 1,
-0.2610835, -0.004774427, -0.5876545, 1, 0, 0, 1, 1,
-0.2609358, -0.9513649, -3.239017, 0, 0, 0, 1, 1,
-0.2602111, 0.5345684, -1.22326, 0, 0, 0, 1, 1,
-0.2590658, 0.5734004, -1.488578, 0, 0, 0, 1, 1,
-0.2579937, 0.5866351, 0.7076981, 0, 0, 0, 1, 1,
-0.2565175, -0.1679533, -4.258096, 0, 0, 0, 1, 1,
-0.2554148, -1.177036, -1.497341, 0, 0, 0, 1, 1,
-0.2540955, -0.5144876, -3.572208, 0, 0, 0, 1, 1,
-0.2531098, -0.2882647, -1.23368, 1, 1, 1, 1, 1,
-0.2487633, 1.706424, -0.3151281, 1, 1, 1, 1, 1,
-0.2468559, 1.392633, -0.2695947, 1, 1, 1, 1, 1,
-0.2424166, 0.6786059, -1.451981, 1, 1, 1, 1, 1,
-0.2405575, 0.2604139, -0.6644324, 1, 1, 1, 1, 1,
-0.240473, -0.3750454, -3.276964, 1, 1, 1, 1, 1,
-0.2370857, 0.3444462, -3.597849, 1, 1, 1, 1, 1,
-0.2363472, -1.548759, -3.084346, 1, 1, 1, 1, 1,
-0.2349431, 0.7288553, -1.485674, 1, 1, 1, 1, 1,
-0.2345237, -1.965294, -1.627233, 1, 1, 1, 1, 1,
-0.227744, -2.048053, -1.500055, 1, 1, 1, 1, 1,
-0.2212045, 0.943706, 0.9189563, 1, 1, 1, 1, 1,
-0.2211983, -0.9293871, -2.91594, 1, 1, 1, 1, 1,
-0.2211682, -0.07544223, -2.572582, 1, 1, 1, 1, 1,
-0.2206899, -0.8332993, -4.146776, 1, 1, 1, 1, 1,
-0.2181994, 0.3986055, 0.07628714, 0, 0, 1, 1, 1,
-0.217739, -1.627713, -2.58596, 1, 0, 0, 1, 1,
-0.2150805, -1.628698, -3.654675, 1, 0, 0, 1, 1,
-0.2146398, -0.542381, -2.759195, 1, 0, 0, 1, 1,
-0.2137984, -0.0462897, -1.435128, 1, 0, 0, 1, 1,
-0.2031363, -0.6414913, -2.998526, 1, 0, 0, 1, 1,
-0.2029318, -0.7629646, -5.017446, 0, 0, 0, 1, 1,
-0.2017138, 1.339959, -0.9596949, 0, 0, 0, 1, 1,
-0.2016678, -1.058632, -2.299066, 0, 0, 0, 1, 1,
-0.2003802, 0.03211648, -1.986201, 0, 0, 0, 1, 1,
-0.1988762, -0.5523756, -1.823569, 0, 0, 0, 1, 1,
-0.1965228, 1.209852, 0.3102845, 0, 0, 0, 1, 1,
-0.1901333, -1.01996, -3.67424, 0, 0, 0, 1, 1,
-0.1878418, -0.841092, -2.763385, 1, 1, 1, 1, 1,
-0.1834239, 0.03174328, -1.069577, 1, 1, 1, 1, 1,
-0.1812771, 0.3902774, 0.09503115, 1, 1, 1, 1, 1,
-0.1706812, 1.13264, 1.1997, 1, 1, 1, 1, 1,
-0.1673544, -0.9597501, -2.001789, 1, 1, 1, 1, 1,
-0.1663876, 0.6148137, -1.753323, 1, 1, 1, 1, 1,
-0.1616688, -0.2136652, -0.8176405, 1, 1, 1, 1, 1,
-0.161317, -0.9892746, -1.675205, 1, 1, 1, 1, 1,
-0.1583825, 0.6834874, -1.467974, 1, 1, 1, 1, 1,
-0.1569434, 0.4037385, -0.9102377, 1, 1, 1, 1, 1,
-0.1558645, 0.8907993, -1.266161, 1, 1, 1, 1, 1,
-0.1529987, -2.155114, -4.766511, 1, 1, 1, 1, 1,
-0.1447395, 0.5489818, 0.4782318, 1, 1, 1, 1, 1,
-0.144675, -0.8149776, -2.872939, 1, 1, 1, 1, 1,
-0.1440514, 0.192626, 1.058261, 1, 1, 1, 1, 1,
-0.1423621, 0.2865693, -0.2157586, 0, 0, 1, 1, 1,
-0.1391969, -0.7039759, -3.921814, 1, 0, 0, 1, 1,
-0.1378854, -0.7015109, -1.961193, 1, 0, 0, 1, 1,
-0.1331749, -0.3176931, -2.311769, 1, 0, 0, 1, 1,
-0.1323419, -0.7364987, -4.830688, 1, 0, 0, 1, 1,
-0.1286021, -2.001848, -2.010224, 1, 0, 0, 1, 1,
-0.1259763, -0.6483309, -1.553205, 0, 0, 0, 1, 1,
-0.1259074, 1.853977, -1.076221, 0, 0, 0, 1, 1,
-0.1237701, -1.401077, -4.062356, 0, 0, 0, 1, 1,
-0.1223924, -2.591581, -3.085922, 0, 0, 0, 1, 1,
-0.1166486, -0.5406733, -2.129169, 0, 0, 0, 1, 1,
-0.1156294, -0.1423459, -3.482915, 0, 0, 0, 1, 1,
-0.1137357, -0.2995593, -3.028507, 0, 0, 0, 1, 1,
-0.1135892, -0.5725492, -2.151628, 1, 1, 1, 1, 1,
-0.1110425, 0.3156782, -0.1050861, 1, 1, 1, 1, 1,
-0.1062296, 1.357824, -0.503428, 1, 1, 1, 1, 1,
-0.1046107, 1.070083, -0.2868433, 1, 1, 1, 1, 1,
-0.1027463, 0.4610187, 1.239683, 1, 1, 1, 1, 1,
-0.1015228, -1.086014, -4.170048, 1, 1, 1, 1, 1,
-0.09988283, 0.7358505, 0.08016184, 1, 1, 1, 1, 1,
-0.09644123, 0.02133658, -1.893412, 1, 1, 1, 1, 1,
-0.09429466, -1.745242, -1.626137, 1, 1, 1, 1, 1,
-0.09348919, -0.03407469, -1.842147, 1, 1, 1, 1, 1,
-0.08862676, 0.1351628, -1.418012, 1, 1, 1, 1, 1,
-0.08717258, -0.5103167, -3.881945, 1, 1, 1, 1, 1,
-0.08469673, -0.03226734, -0.8990586, 1, 1, 1, 1, 1,
-0.0844048, -0.725455, -3.241067, 1, 1, 1, 1, 1,
-0.08193468, -0.02930366, -0.7983365, 1, 1, 1, 1, 1,
-0.08147454, 1.324783, 0.9441752, 0, 0, 1, 1, 1,
-0.07252444, -0.9780532, -2.192097, 1, 0, 0, 1, 1,
-0.07199306, 0.7706872, 1.065777, 1, 0, 0, 1, 1,
-0.06975568, -0.4095013, -4.3792, 1, 0, 0, 1, 1,
-0.06190388, 1.143926, -1.03728, 1, 0, 0, 1, 1,
-0.05584106, 1.973124, -0.5686275, 1, 0, 0, 1, 1,
-0.05138255, -0.3120968, -3.01867, 0, 0, 0, 1, 1,
-0.05079236, 0.6832766, -0.3670724, 0, 0, 0, 1, 1,
-0.04374432, 1.225354, -0.2231801, 0, 0, 0, 1, 1,
-0.04199995, -0.2010319, -3.265597, 0, 0, 0, 1, 1,
-0.04044077, -0.4732441, -2.072572, 0, 0, 0, 1, 1,
-0.03728056, 1.381922, -0.1045657, 0, 0, 0, 1, 1,
-0.03611597, -0.2787696, -2.609971, 0, 0, 0, 1, 1,
-0.03155304, -0.4623548, -2.607686, 1, 1, 1, 1, 1,
-0.03001923, 0.03620248, -2.520009, 1, 1, 1, 1, 1,
-0.0281591, 0.8005942, -0.3902113, 1, 1, 1, 1, 1,
-0.02517015, 0.1139361, 0.5477382, 1, 1, 1, 1, 1,
-0.02481652, 0.2630481, 0.02938664, 1, 1, 1, 1, 1,
-0.023598, -0.6470487, -2.797695, 1, 1, 1, 1, 1,
-0.0214369, -0.4994758, -3.193868, 1, 1, 1, 1, 1,
-0.01861404, 0.1283538, -1.075526, 1, 1, 1, 1, 1,
-0.01581602, -0.3174614, -4.660401, 1, 1, 1, 1, 1,
-0.009300439, 0.2052132, 0.337085, 1, 1, 1, 1, 1,
-0.008582421, -0.6237417, -3.131979, 1, 1, 1, 1, 1,
-0.008097287, -0.4239103, -3.089023, 1, 1, 1, 1, 1,
-0.006649539, -1.31736, -4.531165, 1, 1, 1, 1, 1,
-0.005610341, -0.8743694, -1.431718, 1, 1, 1, 1, 1,
-0.004323624, -0.3686191, -3.631748, 1, 1, 1, 1, 1,
-0.001506594, -0.51539, -3.580145, 0, 0, 1, 1, 1,
0.001369848, -1.955499, 2.688099, 1, 0, 0, 1, 1,
0.003609051, -0.3152905, 2.158249, 1, 0, 0, 1, 1,
0.004263497, 1.167397, 1.765471, 1, 0, 0, 1, 1,
0.01102558, 0.9780263, -0.4671666, 1, 0, 0, 1, 1,
0.01254008, 0.2002906, 0.4077814, 1, 0, 0, 1, 1,
0.01345789, -0.2481244, 3.31145, 0, 0, 0, 1, 1,
0.01409504, 0.09160363, 2.196091, 0, 0, 0, 1, 1,
0.01690967, -0.2691411, 1.666255, 0, 0, 0, 1, 1,
0.02295695, -0.6890501, 2.688512, 0, 0, 0, 1, 1,
0.02577129, -0.2970777, 1.915947, 0, 0, 0, 1, 1,
0.03573599, 0.3436806, 0.304557, 0, 0, 0, 1, 1,
0.03616209, -0.263045, 3.111756, 0, 0, 0, 1, 1,
0.03768787, -0.6143658, 4.1315, 1, 1, 1, 1, 1,
0.03783029, -1.82477, 2.95453, 1, 1, 1, 1, 1,
0.04121567, -0.5557631, 4.17797, 1, 1, 1, 1, 1,
0.04281001, -0.03352629, 3.306772, 1, 1, 1, 1, 1,
0.04894067, 0.3486339, 0.9844097, 1, 1, 1, 1, 1,
0.05135909, -0.4136166, 2.788158, 1, 1, 1, 1, 1,
0.05502776, 0.3715089, -0.7798302, 1, 1, 1, 1, 1,
0.05876222, -0.5219022, 5.067029, 1, 1, 1, 1, 1,
0.05935932, 0.5660484, -0.7214002, 1, 1, 1, 1, 1,
0.05979735, 0.0867391, -0.1051836, 1, 1, 1, 1, 1,
0.07357402, -1.240458, 2.825904, 1, 1, 1, 1, 1,
0.0767379, 0.9244192, -0.2595802, 1, 1, 1, 1, 1,
0.07694435, 1.364138, -0.6435847, 1, 1, 1, 1, 1,
0.07927645, 0.1062405, 0.8101746, 1, 1, 1, 1, 1,
0.07991421, -1.050998, 3.877943, 1, 1, 1, 1, 1,
0.08035674, 0.01850991, 1.890938, 0, 0, 1, 1, 1,
0.08388969, -0.2013918, 2.953338, 1, 0, 0, 1, 1,
0.08676907, 0.4520724, 0.03319814, 1, 0, 0, 1, 1,
0.08768034, 1.417153, -0.219019, 1, 0, 0, 1, 1,
0.08776028, -0.9018605, 3.29791, 1, 0, 0, 1, 1,
0.08923687, -0.3900526, 1.524828, 1, 0, 0, 1, 1,
0.09422337, -1.547644, 3.392992, 0, 0, 0, 1, 1,
0.09537286, -0.2851996, 3.679729, 0, 0, 0, 1, 1,
0.09543528, 1.857775, -0.8472003, 0, 0, 0, 1, 1,
0.09569338, -0.2091611, 3.473619, 0, 0, 0, 1, 1,
0.09829983, -0.446714, 3.096207, 0, 0, 0, 1, 1,
0.09864143, 0.02427069, 1.220315, 0, 0, 0, 1, 1,
0.1024959, 0.3337487, 1.826496, 0, 0, 0, 1, 1,
0.1026121, 0.03347262, -0.2935766, 1, 1, 1, 1, 1,
0.1026387, -0.6217773, 4.440991, 1, 1, 1, 1, 1,
0.1057023, 0.6015092, 0.590786, 1, 1, 1, 1, 1,
0.1080227, -1.426161, 2.709139, 1, 1, 1, 1, 1,
0.1080944, 1.280759, -0.7785726, 1, 1, 1, 1, 1,
0.1156366, 2.809576, -0.1327509, 1, 1, 1, 1, 1,
0.118696, 1.009965, 0.6053138, 1, 1, 1, 1, 1,
0.1210667, -0.7705609, 1.740775, 1, 1, 1, 1, 1,
0.1235204, -0.3647276, 3.964437, 1, 1, 1, 1, 1,
0.1252029, -1.066265, 3.44103, 1, 1, 1, 1, 1,
0.1293996, -0.276805, 1.976611, 1, 1, 1, 1, 1,
0.1319211, -0.7203338, 3.405108, 1, 1, 1, 1, 1,
0.1349912, -1.054574, 2.9492, 1, 1, 1, 1, 1,
0.1390098, 0.7916753, 0.1232885, 1, 1, 1, 1, 1,
0.1392529, -1.253118, 2.210326, 1, 1, 1, 1, 1,
0.1417861, 0.8340809, 0.8353096, 0, 0, 1, 1, 1,
0.1430421, -0.9401813, 4.572772, 1, 0, 0, 1, 1,
0.1438185, -0.656646, 2.788425, 1, 0, 0, 1, 1,
0.1448367, -1.366481, 4.614272, 1, 0, 0, 1, 1,
0.1472669, -0.2779939, 2.327492, 1, 0, 0, 1, 1,
0.1480432, 0.4092105, -0.6158937, 1, 0, 0, 1, 1,
0.1485855, -1.555667, 0.9538699, 0, 0, 0, 1, 1,
0.1561986, -0.9855173, 3.355734, 0, 0, 0, 1, 1,
0.1585274, 0.5561065, -1.483901, 0, 0, 0, 1, 1,
0.1604594, -0.2025215, 2.526468, 0, 0, 0, 1, 1,
0.1634423, -0.1819127, 3.683431, 0, 0, 0, 1, 1,
0.173376, 0.134259, -0.4021138, 0, 0, 0, 1, 1,
0.1746579, 0.2208979, -1.001402, 0, 0, 0, 1, 1,
0.1750222, 1.345573, 0.5598677, 1, 1, 1, 1, 1,
0.1778141, 0.7325599, 1.179518, 1, 1, 1, 1, 1,
0.1835207, -0.5283335, 0.4483579, 1, 1, 1, 1, 1,
0.1850772, -1.045848, 2.710554, 1, 1, 1, 1, 1,
0.1861512, -0.09680396, 2.309506, 1, 1, 1, 1, 1,
0.1867681, -0.8981307, 4.453394, 1, 1, 1, 1, 1,
0.1898601, 0.2683961, 1.116232, 1, 1, 1, 1, 1,
0.1942454, 0.2633524, -0.5765734, 1, 1, 1, 1, 1,
0.1963314, -0.7978235, 1.631317, 1, 1, 1, 1, 1,
0.1974087, 2.151783, 0.3054542, 1, 1, 1, 1, 1,
0.2052787, 0.9669707, -0.9116461, 1, 1, 1, 1, 1,
0.2128835, -0.7781321, 3.0607, 1, 1, 1, 1, 1,
0.2131009, -0.005017065, 1.32153, 1, 1, 1, 1, 1,
0.2156529, -1.643009, 3.439621, 1, 1, 1, 1, 1,
0.2229905, 0.8319816, 1.773281, 1, 1, 1, 1, 1,
0.2238384, 1.029821, 0.5336424, 0, 0, 1, 1, 1,
0.2280186, -0.5753805, 4.65873, 1, 0, 0, 1, 1,
0.2295311, 0.2360444, 0.9314395, 1, 0, 0, 1, 1,
0.2322162, -0.401943, 2.482865, 1, 0, 0, 1, 1,
0.2337181, 1.152153, 1.29108, 1, 0, 0, 1, 1,
0.2352622, 1.299456, 0.1181262, 1, 0, 0, 1, 1,
0.2369703, -0.8610317, 3.053669, 0, 0, 0, 1, 1,
0.2414075, -0.8562328, 4.173299, 0, 0, 0, 1, 1,
0.250872, 0.1304509, 2.132451, 0, 0, 0, 1, 1,
0.2525508, -0.7542496, 2.856395, 0, 0, 0, 1, 1,
0.2530148, 0.1614952, 0.9873455, 0, 0, 0, 1, 1,
0.2536035, 0.9023936, -1.113539, 0, 0, 0, 1, 1,
0.253821, -0.3590055, 3.160832, 0, 0, 0, 1, 1,
0.2547638, 0.1031775, 3.701063, 1, 1, 1, 1, 1,
0.2548915, 1.350032, 1.207494, 1, 1, 1, 1, 1,
0.2550593, 2.129309, 0.9359102, 1, 1, 1, 1, 1,
0.2552436, -2.313468, 2.555327, 1, 1, 1, 1, 1,
0.2554129, 0.9340845, -0.2015667, 1, 1, 1, 1, 1,
0.2586232, -0.7465922, 3.494588, 1, 1, 1, 1, 1,
0.2631251, -0.2737047, 1.529535, 1, 1, 1, 1, 1,
0.2692866, 1.84771, -0.4474785, 1, 1, 1, 1, 1,
0.2702424, 0.1672828, -0.967923, 1, 1, 1, 1, 1,
0.274285, -2.195126, 2.839803, 1, 1, 1, 1, 1,
0.2749908, 0.9700766, 0.3274105, 1, 1, 1, 1, 1,
0.2760184, 0.7410472, 0.5368388, 1, 1, 1, 1, 1,
0.2778513, -0.04276641, 1.721388, 1, 1, 1, 1, 1,
0.278088, -0.3594204, 1.054717, 1, 1, 1, 1, 1,
0.2833638, -0.4994799, 4.294313, 1, 1, 1, 1, 1,
0.2839123, -0.8332316, 3.558712, 0, 0, 1, 1, 1,
0.2849263, -0.8416199, 3.94979, 1, 0, 0, 1, 1,
0.2857841, -0.08762274, 2.586556, 1, 0, 0, 1, 1,
0.287286, 0.2660777, 2.030303, 1, 0, 0, 1, 1,
0.2897597, 0.5378321, 1.03881, 1, 0, 0, 1, 1,
0.291295, 0.8779836, -0.6504521, 1, 0, 0, 1, 1,
0.2999298, -0.2607243, 4.160421, 0, 0, 0, 1, 1,
0.3067023, 0.5379329, -0.3799416, 0, 0, 0, 1, 1,
0.3107674, -0.9985043, 2.801389, 0, 0, 0, 1, 1,
0.319088, 0.419513, 1.422267, 0, 0, 0, 1, 1,
0.3328778, 1.080781, -0.1398024, 0, 0, 0, 1, 1,
0.3330919, -1.301754, 1.789686, 0, 0, 0, 1, 1,
0.3349768, -0.9143551, 2.419464, 0, 0, 0, 1, 1,
0.3378243, 1.048019, -0.08650624, 1, 1, 1, 1, 1,
0.3389841, -0.7125503, 1.476464, 1, 1, 1, 1, 1,
0.342067, 0.5901176, 0.518521, 1, 1, 1, 1, 1,
0.343436, 1.426863, 0.4950447, 1, 1, 1, 1, 1,
0.3463112, -0.03783101, 2.51467, 1, 1, 1, 1, 1,
0.3503205, 1.137983, 0.9662309, 1, 1, 1, 1, 1,
0.353213, 0.8934554, -0.07500653, 1, 1, 1, 1, 1,
0.3588591, 0.3628277, 1.067737, 1, 1, 1, 1, 1,
0.3687561, 1.954118, 0.7576326, 1, 1, 1, 1, 1,
0.3744471, -1.722417, 3.629687, 1, 1, 1, 1, 1,
0.3752099, -1.027223, 0.3142592, 1, 1, 1, 1, 1,
0.3795723, -2.178796, 3.588901, 1, 1, 1, 1, 1,
0.3807442, 2.288744, 1.117514, 1, 1, 1, 1, 1,
0.3847124, -0.6480399, 3.729339, 1, 1, 1, 1, 1,
0.3860362, -0.5700992, 3.067317, 1, 1, 1, 1, 1,
0.3865018, -0.3625403, 2.349786, 0, 0, 1, 1, 1,
0.387529, 0.9021668, 0.09214322, 1, 0, 0, 1, 1,
0.3910342, 0.8173499, -1.410259, 1, 0, 0, 1, 1,
0.3926872, -0.7796222, 2.448994, 1, 0, 0, 1, 1,
0.393269, -1.035871, 5.500083, 1, 0, 0, 1, 1,
0.3952381, 2.103976, 0.8073214, 1, 0, 0, 1, 1,
0.3983502, -1.722901, 3.578281, 0, 0, 0, 1, 1,
0.3996058, -0.9709573, 4.40292, 0, 0, 0, 1, 1,
0.40096, -0.9296531, 4.036556, 0, 0, 0, 1, 1,
0.4033434, -0.695786, 3.236847, 0, 0, 0, 1, 1,
0.4069091, 0.4222269, 1.36846, 0, 0, 0, 1, 1,
0.408494, 0.9070544, 0.1775638, 0, 0, 0, 1, 1,
0.410604, -0.736634, 2.568122, 0, 0, 0, 1, 1,
0.4122007, 0.2085535, 1.822248, 1, 1, 1, 1, 1,
0.4139615, -1.671236, 2.792444, 1, 1, 1, 1, 1,
0.4169182, 0.2405596, 1.24247, 1, 1, 1, 1, 1,
0.4205308, 1.087861, 1.476056, 1, 1, 1, 1, 1,
0.4253988, 1.060063, 1.167011, 1, 1, 1, 1, 1,
0.4270641, -0.7600201, 2.355457, 1, 1, 1, 1, 1,
0.4276634, 0.7485102, -0.564862, 1, 1, 1, 1, 1,
0.4290766, -0.2707899, 2.145547, 1, 1, 1, 1, 1,
0.4296481, 0.6756386, 0.7286112, 1, 1, 1, 1, 1,
0.4299428, -2.216374, 1.997899, 1, 1, 1, 1, 1,
0.4331606, 0.325001, -0.2095077, 1, 1, 1, 1, 1,
0.4372633, -0.6653827, 1.013153, 1, 1, 1, 1, 1,
0.4386864, -0.2327229, 2.601301, 1, 1, 1, 1, 1,
0.4420212, -0.9240314, 0.1786173, 1, 1, 1, 1, 1,
0.4428965, 0.1695331, 2.672212, 1, 1, 1, 1, 1,
0.444093, 0.4201239, 1.092395, 0, 0, 1, 1, 1,
0.4487576, 0.1954007, 0.9604401, 1, 0, 0, 1, 1,
0.4500212, -0.2737747, 2.020637, 1, 0, 0, 1, 1,
0.4507153, -0.0007818923, 2.245385, 1, 0, 0, 1, 1,
0.4523827, -0.3924645, 2.854739, 1, 0, 0, 1, 1,
0.4591719, 0.07133171, 0.5733927, 1, 0, 0, 1, 1,
0.4599767, 0.006552169, 1.74143, 0, 0, 0, 1, 1,
0.4662784, 1.078932, 1.171397, 0, 0, 0, 1, 1,
0.4680375, -0.2713434, 1.479944, 0, 0, 0, 1, 1,
0.4680926, 1.089214, -0.3834333, 0, 0, 0, 1, 1,
0.4710776, -1.025792, 2.347165, 0, 0, 0, 1, 1,
0.4723902, -0.844806, 2.637823, 0, 0, 0, 1, 1,
0.4741547, -1.183988, 3.212078, 0, 0, 0, 1, 1,
0.4751337, -0.0164324, 2.720009, 1, 1, 1, 1, 1,
0.4792047, 0.5931965, 1.27469, 1, 1, 1, 1, 1,
0.4818451, -0.02216669, 0.5779589, 1, 1, 1, 1, 1,
0.4854685, 1.012012, 0.4943877, 1, 1, 1, 1, 1,
0.5020301, 0.1862084, 2.433908, 1, 1, 1, 1, 1,
0.5027999, -0.7716054, 1.304255, 1, 1, 1, 1, 1,
0.5057551, -1.922909, 2.112077, 1, 1, 1, 1, 1,
0.506024, -1.483922, 2.92231, 1, 1, 1, 1, 1,
0.5096082, -0.7406598, 2.282319, 1, 1, 1, 1, 1,
0.5101978, 1.269416, 0.9241691, 1, 1, 1, 1, 1,
0.5183016, -0.7687587, 1.899211, 1, 1, 1, 1, 1,
0.520362, 0.5213846, 1.661078, 1, 1, 1, 1, 1,
0.5208672, 0.8583663, 0.1586729, 1, 1, 1, 1, 1,
0.5355934, 2.449031, 1.738356, 1, 1, 1, 1, 1,
0.5379823, -0.4994616, 3.344529, 1, 1, 1, 1, 1,
0.540606, 1.752584, 0.2443788, 0, 0, 1, 1, 1,
0.5437512, 0.676116, 2.152142, 1, 0, 0, 1, 1,
0.5543159, -0.5697616, 2.159237, 1, 0, 0, 1, 1,
0.5605913, -0.7020167, 1.073393, 1, 0, 0, 1, 1,
0.5609223, 0.8240378, 0.150853, 1, 0, 0, 1, 1,
0.5690151, 0.3523566, -0.192664, 1, 0, 0, 1, 1,
0.5716624, 0.9033735, 0.7005345, 0, 0, 0, 1, 1,
0.5736478, -1.987854, 3.931502, 0, 0, 0, 1, 1,
0.5753092, 0.2515889, 0.0416134, 0, 0, 0, 1, 1,
0.5760283, 0.7022729, 2.072229, 0, 0, 0, 1, 1,
0.5770111, 1.691907, -0.4898397, 0, 0, 0, 1, 1,
0.581453, -0.7799332, 2.948237, 0, 0, 0, 1, 1,
0.5836302, -0.1845644, 3.065971, 0, 0, 0, 1, 1,
0.5849806, -0.1372077, 3.276521, 1, 1, 1, 1, 1,
0.5851699, 0.3096105, 1.263595, 1, 1, 1, 1, 1,
0.5891005, 0.1624807, 2.117118, 1, 1, 1, 1, 1,
0.5900578, -0.6676522, 1.818454, 1, 1, 1, 1, 1,
0.5907741, 0.4776897, 1.220383, 1, 1, 1, 1, 1,
0.5975756, -1.07051, 1.916262, 1, 1, 1, 1, 1,
0.6007127, 0.9102163, 0.2879828, 1, 1, 1, 1, 1,
0.6009837, 0.04500682, 1.011239, 1, 1, 1, 1, 1,
0.6010698, -0.9792432, 3.095134, 1, 1, 1, 1, 1,
0.6113871, -0.747201, 1.70855, 1, 1, 1, 1, 1,
0.6131532, -0.8097878, 3.693844, 1, 1, 1, 1, 1,
0.6156025, 1.298315, 2.0371, 1, 1, 1, 1, 1,
0.6183814, -2.88193, 1.583246, 1, 1, 1, 1, 1,
0.6199517, -0.9479169, 1.72028, 1, 1, 1, 1, 1,
0.622845, -0.5458415, 2.11031, 1, 1, 1, 1, 1,
0.623687, -0.4613922, 1.165468, 0, 0, 1, 1, 1,
0.6243815, 0.9500693, 0.5202261, 1, 0, 0, 1, 1,
0.6325575, 0.5731554, 0.2266074, 1, 0, 0, 1, 1,
0.6329393, 1.095871, 0.8924848, 1, 0, 0, 1, 1,
0.6337219, 1.058896, 1.984486, 1, 0, 0, 1, 1,
0.6357791, -0.1442483, 1.14456, 1, 0, 0, 1, 1,
0.6365061, -1.001416, 3.829556, 0, 0, 0, 1, 1,
0.6382583, 0.01091767, 1.776469, 0, 0, 0, 1, 1,
0.6392999, 0.6520552, -0.3694324, 0, 0, 0, 1, 1,
0.641692, 0.4952012, 1.562307, 0, 0, 0, 1, 1,
0.6475555, -0.5505111, 1.915848, 0, 0, 0, 1, 1,
0.6480374, -0.9732366, 3.610941, 0, 0, 0, 1, 1,
0.6480904, 0.212011, 1.161462, 0, 0, 0, 1, 1,
0.6483805, 0.1838144, 0.8719304, 1, 1, 1, 1, 1,
0.653206, 0.5721985, 1.384177, 1, 1, 1, 1, 1,
0.6542252, -0.614247, 1.637491, 1, 1, 1, 1, 1,
0.6543943, -0.1480018, 2.016514, 1, 1, 1, 1, 1,
0.6577337, -0.008484067, 1.029581, 1, 1, 1, 1, 1,
0.6598272, 0.5176067, 0.8525591, 1, 1, 1, 1, 1,
0.6612142, -0.8253247, 2.269703, 1, 1, 1, 1, 1,
0.6622078, -1.72691, 1.66644, 1, 1, 1, 1, 1,
0.6660091, 1.504335, -0.5243047, 1, 1, 1, 1, 1,
0.6685609, 0.1854957, 0.5854362, 1, 1, 1, 1, 1,
0.6690083, -0.578014, 3.329783, 1, 1, 1, 1, 1,
0.6751869, -0.5077186, 3.325499, 1, 1, 1, 1, 1,
0.6842409, 0.5394759, 0.9562206, 1, 1, 1, 1, 1,
0.6869501, 0.410115, 0.7837889, 1, 1, 1, 1, 1,
0.6869748, 1.234753, 0.7713027, 1, 1, 1, 1, 1,
0.6883464, -0.1539647, 2.171129, 0, 0, 1, 1, 1,
0.6954832, 1.070425, 0.3120391, 1, 0, 0, 1, 1,
0.6983564, 0.3810661, 0.9698291, 1, 0, 0, 1, 1,
0.7002272, -0.7052493, 1.01138, 1, 0, 0, 1, 1,
0.7007935, 0.5397044, -0.4672542, 1, 0, 0, 1, 1,
0.7031826, 0.4951366, -0.2169628, 1, 0, 0, 1, 1,
0.7039015, 0.4926431, 1.725, 0, 0, 0, 1, 1,
0.7046016, 0.387243, 0.9556985, 0, 0, 0, 1, 1,
0.7048833, -0.405945, 2.32522, 0, 0, 0, 1, 1,
0.7053055, -0.6456455, 5.580195, 0, 0, 0, 1, 1,
0.7091693, 0.6057068, 1.822765, 0, 0, 0, 1, 1,
0.7093056, -1.319537, 2.201601, 0, 0, 0, 1, 1,
0.7106107, -0.5511414, 1.815273, 0, 0, 0, 1, 1,
0.7117612, -0.2689514, 2.522351, 1, 1, 1, 1, 1,
0.7155181, 1.951838, 0.2315605, 1, 1, 1, 1, 1,
0.7173942, 0.5843647, -0.02941236, 1, 1, 1, 1, 1,
0.7212626, 0.3124885, 1.302518, 1, 1, 1, 1, 1,
0.7216225, -0.4179419, 2.107239, 1, 1, 1, 1, 1,
0.7216399, -0.1616023, 0.4779395, 1, 1, 1, 1, 1,
0.7254765, -0.5613484, 4.220733, 1, 1, 1, 1, 1,
0.727058, -1.619192, 1.865115, 1, 1, 1, 1, 1,
0.7271547, -1.526421, 2.822584, 1, 1, 1, 1, 1,
0.7331024, -0.4870588, 1.551831, 1, 1, 1, 1, 1,
0.7362491, -1.024975, 3.314748, 1, 1, 1, 1, 1,
0.7377837, -0.7688841, 2.346094, 1, 1, 1, 1, 1,
0.7392646, -0.2799825, 2.384509, 1, 1, 1, 1, 1,
0.7436547, 0.33033, 2.549361, 1, 1, 1, 1, 1,
0.7442503, -0.5365559, 1.886689, 1, 1, 1, 1, 1,
0.7442567, 0.5812921, 0.940931, 0, 0, 1, 1, 1,
0.7460821, -0.03410404, 1.144938, 1, 0, 0, 1, 1,
0.7490658, 0.7624348, -0.5882269, 1, 0, 0, 1, 1,
0.7517895, -0.1642092, -0.2393039, 1, 0, 0, 1, 1,
0.7531428, 0.1433322, 2.057997, 1, 0, 0, 1, 1,
0.7532046, 0.8664634, 0.8650125, 1, 0, 0, 1, 1,
0.7535839, 0.1289167, 0.3231978, 0, 0, 0, 1, 1,
0.7555931, -1.12291, 2.291627, 0, 0, 0, 1, 1,
0.7603481, -0.6574898, 1.258829, 0, 0, 0, 1, 1,
0.760716, 0.4261659, 1.211497, 0, 0, 0, 1, 1,
0.7670173, 1.148188, 0.4250087, 0, 0, 0, 1, 1,
0.7675623, 0.21848, 2.05259, 0, 0, 0, 1, 1,
0.7723486, -0.2257632, 1.78264, 0, 0, 0, 1, 1,
0.7764593, 0.1726237, 3.081486, 1, 1, 1, 1, 1,
0.77865, -0.5997514, 1.129688, 1, 1, 1, 1, 1,
0.7864324, -0.8363994, 2.993859, 1, 1, 1, 1, 1,
0.7942909, 2.178037, -0.8213537, 1, 1, 1, 1, 1,
0.7946564, 0.4388996, 0.1236788, 1, 1, 1, 1, 1,
0.7948329, -0.4981643, 2.794599, 1, 1, 1, 1, 1,
0.7997986, 0.2793652, 1.864918, 1, 1, 1, 1, 1,
0.8087631, 0.3285215, 1.13371, 1, 1, 1, 1, 1,
0.8118626, -2.219625, 2.81965, 1, 1, 1, 1, 1,
0.8138768, 0.9046502, 2.30391, 1, 1, 1, 1, 1,
0.8235163, -0.185344, 1.700612, 1, 1, 1, 1, 1,
0.8296846, 1.600103, 2.003256, 1, 1, 1, 1, 1,
0.8307857, -0.01623001, 1.587046, 1, 1, 1, 1, 1,
0.8336411, 1.885304, 2.089276, 1, 1, 1, 1, 1,
0.8347011, 1.165305, 0.05287532, 1, 1, 1, 1, 1,
0.8363408, -1.464253, 2.904185, 0, 0, 1, 1, 1,
0.8416089, 2.161017, 1.142346, 1, 0, 0, 1, 1,
0.8426604, -1.247629, 2.388682, 1, 0, 0, 1, 1,
0.8441329, 0.3815565, 3.412871, 1, 0, 0, 1, 1,
0.8551981, 1.242011, -0.04464847, 1, 0, 0, 1, 1,
0.8570266, -1.592302, 1.889316, 1, 0, 0, 1, 1,
0.8583448, 1.083481, 0.7842396, 0, 0, 0, 1, 1,
0.8593594, -1.833484, 1.175595, 0, 0, 0, 1, 1,
0.8652489, 1.176128, -1.047909, 0, 0, 0, 1, 1,
0.8655784, 0.4024811, 3.233736, 0, 0, 0, 1, 1,
0.8686422, 0.5342509, 1.65096, 0, 0, 0, 1, 1,
0.8706667, 0.882674, -0.3301598, 0, 0, 0, 1, 1,
0.8851334, -1.314274, 2.26854, 0, 0, 0, 1, 1,
0.8924327, 0.2040423, 1.137787, 1, 1, 1, 1, 1,
0.8927461, 0.2990606, 0.6317335, 1, 1, 1, 1, 1,
0.8992209, -1.78117, 1.447453, 1, 1, 1, 1, 1,
0.9034782, -0.9409471, 1.822319, 1, 1, 1, 1, 1,
0.9043028, 0.9419546, 2.983221, 1, 1, 1, 1, 1,
0.9088024, 1.805659, 0.7678726, 1, 1, 1, 1, 1,
0.9145445, -1.225427, 3.735988, 1, 1, 1, 1, 1,
0.9171495, -0.08275407, 0.01034947, 1, 1, 1, 1, 1,
0.9226952, -0.5900042, 2.176224, 1, 1, 1, 1, 1,
0.9323297, 0.00495765, 2.595904, 1, 1, 1, 1, 1,
0.9328047, 0.3280688, 0.1953397, 1, 1, 1, 1, 1,
0.943906, -0.6673308, 3.141364, 1, 1, 1, 1, 1,
0.9444023, -1.880694, 3.49793, 1, 1, 1, 1, 1,
0.9479928, 0.7129707, 0.2765093, 1, 1, 1, 1, 1,
0.9484214, 0.3031996, 1.219437, 1, 1, 1, 1, 1,
0.9563255, -0.8013325, 3.179377, 0, 0, 1, 1, 1,
0.9567748, 0.1471333, 2.215141, 1, 0, 0, 1, 1,
0.9583825, 2.834053, 0.1664632, 1, 0, 0, 1, 1,
0.9587803, -0.2715641, 2.238688, 1, 0, 0, 1, 1,
0.9647957, 0.3867583, 1.090906, 1, 0, 0, 1, 1,
0.9769562, -1.464644, 4.509802, 1, 0, 0, 1, 1,
0.9870341, -0.7904235, 2.473741, 0, 0, 0, 1, 1,
0.9892303, -0.9276809, 2.538823, 0, 0, 0, 1, 1,
0.9898154, -0.3642382, 1.661645, 0, 0, 0, 1, 1,
0.993946, 0.6391942, 1.489237, 0, 0, 0, 1, 1,
0.9995442, -0.3390514, 1.1454, 0, 0, 0, 1, 1,
0.9995965, 0.4251437, 1.569648, 0, 0, 0, 1, 1,
1.002978, 0.2993738, -0.09718125, 0, 0, 0, 1, 1,
1.006955, 0.9875693, 1.932957, 1, 1, 1, 1, 1,
1.007471, 0.07832663, 0.4811691, 1, 1, 1, 1, 1,
1.013273, 0.5786345, 2.421153, 1, 1, 1, 1, 1,
1.014116, -1.217546, 2.595588, 1, 1, 1, 1, 1,
1.014968, -0.8187709, 2.49782, 1, 1, 1, 1, 1,
1.0152, 0.2599903, 0.637153, 1, 1, 1, 1, 1,
1.023644, 1.141234, -0.5522916, 1, 1, 1, 1, 1,
1.025882, -0.2773777, 1.253825, 1, 1, 1, 1, 1,
1.027459, -1.328082, 2.469308, 1, 1, 1, 1, 1,
1.040955, -0.3678823, -0.7049376, 1, 1, 1, 1, 1,
1.042743, -2.061905, 3.02164, 1, 1, 1, 1, 1,
1.046603, -1.987134, 4.3149, 1, 1, 1, 1, 1,
1.050546, 1.266868, 1.226498, 1, 1, 1, 1, 1,
1.053662, -0.306518, 1.196911, 1, 1, 1, 1, 1,
1.055489, -0.06454169, 1.569818, 1, 1, 1, 1, 1,
1.057644, 0.0148431, 2.192886, 0, 0, 1, 1, 1,
1.066018, 0.2921346, 2.185272, 1, 0, 0, 1, 1,
1.066142, 0.4448555, -0.2677227, 1, 0, 0, 1, 1,
1.092833, -0.5030188, 2.045812, 1, 0, 0, 1, 1,
1.094833, -1.23383, 1.86882, 1, 0, 0, 1, 1,
1.099892, -0.4108045, 4.161003, 1, 0, 0, 1, 1,
1.101215, -1.144848, 3.28657, 0, 0, 0, 1, 1,
1.107827, -1.279833, 2.727942, 0, 0, 0, 1, 1,
1.111457, -0.8274491, 1.983818, 0, 0, 0, 1, 1,
1.112178, 1.915487, 0.3051649, 0, 0, 0, 1, 1,
1.118125, -0.7480738, 1.219657, 0, 0, 0, 1, 1,
1.127193, 0.1203365, 0.7268787, 0, 0, 0, 1, 1,
1.133426, -0.7715914, 3.144063, 0, 0, 0, 1, 1,
1.146255, 0.4260801, 1.30681, 1, 1, 1, 1, 1,
1.146966, -1.71936, 2.548905, 1, 1, 1, 1, 1,
1.14849, 1.529868, -0.0805279, 1, 1, 1, 1, 1,
1.152649, 0.7356918, 0.3945721, 1, 1, 1, 1, 1,
1.153605, -1.317317, 2.88344, 1, 1, 1, 1, 1,
1.15496, 1.239307, 0.1354872, 1, 1, 1, 1, 1,
1.157461, 0.1751142, 1.172107, 1, 1, 1, 1, 1,
1.165386, 0.6251054, 1.367039, 1, 1, 1, 1, 1,
1.17545, 1.822515, -0.2521895, 1, 1, 1, 1, 1,
1.177784, -0.1121446, 0.867066, 1, 1, 1, 1, 1,
1.183199, 0.01184938, 0.9032313, 1, 1, 1, 1, 1,
1.183732, 0.5742906, 0.6268618, 1, 1, 1, 1, 1,
1.185289, 0.7573234, 1.799688, 1, 1, 1, 1, 1,
1.188727, -0.31094, 1.5278, 1, 1, 1, 1, 1,
1.196002, -0.6146731, 2.638589, 1, 1, 1, 1, 1,
1.196579, 1.422523, 0.2276448, 0, 0, 1, 1, 1,
1.203721, 1.145428, -1.417206, 1, 0, 0, 1, 1,
1.203749, 0.6029535, 0.8093384, 1, 0, 0, 1, 1,
1.206178, 0.3139734, 3.632551, 1, 0, 0, 1, 1,
1.23379, 0.4325577, 1.086728, 1, 0, 0, 1, 1,
1.246645, 1.905336, 0.2300726, 1, 0, 0, 1, 1,
1.251213, 0.0579941, 3.283104, 0, 0, 0, 1, 1,
1.251393, 1.377497, 0.5061721, 0, 0, 0, 1, 1,
1.251757, 0.3563069, 1.751903, 0, 0, 0, 1, 1,
1.253326, -1.71555, 1.635596, 0, 0, 0, 1, 1,
1.253727, -1.048435, 1.464354, 0, 0, 0, 1, 1,
1.254827, -1.220374, 3.969588, 0, 0, 0, 1, 1,
1.271865, -0.4084417, 3.231594, 0, 0, 0, 1, 1,
1.273951, -0.7015041, 2.497632, 1, 1, 1, 1, 1,
1.276659, 2.077547, -1.940795, 1, 1, 1, 1, 1,
1.281604, -2.537645, 3.136024, 1, 1, 1, 1, 1,
1.293925, -0.1990302, 2.108677, 1, 1, 1, 1, 1,
1.294219, 1.526613, 1.769488, 1, 1, 1, 1, 1,
1.295559, 2.392467, -0.2655974, 1, 1, 1, 1, 1,
1.295862, -0.1162762, 0.9277895, 1, 1, 1, 1, 1,
1.30355, -0.3538671, 2.173719, 1, 1, 1, 1, 1,
1.30533, 0.4932667, 2.660379, 1, 1, 1, 1, 1,
1.321038, -0.2822278, 1.829746, 1, 1, 1, 1, 1,
1.322741, -0.3682501, 1.602396, 1, 1, 1, 1, 1,
1.32639, 0.7279045, -0.05708025, 1, 1, 1, 1, 1,
1.338215, 0.6257365, 2.649814, 1, 1, 1, 1, 1,
1.340177, 0.0613517, 3.458834, 1, 1, 1, 1, 1,
1.344173, 1.194671, 1.498254, 1, 1, 1, 1, 1,
1.348346, -1.001728, 2.295314, 0, 0, 1, 1, 1,
1.362464, -0.5920112, 2.319129, 1, 0, 0, 1, 1,
1.363763, -0.01492584, 0.8025073, 1, 0, 0, 1, 1,
1.37028, -0.071351, 1.821099, 1, 0, 0, 1, 1,
1.383106, 0.6113631, 1.802398, 1, 0, 0, 1, 1,
1.391868, -0.5233717, 1.093111, 1, 0, 0, 1, 1,
1.394084, -1.065628, 2.61418, 0, 0, 0, 1, 1,
1.396485, 0.1948988, 1.892389, 0, 0, 0, 1, 1,
1.398355, -0.6183649, 0.6208495, 0, 0, 0, 1, 1,
1.398618, 1.19768, 0.7156966, 0, 0, 0, 1, 1,
1.400001, 1.404298, 2.269016, 0, 0, 0, 1, 1,
1.409411, -0.3960415, 1.47067, 0, 0, 0, 1, 1,
1.410623, -0.8121182, 0.198258, 0, 0, 0, 1, 1,
1.421216, 3.529535, 0.580431, 1, 1, 1, 1, 1,
1.42492, -0.8797652, 2.449008, 1, 1, 1, 1, 1,
1.430908, -0.1474913, 0.5025634, 1, 1, 1, 1, 1,
1.431784, 1.033724, -0.9729154, 1, 1, 1, 1, 1,
1.441413, 2.4717, -0.2734804, 1, 1, 1, 1, 1,
1.454221, 0.7243814, 2.49962, 1, 1, 1, 1, 1,
1.457295, -0.006951444, 1.613569, 1, 1, 1, 1, 1,
1.462684, -0.8640175, 2.701682, 1, 1, 1, 1, 1,
1.490099, 0.1082854, 0.6354017, 1, 1, 1, 1, 1,
1.496653, -0.4384282, 0.9523028, 1, 1, 1, 1, 1,
1.528426, 0.5044459, -1.073291, 1, 1, 1, 1, 1,
1.55362, -0.2602607, 0.393827, 1, 1, 1, 1, 1,
1.556755, 1.311501, 0.530337, 1, 1, 1, 1, 1,
1.558647, 0.5340952, 0.5536693, 1, 1, 1, 1, 1,
1.561116, 0.2407392, 0.2799667, 1, 1, 1, 1, 1,
1.569503, -1.355674, 1.464412, 0, 0, 1, 1, 1,
1.574132, 0.7905855, 2.265365, 1, 0, 0, 1, 1,
1.589159, 0.8491926, 1.369111, 1, 0, 0, 1, 1,
1.592419, -0.4022806, 0.9535726, 1, 0, 0, 1, 1,
1.601354, -0.8772445, 3.552037, 1, 0, 0, 1, 1,
1.617458, 1.138242, 2.379088, 1, 0, 0, 1, 1,
1.620617, -1.096747, 1.522588, 0, 0, 0, 1, 1,
1.625481, 0.248713, -0.01296979, 0, 0, 0, 1, 1,
1.646133, -0.7033575, 1.829678, 0, 0, 0, 1, 1,
1.652281, 1.006076, 1.482011, 0, 0, 0, 1, 1,
1.652544, 1.549606, 0.9345417, 0, 0, 0, 1, 1,
1.658954, -0.3646353, 2.729604, 0, 0, 0, 1, 1,
1.662372, 0.8926727, 1.316, 0, 0, 0, 1, 1,
1.670638, -0.6770241, 3.340357, 1, 1, 1, 1, 1,
1.697473, -0.08639669, 0.7759134, 1, 1, 1, 1, 1,
1.704795, -0.01221913, 3.776851, 1, 1, 1, 1, 1,
1.761781, 0.1495288, 1.700006, 1, 1, 1, 1, 1,
1.771239, 0.4821886, 2.301654, 1, 1, 1, 1, 1,
1.778428, 1.700047, 2.005368, 1, 1, 1, 1, 1,
1.78111, 1.320372, 0.7940011, 1, 1, 1, 1, 1,
1.807866, -0.9216465, 2.615013, 1, 1, 1, 1, 1,
1.817183, -1.395631, 3.621933, 1, 1, 1, 1, 1,
1.823618, 1.640977, 1.698724, 1, 1, 1, 1, 1,
1.849186, 0.2241053, 4.542351, 1, 1, 1, 1, 1,
1.87211, 0.505307, 1.92846, 1, 1, 1, 1, 1,
1.872497, -0.8326045, 1.1791, 1, 1, 1, 1, 1,
1.9223, 0.09542377, 2.028479, 1, 1, 1, 1, 1,
1.922823, 0.1860414, 0.06981127, 1, 1, 1, 1, 1,
1.926381, -1.035411, 1.342255, 0, 0, 1, 1, 1,
1.934234, -0.7611133, 1.897505, 1, 0, 0, 1, 1,
1.964482, 1.903963, 1.663967, 1, 0, 0, 1, 1,
1.977276, 0.5996722, 1.62555, 1, 0, 0, 1, 1,
2.026537, -0.8826846, 3.433785, 1, 0, 0, 1, 1,
2.032063, -0.4197295, 0.7691205, 1, 0, 0, 1, 1,
2.087503, -0.4013872, 3.952522, 0, 0, 0, 1, 1,
2.182357, -0.1055297, 0.6521717, 0, 0, 0, 1, 1,
2.244048, -0.1292011, 1.933141, 0, 0, 0, 1, 1,
2.246343, -0.7620416, 4.062745, 0, 0, 0, 1, 1,
2.257583, -0.7001395, 1.472102, 0, 0, 0, 1, 1,
2.267572, -1.131556, -0.247668, 0, 0, 0, 1, 1,
2.295378, 0.4718803, 2.026976, 0, 0, 0, 1, 1,
2.30093, -1.284026, 0.9633591, 1, 1, 1, 1, 1,
2.449369, 0.6203911, 3.830585, 1, 1, 1, 1, 1,
2.472495, 1.957128, 0.8022976, 1, 1, 1, 1, 1,
2.666389, 0.9005598, 2.866383, 1, 1, 1, 1, 1,
2.710579, -0.1035963, 1.61468, 1, 1, 1, 1, 1,
2.891691, -1.398968, 1.015985, 1, 1, 1, 1, 1,
2.928041, 1.471138, 0.7231751, 1, 1, 1, 1, 1
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
var radius = 9.731314;
var distance = 34.18083;
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
mvMatrix.translate( 0.2167139, -0.3238028, 0.007370949 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.18083);
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
