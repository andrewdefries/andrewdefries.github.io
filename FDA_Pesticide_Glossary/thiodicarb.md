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
-3.105793, 2.399837, -2.159466, 1, 0, 0, 1,
-2.595574, 0.08623759, -2.769982, 1, 0.007843138, 0, 1,
-2.534345, -0.5822177, -1.346675, 1, 0.01176471, 0, 1,
-2.533095, 0.4339562, -1.57064, 1, 0.01960784, 0, 1,
-2.49304, 0.5535033, -0.1657083, 1, 0.02352941, 0, 1,
-2.290765, 0.9237267, -1.399592, 1, 0.03137255, 0, 1,
-2.284384, 0.2759221, -2.706712, 1, 0.03529412, 0, 1,
-2.280775, -1.853536, -0.4520762, 1, 0.04313726, 0, 1,
-2.266319, -1.09793, -2.143579, 1, 0.04705882, 0, 1,
-2.264814, 0.3510711, -0.3420389, 1, 0.05490196, 0, 1,
-2.2589, -0.1573904, -1.510237, 1, 0.05882353, 0, 1,
-2.205536, -1.216039, -3.06867, 1, 0.06666667, 0, 1,
-2.193138, 0.1031814, -1.847899, 1, 0.07058824, 0, 1,
-2.113112, -0.8094386, -2.568463, 1, 0.07843138, 0, 1,
-2.104716, 0.3958142, -3.702985, 1, 0.08235294, 0, 1,
-2.082664, -0.277089, -1.225862, 1, 0.09019608, 0, 1,
-2.065593, 1.291465, -2.093844, 1, 0.09411765, 0, 1,
-2.063438, -1.301459, -2.099922, 1, 0.1019608, 0, 1,
-2.058607, -1.040133, -1.74459, 1, 0.1098039, 0, 1,
-2.011611, -0.8220854, -3.112582, 1, 0.1137255, 0, 1,
-1.993957, 0.1630168, -1.019531, 1, 0.1215686, 0, 1,
-1.99139, 0.8068784, -0.8837726, 1, 0.1254902, 0, 1,
-1.99096, 0.700052, -1.604844, 1, 0.1333333, 0, 1,
-1.975249, 0.6356744, -1.121867, 1, 0.1372549, 0, 1,
-1.969109, -0.09534193, -3.73586, 1, 0.145098, 0, 1,
-1.883603, 0.3662923, -2.278567, 1, 0.1490196, 0, 1,
-1.861723, -0.1138903, -0.7728063, 1, 0.1568628, 0, 1,
-1.853572, 0.02225239, -2.649569, 1, 0.1607843, 0, 1,
-1.845412, -0.5513135, -2.122038, 1, 0.1686275, 0, 1,
-1.806459, 1.070102, -0.8296323, 1, 0.172549, 0, 1,
-1.791441, -0.6983783, -2.145883, 1, 0.1803922, 0, 1,
-1.749265, 0.1766374, -1.870658, 1, 0.1843137, 0, 1,
-1.738587, 1.376425, -0.7248672, 1, 0.1921569, 0, 1,
-1.734138, 0.8165875, -1.51734, 1, 0.1960784, 0, 1,
-1.730531, 1.163923, -0.2259675, 1, 0.2039216, 0, 1,
-1.725559, 1.483161, 0.980096, 1, 0.2117647, 0, 1,
-1.722716, -0.4574852, -1.959793, 1, 0.2156863, 0, 1,
-1.692344, 0.1143598, -0.6134222, 1, 0.2235294, 0, 1,
-1.682454, 0.8115122, -0.689706, 1, 0.227451, 0, 1,
-1.679549, -0.7375768, -1.779336, 1, 0.2352941, 0, 1,
-1.677312, -0.4609951, -2.043592, 1, 0.2392157, 0, 1,
-1.67342, 0.1888401, -2.739203, 1, 0.2470588, 0, 1,
-1.661085, -0.5260214, -2.235366, 1, 0.2509804, 0, 1,
-1.658546, 0.8298573, -2.934994, 1, 0.2588235, 0, 1,
-1.657598, 0.4730631, -2.18825, 1, 0.2627451, 0, 1,
-1.654733, 0.2089632, -2.927242, 1, 0.2705882, 0, 1,
-1.646808, -0.08806959, -0.4985761, 1, 0.2745098, 0, 1,
-1.641171, -0.7179177, -3.395017, 1, 0.282353, 0, 1,
-1.62643, -0.02535955, -2.45493, 1, 0.2862745, 0, 1,
-1.611372, -0.7562783, -3.521353, 1, 0.2941177, 0, 1,
-1.607925, 0.1646978, -2.022908, 1, 0.3019608, 0, 1,
-1.597953, -0.2041093, -0.6418908, 1, 0.3058824, 0, 1,
-1.593431, 0.4987215, -1.821497, 1, 0.3137255, 0, 1,
-1.575058, 0.2401653, 0.4791697, 1, 0.3176471, 0, 1,
-1.575029, -0.4859009, -2.597708, 1, 0.3254902, 0, 1,
-1.574556, 1.761622, 0.8013611, 1, 0.3294118, 0, 1,
-1.566468, 0.694398, 0.5013368, 1, 0.3372549, 0, 1,
-1.565262, 0.1010368, -1.737971, 1, 0.3411765, 0, 1,
-1.551816, 0.1159506, -2.567976, 1, 0.3490196, 0, 1,
-1.539716, 0.3723558, -0.4864758, 1, 0.3529412, 0, 1,
-1.514232, 1.042048, -1.29637, 1, 0.3607843, 0, 1,
-1.500651, 2.138453, -0.7890837, 1, 0.3647059, 0, 1,
-1.491128, 0.8127295, -0.3038564, 1, 0.372549, 0, 1,
-1.491087, -1.01667, -1.008321, 1, 0.3764706, 0, 1,
-1.479547, 0.442815, -1.809058, 1, 0.3843137, 0, 1,
-1.470667, -0.9217753, -1.261551, 1, 0.3882353, 0, 1,
-1.468264, -1.258613, -0.3092, 1, 0.3960784, 0, 1,
-1.462487, -2.163799, -2.594115, 1, 0.4039216, 0, 1,
-1.46054, -1.009456, -2.352986, 1, 0.4078431, 0, 1,
-1.456618, -1.654142, -2.19226, 1, 0.4156863, 0, 1,
-1.441393, 0.6787395, -0.6205673, 1, 0.4196078, 0, 1,
-1.434764, 0.03920572, -1.735433, 1, 0.427451, 0, 1,
-1.433312, -0.5441107, 1.030452, 1, 0.4313726, 0, 1,
-1.428933, 1.027644, -1.40965, 1, 0.4392157, 0, 1,
-1.423841, 0.2063358, -2.30428, 1, 0.4431373, 0, 1,
-1.422237, 0.09498275, -3.021271, 1, 0.4509804, 0, 1,
-1.415627, 0.5143932, -2.227728, 1, 0.454902, 0, 1,
-1.410784, 0.05851894, -3.426233, 1, 0.4627451, 0, 1,
-1.409532, -0.09035536, -2.252358, 1, 0.4666667, 0, 1,
-1.400284, 0.1066068, -1.192184, 1, 0.4745098, 0, 1,
-1.399554, 1.56322, -0.2569095, 1, 0.4784314, 0, 1,
-1.391514, 0.2352316, -1.144884, 1, 0.4862745, 0, 1,
-1.385241, 0.000773101, -2.124549, 1, 0.4901961, 0, 1,
-1.376508, -0.8299022, -4.422456, 1, 0.4980392, 0, 1,
-1.354642, -1.962604, -3.599354, 1, 0.5058824, 0, 1,
-1.349085, 0.4903618, 1.593215, 1, 0.509804, 0, 1,
-1.345863, -0.7897184, -1.113356, 1, 0.5176471, 0, 1,
-1.343365, -0.02816788, -1.999728, 1, 0.5215687, 0, 1,
-1.341161, 0.7820948, -1.938071, 1, 0.5294118, 0, 1,
-1.34016, -0.2201523, -1.525568, 1, 0.5333334, 0, 1,
-1.334818, 1.300683, -2.018263, 1, 0.5411765, 0, 1,
-1.331338, -1.162028, -2.163152, 1, 0.5450981, 0, 1,
-1.329901, -1.027064, -2.239419, 1, 0.5529412, 0, 1,
-1.329786, -2.04899, -4.037172, 1, 0.5568628, 0, 1,
-1.32503, -0.5235329, -1.609475, 1, 0.5647059, 0, 1,
-1.318918, -1.713495, -0.585843, 1, 0.5686275, 0, 1,
-1.309534, 0.2827433, 0.7257743, 1, 0.5764706, 0, 1,
-1.300183, -0.07934167, -2.184697, 1, 0.5803922, 0, 1,
-1.292888, 1.044608, 0.8805835, 1, 0.5882353, 0, 1,
-1.292142, -1.60081, -1.434288, 1, 0.5921569, 0, 1,
-1.285924, 0.5639768, -2.167731, 1, 0.6, 0, 1,
-1.283392, 0.01140563, 0.2705634, 1, 0.6078432, 0, 1,
-1.281913, -1.233947, -2.809222, 1, 0.6117647, 0, 1,
-1.281678, -1.647429, -1.699351, 1, 0.6196079, 0, 1,
-1.272906, 2.148774, 0.6354128, 1, 0.6235294, 0, 1,
-1.257966, 1.077426, 0.2960284, 1, 0.6313726, 0, 1,
-1.250258, 0.3670507, -2.660471, 1, 0.6352941, 0, 1,
-1.23675, 1.250079, -1.717241, 1, 0.6431373, 0, 1,
-1.221379, -0.8386419, -3.126111, 1, 0.6470588, 0, 1,
-1.213382, -0.3759155, -2.777853, 1, 0.654902, 0, 1,
-1.205046, 1.442054, -0.6917099, 1, 0.6588235, 0, 1,
-1.201724, 0.3166184, -1.567509, 1, 0.6666667, 0, 1,
-1.199072, -0.9143777, -2.714507, 1, 0.6705883, 0, 1,
-1.193811, -0.6619743, -1.483803, 1, 0.6784314, 0, 1,
-1.190446, -0.0493978, -0.7095619, 1, 0.682353, 0, 1,
-1.189794, 0.5064579, -1.425416, 1, 0.6901961, 0, 1,
-1.185444, -0.2713528, -0.8938043, 1, 0.6941177, 0, 1,
-1.183394, -0.9898224, -2.72714, 1, 0.7019608, 0, 1,
-1.171139, -1.350273, -1.765566, 1, 0.7098039, 0, 1,
-1.167121, -1.549495, -4.428386, 1, 0.7137255, 0, 1,
-1.166828, 1.547253, -0.8643404, 1, 0.7215686, 0, 1,
-1.166737, 1.118878, -1.439682, 1, 0.7254902, 0, 1,
-1.165664, 0.1424673, -4.220846, 1, 0.7333333, 0, 1,
-1.154778, -1.221832, -2.799392, 1, 0.7372549, 0, 1,
-1.149297, -1.254915, -0.4281325, 1, 0.7450981, 0, 1,
-1.136751, 0.7613668, -0.1633231, 1, 0.7490196, 0, 1,
-1.131336, 0.7943081, -1.306072, 1, 0.7568628, 0, 1,
-1.129982, -1.050089, -1.942581, 1, 0.7607843, 0, 1,
-1.124697, 0.8599207, -0.0835766, 1, 0.7686275, 0, 1,
-1.123759, -0.3767203, -3.088185, 1, 0.772549, 0, 1,
-1.122187, -0.3826558, -1.574114, 1, 0.7803922, 0, 1,
-1.121698, 1.202427, -1.909762, 1, 0.7843137, 0, 1,
-1.119693, 0.614051, -1.681529, 1, 0.7921569, 0, 1,
-1.10907, 0.04503177, -0.4024518, 1, 0.7960784, 0, 1,
-1.100549, 0.7302964, -2.049037, 1, 0.8039216, 0, 1,
-1.099339, 0.7100571, 0.3147977, 1, 0.8117647, 0, 1,
-1.098241, 0.1794047, -0.4007854, 1, 0.8156863, 0, 1,
-1.091044, 0.8927327, -2.182786, 1, 0.8235294, 0, 1,
-1.089957, -0.4249263, -2.269358, 1, 0.827451, 0, 1,
-1.087227, 0.2240043, 0.5006397, 1, 0.8352941, 0, 1,
-1.086071, 0.3059582, -1.530095, 1, 0.8392157, 0, 1,
-1.0857, -1.676757, -2.5059, 1, 0.8470588, 0, 1,
-1.081116, -0.2933625, -3.592834, 1, 0.8509804, 0, 1,
-1.079571, 0.3158011, -3.189107, 1, 0.8588235, 0, 1,
-1.078258, -0.2138946, -2.112683, 1, 0.8627451, 0, 1,
-1.0744, 0.5502858, -1.41983, 1, 0.8705882, 0, 1,
-1.072768, 0.9558571, -1.176944, 1, 0.8745098, 0, 1,
-1.071714, 1.22896, -1.311796, 1, 0.8823529, 0, 1,
-1.066002, -1.095297, -2.031873, 1, 0.8862745, 0, 1,
-1.064536, 0.314162, -1.792638, 1, 0.8941177, 0, 1,
-1.063687, -1.162808, 0.003280456, 1, 0.8980392, 0, 1,
-1.063599, 0.06997862, -1.4876, 1, 0.9058824, 0, 1,
-1.046573, -0.7568625, -2.832916, 1, 0.9137255, 0, 1,
-1.046292, -0.9683304, -1.353648, 1, 0.9176471, 0, 1,
-1.044288, -0.4482962, -1.637354, 1, 0.9254902, 0, 1,
-1.043854, -1.381194, -5.019308, 1, 0.9294118, 0, 1,
-1.041688, -0.4871539, -2.267512, 1, 0.9372549, 0, 1,
-1.036204, 0.3306228, -2.021456, 1, 0.9411765, 0, 1,
-1.034845, -0.6310338, -2.464357, 1, 0.9490196, 0, 1,
-1.028797, 0.1047382, -1.390884, 1, 0.9529412, 0, 1,
-1.021498, 0.6345586, -0.09257647, 1, 0.9607843, 0, 1,
-1.018201, 0.383559, -1.795216, 1, 0.9647059, 0, 1,
-1.003268, 0.9013109, -0.8752788, 1, 0.972549, 0, 1,
-1.002648, 0.6432759, -0.2821791, 1, 0.9764706, 0, 1,
-0.9976576, -1.278629, -4.218874, 1, 0.9843137, 0, 1,
-0.9934943, -0.8130977, -2.222303, 1, 0.9882353, 0, 1,
-0.9840472, -0.03377979, 0.1964593, 1, 0.9960784, 0, 1,
-0.9830176, -1.217785, -2.066733, 0.9960784, 1, 0, 1,
-0.9824392, 0.7236198, -0.4405678, 0.9921569, 1, 0, 1,
-0.9816051, 0.5813615, -0.3779445, 0.9843137, 1, 0, 1,
-0.9734802, -1.014245, -2.189979, 0.9803922, 1, 0, 1,
-0.9619577, 0.535542, -2.017356, 0.972549, 1, 0, 1,
-0.9604551, 0.4534468, -0.5119068, 0.9686275, 1, 0, 1,
-0.9591016, -0.23241, -2.131183, 0.9607843, 1, 0, 1,
-0.9579433, -1.257049, -3.778234, 0.9568627, 1, 0, 1,
-0.955336, -0.6916232, -2.290943, 0.9490196, 1, 0, 1,
-0.9542682, -0.3413767, -2.841975, 0.945098, 1, 0, 1,
-0.9503189, -0.6540101, -0.8726851, 0.9372549, 1, 0, 1,
-0.9487965, 1.203677, -1.403132, 0.9333333, 1, 0, 1,
-0.9471237, -0.7794397, -2.532043, 0.9254902, 1, 0, 1,
-0.9428683, -0.2277661, -2.578722, 0.9215686, 1, 0, 1,
-0.9423568, -1.490685, -1.239351, 0.9137255, 1, 0, 1,
-0.9381065, -1.402627, -3.501854, 0.9098039, 1, 0, 1,
-0.9349899, 0.4752027, -0.8990356, 0.9019608, 1, 0, 1,
-0.9268652, -0.8693591, -2.558826, 0.8941177, 1, 0, 1,
-0.9190941, -0.2902272, -1.671385, 0.8901961, 1, 0, 1,
-0.9147385, 0.2800591, -1.105382, 0.8823529, 1, 0, 1,
-0.9137717, 0.3939706, 0.349624, 0.8784314, 1, 0, 1,
-0.9115372, -0.1226107, -1.502935, 0.8705882, 1, 0, 1,
-0.9089293, 0.5573967, 0.1843089, 0.8666667, 1, 0, 1,
-0.9067556, 2.706436, 0.1000308, 0.8588235, 1, 0, 1,
-0.905911, 1.142833, -0.1192585, 0.854902, 1, 0, 1,
-0.9040454, -1.133003, -2.186514, 0.8470588, 1, 0, 1,
-0.897396, 0.9863005, -0.3422262, 0.8431373, 1, 0, 1,
-0.8920358, 0.291563, -1.534217, 0.8352941, 1, 0, 1,
-0.8858767, -0.8337771, 0.3346491, 0.8313726, 1, 0, 1,
-0.8838758, 1.628051, -1.966079, 0.8235294, 1, 0, 1,
-0.8834733, -0.8760028, -4.24284, 0.8196079, 1, 0, 1,
-0.8804447, 0.2624268, -1.556479, 0.8117647, 1, 0, 1,
-0.8783533, 1.101827, -1.252253, 0.8078431, 1, 0, 1,
-0.870066, 1.294648, -1.05141, 0.8, 1, 0, 1,
-0.8625413, 0.4747894, -0.2080502, 0.7921569, 1, 0, 1,
-0.8601663, -2.435353, -2.598565, 0.7882353, 1, 0, 1,
-0.8445613, -0.9096598, -2.81626, 0.7803922, 1, 0, 1,
-0.8443945, -0.08179785, -2.674938, 0.7764706, 1, 0, 1,
-0.8397727, -0.3890351, -1.104467, 0.7686275, 1, 0, 1,
-0.838395, 1.316219, -0.3921373, 0.7647059, 1, 0, 1,
-0.8362044, 0.8647677, -1.160235, 0.7568628, 1, 0, 1,
-0.8305051, 1.318695, 0.9811241, 0.7529412, 1, 0, 1,
-0.8244991, 0.1181562, -0.9175662, 0.7450981, 1, 0, 1,
-0.8243043, 1.158592, -1.168666, 0.7411765, 1, 0, 1,
-0.8210584, 1.051732, -1.294774, 0.7333333, 1, 0, 1,
-0.812362, 0.4334279, -2.392283, 0.7294118, 1, 0, 1,
-0.8122425, 1.310659, -0.8775641, 0.7215686, 1, 0, 1,
-0.8091708, 0.9074394, 0.06555807, 0.7176471, 1, 0, 1,
-0.8086868, 0.3100655, -2.391726, 0.7098039, 1, 0, 1,
-0.8077334, 0.2519428, -1.319785, 0.7058824, 1, 0, 1,
-0.8057069, 0.5383706, -0.01881226, 0.6980392, 1, 0, 1,
-0.8051898, 1.273592, -0.7441815, 0.6901961, 1, 0, 1,
-0.8014315, -0.4808642, -0.5090966, 0.6862745, 1, 0, 1,
-0.7892767, 0.5016215, 0.5334048, 0.6784314, 1, 0, 1,
-0.7799668, 1.112614, -1.921829, 0.6745098, 1, 0, 1,
-0.7776146, -0.05026922, -2.804436, 0.6666667, 1, 0, 1,
-0.7753341, -1.715499, -2.31934, 0.6627451, 1, 0, 1,
-0.7744005, 2.213875, -0.8162716, 0.654902, 1, 0, 1,
-0.7641401, -0.3910769, -0.9621717, 0.6509804, 1, 0, 1,
-0.7635384, 0.3755445, -1.156208, 0.6431373, 1, 0, 1,
-0.7566153, 1.449339, -0.03634428, 0.6392157, 1, 0, 1,
-0.7545222, -0.5833196, -0.7957761, 0.6313726, 1, 0, 1,
-0.7512042, -0.01600575, -2.833459, 0.627451, 1, 0, 1,
-0.7502654, 0.5851067, 0.1574535, 0.6196079, 1, 0, 1,
-0.7463554, -1.147609, -3.2753, 0.6156863, 1, 0, 1,
-0.742117, 0.9207942, 0.1550915, 0.6078432, 1, 0, 1,
-0.7392962, -1.063951, -3.076514, 0.6039216, 1, 0, 1,
-0.7305605, -0.8179282, -1.814351, 0.5960785, 1, 0, 1,
-0.730271, -0.9692496, -1.335476, 0.5882353, 1, 0, 1,
-0.7099307, -1.093398, -1.504025, 0.5843138, 1, 0, 1,
-0.7044066, 1.552966, -0.07505885, 0.5764706, 1, 0, 1,
-0.6997488, -0.2114707, -0.6933051, 0.572549, 1, 0, 1,
-0.6977124, -1.107759, -2.854833, 0.5647059, 1, 0, 1,
-0.6972007, -0.1647707, -0.5140686, 0.5607843, 1, 0, 1,
-0.6960912, -0.6263701, -2.167294, 0.5529412, 1, 0, 1,
-0.6951278, -0.199807, -0.4254805, 0.5490196, 1, 0, 1,
-0.6945836, 0.2769961, -2.000928, 0.5411765, 1, 0, 1,
-0.6893703, 0.6218614, -0.5854082, 0.5372549, 1, 0, 1,
-0.6887969, -0.1343539, -3.05836, 0.5294118, 1, 0, 1,
-0.6884625, -1.20397, -2.70246, 0.5254902, 1, 0, 1,
-0.6881856, -1.423841, -4.527322, 0.5176471, 1, 0, 1,
-0.6878422, 0.1710721, -0.274486, 0.5137255, 1, 0, 1,
-0.6841747, 1.186331, -0.6217696, 0.5058824, 1, 0, 1,
-0.673758, -1.548948, -3.138595, 0.5019608, 1, 0, 1,
-0.6691235, -0.01876294, -1.267561, 0.4941176, 1, 0, 1,
-0.6677795, 0.009467909, 0.3001561, 0.4862745, 1, 0, 1,
-0.6627164, 0.8511753, -1.047015, 0.4823529, 1, 0, 1,
-0.6604418, -1.983118, -2.827758, 0.4745098, 1, 0, 1,
-0.653511, 0.7091756, -0.8913518, 0.4705882, 1, 0, 1,
-0.653309, -0.1996483, -1.910556, 0.4627451, 1, 0, 1,
-0.6523476, 0.3992318, -2.489464, 0.4588235, 1, 0, 1,
-0.651862, -0.8154746, -2.285112, 0.4509804, 1, 0, 1,
-0.6496345, 1.645871, -1.195589, 0.4470588, 1, 0, 1,
-0.6440765, 2.303065, 1.537331, 0.4392157, 1, 0, 1,
-0.6390202, -1.70308, -1.923999, 0.4352941, 1, 0, 1,
-0.6370276, 0.104414, -2.140759, 0.427451, 1, 0, 1,
-0.6369797, 0.5612781, -1.582905, 0.4235294, 1, 0, 1,
-0.6357455, 0.2301856, 0.2545318, 0.4156863, 1, 0, 1,
-0.6349949, 0.6016393, -0.9767515, 0.4117647, 1, 0, 1,
-0.632153, -0.0606685, -1.436141, 0.4039216, 1, 0, 1,
-0.6306751, -1.070561, -2.280948, 0.3960784, 1, 0, 1,
-0.6296958, -0.3548266, -2.271897, 0.3921569, 1, 0, 1,
-0.6286441, 0.2555224, -2.729119, 0.3843137, 1, 0, 1,
-0.6248375, 0.9044414, -0.04786691, 0.3803922, 1, 0, 1,
-0.6090399, 0.4857262, 0.782942, 0.372549, 1, 0, 1,
-0.6090283, 0.9941891, -1.931007, 0.3686275, 1, 0, 1,
-0.6057798, -1.991325, -1.162564, 0.3607843, 1, 0, 1,
-0.6050785, 1.185683, -0.117122, 0.3568628, 1, 0, 1,
-0.6020851, -2.032928, -2.108455, 0.3490196, 1, 0, 1,
-0.6020368, 0.07029624, 0.6181777, 0.345098, 1, 0, 1,
-0.5939111, 1.660049, 0.6075341, 0.3372549, 1, 0, 1,
-0.5914527, -1.290677, -1.925727, 0.3333333, 1, 0, 1,
-0.5901347, 0.5117882, -2.16991, 0.3254902, 1, 0, 1,
-0.5872316, -0.4222293, -0.7792755, 0.3215686, 1, 0, 1,
-0.5865576, -0.3847254, -2.930098, 0.3137255, 1, 0, 1,
-0.5855765, 0.3410977, -0.236078, 0.3098039, 1, 0, 1,
-0.5823019, 1.249551, -1.0553, 0.3019608, 1, 0, 1,
-0.5814632, -0.4006845, -1.105306, 0.2941177, 1, 0, 1,
-0.5787656, -0.1522323, -2.859823, 0.2901961, 1, 0, 1,
-0.575191, -1.257121, -4.085572, 0.282353, 1, 0, 1,
-0.575077, 0.7512464, 0.9702194, 0.2784314, 1, 0, 1,
-0.574917, -2.178447, -4.329785, 0.2705882, 1, 0, 1,
-0.5639471, -0.6321325, -4.401207, 0.2666667, 1, 0, 1,
-0.5598923, 2.074696, -0.2988953, 0.2588235, 1, 0, 1,
-0.5572398, -1.705361, -1.609804, 0.254902, 1, 0, 1,
-0.5561051, -1.099844, -2.549004, 0.2470588, 1, 0, 1,
-0.5478057, -0.936201, -0.851106, 0.2431373, 1, 0, 1,
-0.5377619, -1.897244, -0.4832633, 0.2352941, 1, 0, 1,
-0.5366676, 0.1603852, -1.429001, 0.2313726, 1, 0, 1,
-0.5315846, -1.564218, -3.290998, 0.2235294, 1, 0, 1,
-0.5296817, -0.1473115, -1.721413, 0.2196078, 1, 0, 1,
-0.5295627, 2.337221, 0.9433089, 0.2117647, 1, 0, 1,
-0.5290767, -0.5599004, -2.275814, 0.2078431, 1, 0, 1,
-0.5285273, -0.7964482, -2.647998, 0.2, 1, 0, 1,
-0.5213072, -1.830876, -3.156986, 0.1921569, 1, 0, 1,
-0.5206966, 1.222537, 1.255586, 0.1882353, 1, 0, 1,
-0.5177301, 1.369189, -1.387141, 0.1803922, 1, 0, 1,
-0.5096563, -0.03445638, -1.105859, 0.1764706, 1, 0, 1,
-0.5074857, -0.4273312, -3.275653, 0.1686275, 1, 0, 1,
-0.5029196, -1.179857, -5.418856, 0.1647059, 1, 0, 1,
-0.5007136, 0.1543147, -2.514344, 0.1568628, 1, 0, 1,
-0.4976833, -0.2534871, -3.101337, 0.1529412, 1, 0, 1,
-0.4955595, 0.02921401, -1.235338, 0.145098, 1, 0, 1,
-0.487045, -0.1624377, -3.870838, 0.1411765, 1, 0, 1,
-0.4845915, -0.3054428, -1.469161, 0.1333333, 1, 0, 1,
-0.4845735, -0.3747338, -2.514468, 0.1294118, 1, 0, 1,
-0.4815012, 0.6422824, 0.7990826, 0.1215686, 1, 0, 1,
-0.4789152, -1.368681, -1.367293, 0.1176471, 1, 0, 1,
-0.469421, -1.012879, -2.704271, 0.1098039, 1, 0, 1,
-0.4664837, 1.979314, 0.4143907, 0.1058824, 1, 0, 1,
-0.4644656, -0.6999662, -3.297606, 0.09803922, 1, 0, 1,
-0.4636079, -0.6974303, -1.204774, 0.09019608, 1, 0, 1,
-0.4600653, 1.165207, 0.9567914, 0.08627451, 1, 0, 1,
-0.4537885, -0.6811298, -1.005429, 0.07843138, 1, 0, 1,
-0.4523958, 0.1594543, -2.220702, 0.07450981, 1, 0, 1,
-0.4513075, -0.5670581, -4.854058, 0.06666667, 1, 0, 1,
-0.4512905, -0.5341786, -1.659138, 0.0627451, 1, 0, 1,
-0.4508841, 0.223699, -1.10578, 0.05490196, 1, 0, 1,
-0.4498239, -0.4692768, -2.960585, 0.05098039, 1, 0, 1,
-0.449608, -0.9708801, -2.16918, 0.04313726, 1, 0, 1,
-0.4489758, 0.7981187, -0.6072413, 0.03921569, 1, 0, 1,
-0.4485384, -0.3345327, -1.751906, 0.03137255, 1, 0, 1,
-0.4460431, 0.6807277, -2.026751, 0.02745098, 1, 0, 1,
-0.4453683, -1.431145, -4.064721, 0.01960784, 1, 0, 1,
-0.4448416, -0.8211278, -0.7289582, 0.01568628, 1, 0, 1,
-0.4425001, 0.6490579, -2.004467, 0.007843138, 1, 0, 1,
-0.4372107, -1.844081, -3.482355, 0.003921569, 1, 0, 1,
-0.4364952, 0.8519163, -0.9999112, 0, 1, 0.003921569, 1,
-0.4337991, 0.8978258, -0.8291732, 0, 1, 0.01176471, 1,
-0.4276091, 0.4438699, -1.807404, 0, 1, 0.01568628, 1,
-0.4233162, 0.1547188, 0.4891173, 0, 1, 0.02352941, 1,
-0.4232425, 1.304032, -1.775688, 0, 1, 0.02745098, 1,
-0.4202265, -1.65982, -2.58665, 0, 1, 0.03529412, 1,
-0.4195654, -0.5195469, -0.2997079, 0, 1, 0.03921569, 1,
-0.4142634, -0.6241519, -2.979623, 0, 1, 0.04705882, 1,
-0.3999392, 0.6894971, -0.2803939, 0, 1, 0.05098039, 1,
-0.3982682, -0.0111357, -2.490064, 0, 1, 0.05882353, 1,
-0.3962233, 0.3636991, -0.6029826, 0, 1, 0.0627451, 1,
-0.3959788, -0.645179, -2.418407, 0, 1, 0.07058824, 1,
-0.3930351, 0.4359591, -2.569825, 0, 1, 0.07450981, 1,
-0.388471, 1.321566, -1.458036, 0, 1, 0.08235294, 1,
-0.3862852, 0.1696875, -1.678911, 0, 1, 0.08627451, 1,
-0.3856514, 0.1781165, 0.80238, 0, 1, 0.09411765, 1,
-0.3856212, -2.67023, -2.349525, 0, 1, 0.1019608, 1,
-0.383814, 1.665952, -1.027134, 0, 1, 0.1058824, 1,
-0.3821655, -0.4891267, -4.398312, 0, 1, 0.1137255, 1,
-0.3757995, 0.1952577, -0.4732676, 0, 1, 0.1176471, 1,
-0.3680728, -1.306658, -3.42064, 0, 1, 0.1254902, 1,
-0.3668955, -0.3941143, -4.057285, 0, 1, 0.1294118, 1,
-0.3585036, 0.6561844, -0.5326161, 0, 1, 0.1372549, 1,
-0.3567669, 1.444016, -1.007594, 0, 1, 0.1411765, 1,
-0.3550094, -0.2568159, -2.332679, 0, 1, 0.1490196, 1,
-0.3526996, -1.035918, -3.672715, 0, 1, 0.1529412, 1,
-0.3525392, 0.4598412, -0.01706827, 0, 1, 0.1607843, 1,
-0.3437792, 1.198152, -0.6607488, 0, 1, 0.1647059, 1,
-0.341563, 0.9430702, 0.07868657, 0, 1, 0.172549, 1,
-0.3394185, 0.7457998, -0.2171974, 0, 1, 0.1764706, 1,
-0.3388035, -0.7751215, -3.081172, 0, 1, 0.1843137, 1,
-0.338317, -0.8397883, -2.644758, 0, 1, 0.1882353, 1,
-0.3380122, -0.8373563, -2.945443, 0, 1, 0.1960784, 1,
-0.3364767, 1.033321, 0.4473556, 0, 1, 0.2039216, 1,
-0.3357211, 1.646729, -0.4033135, 0, 1, 0.2078431, 1,
-0.3338967, -0.351396, -3.895097, 0, 1, 0.2156863, 1,
-0.3317485, -0.3340709, -1.435708, 0, 1, 0.2196078, 1,
-0.3313603, -0.2265088, -1.740367, 0, 1, 0.227451, 1,
-0.3278899, -1.321705, -4.012542, 0, 1, 0.2313726, 1,
-0.3200195, 0.5535025, -0.1003011, 0, 1, 0.2392157, 1,
-0.3189826, 1.307369, -0.60205, 0, 1, 0.2431373, 1,
-0.3166934, -0.1380999, -0.08144488, 0, 1, 0.2509804, 1,
-0.3164348, 0.6755949, -0.3395554, 0, 1, 0.254902, 1,
-0.3143799, 1.401406, 0.03445504, 0, 1, 0.2627451, 1,
-0.308002, 0.2779739, -0.4261377, 0, 1, 0.2666667, 1,
-0.3044691, 0.7423188, -0.3129928, 0, 1, 0.2745098, 1,
-0.3044176, 2.282949, -0.2879505, 0, 1, 0.2784314, 1,
-0.3017805, -0.8570384, -4.606003, 0, 1, 0.2862745, 1,
-0.299834, 0.5109883, 1.167914, 0, 1, 0.2901961, 1,
-0.2984883, 1.338621, 0.4710683, 0, 1, 0.2980392, 1,
-0.2924654, 2.045804, -1.20152, 0, 1, 0.3058824, 1,
-0.2899651, -0.4364315, -2.266972, 0, 1, 0.3098039, 1,
-0.2882282, 0.8320429, -0.7176223, 0, 1, 0.3176471, 1,
-0.2851408, -1.171382, -4.122896, 0, 1, 0.3215686, 1,
-0.2850746, 0.7581462, 1.581028, 0, 1, 0.3294118, 1,
-0.2845036, 1.987126, 0.3635809, 0, 1, 0.3333333, 1,
-0.2841699, -1.569936, -3.527562, 0, 1, 0.3411765, 1,
-0.2836238, -0.7728667, -2.333723, 0, 1, 0.345098, 1,
-0.2833306, -0.3258739, -2.382238, 0, 1, 0.3529412, 1,
-0.2826739, 0.7624064, 1.429482, 0, 1, 0.3568628, 1,
-0.2810284, -0.2199904, -1.106916, 0, 1, 0.3647059, 1,
-0.2795789, 1.076931, -0.3645364, 0, 1, 0.3686275, 1,
-0.2758685, -0.0153559, -2.596758, 0, 1, 0.3764706, 1,
-0.2666888, -1.926638, -2.983266, 0, 1, 0.3803922, 1,
-0.2646998, 0.05921387, 0.2196594, 0, 1, 0.3882353, 1,
-0.2645645, -0.3526745, -2.010269, 0, 1, 0.3921569, 1,
-0.2628113, 1.52171, -1.407287, 0, 1, 0.4, 1,
-0.2600079, 0.9181939, 1.282579, 0, 1, 0.4078431, 1,
-0.2595629, 0.8030389, 0.277784, 0, 1, 0.4117647, 1,
-0.2594498, 0.7032147, -0.8714751, 0, 1, 0.4196078, 1,
-0.2573935, 1.072653, 1.315535, 0, 1, 0.4235294, 1,
-0.2549739, 0.3091579, -1.364121, 0, 1, 0.4313726, 1,
-0.2547954, -1.16592, -2.957782, 0, 1, 0.4352941, 1,
-0.2472558, -0.5386811, -2.496384, 0, 1, 0.4431373, 1,
-0.2372907, -0.2286569, -1.968115, 0, 1, 0.4470588, 1,
-0.2353908, -0.8697798, -1.939915, 0, 1, 0.454902, 1,
-0.2352438, 0.5095497, -1.798889, 0, 1, 0.4588235, 1,
-0.2287164, -0.5697107, -2.516739, 0, 1, 0.4666667, 1,
-0.2273213, -0.5138053, -4.446206, 0, 1, 0.4705882, 1,
-0.2272925, 0.5358417, 0.8542349, 0, 1, 0.4784314, 1,
-0.2263598, -0.4219182, -2.434418, 0, 1, 0.4823529, 1,
-0.2247518, 0.1319817, -1.640492, 0, 1, 0.4901961, 1,
-0.2246255, -0.06614289, -0.07629883, 0, 1, 0.4941176, 1,
-0.2238273, -0.4708308, -3.963598, 0, 1, 0.5019608, 1,
-0.2230773, 1.139718, 0.3232019, 0, 1, 0.509804, 1,
-0.2211575, 0.7679878, -0.0523537, 0, 1, 0.5137255, 1,
-0.2140238, 1.02184, 1.227991, 0, 1, 0.5215687, 1,
-0.2136353, 1.109837, 0.2009486, 0, 1, 0.5254902, 1,
-0.2063146, -1.304783, -5.122596, 0, 1, 0.5333334, 1,
-0.2041473, -0.1813708, -3.131809, 0, 1, 0.5372549, 1,
-0.2034821, -2.157914, -1.185537, 0, 1, 0.5450981, 1,
-0.2017082, 0.03945372, -1.694833, 0, 1, 0.5490196, 1,
-0.2015245, 0.7950841, 1.516764, 0, 1, 0.5568628, 1,
-0.1985137, 0.350847, -0.5454501, 0, 1, 0.5607843, 1,
-0.1970757, -0.326219, -2.255241, 0, 1, 0.5686275, 1,
-0.1899727, -2.062024, -2.241807, 0, 1, 0.572549, 1,
-0.1895202, -0.2733287, -3.095056, 0, 1, 0.5803922, 1,
-0.1874861, -0.4565431, -2.168542, 0, 1, 0.5843138, 1,
-0.1862111, -0.338, -2.607948, 0, 1, 0.5921569, 1,
-0.18017, -0.3396935, -3.784969, 0, 1, 0.5960785, 1,
-0.1776046, -0.02044848, -1.371054, 0, 1, 0.6039216, 1,
-0.1767537, -1.633605, -1.918051, 0, 1, 0.6117647, 1,
-0.1767534, 1.865447, -1.555998, 0, 1, 0.6156863, 1,
-0.1726879, -0.6091277, -2.560555, 0, 1, 0.6235294, 1,
-0.1694146, 0.4897052, 0.692497, 0, 1, 0.627451, 1,
-0.1656959, 2.282819, -0.9781345, 0, 1, 0.6352941, 1,
-0.1628022, -1.439755, -5.931876, 0, 1, 0.6392157, 1,
-0.1601443, 0.1595497, -0.6728377, 0, 1, 0.6470588, 1,
-0.1597246, -0.3370391, -2.161647, 0, 1, 0.6509804, 1,
-0.1585601, -0.1083065, -2.811298, 0, 1, 0.6588235, 1,
-0.1543687, 1.219772, -0.699928, 0, 1, 0.6627451, 1,
-0.1527266, -0.3554664, -1.897452, 0, 1, 0.6705883, 1,
-0.1516158, 0.7615497, -0.3103024, 0, 1, 0.6745098, 1,
-0.1457996, 0.5507992, -1.588289, 0, 1, 0.682353, 1,
-0.1456182, 1.102162, -0.9708114, 0, 1, 0.6862745, 1,
-0.1395491, 0.686981, 1.735941, 0, 1, 0.6941177, 1,
-0.1367176, -1.04693, -3.250826, 0, 1, 0.7019608, 1,
-0.1360882, 0.2761159, -1.908057, 0, 1, 0.7058824, 1,
-0.129388, 2.39244, -0.9521887, 0, 1, 0.7137255, 1,
-0.1289638, 2.347309, 0.6795185, 0, 1, 0.7176471, 1,
-0.1278117, -0.3111785, -4.190213, 0, 1, 0.7254902, 1,
-0.1270843, 1.348277, 0.6780821, 0, 1, 0.7294118, 1,
-0.1226883, -0.8407806, -3.159916, 0, 1, 0.7372549, 1,
-0.1208331, -0.4116178, -2.967113, 0, 1, 0.7411765, 1,
-0.1195844, -0.3662344, -4.628225, 0, 1, 0.7490196, 1,
-0.1188784, 0.04175365, -0.2329221, 0, 1, 0.7529412, 1,
-0.1151643, 0.48284, 0.359787, 0, 1, 0.7607843, 1,
-0.1144628, 0.889253, 0.09509265, 0, 1, 0.7647059, 1,
-0.1093054, 1.866762, -0.9089548, 0, 1, 0.772549, 1,
-0.1025805, -0.6555083, -3.892423, 0, 1, 0.7764706, 1,
-0.1013115, -1.264651, -1.98304, 0, 1, 0.7843137, 1,
-0.09758357, -1.471384, -2.705174, 0, 1, 0.7882353, 1,
-0.09713036, 0.001678775, -1.982896, 0, 1, 0.7960784, 1,
-0.09390027, -0.08277228, -1.131199, 0, 1, 0.8039216, 1,
-0.09387669, -0.009717526, -4.365021, 0, 1, 0.8078431, 1,
-0.08588915, 0.5175677, -0.7673904, 0, 1, 0.8156863, 1,
-0.08391091, -1.161962, -2.584234, 0, 1, 0.8196079, 1,
-0.08271933, 0.3877527, -0.4860807, 0, 1, 0.827451, 1,
-0.08246146, -0.04764044, -3.465746, 0, 1, 0.8313726, 1,
-0.07938841, 0.5153093, -0.1303482, 0, 1, 0.8392157, 1,
-0.07670254, 0.4026402, -0.409078, 0, 1, 0.8431373, 1,
-0.07664866, 2.049536, -0.2532406, 0, 1, 0.8509804, 1,
-0.07500197, 0.1518981, -0.4337776, 0, 1, 0.854902, 1,
-0.07451475, 1.869712, 0.4237482, 0, 1, 0.8627451, 1,
-0.07138205, -0.2766893, -2.00579, 0, 1, 0.8666667, 1,
-0.06748537, -0.1105741, -0.7843667, 0, 1, 0.8745098, 1,
-0.06661223, -0.8110369, -3.796032, 0, 1, 0.8784314, 1,
-0.0663853, -1.166166, -3.043927, 0, 1, 0.8862745, 1,
-0.06442141, 1.214839, -1.498203, 0, 1, 0.8901961, 1,
-0.06437933, -0.9187689, -3.687024, 0, 1, 0.8980392, 1,
-0.05849463, -1.647832, -2.182954, 0, 1, 0.9058824, 1,
-0.05713646, -0.7444254, -1.477411, 0, 1, 0.9098039, 1,
-0.05703991, -1.211377, -2.966274, 0, 1, 0.9176471, 1,
-0.05489225, -0.6304181, -3.386893, 0, 1, 0.9215686, 1,
-0.05258685, 2.123885, 0.7668248, 0, 1, 0.9294118, 1,
-0.04745481, 1.03587, 0.6915109, 0, 1, 0.9333333, 1,
-0.04622846, 0.8932673, -1.039968, 0, 1, 0.9411765, 1,
-0.04072965, -0.3168824, -1.592842, 0, 1, 0.945098, 1,
-0.04006403, 0.1230467, 0.1765543, 0, 1, 0.9529412, 1,
-0.0389598, -0.4290326, -4.546969, 0, 1, 0.9568627, 1,
-0.03800837, -0.4102199, -4.569921, 0, 1, 0.9647059, 1,
-0.0309615, 0.6940523, 1.041942, 0, 1, 0.9686275, 1,
-0.03090665, -0.4312567, -2.39684, 0, 1, 0.9764706, 1,
-0.0245861, -0.6423088, -4.112393, 0, 1, 0.9803922, 1,
-0.02208433, 0.3627112, -1.032013, 0, 1, 0.9882353, 1,
-0.01854988, -0.6196238, -4.259068, 0, 1, 0.9921569, 1,
-0.01799723, 0.6054596, -1.042023, 0, 1, 1, 1,
-0.01702204, 1.117068, -0.8081228, 0, 0.9921569, 1, 1,
-0.01304807, 0.02150574, -2.390143, 0, 0.9882353, 1, 1,
-0.006424115, 0.4613892, -1.748338, 0, 0.9803922, 1, 1,
-0.002580591, 1.248262, 1.115839, 0, 0.9764706, 1, 1,
-0.001803502, -1.844466, -2.814019, 0, 0.9686275, 1, 1,
-0.001593934, 0.2179223, 0.5505428, 0, 0.9647059, 1, 1,
0.002142639, -1.241908, 3.790979, 0, 0.9568627, 1, 1,
0.003947533, -1.135977, 4.353089, 0, 0.9529412, 1, 1,
0.007933916, -1.920831, 5.37541, 0, 0.945098, 1, 1,
0.008790102, 1.088062, -0.05876172, 0, 0.9411765, 1, 1,
0.009631155, -0.5250621, 2.995578, 0, 0.9333333, 1, 1,
0.01379092, -0.1189272, 3.317332, 0, 0.9294118, 1, 1,
0.01490354, -1.683516, 2.287781, 0, 0.9215686, 1, 1,
0.01716825, 0.5478424, -0.7019346, 0, 0.9176471, 1, 1,
0.01789161, -1.157245, 3.69, 0, 0.9098039, 1, 1,
0.01845897, 0.4152002, -1.609452, 0, 0.9058824, 1, 1,
0.0185851, -1.51755, 2.347221, 0, 0.8980392, 1, 1,
0.02109832, 0.7900463, -0.1990837, 0, 0.8901961, 1, 1,
0.02518508, 0.9857145, -0.1371659, 0, 0.8862745, 1, 1,
0.02873349, -0.779317, 2.635915, 0, 0.8784314, 1, 1,
0.03221777, 0.2122823, 0.3837931, 0, 0.8745098, 1, 1,
0.032287, -1.60771, 2.45523, 0, 0.8666667, 1, 1,
0.03291591, 0.7612493, 0.5262652, 0, 0.8627451, 1, 1,
0.03397036, 2.227407, 0.4925972, 0, 0.854902, 1, 1,
0.03436977, 0.9096495, -0.7878187, 0, 0.8509804, 1, 1,
0.03546516, -0.1316491, 1.526651, 0, 0.8431373, 1, 1,
0.03623057, -0.1944091, 2.420935, 0, 0.8392157, 1, 1,
0.04095821, -0.2918691, 3.810081, 0, 0.8313726, 1, 1,
0.04196051, -0.2940609, 3.218355, 0, 0.827451, 1, 1,
0.04332308, -1.558379, 3.424294, 0, 0.8196079, 1, 1,
0.05111268, -2.199859, 2.238415, 0, 0.8156863, 1, 1,
0.05143934, -0.0917949, 1.964949, 0, 0.8078431, 1, 1,
0.05890179, 0.5318261, -0.4539836, 0, 0.8039216, 1, 1,
0.0602666, 0.7524763, 0.1117589, 0, 0.7960784, 1, 1,
0.06210365, -1.018906, 3.844497, 0, 0.7882353, 1, 1,
0.06337994, 0.2693775, -0.9305803, 0, 0.7843137, 1, 1,
0.06349356, 0.4602201, -2.23811, 0, 0.7764706, 1, 1,
0.06354664, -0.7448316, 2.095545, 0, 0.772549, 1, 1,
0.06711551, -1.116218, 4.24463, 0, 0.7647059, 1, 1,
0.06868666, 0.9693186, 0.1555358, 0, 0.7607843, 1, 1,
0.06947755, -0.07437866, 1.615731, 0, 0.7529412, 1, 1,
0.07047898, -0.738782, 2.646683, 0, 0.7490196, 1, 1,
0.07109676, -0.1708179, 1.715813, 0, 0.7411765, 1, 1,
0.07122571, 0.6679392, -0.3136772, 0, 0.7372549, 1, 1,
0.07122771, 0.1954353, 0.7069169, 0, 0.7294118, 1, 1,
0.07242695, 0.4866764, -0.7701129, 0, 0.7254902, 1, 1,
0.07302879, 0.8019112, -0.1846067, 0, 0.7176471, 1, 1,
0.07618842, 0.8083888, 2.236617, 0, 0.7137255, 1, 1,
0.07669673, -0.781396, 3.288105, 0, 0.7058824, 1, 1,
0.07801341, 1.610218, 0.5533397, 0, 0.6980392, 1, 1,
0.07847234, 0.1505827, -1.20211, 0, 0.6941177, 1, 1,
0.08302587, 0.3550102, 1.127759, 0, 0.6862745, 1, 1,
0.08908789, -0.8715996, 5.285987, 0, 0.682353, 1, 1,
0.09103723, 0.43363, -2.387759, 0, 0.6745098, 1, 1,
0.09182586, -1.015576, 3.2796, 0, 0.6705883, 1, 1,
0.0938187, 0.7313094, -0.2937208, 0, 0.6627451, 1, 1,
0.09793363, 1.720665, 1.42693, 0, 0.6588235, 1, 1,
0.09838928, 1.21082, -1.274151, 0, 0.6509804, 1, 1,
0.1008909, 0.9365271, -0.5821533, 0, 0.6470588, 1, 1,
0.1033297, -1.059167, 4.780161, 0, 0.6392157, 1, 1,
0.1041223, 0.4157881, 0.09278795, 0, 0.6352941, 1, 1,
0.1043365, -1.065513, 2.947983, 0, 0.627451, 1, 1,
0.1056001, -0.4210312, 3.493765, 0, 0.6235294, 1, 1,
0.1058172, 1.007997, -0.4749381, 0, 0.6156863, 1, 1,
0.1072623, 1.516974, 0.3732266, 0, 0.6117647, 1, 1,
0.1083995, -0.1556821, 2.558752, 0, 0.6039216, 1, 1,
0.1105922, 0.2114551, 1.615585, 0, 0.5960785, 1, 1,
0.1110403, -0.2579202, 3.796721, 0, 0.5921569, 1, 1,
0.1188541, -1.370155, 1.555818, 0, 0.5843138, 1, 1,
0.1194216, -0.6152257, 3.363612, 0, 0.5803922, 1, 1,
0.1209001, 0.2039006, 0.2851057, 0, 0.572549, 1, 1,
0.1222547, 0.5020826, 0.973574, 0, 0.5686275, 1, 1,
0.1230189, -1.428704, 3.313606, 0, 0.5607843, 1, 1,
0.1236411, -1.276839, 2.227794, 0, 0.5568628, 1, 1,
0.1250719, -0.7115788, 1.172134, 0, 0.5490196, 1, 1,
0.1276111, 0.001083145, 2.824943, 0, 0.5450981, 1, 1,
0.1285656, 0.427212, 0.2528163, 0, 0.5372549, 1, 1,
0.1327851, 2.22708, 0.8412182, 0, 0.5333334, 1, 1,
0.1335553, -0.5874434, 2.559293, 0, 0.5254902, 1, 1,
0.1371722, 1.534541, -0.4350076, 0, 0.5215687, 1, 1,
0.1387791, -0.1271764, 3.470494, 0, 0.5137255, 1, 1,
0.1392678, -0.2470534, 3.39833, 0, 0.509804, 1, 1,
0.1410311, 0.4842626, 0.76748, 0, 0.5019608, 1, 1,
0.145158, 0.4719499, -1.721272, 0, 0.4941176, 1, 1,
0.1498352, -0.6944182, 2.878484, 0, 0.4901961, 1, 1,
0.1506896, 1.122165, -0.02008998, 0, 0.4823529, 1, 1,
0.1523369, -0.4172699, 5.427384, 0, 0.4784314, 1, 1,
0.1532771, 0.9445432, -2.553308, 0, 0.4705882, 1, 1,
0.1532952, 1.821116, 1.307573, 0, 0.4666667, 1, 1,
0.1540321, -1.56223, 3.028347, 0, 0.4588235, 1, 1,
0.1541346, 0.6452138, -0.9198008, 0, 0.454902, 1, 1,
0.1603369, -1.148996, 2.043554, 0, 0.4470588, 1, 1,
0.1629193, -0.1485339, 2.999529, 0, 0.4431373, 1, 1,
0.1694205, 1.867181, 1.137543, 0, 0.4352941, 1, 1,
0.1734197, -0.1046173, 3.024881, 0, 0.4313726, 1, 1,
0.1798952, 0.09099296, 0.5881559, 0, 0.4235294, 1, 1,
0.1805406, 1.099504, -1.041091, 0, 0.4196078, 1, 1,
0.1829443, -0.002026069, 1.441807, 0, 0.4117647, 1, 1,
0.1838807, -0.7240013, 2.67368, 0, 0.4078431, 1, 1,
0.1841081, 0.3760374, 1.063206, 0, 0.4, 1, 1,
0.185783, -1.250817, 0.8988422, 0, 0.3921569, 1, 1,
0.1875942, 0.229979, 0.1296969, 0, 0.3882353, 1, 1,
0.1893435, 0.1984218, 1.12836, 0, 0.3803922, 1, 1,
0.1978839, -0.5692902, 2.517231, 0, 0.3764706, 1, 1,
0.1988801, 1.27544, 0.6370393, 0, 0.3686275, 1, 1,
0.2074152, -0.5031738, 1.98578, 0, 0.3647059, 1, 1,
0.2110113, 1.180634, -1.186537, 0, 0.3568628, 1, 1,
0.2114929, 1.586439, 0.0317927, 0, 0.3529412, 1, 1,
0.2125203, -0.1486864, 4.086034, 0, 0.345098, 1, 1,
0.214518, -0.8309938, 2.533448, 0, 0.3411765, 1, 1,
0.2169021, -0.5711474, 2.917923, 0, 0.3333333, 1, 1,
0.2189915, 1.509109, 1.60037, 0, 0.3294118, 1, 1,
0.2243127, 0.908182, -0.8596897, 0, 0.3215686, 1, 1,
0.2268977, -2.024833, 1.179127, 0, 0.3176471, 1, 1,
0.228718, -0.1876653, 0.3297305, 0, 0.3098039, 1, 1,
0.2319321, 0.4231256, 1.279669, 0, 0.3058824, 1, 1,
0.2320973, -0.2765287, 2.254398, 0, 0.2980392, 1, 1,
0.2329542, -0.9582395, 3.525131, 0, 0.2901961, 1, 1,
0.2343221, 0.3831563, -0.3433745, 0, 0.2862745, 1, 1,
0.2347031, -0.5257409, 1.273036, 0, 0.2784314, 1, 1,
0.2347641, 0.5526878, -0.7943454, 0, 0.2745098, 1, 1,
0.2362557, -0.07828616, 2.252828, 0, 0.2666667, 1, 1,
0.2363903, -1.735999, 3.745381, 0, 0.2627451, 1, 1,
0.2372372, 1.388205, 1.059162, 0, 0.254902, 1, 1,
0.2389428, 0.1923541, 0.6108378, 0, 0.2509804, 1, 1,
0.2493333, 0.4782637, 1.216725, 0, 0.2431373, 1, 1,
0.2495191, -0.8696289, 3.762023, 0, 0.2392157, 1, 1,
0.2506739, 1.953887, 0.150712, 0, 0.2313726, 1, 1,
0.2536225, -1.079266, 3.297465, 0, 0.227451, 1, 1,
0.257656, 0.5486096, 0.7635297, 0, 0.2196078, 1, 1,
0.2620574, 1.455612, -1.03809, 0, 0.2156863, 1, 1,
0.2642654, 0.3301385, -0.1709765, 0, 0.2078431, 1, 1,
0.2662467, 0.7542009, 1.220053, 0, 0.2039216, 1, 1,
0.2684113, 1.654351, 1.211343, 0, 0.1960784, 1, 1,
0.279702, -1.192229, 4.505441, 0, 0.1882353, 1, 1,
0.2828917, -0.3563836, 1.980497, 0, 0.1843137, 1, 1,
0.2876798, 1.085377, -0.03773492, 0, 0.1764706, 1, 1,
0.2906719, -1.477943, 1.956202, 0, 0.172549, 1, 1,
0.2936959, -1.514652, 4.496806, 0, 0.1647059, 1, 1,
0.2948219, 0.4535154, 2.831247, 0, 0.1607843, 1, 1,
0.2956429, 0.8782884, 3.059269, 0, 0.1529412, 1, 1,
0.2989222, -0.6309817, 1.744634, 0, 0.1490196, 1, 1,
0.3026221, 0.04951369, 2.13945, 0, 0.1411765, 1, 1,
0.3048848, -0.1446543, 1.624512, 0, 0.1372549, 1, 1,
0.3151661, 0.8340941, -0.1478641, 0, 0.1294118, 1, 1,
0.3214254, -0.7553481, 1.916863, 0, 0.1254902, 1, 1,
0.3257869, -0.07469102, 1.492232, 0, 0.1176471, 1, 1,
0.3267079, 0.1583107, 3.063815, 0, 0.1137255, 1, 1,
0.3267847, 2.588485, 0.8743123, 0, 0.1058824, 1, 1,
0.3270313, 0.02449926, -0.5269765, 0, 0.09803922, 1, 1,
0.329116, 0.007006104, 1.413269, 0, 0.09411765, 1, 1,
0.3293733, 1.818088, -0.1785439, 0, 0.08627451, 1, 1,
0.3319811, 0.6076807, -1.240396, 0, 0.08235294, 1, 1,
0.3358492, 3.121018, -0.09179563, 0, 0.07450981, 1, 1,
0.3459162, 0.5667466, 0.7659097, 0, 0.07058824, 1, 1,
0.3460595, 0.6348075, -0.914921, 0, 0.0627451, 1, 1,
0.3488223, 0.9331648, 2.583277, 0, 0.05882353, 1, 1,
0.3537226, -1.709246, 2.294342, 0, 0.05098039, 1, 1,
0.3604311, -1.859397, 3.574215, 0, 0.04705882, 1, 1,
0.3720766, 0.1211557, 0.4763519, 0, 0.03921569, 1, 1,
0.3727625, -0.4133072, 2.453832, 0, 0.03529412, 1, 1,
0.378669, 1.674776, 0.4714752, 0, 0.02745098, 1, 1,
0.3817191, -0.2678992, 1.616697, 0, 0.02352941, 1, 1,
0.389096, 0.3693012, 0.2612059, 0, 0.01568628, 1, 1,
0.3942851, -0.8587273, 1.283551, 0, 0.01176471, 1, 1,
0.3979585, -0.6658601, 4.671951, 0, 0.003921569, 1, 1,
0.4043814, 1.150416, 2.850976, 0.003921569, 0, 1, 1,
0.4044016, -1.789834, 2.705075, 0.007843138, 0, 1, 1,
0.4062313, 0.5159901, 0.8119165, 0.01568628, 0, 1, 1,
0.4088374, 0.003713383, 1.674671, 0.01960784, 0, 1, 1,
0.4090879, 0.5530919, 0.1023612, 0.02745098, 0, 1, 1,
0.4114478, 0.06701708, 0.56393, 0.03137255, 0, 1, 1,
0.4116017, -1.053832, 3.356661, 0.03921569, 0, 1, 1,
0.414883, 1.277969, 1.014816, 0.04313726, 0, 1, 1,
0.4186535, 0.0516014, -0.3533854, 0.05098039, 0, 1, 1,
0.4192157, 0.2227115, 1.103227, 0.05490196, 0, 1, 1,
0.4205168, 0.6200377, -1.018503, 0.0627451, 0, 1, 1,
0.4211416, -1.166156, 2.95093, 0.06666667, 0, 1, 1,
0.4239985, 0.2455063, 0.7321627, 0.07450981, 0, 1, 1,
0.4263259, 1.767727, 0.3525363, 0.07843138, 0, 1, 1,
0.426694, 0.01923913, 1.282478, 0.08627451, 0, 1, 1,
0.4326041, -1.579743, 3.909012, 0.09019608, 0, 1, 1,
0.4364363, -0.7326979, 2.42901, 0.09803922, 0, 1, 1,
0.4428816, 0.5183044, 1.456706, 0.1058824, 0, 1, 1,
0.4471438, -1.311897, 4.46438, 0.1098039, 0, 1, 1,
0.4472446, -1.345213, 2.398319, 0.1176471, 0, 1, 1,
0.4473268, 0.1339403, 2.940142, 0.1215686, 0, 1, 1,
0.4500926, -0.847993, 3.210738, 0.1294118, 0, 1, 1,
0.4509517, -2.247335, 3.634043, 0.1333333, 0, 1, 1,
0.4527231, -0.9337113, 1.535784, 0.1411765, 0, 1, 1,
0.4554298, 0.5793987, 2.170849, 0.145098, 0, 1, 1,
0.4557478, -0.1894722, 1.588145, 0.1529412, 0, 1, 1,
0.4560599, -1.430391, 3.36268, 0.1568628, 0, 1, 1,
0.4561709, -0.08077163, 1.306368, 0.1647059, 0, 1, 1,
0.4573792, -0.01554922, 2.001444, 0.1686275, 0, 1, 1,
0.4638149, 0.7387135, 1.354324, 0.1764706, 0, 1, 1,
0.4654102, 0.1232579, 0.5593457, 0.1803922, 0, 1, 1,
0.4759271, 2.617626, 0.6611528, 0.1882353, 0, 1, 1,
0.478706, 0.1603204, 2.07182, 0.1921569, 0, 1, 1,
0.484834, -1.276736, 3.829611, 0.2, 0, 1, 1,
0.4881504, 0.1238314, 1.292133, 0.2078431, 0, 1, 1,
0.4894393, -0.2087903, 0.8593643, 0.2117647, 0, 1, 1,
0.4942799, -0.767442, 2.916426, 0.2196078, 0, 1, 1,
0.5005476, 0.7841152, 1.056952, 0.2235294, 0, 1, 1,
0.5015677, -1.028661, -0.01280486, 0.2313726, 0, 1, 1,
0.5022199, 0.4622165, 0.8311865, 0.2352941, 0, 1, 1,
0.5040988, 0.1521205, 2.461539, 0.2431373, 0, 1, 1,
0.5058469, 0.4287008, 1.560304, 0.2470588, 0, 1, 1,
0.5114053, -0.2157062, 1.411099, 0.254902, 0, 1, 1,
0.5259063, -2.096047, 1.266731, 0.2588235, 0, 1, 1,
0.532335, -0.2110549, 2.03117, 0.2666667, 0, 1, 1,
0.5335832, -0.7785479, 1.813365, 0.2705882, 0, 1, 1,
0.5414502, -0.006241434, 0.4291544, 0.2784314, 0, 1, 1,
0.5445321, -0.6561182, 2.295673, 0.282353, 0, 1, 1,
0.545742, 0.7366964, -1.126556, 0.2901961, 0, 1, 1,
0.549639, -0.4817533, 1.804434, 0.2941177, 0, 1, 1,
0.5496652, 0.08946069, 1.475475, 0.3019608, 0, 1, 1,
0.551937, 0.9612368, -0.003491935, 0.3098039, 0, 1, 1,
0.5534173, 0.334068, 0.2766802, 0.3137255, 0, 1, 1,
0.5551452, 0.2776868, 1.86189, 0.3215686, 0, 1, 1,
0.5570529, -0.6586512, 2.642375, 0.3254902, 0, 1, 1,
0.5583823, 0.9159591, 0.0976731, 0.3333333, 0, 1, 1,
0.5604647, 0.614809, 0.6008098, 0.3372549, 0, 1, 1,
0.5646008, -0.7406388, 3.164167, 0.345098, 0, 1, 1,
0.5652169, -0.6941528, 2.922785, 0.3490196, 0, 1, 1,
0.5685148, -0.6107272, 2.674489, 0.3568628, 0, 1, 1,
0.5697835, 1.768187, 0.3986286, 0.3607843, 0, 1, 1,
0.5739412, 2.105249, -0.04874061, 0.3686275, 0, 1, 1,
0.5752444, -0.7030232, 2.262344, 0.372549, 0, 1, 1,
0.5754846, -0.5847471, 3.565149, 0.3803922, 0, 1, 1,
0.5817488, -0.2089675, 3.582384, 0.3843137, 0, 1, 1,
0.5832234, 0.6840067, 1.203835, 0.3921569, 0, 1, 1,
0.5840787, 0.2850856, 1.252511, 0.3960784, 0, 1, 1,
0.5870625, 1.122959, 3.822753, 0.4039216, 0, 1, 1,
0.5911697, -1.953883, 3.481084, 0.4117647, 0, 1, 1,
0.6038551, -0.2597066, 0.6784521, 0.4156863, 0, 1, 1,
0.6106678, -1.70511, 4.064803, 0.4235294, 0, 1, 1,
0.6121269, 0.8208212, -1.288232, 0.427451, 0, 1, 1,
0.6134668, -0.04491769, 1.862566, 0.4352941, 0, 1, 1,
0.6139044, 0.9788669, -0.1374816, 0.4392157, 0, 1, 1,
0.6139711, -0.1672383, 2.786664, 0.4470588, 0, 1, 1,
0.6266091, -2.254788, 3.576549, 0.4509804, 0, 1, 1,
0.6284229, -1.467411, 2.086861, 0.4588235, 0, 1, 1,
0.6287543, -0.6225906, 3.010944, 0.4627451, 0, 1, 1,
0.6304368, -0.02406071, 3.752576, 0.4705882, 0, 1, 1,
0.6305951, 0.2650944, 2.720288, 0.4745098, 0, 1, 1,
0.630854, -1.006172, 1.848321, 0.4823529, 0, 1, 1,
0.6366515, 0.8814203, -0.2850901, 0.4862745, 0, 1, 1,
0.6406443, 1.014729, -0.3003842, 0.4941176, 0, 1, 1,
0.640997, 0.01882109, 2.331543, 0.5019608, 0, 1, 1,
0.6465243, -1.093478, 3.704465, 0.5058824, 0, 1, 1,
0.6504768, 0.2408445, 0.2922466, 0.5137255, 0, 1, 1,
0.6520168, 0.4937981, 0.6131718, 0.5176471, 0, 1, 1,
0.6525484, 0.6746899, 2.098241, 0.5254902, 0, 1, 1,
0.6548647, 1.637795, 2.142221, 0.5294118, 0, 1, 1,
0.6548909, -0.4790437, 2.34716, 0.5372549, 0, 1, 1,
0.6614137, 0.2985998, 1.708299, 0.5411765, 0, 1, 1,
0.6618197, 0.8722084, 0.2938831, 0.5490196, 0, 1, 1,
0.6625422, -0.9166285, 2.132329, 0.5529412, 0, 1, 1,
0.6653965, 0.3608758, 1.616637, 0.5607843, 0, 1, 1,
0.6722579, 0.367045, 0.5246907, 0.5647059, 0, 1, 1,
0.6729359, 0.4268276, 1.800936, 0.572549, 0, 1, 1,
0.6745545, 1.34548, 0.8633093, 0.5764706, 0, 1, 1,
0.6795212, 0.07062783, 1.718638, 0.5843138, 0, 1, 1,
0.6830751, -0.2734749, 2.505082, 0.5882353, 0, 1, 1,
0.6855703, -1.058534, 2.543116, 0.5960785, 0, 1, 1,
0.6888999, 0.3041967, 1.742962, 0.6039216, 0, 1, 1,
0.6907787, 0.4502614, 0.4433081, 0.6078432, 0, 1, 1,
0.706695, -0.03766586, 1.523909, 0.6156863, 0, 1, 1,
0.7217366, 1.121286, 1.983898, 0.6196079, 0, 1, 1,
0.7281908, -0.9109455, 1.696606, 0.627451, 0, 1, 1,
0.7417678, 0.7767287, 1.572781, 0.6313726, 0, 1, 1,
0.7419887, -0.7144349, 1.952888, 0.6392157, 0, 1, 1,
0.7439576, 0.2957642, 0.9056478, 0.6431373, 0, 1, 1,
0.7455651, -0.2396339, 2.328657, 0.6509804, 0, 1, 1,
0.7464271, 0.3056575, -0.2551678, 0.654902, 0, 1, 1,
0.7492182, 0.7393683, 2.475422, 0.6627451, 0, 1, 1,
0.7604786, -2.061679, 3.097397, 0.6666667, 0, 1, 1,
0.7618365, -0.1485596, 1.640764, 0.6745098, 0, 1, 1,
0.7722875, -0.004934686, 0.1166187, 0.6784314, 0, 1, 1,
0.7723908, -2.199463, 2.486112, 0.6862745, 0, 1, 1,
0.7741377, 0.3385988, 1.066355, 0.6901961, 0, 1, 1,
0.7809478, -0.4993245, -0.241689, 0.6980392, 0, 1, 1,
0.7820247, 2.059438, 1.990586, 0.7058824, 0, 1, 1,
0.7844735, -1.46038, 3.199529, 0.7098039, 0, 1, 1,
0.7895354, 2.218048, 0.8160102, 0.7176471, 0, 1, 1,
0.7897641, -1.207059, 4.21947, 0.7215686, 0, 1, 1,
0.7919065, -0.2311548, 2.933099, 0.7294118, 0, 1, 1,
0.7942038, -0.5363392, 0.970436, 0.7333333, 0, 1, 1,
0.7948034, 0.2280747, 1.249057, 0.7411765, 0, 1, 1,
0.7961464, 0.7747762, 0.8603455, 0.7450981, 0, 1, 1,
0.803566, -0.1257841, 1.634769, 0.7529412, 0, 1, 1,
0.805691, 1.080195, -1.250455, 0.7568628, 0, 1, 1,
0.8071532, 0.2215258, 1.230704, 0.7647059, 0, 1, 1,
0.8105907, -0.2787275, 2.389542, 0.7686275, 0, 1, 1,
0.8110893, -0.4889153, 1.391885, 0.7764706, 0, 1, 1,
0.8144462, 1.142189, 0.6625807, 0.7803922, 0, 1, 1,
0.8182623, 0.01217748, -0.2681593, 0.7882353, 0, 1, 1,
0.8209075, 1.363118, 1.133318, 0.7921569, 0, 1, 1,
0.8231412, 2.211854, 2.206106, 0.8, 0, 1, 1,
0.8235146, 0.5906643, 0.340813, 0.8078431, 0, 1, 1,
0.8276353, 1.158112, 0.4006041, 0.8117647, 0, 1, 1,
0.8297636, -2.741093, 2.025148, 0.8196079, 0, 1, 1,
0.831704, -0.7341688, 1.963832, 0.8235294, 0, 1, 1,
0.8332999, -0.06454224, 1.784158, 0.8313726, 0, 1, 1,
0.8365101, 0.704865, 0.5949438, 0.8352941, 0, 1, 1,
0.8379447, -0.01933369, 1.525435, 0.8431373, 0, 1, 1,
0.838258, -0.04640545, 2.376749, 0.8470588, 0, 1, 1,
0.8473697, -0.779009, 1.603363, 0.854902, 0, 1, 1,
0.8546751, -0.5444627, 2.89085, 0.8588235, 0, 1, 1,
0.8567146, -0.03749498, 0.7673488, 0.8666667, 0, 1, 1,
0.8658009, -0.2097576, 2.0878, 0.8705882, 0, 1, 1,
0.8659883, -0.8534231, 2.780821, 0.8784314, 0, 1, 1,
0.8688731, -1.224565, 1.087232, 0.8823529, 0, 1, 1,
0.8710521, 0.0195856, 2.545354, 0.8901961, 0, 1, 1,
0.8725246, 1.395586, 1.54336, 0.8941177, 0, 1, 1,
0.8775836, 1.266823, -0.7766872, 0.9019608, 0, 1, 1,
0.8786846, 0.1771364, 0.3772659, 0.9098039, 0, 1, 1,
0.8832127, 0.5115706, -0.7612662, 0.9137255, 0, 1, 1,
0.8860679, -0.5967634, 0.06364038, 0.9215686, 0, 1, 1,
0.8880408, 0.2360374, 2.566401, 0.9254902, 0, 1, 1,
0.8941401, 1.231792, 1.537704, 0.9333333, 0, 1, 1,
0.8987806, -2.507016, 3.307349, 0.9372549, 0, 1, 1,
0.899435, 1.337048, 1.832471, 0.945098, 0, 1, 1,
0.9073112, 0.6233068, -0.1515668, 0.9490196, 0, 1, 1,
0.9094729, 2.518771, -0.7713014, 0.9568627, 0, 1, 1,
0.9115463, 0.1154309, 0.5788361, 0.9607843, 0, 1, 1,
0.9177045, -1.549237, 0.6027508, 0.9686275, 0, 1, 1,
0.9192615, -0.5162629, 2.031117, 0.972549, 0, 1, 1,
0.9216956, -0.1249804, 1.795491, 0.9803922, 0, 1, 1,
0.9237345, -1.087047, 2.556441, 0.9843137, 0, 1, 1,
0.9326248, 0.7969876, 1.135888, 0.9921569, 0, 1, 1,
0.9437631, 1.372621, 1.387583, 0.9960784, 0, 1, 1,
0.9533346, -1.560535, 2.11094, 1, 0, 0.9960784, 1,
0.9537163, -0.2009871, 0.9719146, 1, 0, 0.9882353, 1,
0.9550453, 0.03973324, 1.821781, 1, 0, 0.9843137, 1,
0.9557974, 0.5413864, 1.063276, 1, 0, 0.9764706, 1,
0.9571763, 0.1495887, 1.703901, 1, 0, 0.972549, 1,
0.9667835, -0.677896, 2.047287, 1, 0, 0.9647059, 1,
0.9670075, 0.8996952, 1.115331, 1, 0, 0.9607843, 1,
0.9698157, -1.121988, 2.5885, 1, 0, 0.9529412, 1,
0.981445, 0.7606987, 1.742528, 1, 0, 0.9490196, 1,
0.9942377, -0.5641103, -0.4818444, 1, 0, 0.9411765, 1,
0.9954808, 0.1854785, 1.657454, 1, 0, 0.9372549, 1,
0.9984968, -1.498516, 2.201581, 1, 0, 0.9294118, 1,
0.9986281, 0.2867891, 0.2847428, 1, 0, 0.9254902, 1,
1.004256, 0.3567791, 3.465697, 1, 0, 0.9176471, 1,
1.012215, -0.8452035, 1.878134, 1, 0, 0.9137255, 1,
1.015017, -1.044615, 4.308842, 1, 0, 0.9058824, 1,
1.015731, 0.1117168, 2.225957, 1, 0, 0.9019608, 1,
1.018697, 0.503296, -0.4140505, 1, 0, 0.8941177, 1,
1.019665, 0.5262666, 1.36161, 1, 0, 0.8862745, 1,
1.02736, -1.107728, 1.804562, 1, 0, 0.8823529, 1,
1.036955, -1.246343, 1.477111, 1, 0, 0.8745098, 1,
1.043022, 0.4913645, 2.279265, 1, 0, 0.8705882, 1,
1.047706, -0.2089939, 0.1913774, 1, 0, 0.8627451, 1,
1.049108, -0.321682, 3.772344, 1, 0, 0.8588235, 1,
1.052335, -0.5860661, 3.968832, 1, 0, 0.8509804, 1,
1.052866, 0.7141526, 0.9000515, 1, 0, 0.8470588, 1,
1.052904, -3.106265, 3.283854, 1, 0, 0.8392157, 1,
1.053509, 0.1260707, 0.5605838, 1, 0, 0.8352941, 1,
1.066302, -0.3809861, 2.82844, 1, 0, 0.827451, 1,
1.074653, -0.6307442, 1.782231, 1, 0, 0.8235294, 1,
1.078964, 0.3040192, 0.04608364, 1, 0, 0.8156863, 1,
1.082352, -0.5739197, 3.150734, 1, 0, 0.8117647, 1,
1.083224, 0.1289994, 1.59402, 1, 0, 0.8039216, 1,
1.085553, 0.6993566, 1.453556, 1, 0, 0.7960784, 1,
1.098827, -0.01386857, 1.433555, 1, 0, 0.7921569, 1,
1.100451, -0.6088345, 3.594913, 1, 0, 0.7843137, 1,
1.102077, -0.6078392, 2.599695, 1, 0, 0.7803922, 1,
1.103758, -0.6466083, 3.671849, 1, 0, 0.772549, 1,
1.105133, -2.328625, 2.611746, 1, 0, 0.7686275, 1,
1.111424, 0.8948068, 0.02490423, 1, 0, 0.7607843, 1,
1.120381, 1.295327, 1.88742, 1, 0, 0.7568628, 1,
1.123522, -0.4358029, 2.116422, 1, 0, 0.7490196, 1,
1.132764, -0.3989583, 1.120034, 1, 0, 0.7450981, 1,
1.134578, 0.9592099, 0.7923086, 1, 0, 0.7372549, 1,
1.138775, -0.7257975, 2.14864, 1, 0, 0.7333333, 1,
1.145211, 0.3753009, 3.124551, 1, 0, 0.7254902, 1,
1.146281, 0.9795918, 1.95626, 1, 0, 0.7215686, 1,
1.148235, 1.845486, -0.3292782, 1, 0, 0.7137255, 1,
1.149201, -1.165999, 1.759982, 1, 0, 0.7098039, 1,
1.150023, -1.279978, 2.866061, 1, 0, 0.7019608, 1,
1.169133, -0.6971566, 1.669481, 1, 0, 0.6941177, 1,
1.176204, -0.2466949, 1.067089, 1, 0, 0.6901961, 1,
1.188953, 0.2517871, 1.635307, 1, 0, 0.682353, 1,
1.196802, 0.8811088, 1.225498, 1, 0, 0.6784314, 1,
1.206082, -1.235461, 2.089883, 1, 0, 0.6705883, 1,
1.215803, -2.515224, 2.516848, 1, 0, 0.6666667, 1,
1.221235, 0.7150525, 1.843683, 1, 0, 0.6588235, 1,
1.223283, -0.6600957, 2.921805, 1, 0, 0.654902, 1,
1.22367, 0.6519502, 0.3178968, 1, 0, 0.6470588, 1,
1.239483, 1.393063, 1.683208, 1, 0, 0.6431373, 1,
1.23988, 0.02042251, 1.400405, 1, 0, 0.6352941, 1,
1.24161, -1.840352, 2.759696, 1, 0, 0.6313726, 1,
1.244153, -0.08879847, 2.374969, 1, 0, 0.6235294, 1,
1.245757, -0.6674127, 1.673473, 1, 0, 0.6196079, 1,
1.24915, -0.3400497, 2.482663, 1, 0, 0.6117647, 1,
1.251434, -0.4255573, 0.7145605, 1, 0, 0.6078432, 1,
1.254196, -0.1847002, 0.8831228, 1, 0, 0.6, 1,
1.256059, 0.4863687, 1.6433, 1, 0, 0.5921569, 1,
1.257187, -0.5513197, -1.003357, 1, 0, 0.5882353, 1,
1.258036, -0.1738412, 0.0263326, 1, 0, 0.5803922, 1,
1.265768, -0.2442853, 2.515892, 1, 0, 0.5764706, 1,
1.270315, 0.6781241, 1.939855, 1, 0, 0.5686275, 1,
1.27476, -0.6523411, 2.218153, 1, 0, 0.5647059, 1,
1.280727, -2.092999, 1.234795, 1, 0, 0.5568628, 1,
1.28661, 1.958292, 0.4230634, 1, 0, 0.5529412, 1,
1.294534, -2.972494, 3.597466, 1, 0, 0.5450981, 1,
1.312615, -0.4272431, 1.375243, 1, 0, 0.5411765, 1,
1.313183, -0.1494676, 2.02339, 1, 0, 0.5333334, 1,
1.318269, -1.283347, 1.667486, 1, 0, 0.5294118, 1,
1.33657, 0.2073879, 0.868975, 1, 0, 0.5215687, 1,
1.342827, -1.033001, 0.4394544, 1, 0, 0.5176471, 1,
1.345253, 0.372142, 2.681015, 1, 0, 0.509804, 1,
1.355295, 2.361904, 2.027878, 1, 0, 0.5058824, 1,
1.356709, 0.1546841, 3.617934, 1, 0, 0.4980392, 1,
1.359879, 1.65148, 1.251138, 1, 0, 0.4901961, 1,
1.36424, 0.3820592, 0.9220938, 1, 0, 0.4862745, 1,
1.365056, 0.08602954, -0.1937713, 1, 0, 0.4784314, 1,
1.365169, -0.6099752, 0.647913, 1, 0, 0.4745098, 1,
1.365922, -0.2563336, 1.771891, 1, 0, 0.4666667, 1,
1.366292, -0.3525567, 2.200751, 1, 0, 0.4627451, 1,
1.367588, 0.7371389, 0.6861941, 1, 0, 0.454902, 1,
1.368493, -0.84816, 3.075743, 1, 0, 0.4509804, 1,
1.378395, -0.3060926, 0.558639, 1, 0, 0.4431373, 1,
1.390148, -0.2566251, 2.816542, 1, 0, 0.4392157, 1,
1.395323, -0.8526395, 4.007149, 1, 0, 0.4313726, 1,
1.42357, -0.7843587, 2.865686, 1, 0, 0.427451, 1,
1.427239, -0.8053715, 3.396676, 1, 0, 0.4196078, 1,
1.433774, 1.018897, 0.3756163, 1, 0, 0.4156863, 1,
1.439596, -1.093941, 2.136403, 1, 0, 0.4078431, 1,
1.451945, -1.518453, 2.022545, 1, 0, 0.4039216, 1,
1.464946, 0.6031278, 0.6691923, 1, 0, 0.3960784, 1,
1.482894, 0.9004667, 1.4877, 1, 0, 0.3882353, 1,
1.483284, 0.2159381, 0.889502, 1, 0, 0.3843137, 1,
1.495692, -0.3792833, 1.541189, 1, 0, 0.3764706, 1,
1.503935, 1.590109, 0.3462877, 1, 0, 0.372549, 1,
1.508373, 2.083235, 1.126929, 1, 0, 0.3647059, 1,
1.518395, 0.1622688, 0.9297253, 1, 0, 0.3607843, 1,
1.526989, -1.600925, 1.80847, 1, 0, 0.3529412, 1,
1.550121, -0.5988104, -0.06012399, 1, 0, 0.3490196, 1,
1.55663, -0.6912867, 0.7934494, 1, 0, 0.3411765, 1,
1.565032, -2.480092, 1.167861, 1, 0, 0.3372549, 1,
1.594658, -1.008138, 2.887367, 1, 0, 0.3294118, 1,
1.605115, -1.02684, 2.911918, 1, 0, 0.3254902, 1,
1.605992, 0.0713421, 1.761748, 1, 0, 0.3176471, 1,
1.606556, 0.536647, 3.69416, 1, 0, 0.3137255, 1,
1.61106, -1.254233, 3.555995, 1, 0, 0.3058824, 1,
1.612887, -0.004477577, 0.1486821, 1, 0, 0.2980392, 1,
1.614148, -0.8913126, 0.824875, 1, 0, 0.2941177, 1,
1.651212, 1.047594, 0.9835681, 1, 0, 0.2862745, 1,
1.651712, -0.06919913, 1.09828, 1, 0, 0.282353, 1,
1.652831, -1.136644, 3.170132, 1, 0, 0.2745098, 1,
1.67287, 1.716179, 2.817547, 1, 0, 0.2705882, 1,
1.684762, -0.07903662, 4.104178, 1, 0, 0.2627451, 1,
1.724533, -0.3708582, 1.463083, 1, 0, 0.2588235, 1,
1.761347, -1.522037, 2.653212, 1, 0, 0.2509804, 1,
1.771572, 1.367047, 0.2484212, 1, 0, 0.2470588, 1,
1.785995, 1.566855, 2.041664, 1, 0, 0.2392157, 1,
1.792247, 1.139886, -0.2018023, 1, 0, 0.2352941, 1,
1.797854, 0.5047653, 1.957438, 1, 0, 0.227451, 1,
1.815747, 2.095275, -0.2497879, 1, 0, 0.2235294, 1,
1.820964, 0.1392359, 0.4761579, 1, 0, 0.2156863, 1,
1.863104, -0.1584007, 0.8240277, 1, 0, 0.2117647, 1,
1.867125, -0.004954573, 1.728334, 1, 0, 0.2039216, 1,
1.869986, 0.9219221, 1.043272, 1, 0, 0.1960784, 1,
1.870995, 2.176143, 1.300055, 1, 0, 0.1921569, 1,
1.890837, 1.70684, -0.1483136, 1, 0, 0.1843137, 1,
1.94421, -0.212653, 2.021271, 1, 0, 0.1803922, 1,
1.944595, 0.9800818, 2.087167, 1, 0, 0.172549, 1,
1.954219, -1.929553, 1.886008, 1, 0, 0.1686275, 1,
1.972009, 0.2070475, 0.9525333, 1, 0, 0.1607843, 1,
1.977196, -1.473519, 2.005775, 1, 0, 0.1568628, 1,
1.995417, 1.150391, 0.07234725, 1, 0, 0.1490196, 1,
2.035087, -0.3702192, 2.207121, 1, 0, 0.145098, 1,
2.059836, -0.9645374, 0.99458, 1, 0, 0.1372549, 1,
2.108788, -0.8621839, 2.646235, 1, 0, 0.1333333, 1,
2.111832, -0.4427447, 2.566444, 1, 0, 0.1254902, 1,
2.113961, -0.4528396, 2.04196, 1, 0, 0.1215686, 1,
2.205842, -0.8137546, 1.899033, 1, 0, 0.1137255, 1,
2.227937, -0.4864678, 0.8181184, 1, 0, 0.1098039, 1,
2.303142, 1.161391, 1.354053, 1, 0, 0.1019608, 1,
2.349283, -1.163494, 3.045474, 1, 0, 0.09411765, 1,
2.358609, -1.284081, -0.03817938, 1, 0, 0.09019608, 1,
2.364531, 0.8348399, 2.228251, 1, 0, 0.08235294, 1,
2.374308, -0.477153, -0.7946568, 1, 0, 0.07843138, 1,
2.399165, -0.8753179, 2.329251, 1, 0, 0.07058824, 1,
2.451266, 1.119974, 0.5916994, 1, 0, 0.06666667, 1,
2.461593, 0.228363, 0.5830102, 1, 0, 0.05882353, 1,
2.468324, 0.07932124, 3.257432, 1, 0, 0.05490196, 1,
2.476424, -1.10154, 1.10952, 1, 0, 0.04705882, 1,
2.698834, -1.024374, 0.3861987, 1, 0, 0.04313726, 1,
2.714641, -0.4643535, 2.793656, 1, 0, 0.03529412, 1,
2.734205, 1.033863, 2.264392, 1, 0, 0.03137255, 1,
2.748539, -0.3217623, 0.4065163, 1, 0, 0.02352941, 1,
2.824967, -1.183773, -0.4782515, 1, 0, 0.01960784, 1,
3.041511, 0.1934026, 2.997027, 1, 0, 0.01176471, 1,
3.056788, 0.6358031, -0.7107563, 1, 0, 0.007843138, 1
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
-0.02450252, -4.161789, -7.857271, 0, -0.5, 0.5, 0.5,
-0.02450252, -4.161789, -7.857271, 1, -0.5, 0.5, 0.5,
-0.02450252, -4.161789, -7.857271, 1, 1.5, 0.5, 0.5,
-0.02450252, -4.161789, -7.857271, 0, 1.5, 0.5, 0.5
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
-4.150351, 0.007376671, -7.857271, 0, -0.5, 0.5, 0.5,
-4.150351, 0.007376671, -7.857271, 1, -0.5, 0.5, 0.5,
-4.150351, 0.007376671, -7.857271, 1, 1.5, 0.5, 0.5,
-4.150351, 0.007376671, -7.857271, 0, 1.5, 0.5, 0.5
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
-4.150351, -4.161789, -0.2522461, 0, -0.5, 0.5, 0.5,
-4.150351, -4.161789, -0.2522461, 1, -0.5, 0.5, 0.5,
-4.150351, -4.161789, -0.2522461, 1, 1.5, 0.5, 0.5,
-4.150351, -4.161789, -0.2522461, 0, 1.5, 0.5, 0.5
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
-3, -3.199674, -6.102265,
3, -3.199674, -6.102265,
-3, -3.199674, -6.102265,
-3, -3.360026, -6.394766,
-2, -3.199674, -6.102265,
-2, -3.360026, -6.394766,
-1, -3.199674, -6.102265,
-1, -3.360026, -6.394766,
0, -3.199674, -6.102265,
0, -3.360026, -6.394766,
1, -3.199674, -6.102265,
1, -3.360026, -6.394766,
2, -3.199674, -6.102265,
2, -3.360026, -6.394766,
3, -3.199674, -6.102265,
3, -3.360026, -6.394766
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
-3, -3.680731, -6.979768, 0, -0.5, 0.5, 0.5,
-3, -3.680731, -6.979768, 1, -0.5, 0.5, 0.5,
-3, -3.680731, -6.979768, 1, 1.5, 0.5, 0.5,
-3, -3.680731, -6.979768, 0, 1.5, 0.5, 0.5,
-2, -3.680731, -6.979768, 0, -0.5, 0.5, 0.5,
-2, -3.680731, -6.979768, 1, -0.5, 0.5, 0.5,
-2, -3.680731, -6.979768, 1, 1.5, 0.5, 0.5,
-2, -3.680731, -6.979768, 0, 1.5, 0.5, 0.5,
-1, -3.680731, -6.979768, 0, -0.5, 0.5, 0.5,
-1, -3.680731, -6.979768, 1, -0.5, 0.5, 0.5,
-1, -3.680731, -6.979768, 1, 1.5, 0.5, 0.5,
-1, -3.680731, -6.979768, 0, 1.5, 0.5, 0.5,
0, -3.680731, -6.979768, 0, -0.5, 0.5, 0.5,
0, -3.680731, -6.979768, 1, -0.5, 0.5, 0.5,
0, -3.680731, -6.979768, 1, 1.5, 0.5, 0.5,
0, -3.680731, -6.979768, 0, 1.5, 0.5, 0.5,
1, -3.680731, -6.979768, 0, -0.5, 0.5, 0.5,
1, -3.680731, -6.979768, 1, -0.5, 0.5, 0.5,
1, -3.680731, -6.979768, 1, 1.5, 0.5, 0.5,
1, -3.680731, -6.979768, 0, 1.5, 0.5, 0.5,
2, -3.680731, -6.979768, 0, -0.5, 0.5, 0.5,
2, -3.680731, -6.979768, 1, -0.5, 0.5, 0.5,
2, -3.680731, -6.979768, 1, 1.5, 0.5, 0.5,
2, -3.680731, -6.979768, 0, 1.5, 0.5, 0.5,
3, -3.680731, -6.979768, 0, -0.5, 0.5, 0.5,
3, -3.680731, -6.979768, 1, -0.5, 0.5, 0.5,
3, -3.680731, -6.979768, 1, 1.5, 0.5, 0.5,
3, -3.680731, -6.979768, 0, 1.5, 0.5, 0.5
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
-3.198232, -3, -6.102265,
-3.198232, 3, -6.102265,
-3.198232, -3, -6.102265,
-3.356918, -3, -6.394766,
-3.198232, -2, -6.102265,
-3.356918, -2, -6.394766,
-3.198232, -1, -6.102265,
-3.356918, -1, -6.394766,
-3.198232, 0, -6.102265,
-3.356918, 0, -6.394766,
-3.198232, 1, -6.102265,
-3.356918, 1, -6.394766,
-3.198232, 2, -6.102265,
-3.356918, 2, -6.394766,
-3.198232, 3, -6.102265,
-3.356918, 3, -6.394766
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
-3.674291, -3, -6.979768, 0, -0.5, 0.5, 0.5,
-3.674291, -3, -6.979768, 1, -0.5, 0.5, 0.5,
-3.674291, -3, -6.979768, 1, 1.5, 0.5, 0.5,
-3.674291, -3, -6.979768, 0, 1.5, 0.5, 0.5,
-3.674291, -2, -6.979768, 0, -0.5, 0.5, 0.5,
-3.674291, -2, -6.979768, 1, -0.5, 0.5, 0.5,
-3.674291, -2, -6.979768, 1, 1.5, 0.5, 0.5,
-3.674291, -2, -6.979768, 0, 1.5, 0.5, 0.5,
-3.674291, -1, -6.979768, 0, -0.5, 0.5, 0.5,
-3.674291, -1, -6.979768, 1, -0.5, 0.5, 0.5,
-3.674291, -1, -6.979768, 1, 1.5, 0.5, 0.5,
-3.674291, -1, -6.979768, 0, 1.5, 0.5, 0.5,
-3.674291, 0, -6.979768, 0, -0.5, 0.5, 0.5,
-3.674291, 0, -6.979768, 1, -0.5, 0.5, 0.5,
-3.674291, 0, -6.979768, 1, 1.5, 0.5, 0.5,
-3.674291, 0, -6.979768, 0, 1.5, 0.5, 0.5,
-3.674291, 1, -6.979768, 0, -0.5, 0.5, 0.5,
-3.674291, 1, -6.979768, 1, -0.5, 0.5, 0.5,
-3.674291, 1, -6.979768, 1, 1.5, 0.5, 0.5,
-3.674291, 1, -6.979768, 0, 1.5, 0.5, 0.5,
-3.674291, 2, -6.979768, 0, -0.5, 0.5, 0.5,
-3.674291, 2, -6.979768, 1, -0.5, 0.5, 0.5,
-3.674291, 2, -6.979768, 1, 1.5, 0.5, 0.5,
-3.674291, 2, -6.979768, 0, 1.5, 0.5, 0.5,
-3.674291, 3, -6.979768, 0, -0.5, 0.5, 0.5,
-3.674291, 3, -6.979768, 1, -0.5, 0.5, 0.5,
-3.674291, 3, -6.979768, 1, 1.5, 0.5, 0.5,
-3.674291, 3, -6.979768, 0, 1.5, 0.5, 0.5
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
-3.198232, -3.199674, -4,
-3.198232, -3.199674, 4,
-3.198232, -3.199674, -4,
-3.356918, -3.360026, -4,
-3.198232, -3.199674, -2,
-3.356918, -3.360026, -2,
-3.198232, -3.199674, 0,
-3.356918, -3.360026, 0,
-3.198232, -3.199674, 2,
-3.356918, -3.360026, 2,
-3.198232, -3.199674, 4,
-3.356918, -3.360026, 4
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
-3.674291, -3.680731, -4, 0, -0.5, 0.5, 0.5,
-3.674291, -3.680731, -4, 1, -0.5, 0.5, 0.5,
-3.674291, -3.680731, -4, 1, 1.5, 0.5, 0.5,
-3.674291, -3.680731, -4, 0, 1.5, 0.5, 0.5,
-3.674291, -3.680731, -2, 0, -0.5, 0.5, 0.5,
-3.674291, -3.680731, -2, 1, -0.5, 0.5, 0.5,
-3.674291, -3.680731, -2, 1, 1.5, 0.5, 0.5,
-3.674291, -3.680731, -2, 0, 1.5, 0.5, 0.5,
-3.674291, -3.680731, 0, 0, -0.5, 0.5, 0.5,
-3.674291, -3.680731, 0, 1, -0.5, 0.5, 0.5,
-3.674291, -3.680731, 0, 1, 1.5, 0.5, 0.5,
-3.674291, -3.680731, 0, 0, 1.5, 0.5, 0.5,
-3.674291, -3.680731, 2, 0, -0.5, 0.5, 0.5,
-3.674291, -3.680731, 2, 1, -0.5, 0.5, 0.5,
-3.674291, -3.680731, 2, 1, 1.5, 0.5, 0.5,
-3.674291, -3.680731, 2, 0, 1.5, 0.5, 0.5,
-3.674291, -3.680731, 4, 0, -0.5, 0.5, 0.5,
-3.674291, -3.680731, 4, 1, -0.5, 0.5, 0.5,
-3.674291, -3.680731, 4, 1, 1.5, 0.5, 0.5,
-3.674291, -3.680731, 4, 0, 1.5, 0.5, 0.5
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
-3.198232, -3.199674, -6.102265,
-3.198232, 3.214427, -6.102265,
-3.198232, -3.199674, 5.597773,
-3.198232, 3.214427, 5.597773,
-3.198232, -3.199674, -6.102265,
-3.198232, -3.199674, 5.597773,
-3.198232, 3.214427, -6.102265,
-3.198232, 3.214427, 5.597773,
-3.198232, -3.199674, -6.102265,
3.149227, -3.199674, -6.102265,
-3.198232, -3.199674, 5.597773,
3.149227, -3.199674, 5.597773,
-3.198232, 3.214427, -6.102265,
3.149227, 3.214427, -6.102265,
-3.198232, 3.214427, 5.597773,
3.149227, 3.214427, 5.597773,
3.149227, -3.199674, -6.102265,
3.149227, 3.214427, -6.102265,
3.149227, -3.199674, 5.597773,
3.149227, 3.214427, 5.597773,
3.149227, -3.199674, -6.102265,
3.149227, -3.199674, 5.597773,
3.149227, 3.214427, -6.102265,
3.149227, 3.214427, 5.597773
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
var radius = 7.889946;
var distance = 35.10326;
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
mvMatrix.translate( 0.02450252, -0.007376671, 0.2522461 );
mvMatrix.scale( 1.343965, 1.330002, 0.7291228 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.10326);
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
thiodicarb<-read.table("thiodicarb.xyz")
```

```
## Error in read.table("thiodicarb.xyz"): no lines available in input
```

```r
x<-thiodicarb$V2
```

```
## Error in eval(expr, envir, enclos): object 'thiodicarb' not found
```

```r
y<-thiodicarb$V3
```

```
## Error in eval(expr, envir, enclos): object 'thiodicarb' not found
```

```r
z<-thiodicarb$V4
```

```
## Error in eval(expr, envir, enclos): object 'thiodicarb' not found
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
-3.105793, 2.399837, -2.159466, 0, 0, 1, 1, 1,
-2.595574, 0.08623759, -2.769982, 1, 0, 0, 1, 1,
-2.534345, -0.5822177, -1.346675, 1, 0, 0, 1, 1,
-2.533095, 0.4339562, -1.57064, 1, 0, 0, 1, 1,
-2.49304, 0.5535033, -0.1657083, 1, 0, 0, 1, 1,
-2.290765, 0.9237267, -1.399592, 1, 0, 0, 1, 1,
-2.284384, 0.2759221, -2.706712, 0, 0, 0, 1, 1,
-2.280775, -1.853536, -0.4520762, 0, 0, 0, 1, 1,
-2.266319, -1.09793, -2.143579, 0, 0, 0, 1, 1,
-2.264814, 0.3510711, -0.3420389, 0, 0, 0, 1, 1,
-2.2589, -0.1573904, -1.510237, 0, 0, 0, 1, 1,
-2.205536, -1.216039, -3.06867, 0, 0, 0, 1, 1,
-2.193138, 0.1031814, -1.847899, 0, 0, 0, 1, 1,
-2.113112, -0.8094386, -2.568463, 1, 1, 1, 1, 1,
-2.104716, 0.3958142, -3.702985, 1, 1, 1, 1, 1,
-2.082664, -0.277089, -1.225862, 1, 1, 1, 1, 1,
-2.065593, 1.291465, -2.093844, 1, 1, 1, 1, 1,
-2.063438, -1.301459, -2.099922, 1, 1, 1, 1, 1,
-2.058607, -1.040133, -1.74459, 1, 1, 1, 1, 1,
-2.011611, -0.8220854, -3.112582, 1, 1, 1, 1, 1,
-1.993957, 0.1630168, -1.019531, 1, 1, 1, 1, 1,
-1.99139, 0.8068784, -0.8837726, 1, 1, 1, 1, 1,
-1.99096, 0.700052, -1.604844, 1, 1, 1, 1, 1,
-1.975249, 0.6356744, -1.121867, 1, 1, 1, 1, 1,
-1.969109, -0.09534193, -3.73586, 1, 1, 1, 1, 1,
-1.883603, 0.3662923, -2.278567, 1, 1, 1, 1, 1,
-1.861723, -0.1138903, -0.7728063, 1, 1, 1, 1, 1,
-1.853572, 0.02225239, -2.649569, 1, 1, 1, 1, 1,
-1.845412, -0.5513135, -2.122038, 0, 0, 1, 1, 1,
-1.806459, 1.070102, -0.8296323, 1, 0, 0, 1, 1,
-1.791441, -0.6983783, -2.145883, 1, 0, 0, 1, 1,
-1.749265, 0.1766374, -1.870658, 1, 0, 0, 1, 1,
-1.738587, 1.376425, -0.7248672, 1, 0, 0, 1, 1,
-1.734138, 0.8165875, -1.51734, 1, 0, 0, 1, 1,
-1.730531, 1.163923, -0.2259675, 0, 0, 0, 1, 1,
-1.725559, 1.483161, 0.980096, 0, 0, 0, 1, 1,
-1.722716, -0.4574852, -1.959793, 0, 0, 0, 1, 1,
-1.692344, 0.1143598, -0.6134222, 0, 0, 0, 1, 1,
-1.682454, 0.8115122, -0.689706, 0, 0, 0, 1, 1,
-1.679549, -0.7375768, -1.779336, 0, 0, 0, 1, 1,
-1.677312, -0.4609951, -2.043592, 0, 0, 0, 1, 1,
-1.67342, 0.1888401, -2.739203, 1, 1, 1, 1, 1,
-1.661085, -0.5260214, -2.235366, 1, 1, 1, 1, 1,
-1.658546, 0.8298573, -2.934994, 1, 1, 1, 1, 1,
-1.657598, 0.4730631, -2.18825, 1, 1, 1, 1, 1,
-1.654733, 0.2089632, -2.927242, 1, 1, 1, 1, 1,
-1.646808, -0.08806959, -0.4985761, 1, 1, 1, 1, 1,
-1.641171, -0.7179177, -3.395017, 1, 1, 1, 1, 1,
-1.62643, -0.02535955, -2.45493, 1, 1, 1, 1, 1,
-1.611372, -0.7562783, -3.521353, 1, 1, 1, 1, 1,
-1.607925, 0.1646978, -2.022908, 1, 1, 1, 1, 1,
-1.597953, -0.2041093, -0.6418908, 1, 1, 1, 1, 1,
-1.593431, 0.4987215, -1.821497, 1, 1, 1, 1, 1,
-1.575058, 0.2401653, 0.4791697, 1, 1, 1, 1, 1,
-1.575029, -0.4859009, -2.597708, 1, 1, 1, 1, 1,
-1.574556, 1.761622, 0.8013611, 1, 1, 1, 1, 1,
-1.566468, 0.694398, 0.5013368, 0, 0, 1, 1, 1,
-1.565262, 0.1010368, -1.737971, 1, 0, 0, 1, 1,
-1.551816, 0.1159506, -2.567976, 1, 0, 0, 1, 1,
-1.539716, 0.3723558, -0.4864758, 1, 0, 0, 1, 1,
-1.514232, 1.042048, -1.29637, 1, 0, 0, 1, 1,
-1.500651, 2.138453, -0.7890837, 1, 0, 0, 1, 1,
-1.491128, 0.8127295, -0.3038564, 0, 0, 0, 1, 1,
-1.491087, -1.01667, -1.008321, 0, 0, 0, 1, 1,
-1.479547, 0.442815, -1.809058, 0, 0, 0, 1, 1,
-1.470667, -0.9217753, -1.261551, 0, 0, 0, 1, 1,
-1.468264, -1.258613, -0.3092, 0, 0, 0, 1, 1,
-1.462487, -2.163799, -2.594115, 0, 0, 0, 1, 1,
-1.46054, -1.009456, -2.352986, 0, 0, 0, 1, 1,
-1.456618, -1.654142, -2.19226, 1, 1, 1, 1, 1,
-1.441393, 0.6787395, -0.6205673, 1, 1, 1, 1, 1,
-1.434764, 0.03920572, -1.735433, 1, 1, 1, 1, 1,
-1.433312, -0.5441107, 1.030452, 1, 1, 1, 1, 1,
-1.428933, 1.027644, -1.40965, 1, 1, 1, 1, 1,
-1.423841, 0.2063358, -2.30428, 1, 1, 1, 1, 1,
-1.422237, 0.09498275, -3.021271, 1, 1, 1, 1, 1,
-1.415627, 0.5143932, -2.227728, 1, 1, 1, 1, 1,
-1.410784, 0.05851894, -3.426233, 1, 1, 1, 1, 1,
-1.409532, -0.09035536, -2.252358, 1, 1, 1, 1, 1,
-1.400284, 0.1066068, -1.192184, 1, 1, 1, 1, 1,
-1.399554, 1.56322, -0.2569095, 1, 1, 1, 1, 1,
-1.391514, 0.2352316, -1.144884, 1, 1, 1, 1, 1,
-1.385241, 0.000773101, -2.124549, 1, 1, 1, 1, 1,
-1.376508, -0.8299022, -4.422456, 1, 1, 1, 1, 1,
-1.354642, -1.962604, -3.599354, 0, 0, 1, 1, 1,
-1.349085, 0.4903618, 1.593215, 1, 0, 0, 1, 1,
-1.345863, -0.7897184, -1.113356, 1, 0, 0, 1, 1,
-1.343365, -0.02816788, -1.999728, 1, 0, 0, 1, 1,
-1.341161, 0.7820948, -1.938071, 1, 0, 0, 1, 1,
-1.34016, -0.2201523, -1.525568, 1, 0, 0, 1, 1,
-1.334818, 1.300683, -2.018263, 0, 0, 0, 1, 1,
-1.331338, -1.162028, -2.163152, 0, 0, 0, 1, 1,
-1.329901, -1.027064, -2.239419, 0, 0, 0, 1, 1,
-1.329786, -2.04899, -4.037172, 0, 0, 0, 1, 1,
-1.32503, -0.5235329, -1.609475, 0, 0, 0, 1, 1,
-1.318918, -1.713495, -0.585843, 0, 0, 0, 1, 1,
-1.309534, 0.2827433, 0.7257743, 0, 0, 0, 1, 1,
-1.300183, -0.07934167, -2.184697, 1, 1, 1, 1, 1,
-1.292888, 1.044608, 0.8805835, 1, 1, 1, 1, 1,
-1.292142, -1.60081, -1.434288, 1, 1, 1, 1, 1,
-1.285924, 0.5639768, -2.167731, 1, 1, 1, 1, 1,
-1.283392, 0.01140563, 0.2705634, 1, 1, 1, 1, 1,
-1.281913, -1.233947, -2.809222, 1, 1, 1, 1, 1,
-1.281678, -1.647429, -1.699351, 1, 1, 1, 1, 1,
-1.272906, 2.148774, 0.6354128, 1, 1, 1, 1, 1,
-1.257966, 1.077426, 0.2960284, 1, 1, 1, 1, 1,
-1.250258, 0.3670507, -2.660471, 1, 1, 1, 1, 1,
-1.23675, 1.250079, -1.717241, 1, 1, 1, 1, 1,
-1.221379, -0.8386419, -3.126111, 1, 1, 1, 1, 1,
-1.213382, -0.3759155, -2.777853, 1, 1, 1, 1, 1,
-1.205046, 1.442054, -0.6917099, 1, 1, 1, 1, 1,
-1.201724, 0.3166184, -1.567509, 1, 1, 1, 1, 1,
-1.199072, -0.9143777, -2.714507, 0, 0, 1, 1, 1,
-1.193811, -0.6619743, -1.483803, 1, 0, 0, 1, 1,
-1.190446, -0.0493978, -0.7095619, 1, 0, 0, 1, 1,
-1.189794, 0.5064579, -1.425416, 1, 0, 0, 1, 1,
-1.185444, -0.2713528, -0.8938043, 1, 0, 0, 1, 1,
-1.183394, -0.9898224, -2.72714, 1, 0, 0, 1, 1,
-1.171139, -1.350273, -1.765566, 0, 0, 0, 1, 1,
-1.167121, -1.549495, -4.428386, 0, 0, 0, 1, 1,
-1.166828, 1.547253, -0.8643404, 0, 0, 0, 1, 1,
-1.166737, 1.118878, -1.439682, 0, 0, 0, 1, 1,
-1.165664, 0.1424673, -4.220846, 0, 0, 0, 1, 1,
-1.154778, -1.221832, -2.799392, 0, 0, 0, 1, 1,
-1.149297, -1.254915, -0.4281325, 0, 0, 0, 1, 1,
-1.136751, 0.7613668, -0.1633231, 1, 1, 1, 1, 1,
-1.131336, 0.7943081, -1.306072, 1, 1, 1, 1, 1,
-1.129982, -1.050089, -1.942581, 1, 1, 1, 1, 1,
-1.124697, 0.8599207, -0.0835766, 1, 1, 1, 1, 1,
-1.123759, -0.3767203, -3.088185, 1, 1, 1, 1, 1,
-1.122187, -0.3826558, -1.574114, 1, 1, 1, 1, 1,
-1.121698, 1.202427, -1.909762, 1, 1, 1, 1, 1,
-1.119693, 0.614051, -1.681529, 1, 1, 1, 1, 1,
-1.10907, 0.04503177, -0.4024518, 1, 1, 1, 1, 1,
-1.100549, 0.7302964, -2.049037, 1, 1, 1, 1, 1,
-1.099339, 0.7100571, 0.3147977, 1, 1, 1, 1, 1,
-1.098241, 0.1794047, -0.4007854, 1, 1, 1, 1, 1,
-1.091044, 0.8927327, -2.182786, 1, 1, 1, 1, 1,
-1.089957, -0.4249263, -2.269358, 1, 1, 1, 1, 1,
-1.087227, 0.2240043, 0.5006397, 1, 1, 1, 1, 1,
-1.086071, 0.3059582, -1.530095, 0, 0, 1, 1, 1,
-1.0857, -1.676757, -2.5059, 1, 0, 0, 1, 1,
-1.081116, -0.2933625, -3.592834, 1, 0, 0, 1, 1,
-1.079571, 0.3158011, -3.189107, 1, 0, 0, 1, 1,
-1.078258, -0.2138946, -2.112683, 1, 0, 0, 1, 1,
-1.0744, 0.5502858, -1.41983, 1, 0, 0, 1, 1,
-1.072768, 0.9558571, -1.176944, 0, 0, 0, 1, 1,
-1.071714, 1.22896, -1.311796, 0, 0, 0, 1, 1,
-1.066002, -1.095297, -2.031873, 0, 0, 0, 1, 1,
-1.064536, 0.314162, -1.792638, 0, 0, 0, 1, 1,
-1.063687, -1.162808, 0.003280456, 0, 0, 0, 1, 1,
-1.063599, 0.06997862, -1.4876, 0, 0, 0, 1, 1,
-1.046573, -0.7568625, -2.832916, 0, 0, 0, 1, 1,
-1.046292, -0.9683304, -1.353648, 1, 1, 1, 1, 1,
-1.044288, -0.4482962, -1.637354, 1, 1, 1, 1, 1,
-1.043854, -1.381194, -5.019308, 1, 1, 1, 1, 1,
-1.041688, -0.4871539, -2.267512, 1, 1, 1, 1, 1,
-1.036204, 0.3306228, -2.021456, 1, 1, 1, 1, 1,
-1.034845, -0.6310338, -2.464357, 1, 1, 1, 1, 1,
-1.028797, 0.1047382, -1.390884, 1, 1, 1, 1, 1,
-1.021498, 0.6345586, -0.09257647, 1, 1, 1, 1, 1,
-1.018201, 0.383559, -1.795216, 1, 1, 1, 1, 1,
-1.003268, 0.9013109, -0.8752788, 1, 1, 1, 1, 1,
-1.002648, 0.6432759, -0.2821791, 1, 1, 1, 1, 1,
-0.9976576, -1.278629, -4.218874, 1, 1, 1, 1, 1,
-0.9934943, -0.8130977, -2.222303, 1, 1, 1, 1, 1,
-0.9840472, -0.03377979, 0.1964593, 1, 1, 1, 1, 1,
-0.9830176, -1.217785, -2.066733, 1, 1, 1, 1, 1,
-0.9824392, 0.7236198, -0.4405678, 0, 0, 1, 1, 1,
-0.9816051, 0.5813615, -0.3779445, 1, 0, 0, 1, 1,
-0.9734802, -1.014245, -2.189979, 1, 0, 0, 1, 1,
-0.9619577, 0.535542, -2.017356, 1, 0, 0, 1, 1,
-0.9604551, 0.4534468, -0.5119068, 1, 0, 0, 1, 1,
-0.9591016, -0.23241, -2.131183, 1, 0, 0, 1, 1,
-0.9579433, -1.257049, -3.778234, 0, 0, 0, 1, 1,
-0.955336, -0.6916232, -2.290943, 0, 0, 0, 1, 1,
-0.9542682, -0.3413767, -2.841975, 0, 0, 0, 1, 1,
-0.9503189, -0.6540101, -0.8726851, 0, 0, 0, 1, 1,
-0.9487965, 1.203677, -1.403132, 0, 0, 0, 1, 1,
-0.9471237, -0.7794397, -2.532043, 0, 0, 0, 1, 1,
-0.9428683, -0.2277661, -2.578722, 0, 0, 0, 1, 1,
-0.9423568, -1.490685, -1.239351, 1, 1, 1, 1, 1,
-0.9381065, -1.402627, -3.501854, 1, 1, 1, 1, 1,
-0.9349899, 0.4752027, -0.8990356, 1, 1, 1, 1, 1,
-0.9268652, -0.8693591, -2.558826, 1, 1, 1, 1, 1,
-0.9190941, -0.2902272, -1.671385, 1, 1, 1, 1, 1,
-0.9147385, 0.2800591, -1.105382, 1, 1, 1, 1, 1,
-0.9137717, 0.3939706, 0.349624, 1, 1, 1, 1, 1,
-0.9115372, -0.1226107, -1.502935, 1, 1, 1, 1, 1,
-0.9089293, 0.5573967, 0.1843089, 1, 1, 1, 1, 1,
-0.9067556, 2.706436, 0.1000308, 1, 1, 1, 1, 1,
-0.905911, 1.142833, -0.1192585, 1, 1, 1, 1, 1,
-0.9040454, -1.133003, -2.186514, 1, 1, 1, 1, 1,
-0.897396, 0.9863005, -0.3422262, 1, 1, 1, 1, 1,
-0.8920358, 0.291563, -1.534217, 1, 1, 1, 1, 1,
-0.8858767, -0.8337771, 0.3346491, 1, 1, 1, 1, 1,
-0.8838758, 1.628051, -1.966079, 0, 0, 1, 1, 1,
-0.8834733, -0.8760028, -4.24284, 1, 0, 0, 1, 1,
-0.8804447, 0.2624268, -1.556479, 1, 0, 0, 1, 1,
-0.8783533, 1.101827, -1.252253, 1, 0, 0, 1, 1,
-0.870066, 1.294648, -1.05141, 1, 0, 0, 1, 1,
-0.8625413, 0.4747894, -0.2080502, 1, 0, 0, 1, 1,
-0.8601663, -2.435353, -2.598565, 0, 0, 0, 1, 1,
-0.8445613, -0.9096598, -2.81626, 0, 0, 0, 1, 1,
-0.8443945, -0.08179785, -2.674938, 0, 0, 0, 1, 1,
-0.8397727, -0.3890351, -1.104467, 0, 0, 0, 1, 1,
-0.838395, 1.316219, -0.3921373, 0, 0, 0, 1, 1,
-0.8362044, 0.8647677, -1.160235, 0, 0, 0, 1, 1,
-0.8305051, 1.318695, 0.9811241, 0, 0, 0, 1, 1,
-0.8244991, 0.1181562, -0.9175662, 1, 1, 1, 1, 1,
-0.8243043, 1.158592, -1.168666, 1, 1, 1, 1, 1,
-0.8210584, 1.051732, -1.294774, 1, 1, 1, 1, 1,
-0.812362, 0.4334279, -2.392283, 1, 1, 1, 1, 1,
-0.8122425, 1.310659, -0.8775641, 1, 1, 1, 1, 1,
-0.8091708, 0.9074394, 0.06555807, 1, 1, 1, 1, 1,
-0.8086868, 0.3100655, -2.391726, 1, 1, 1, 1, 1,
-0.8077334, 0.2519428, -1.319785, 1, 1, 1, 1, 1,
-0.8057069, 0.5383706, -0.01881226, 1, 1, 1, 1, 1,
-0.8051898, 1.273592, -0.7441815, 1, 1, 1, 1, 1,
-0.8014315, -0.4808642, -0.5090966, 1, 1, 1, 1, 1,
-0.7892767, 0.5016215, 0.5334048, 1, 1, 1, 1, 1,
-0.7799668, 1.112614, -1.921829, 1, 1, 1, 1, 1,
-0.7776146, -0.05026922, -2.804436, 1, 1, 1, 1, 1,
-0.7753341, -1.715499, -2.31934, 1, 1, 1, 1, 1,
-0.7744005, 2.213875, -0.8162716, 0, 0, 1, 1, 1,
-0.7641401, -0.3910769, -0.9621717, 1, 0, 0, 1, 1,
-0.7635384, 0.3755445, -1.156208, 1, 0, 0, 1, 1,
-0.7566153, 1.449339, -0.03634428, 1, 0, 0, 1, 1,
-0.7545222, -0.5833196, -0.7957761, 1, 0, 0, 1, 1,
-0.7512042, -0.01600575, -2.833459, 1, 0, 0, 1, 1,
-0.7502654, 0.5851067, 0.1574535, 0, 0, 0, 1, 1,
-0.7463554, -1.147609, -3.2753, 0, 0, 0, 1, 1,
-0.742117, 0.9207942, 0.1550915, 0, 0, 0, 1, 1,
-0.7392962, -1.063951, -3.076514, 0, 0, 0, 1, 1,
-0.7305605, -0.8179282, -1.814351, 0, 0, 0, 1, 1,
-0.730271, -0.9692496, -1.335476, 0, 0, 0, 1, 1,
-0.7099307, -1.093398, -1.504025, 0, 0, 0, 1, 1,
-0.7044066, 1.552966, -0.07505885, 1, 1, 1, 1, 1,
-0.6997488, -0.2114707, -0.6933051, 1, 1, 1, 1, 1,
-0.6977124, -1.107759, -2.854833, 1, 1, 1, 1, 1,
-0.6972007, -0.1647707, -0.5140686, 1, 1, 1, 1, 1,
-0.6960912, -0.6263701, -2.167294, 1, 1, 1, 1, 1,
-0.6951278, -0.199807, -0.4254805, 1, 1, 1, 1, 1,
-0.6945836, 0.2769961, -2.000928, 1, 1, 1, 1, 1,
-0.6893703, 0.6218614, -0.5854082, 1, 1, 1, 1, 1,
-0.6887969, -0.1343539, -3.05836, 1, 1, 1, 1, 1,
-0.6884625, -1.20397, -2.70246, 1, 1, 1, 1, 1,
-0.6881856, -1.423841, -4.527322, 1, 1, 1, 1, 1,
-0.6878422, 0.1710721, -0.274486, 1, 1, 1, 1, 1,
-0.6841747, 1.186331, -0.6217696, 1, 1, 1, 1, 1,
-0.673758, -1.548948, -3.138595, 1, 1, 1, 1, 1,
-0.6691235, -0.01876294, -1.267561, 1, 1, 1, 1, 1,
-0.6677795, 0.009467909, 0.3001561, 0, 0, 1, 1, 1,
-0.6627164, 0.8511753, -1.047015, 1, 0, 0, 1, 1,
-0.6604418, -1.983118, -2.827758, 1, 0, 0, 1, 1,
-0.653511, 0.7091756, -0.8913518, 1, 0, 0, 1, 1,
-0.653309, -0.1996483, -1.910556, 1, 0, 0, 1, 1,
-0.6523476, 0.3992318, -2.489464, 1, 0, 0, 1, 1,
-0.651862, -0.8154746, -2.285112, 0, 0, 0, 1, 1,
-0.6496345, 1.645871, -1.195589, 0, 0, 0, 1, 1,
-0.6440765, 2.303065, 1.537331, 0, 0, 0, 1, 1,
-0.6390202, -1.70308, -1.923999, 0, 0, 0, 1, 1,
-0.6370276, 0.104414, -2.140759, 0, 0, 0, 1, 1,
-0.6369797, 0.5612781, -1.582905, 0, 0, 0, 1, 1,
-0.6357455, 0.2301856, 0.2545318, 0, 0, 0, 1, 1,
-0.6349949, 0.6016393, -0.9767515, 1, 1, 1, 1, 1,
-0.632153, -0.0606685, -1.436141, 1, 1, 1, 1, 1,
-0.6306751, -1.070561, -2.280948, 1, 1, 1, 1, 1,
-0.6296958, -0.3548266, -2.271897, 1, 1, 1, 1, 1,
-0.6286441, 0.2555224, -2.729119, 1, 1, 1, 1, 1,
-0.6248375, 0.9044414, -0.04786691, 1, 1, 1, 1, 1,
-0.6090399, 0.4857262, 0.782942, 1, 1, 1, 1, 1,
-0.6090283, 0.9941891, -1.931007, 1, 1, 1, 1, 1,
-0.6057798, -1.991325, -1.162564, 1, 1, 1, 1, 1,
-0.6050785, 1.185683, -0.117122, 1, 1, 1, 1, 1,
-0.6020851, -2.032928, -2.108455, 1, 1, 1, 1, 1,
-0.6020368, 0.07029624, 0.6181777, 1, 1, 1, 1, 1,
-0.5939111, 1.660049, 0.6075341, 1, 1, 1, 1, 1,
-0.5914527, -1.290677, -1.925727, 1, 1, 1, 1, 1,
-0.5901347, 0.5117882, -2.16991, 1, 1, 1, 1, 1,
-0.5872316, -0.4222293, -0.7792755, 0, 0, 1, 1, 1,
-0.5865576, -0.3847254, -2.930098, 1, 0, 0, 1, 1,
-0.5855765, 0.3410977, -0.236078, 1, 0, 0, 1, 1,
-0.5823019, 1.249551, -1.0553, 1, 0, 0, 1, 1,
-0.5814632, -0.4006845, -1.105306, 1, 0, 0, 1, 1,
-0.5787656, -0.1522323, -2.859823, 1, 0, 0, 1, 1,
-0.575191, -1.257121, -4.085572, 0, 0, 0, 1, 1,
-0.575077, 0.7512464, 0.9702194, 0, 0, 0, 1, 1,
-0.574917, -2.178447, -4.329785, 0, 0, 0, 1, 1,
-0.5639471, -0.6321325, -4.401207, 0, 0, 0, 1, 1,
-0.5598923, 2.074696, -0.2988953, 0, 0, 0, 1, 1,
-0.5572398, -1.705361, -1.609804, 0, 0, 0, 1, 1,
-0.5561051, -1.099844, -2.549004, 0, 0, 0, 1, 1,
-0.5478057, -0.936201, -0.851106, 1, 1, 1, 1, 1,
-0.5377619, -1.897244, -0.4832633, 1, 1, 1, 1, 1,
-0.5366676, 0.1603852, -1.429001, 1, 1, 1, 1, 1,
-0.5315846, -1.564218, -3.290998, 1, 1, 1, 1, 1,
-0.5296817, -0.1473115, -1.721413, 1, 1, 1, 1, 1,
-0.5295627, 2.337221, 0.9433089, 1, 1, 1, 1, 1,
-0.5290767, -0.5599004, -2.275814, 1, 1, 1, 1, 1,
-0.5285273, -0.7964482, -2.647998, 1, 1, 1, 1, 1,
-0.5213072, -1.830876, -3.156986, 1, 1, 1, 1, 1,
-0.5206966, 1.222537, 1.255586, 1, 1, 1, 1, 1,
-0.5177301, 1.369189, -1.387141, 1, 1, 1, 1, 1,
-0.5096563, -0.03445638, -1.105859, 1, 1, 1, 1, 1,
-0.5074857, -0.4273312, -3.275653, 1, 1, 1, 1, 1,
-0.5029196, -1.179857, -5.418856, 1, 1, 1, 1, 1,
-0.5007136, 0.1543147, -2.514344, 1, 1, 1, 1, 1,
-0.4976833, -0.2534871, -3.101337, 0, 0, 1, 1, 1,
-0.4955595, 0.02921401, -1.235338, 1, 0, 0, 1, 1,
-0.487045, -0.1624377, -3.870838, 1, 0, 0, 1, 1,
-0.4845915, -0.3054428, -1.469161, 1, 0, 0, 1, 1,
-0.4845735, -0.3747338, -2.514468, 1, 0, 0, 1, 1,
-0.4815012, 0.6422824, 0.7990826, 1, 0, 0, 1, 1,
-0.4789152, -1.368681, -1.367293, 0, 0, 0, 1, 1,
-0.469421, -1.012879, -2.704271, 0, 0, 0, 1, 1,
-0.4664837, 1.979314, 0.4143907, 0, 0, 0, 1, 1,
-0.4644656, -0.6999662, -3.297606, 0, 0, 0, 1, 1,
-0.4636079, -0.6974303, -1.204774, 0, 0, 0, 1, 1,
-0.4600653, 1.165207, 0.9567914, 0, 0, 0, 1, 1,
-0.4537885, -0.6811298, -1.005429, 0, 0, 0, 1, 1,
-0.4523958, 0.1594543, -2.220702, 1, 1, 1, 1, 1,
-0.4513075, -0.5670581, -4.854058, 1, 1, 1, 1, 1,
-0.4512905, -0.5341786, -1.659138, 1, 1, 1, 1, 1,
-0.4508841, 0.223699, -1.10578, 1, 1, 1, 1, 1,
-0.4498239, -0.4692768, -2.960585, 1, 1, 1, 1, 1,
-0.449608, -0.9708801, -2.16918, 1, 1, 1, 1, 1,
-0.4489758, 0.7981187, -0.6072413, 1, 1, 1, 1, 1,
-0.4485384, -0.3345327, -1.751906, 1, 1, 1, 1, 1,
-0.4460431, 0.6807277, -2.026751, 1, 1, 1, 1, 1,
-0.4453683, -1.431145, -4.064721, 1, 1, 1, 1, 1,
-0.4448416, -0.8211278, -0.7289582, 1, 1, 1, 1, 1,
-0.4425001, 0.6490579, -2.004467, 1, 1, 1, 1, 1,
-0.4372107, -1.844081, -3.482355, 1, 1, 1, 1, 1,
-0.4364952, 0.8519163, -0.9999112, 1, 1, 1, 1, 1,
-0.4337991, 0.8978258, -0.8291732, 1, 1, 1, 1, 1,
-0.4276091, 0.4438699, -1.807404, 0, 0, 1, 1, 1,
-0.4233162, 0.1547188, 0.4891173, 1, 0, 0, 1, 1,
-0.4232425, 1.304032, -1.775688, 1, 0, 0, 1, 1,
-0.4202265, -1.65982, -2.58665, 1, 0, 0, 1, 1,
-0.4195654, -0.5195469, -0.2997079, 1, 0, 0, 1, 1,
-0.4142634, -0.6241519, -2.979623, 1, 0, 0, 1, 1,
-0.3999392, 0.6894971, -0.2803939, 0, 0, 0, 1, 1,
-0.3982682, -0.0111357, -2.490064, 0, 0, 0, 1, 1,
-0.3962233, 0.3636991, -0.6029826, 0, 0, 0, 1, 1,
-0.3959788, -0.645179, -2.418407, 0, 0, 0, 1, 1,
-0.3930351, 0.4359591, -2.569825, 0, 0, 0, 1, 1,
-0.388471, 1.321566, -1.458036, 0, 0, 0, 1, 1,
-0.3862852, 0.1696875, -1.678911, 0, 0, 0, 1, 1,
-0.3856514, 0.1781165, 0.80238, 1, 1, 1, 1, 1,
-0.3856212, -2.67023, -2.349525, 1, 1, 1, 1, 1,
-0.383814, 1.665952, -1.027134, 1, 1, 1, 1, 1,
-0.3821655, -0.4891267, -4.398312, 1, 1, 1, 1, 1,
-0.3757995, 0.1952577, -0.4732676, 1, 1, 1, 1, 1,
-0.3680728, -1.306658, -3.42064, 1, 1, 1, 1, 1,
-0.3668955, -0.3941143, -4.057285, 1, 1, 1, 1, 1,
-0.3585036, 0.6561844, -0.5326161, 1, 1, 1, 1, 1,
-0.3567669, 1.444016, -1.007594, 1, 1, 1, 1, 1,
-0.3550094, -0.2568159, -2.332679, 1, 1, 1, 1, 1,
-0.3526996, -1.035918, -3.672715, 1, 1, 1, 1, 1,
-0.3525392, 0.4598412, -0.01706827, 1, 1, 1, 1, 1,
-0.3437792, 1.198152, -0.6607488, 1, 1, 1, 1, 1,
-0.341563, 0.9430702, 0.07868657, 1, 1, 1, 1, 1,
-0.3394185, 0.7457998, -0.2171974, 1, 1, 1, 1, 1,
-0.3388035, -0.7751215, -3.081172, 0, 0, 1, 1, 1,
-0.338317, -0.8397883, -2.644758, 1, 0, 0, 1, 1,
-0.3380122, -0.8373563, -2.945443, 1, 0, 0, 1, 1,
-0.3364767, 1.033321, 0.4473556, 1, 0, 0, 1, 1,
-0.3357211, 1.646729, -0.4033135, 1, 0, 0, 1, 1,
-0.3338967, -0.351396, -3.895097, 1, 0, 0, 1, 1,
-0.3317485, -0.3340709, -1.435708, 0, 0, 0, 1, 1,
-0.3313603, -0.2265088, -1.740367, 0, 0, 0, 1, 1,
-0.3278899, -1.321705, -4.012542, 0, 0, 0, 1, 1,
-0.3200195, 0.5535025, -0.1003011, 0, 0, 0, 1, 1,
-0.3189826, 1.307369, -0.60205, 0, 0, 0, 1, 1,
-0.3166934, -0.1380999, -0.08144488, 0, 0, 0, 1, 1,
-0.3164348, 0.6755949, -0.3395554, 0, 0, 0, 1, 1,
-0.3143799, 1.401406, 0.03445504, 1, 1, 1, 1, 1,
-0.308002, 0.2779739, -0.4261377, 1, 1, 1, 1, 1,
-0.3044691, 0.7423188, -0.3129928, 1, 1, 1, 1, 1,
-0.3044176, 2.282949, -0.2879505, 1, 1, 1, 1, 1,
-0.3017805, -0.8570384, -4.606003, 1, 1, 1, 1, 1,
-0.299834, 0.5109883, 1.167914, 1, 1, 1, 1, 1,
-0.2984883, 1.338621, 0.4710683, 1, 1, 1, 1, 1,
-0.2924654, 2.045804, -1.20152, 1, 1, 1, 1, 1,
-0.2899651, -0.4364315, -2.266972, 1, 1, 1, 1, 1,
-0.2882282, 0.8320429, -0.7176223, 1, 1, 1, 1, 1,
-0.2851408, -1.171382, -4.122896, 1, 1, 1, 1, 1,
-0.2850746, 0.7581462, 1.581028, 1, 1, 1, 1, 1,
-0.2845036, 1.987126, 0.3635809, 1, 1, 1, 1, 1,
-0.2841699, -1.569936, -3.527562, 1, 1, 1, 1, 1,
-0.2836238, -0.7728667, -2.333723, 1, 1, 1, 1, 1,
-0.2833306, -0.3258739, -2.382238, 0, 0, 1, 1, 1,
-0.2826739, 0.7624064, 1.429482, 1, 0, 0, 1, 1,
-0.2810284, -0.2199904, -1.106916, 1, 0, 0, 1, 1,
-0.2795789, 1.076931, -0.3645364, 1, 0, 0, 1, 1,
-0.2758685, -0.0153559, -2.596758, 1, 0, 0, 1, 1,
-0.2666888, -1.926638, -2.983266, 1, 0, 0, 1, 1,
-0.2646998, 0.05921387, 0.2196594, 0, 0, 0, 1, 1,
-0.2645645, -0.3526745, -2.010269, 0, 0, 0, 1, 1,
-0.2628113, 1.52171, -1.407287, 0, 0, 0, 1, 1,
-0.2600079, 0.9181939, 1.282579, 0, 0, 0, 1, 1,
-0.2595629, 0.8030389, 0.277784, 0, 0, 0, 1, 1,
-0.2594498, 0.7032147, -0.8714751, 0, 0, 0, 1, 1,
-0.2573935, 1.072653, 1.315535, 0, 0, 0, 1, 1,
-0.2549739, 0.3091579, -1.364121, 1, 1, 1, 1, 1,
-0.2547954, -1.16592, -2.957782, 1, 1, 1, 1, 1,
-0.2472558, -0.5386811, -2.496384, 1, 1, 1, 1, 1,
-0.2372907, -0.2286569, -1.968115, 1, 1, 1, 1, 1,
-0.2353908, -0.8697798, -1.939915, 1, 1, 1, 1, 1,
-0.2352438, 0.5095497, -1.798889, 1, 1, 1, 1, 1,
-0.2287164, -0.5697107, -2.516739, 1, 1, 1, 1, 1,
-0.2273213, -0.5138053, -4.446206, 1, 1, 1, 1, 1,
-0.2272925, 0.5358417, 0.8542349, 1, 1, 1, 1, 1,
-0.2263598, -0.4219182, -2.434418, 1, 1, 1, 1, 1,
-0.2247518, 0.1319817, -1.640492, 1, 1, 1, 1, 1,
-0.2246255, -0.06614289, -0.07629883, 1, 1, 1, 1, 1,
-0.2238273, -0.4708308, -3.963598, 1, 1, 1, 1, 1,
-0.2230773, 1.139718, 0.3232019, 1, 1, 1, 1, 1,
-0.2211575, 0.7679878, -0.0523537, 1, 1, 1, 1, 1,
-0.2140238, 1.02184, 1.227991, 0, 0, 1, 1, 1,
-0.2136353, 1.109837, 0.2009486, 1, 0, 0, 1, 1,
-0.2063146, -1.304783, -5.122596, 1, 0, 0, 1, 1,
-0.2041473, -0.1813708, -3.131809, 1, 0, 0, 1, 1,
-0.2034821, -2.157914, -1.185537, 1, 0, 0, 1, 1,
-0.2017082, 0.03945372, -1.694833, 1, 0, 0, 1, 1,
-0.2015245, 0.7950841, 1.516764, 0, 0, 0, 1, 1,
-0.1985137, 0.350847, -0.5454501, 0, 0, 0, 1, 1,
-0.1970757, -0.326219, -2.255241, 0, 0, 0, 1, 1,
-0.1899727, -2.062024, -2.241807, 0, 0, 0, 1, 1,
-0.1895202, -0.2733287, -3.095056, 0, 0, 0, 1, 1,
-0.1874861, -0.4565431, -2.168542, 0, 0, 0, 1, 1,
-0.1862111, -0.338, -2.607948, 0, 0, 0, 1, 1,
-0.18017, -0.3396935, -3.784969, 1, 1, 1, 1, 1,
-0.1776046, -0.02044848, -1.371054, 1, 1, 1, 1, 1,
-0.1767537, -1.633605, -1.918051, 1, 1, 1, 1, 1,
-0.1767534, 1.865447, -1.555998, 1, 1, 1, 1, 1,
-0.1726879, -0.6091277, -2.560555, 1, 1, 1, 1, 1,
-0.1694146, 0.4897052, 0.692497, 1, 1, 1, 1, 1,
-0.1656959, 2.282819, -0.9781345, 1, 1, 1, 1, 1,
-0.1628022, -1.439755, -5.931876, 1, 1, 1, 1, 1,
-0.1601443, 0.1595497, -0.6728377, 1, 1, 1, 1, 1,
-0.1597246, -0.3370391, -2.161647, 1, 1, 1, 1, 1,
-0.1585601, -0.1083065, -2.811298, 1, 1, 1, 1, 1,
-0.1543687, 1.219772, -0.699928, 1, 1, 1, 1, 1,
-0.1527266, -0.3554664, -1.897452, 1, 1, 1, 1, 1,
-0.1516158, 0.7615497, -0.3103024, 1, 1, 1, 1, 1,
-0.1457996, 0.5507992, -1.588289, 1, 1, 1, 1, 1,
-0.1456182, 1.102162, -0.9708114, 0, 0, 1, 1, 1,
-0.1395491, 0.686981, 1.735941, 1, 0, 0, 1, 1,
-0.1367176, -1.04693, -3.250826, 1, 0, 0, 1, 1,
-0.1360882, 0.2761159, -1.908057, 1, 0, 0, 1, 1,
-0.129388, 2.39244, -0.9521887, 1, 0, 0, 1, 1,
-0.1289638, 2.347309, 0.6795185, 1, 0, 0, 1, 1,
-0.1278117, -0.3111785, -4.190213, 0, 0, 0, 1, 1,
-0.1270843, 1.348277, 0.6780821, 0, 0, 0, 1, 1,
-0.1226883, -0.8407806, -3.159916, 0, 0, 0, 1, 1,
-0.1208331, -0.4116178, -2.967113, 0, 0, 0, 1, 1,
-0.1195844, -0.3662344, -4.628225, 0, 0, 0, 1, 1,
-0.1188784, 0.04175365, -0.2329221, 0, 0, 0, 1, 1,
-0.1151643, 0.48284, 0.359787, 0, 0, 0, 1, 1,
-0.1144628, 0.889253, 0.09509265, 1, 1, 1, 1, 1,
-0.1093054, 1.866762, -0.9089548, 1, 1, 1, 1, 1,
-0.1025805, -0.6555083, -3.892423, 1, 1, 1, 1, 1,
-0.1013115, -1.264651, -1.98304, 1, 1, 1, 1, 1,
-0.09758357, -1.471384, -2.705174, 1, 1, 1, 1, 1,
-0.09713036, 0.001678775, -1.982896, 1, 1, 1, 1, 1,
-0.09390027, -0.08277228, -1.131199, 1, 1, 1, 1, 1,
-0.09387669, -0.009717526, -4.365021, 1, 1, 1, 1, 1,
-0.08588915, 0.5175677, -0.7673904, 1, 1, 1, 1, 1,
-0.08391091, -1.161962, -2.584234, 1, 1, 1, 1, 1,
-0.08271933, 0.3877527, -0.4860807, 1, 1, 1, 1, 1,
-0.08246146, -0.04764044, -3.465746, 1, 1, 1, 1, 1,
-0.07938841, 0.5153093, -0.1303482, 1, 1, 1, 1, 1,
-0.07670254, 0.4026402, -0.409078, 1, 1, 1, 1, 1,
-0.07664866, 2.049536, -0.2532406, 1, 1, 1, 1, 1,
-0.07500197, 0.1518981, -0.4337776, 0, 0, 1, 1, 1,
-0.07451475, 1.869712, 0.4237482, 1, 0, 0, 1, 1,
-0.07138205, -0.2766893, -2.00579, 1, 0, 0, 1, 1,
-0.06748537, -0.1105741, -0.7843667, 1, 0, 0, 1, 1,
-0.06661223, -0.8110369, -3.796032, 1, 0, 0, 1, 1,
-0.0663853, -1.166166, -3.043927, 1, 0, 0, 1, 1,
-0.06442141, 1.214839, -1.498203, 0, 0, 0, 1, 1,
-0.06437933, -0.9187689, -3.687024, 0, 0, 0, 1, 1,
-0.05849463, -1.647832, -2.182954, 0, 0, 0, 1, 1,
-0.05713646, -0.7444254, -1.477411, 0, 0, 0, 1, 1,
-0.05703991, -1.211377, -2.966274, 0, 0, 0, 1, 1,
-0.05489225, -0.6304181, -3.386893, 0, 0, 0, 1, 1,
-0.05258685, 2.123885, 0.7668248, 0, 0, 0, 1, 1,
-0.04745481, 1.03587, 0.6915109, 1, 1, 1, 1, 1,
-0.04622846, 0.8932673, -1.039968, 1, 1, 1, 1, 1,
-0.04072965, -0.3168824, -1.592842, 1, 1, 1, 1, 1,
-0.04006403, 0.1230467, 0.1765543, 1, 1, 1, 1, 1,
-0.0389598, -0.4290326, -4.546969, 1, 1, 1, 1, 1,
-0.03800837, -0.4102199, -4.569921, 1, 1, 1, 1, 1,
-0.0309615, 0.6940523, 1.041942, 1, 1, 1, 1, 1,
-0.03090665, -0.4312567, -2.39684, 1, 1, 1, 1, 1,
-0.0245861, -0.6423088, -4.112393, 1, 1, 1, 1, 1,
-0.02208433, 0.3627112, -1.032013, 1, 1, 1, 1, 1,
-0.01854988, -0.6196238, -4.259068, 1, 1, 1, 1, 1,
-0.01799723, 0.6054596, -1.042023, 1, 1, 1, 1, 1,
-0.01702204, 1.117068, -0.8081228, 1, 1, 1, 1, 1,
-0.01304807, 0.02150574, -2.390143, 1, 1, 1, 1, 1,
-0.006424115, 0.4613892, -1.748338, 1, 1, 1, 1, 1,
-0.002580591, 1.248262, 1.115839, 0, 0, 1, 1, 1,
-0.001803502, -1.844466, -2.814019, 1, 0, 0, 1, 1,
-0.001593934, 0.2179223, 0.5505428, 1, 0, 0, 1, 1,
0.002142639, -1.241908, 3.790979, 1, 0, 0, 1, 1,
0.003947533, -1.135977, 4.353089, 1, 0, 0, 1, 1,
0.007933916, -1.920831, 5.37541, 1, 0, 0, 1, 1,
0.008790102, 1.088062, -0.05876172, 0, 0, 0, 1, 1,
0.009631155, -0.5250621, 2.995578, 0, 0, 0, 1, 1,
0.01379092, -0.1189272, 3.317332, 0, 0, 0, 1, 1,
0.01490354, -1.683516, 2.287781, 0, 0, 0, 1, 1,
0.01716825, 0.5478424, -0.7019346, 0, 0, 0, 1, 1,
0.01789161, -1.157245, 3.69, 0, 0, 0, 1, 1,
0.01845897, 0.4152002, -1.609452, 0, 0, 0, 1, 1,
0.0185851, -1.51755, 2.347221, 1, 1, 1, 1, 1,
0.02109832, 0.7900463, -0.1990837, 1, 1, 1, 1, 1,
0.02518508, 0.9857145, -0.1371659, 1, 1, 1, 1, 1,
0.02873349, -0.779317, 2.635915, 1, 1, 1, 1, 1,
0.03221777, 0.2122823, 0.3837931, 1, 1, 1, 1, 1,
0.032287, -1.60771, 2.45523, 1, 1, 1, 1, 1,
0.03291591, 0.7612493, 0.5262652, 1, 1, 1, 1, 1,
0.03397036, 2.227407, 0.4925972, 1, 1, 1, 1, 1,
0.03436977, 0.9096495, -0.7878187, 1, 1, 1, 1, 1,
0.03546516, -0.1316491, 1.526651, 1, 1, 1, 1, 1,
0.03623057, -0.1944091, 2.420935, 1, 1, 1, 1, 1,
0.04095821, -0.2918691, 3.810081, 1, 1, 1, 1, 1,
0.04196051, -0.2940609, 3.218355, 1, 1, 1, 1, 1,
0.04332308, -1.558379, 3.424294, 1, 1, 1, 1, 1,
0.05111268, -2.199859, 2.238415, 1, 1, 1, 1, 1,
0.05143934, -0.0917949, 1.964949, 0, 0, 1, 1, 1,
0.05890179, 0.5318261, -0.4539836, 1, 0, 0, 1, 1,
0.0602666, 0.7524763, 0.1117589, 1, 0, 0, 1, 1,
0.06210365, -1.018906, 3.844497, 1, 0, 0, 1, 1,
0.06337994, 0.2693775, -0.9305803, 1, 0, 0, 1, 1,
0.06349356, 0.4602201, -2.23811, 1, 0, 0, 1, 1,
0.06354664, -0.7448316, 2.095545, 0, 0, 0, 1, 1,
0.06711551, -1.116218, 4.24463, 0, 0, 0, 1, 1,
0.06868666, 0.9693186, 0.1555358, 0, 0, 0, 1, 1,
0.06947755, -0.07437866, 1.615731, 0, 0, 0, 1, 1,
0.07047898, -0.738782, 2.646683, 0, 0, 0, 1, 1,
0.07109676, -0.1708179, 1.715813, 0, 0, 0, 1, 1,
0.07122571, 0.6679392, -0.3136772, 0, 0, 0, 1, 1,
0.07122771, 0.1954353, 0.7069169, 1, 1, 1, 1, 1,
0.07242695, 0.4866764, -0.7701129, 1, 1, 1, 1, 1,
0.07302879, 0.8019112, -0.1846067, 1, 1, 1, 1, 1,
0.07618842, 0.8083888, 2.236617, 1, 1, 1, 1, 1,
0.07669673, -0.781396, 3.288105, 1, 1, 1, 1, 1,
0.07801341, 1.610218, 0.5533397, 1, 1, 1, 1, 1,
0.07847234, 0.1505827, -1.20211, 1, 1, 1, 1, 1,
0.08302587, 0.3550102, 1.127759, 1, 1, 1, 1, 1,
0.08908789, -0.8715996, 5.285987, 1, 1, 1, 1, 1,
0.09103723, 0.43363, -2.387759, 1, 1, 1, 1, 1,
0.09182586, -1.015576, 3.2796, 1, 1, 1, 1, 1,
0.0938187, 0.7313094, -0.2937208, 1, 1, 1, 1, 1,
0.09793363, 1.720665, 1.42693, 1, 1, 1, 1, 1,
0.09838928, 1.21082, -1.274151, 1, 1, 1, 1, 1,
0.1008909, 0.9365271, -0.5821533, 1, 1, 1, 1, 1,
0.1033297, -1.059167, 4.780161, 0, 0, 1, 1, 1,
0.1041223, 0.4157881, 0.09278795, 1, 0, 0, 1, 1,
0.1043365, -1.065513, 2.947983, 1, 0, 0, 1, 1,
0.1056001, -0.4210312, 3.493765, 1, 0, 0, 1, 1,
0.1058172, 1.007997, -0.4749381, 1, 0, 0, 1, 1,
0.1072623, 1.516974, 0.3732266, 1, 0, 0, 1, 1,
0.1083995, -0.1556821, 2.558752, 0, 0, 0, 1, 1,
0.1105922, 0.2114551, 1.615585, 0, 0, 0, 1, 1,
0.1110403, -0.2579202, 3.796721, 0, 0, 0, 1, 1,
0.1188541, -1.370155, 1.555818, 0, 0, 0, 1, 1,
0.1194216, -0.6152257, 3.363612, 0, 0, 0, 1, 1,
0.1209001, 0.2039006, 0.2851057, 0, 0, 0, 1, 1,
0.1222547, 0.5020826, 0.973574, 0, 0, 0, 1, 1,
0.1230189, -1.428704, 3.313606, 1, 1, 1, 1, 1,
0.1236411, -1.276839, 2.227794, 1, 1, 1, 1, 1,
0.1250719, -0.7115788, 1.172134, 1, 1, 1, 1, 1,
0.1276111, 0.001083145, 2.824943, 1, 1, 1, 1, 1,
0.1285656, 0.427212, 0.2528163, 1, 1, 1, 1, 1,
0.1327851, 2.22708, 0.8412182, 1, 1, 1, 1, 1,
0.1335553, -0.5874434, 2.559293, 1, 1, 1, 1, 1,
0.1371722, 1.534541, -0.4350076, 1, 1, 1, 1, 1,
0.1387791, -0.1271764, 3.470494, 1, 1, 1, 1, 1,
0.1392678, -0.2470534, 3.39833, 1, 1, 1, 1, 1,
0.1410311, 0.4842626, 0.76748, 1, 1, 1, 1, 1,
0.145158, 0.4719499, -1.721272, 1, 1, 1, 1, 1,
0.1498352, -0.6944182, 2.878484, 1, 1, 1, 1, 1,
0.1506896, 1.122165, -0.02008998, 1, 1, 1, 1, 1,
0.1523369, -0.4172699, 5.427384, 1, 1, 1, 1, 1,
0.1532771, 0.9445432, -2.553308, 0, 0, 1, 1, 1,
0.1532952, 1.821116, 1.307573, 1, 0, 0, 1, 1,
0.1540321, -1.56223, 3.028347, 1, 0, 0, 1, 1,
0.1541346, 0.6452138, -0.9198008, 1, 0, 0, 1, 1,
0.1603369, -1.148996, 2.043554, 1, 0, 0, 1, 1,
0.1629193, -0.1485339, 2.999529, 1, 0, 0, 1, 1,
0.1694205, 1.867181, 1.137543, 0, 0, 0, 1, 1,
0.1734197, -0.1046173, 3.024881, 0, 0, 0, 1, 1,
0.1798952, 0.09099296, 0.5881559, 0, 0, 0, 1, 1,
0.1805406, 1.099504, -1.041091, 0, 0, 0, 1, 1,
0.1829443, -0.002026069, 1.441807, 0, 0, 0, 1, 1,
0.1838807, -0.7240013, 2.67368, 0, 0, 0, 1, 1,
0.1841081, 0.3760374, 1.063206, 0, 0, 0, 1, 1,
0.185783, -1.250817, 0.8988422, 1, 1, 1, 1, 1,
0.1875942, 0.229979, 0.1296969, 1, 1, 1, 1, 1,
0.1893435, 0.1984218, 1.12836, 1, 1, 1, 1, 1,
0.1978839, -0.5692902, 2.517231, 1, 1, 1, 1, 1,
0.1988801, 1.27544, 0.6370393, 1, 1, 1, 1, 1,
0.2074152, -0.5031738, 1.98578, 1, 1, 1, 1, 1,
0.2110113, 1.180634, -1.186537, 1, 1, 1, 1, 1,
0.2114929, 1.586439, 0.0317927, 1, 1, 1, 1, 1,
0.2125203, -0.1486864, 4.086034, 1, 1, 1, 1, 1,
0.214518, -0.8309938, 2.533448, 1, 1, 1, 1, 1,
0.2169021, -0.5711474, 2.917923, 1, 1, 1, 1, 1,
0.2189915, 1.509109, 1.60037, 1, 1, 1, 1, 1,
0.2243127, 0.908182, -0.8596897, 1, 1, 1, 1, 1,
0.2268977, -2.024833, 1.179127, 1, 1, 1, 1, 1,
0.228718, -0.1876653, 0.3297305, 1, 1, 1, 1, 1,
0.2319321, 0.4231256, 1.279669, 0, 0, 1, 1, 1,
0.2320973, -0.2765287, 2.254398, 1, 0, 0, 1, 1,
0.2329542, -0.9582395, 3.525131, 1, 0, 0, 1, 1,
0.2343221, 0.3831563, -0.3433745, 1, 0, 0, 1, 1,
0.2347031, -0.5257409, 1.273036, 1, 0, 0, 1, 1,
0.2347641, 0.5526878, -0.7943454, 1, 0, 0, 1, 1,
0.2362557, -0.07828616, 2.252828, 0, 0, 0, 1, 1,
0.2363903, -1.735999, 3.745381, 0, 0, 0, 1, 1,
0.2372372, 1.388205, 1.059162, 0, 0, 0, 1, 1,
0.2389428, 0.1923541, 0.6108378, 0, 0, 0, 1, 1,
0.2493333, 0.4782637, 1.216725, 0, 0, 0, 1, 1,
0.2495191, -0.8696289, 3.762023, 0, 0, 0, 1, 1,
0.2506739, 1.953887, 0.150712, 0, 0, 0, 1, 1,
0.2536225, -1.079266, 3.297465, 1, 1, 1, 1, 1,
0.257656, 0.5486096, 0.7635297, 1, 1, 1, 1, 1,
0.2620574, 1.455612, -1.03809, 1, 1, 1, 1, 1,
0.2642654, 0.3301385, -0.1709765, 1, 1, 1, 1, 1,
0.2662467, 0.7542009, 1.220053, 1, 1, 1, 1, 1,
0.2684113, 1.654351, 1.211343, 1, 1, 1, 1, 1,
0.279702, -1.192229, 4.505441, 1, 1, 1, 1, 1,
0.2828917, -0.3563836, 1.980497, 1, 1, 1, 1, 1,
0.2876798, 1.085377, -0.03773492, 1, 1, 1, 1, 1,
0.2906719, -1.477943, 1.956202, 1, 1, 1, 1, 1,
0.2936959, -1.514652, 4.496806, 1, 1, 1, 1, 1,
0.2948219, 0.4535154, 2.831247, 1, 1, 1, 1, 1,
0.2956429, 0.8782884, 3.059269, 1, 1, 1, 1, 1,
0.2989222, -0.6309817, 1.744634, 1, 1, 1, 1, 1,
0.3026221, 0.04951369, 2.13945, 1, 1, 1, 1, 1,
0.3048848, -0.1446543, 1.624512, 0, 0, 1, 1, 1,
0.3151661, 0.8340941, -0.1478641, 1, 0, 0, 1, 1,
0.3214254, -0.7553481, 1.916863, 1, 0, 0, 1, 1,
0.3257869, -0.07469102, 1.492232, 1, 0, 0, 1, 1,
0.3267079, 0.1583107, 3.063815, 1, 0, 0, 1, 1,
0.3267847, 2.588485, 0.8743123, 1, 0, 0, 1, 1,
0.3270313, 0.02449926, -0.5269765, 0, 0, 0, 1, 1,
0.329116, 0.007006104, 1.413269, 0, 0, 0, 1, 1,
0.3293733, 1.818088, -0.1785439, 0, 0, 0, 1, 1,
0.3319811, 0.6076807, -1.240396, 0, 0, 0, 1, 1,
0.3358492, 3.121018, -0.09179563, 0, 0, 0, 1, 1,
0.3459162, 0.5667466, 0.7659097, 0, 0, 0, 1, 1,
0.3460595, 0.6348075, -0.914921, 0, 0, 0, 1, 1,
0.3488223, 0.9331648, 2.583277, 1, 1, 1, 1, 1,
0.3537226, -1.709246, 2.294342, 1, 1, 1, 1, 1,
0.3604311, -1.859397, 3.574215, 1, 1, 1, 1, 1,
0.3720766, 0.1211557, 0.4763519, 1, 1, 1, 1, 1,
0.3727625, -0.4133072, 2.453832, 1, 1, 1, 1, 1,
0.378669, 1.674776, 0.4714752, 1, 1, 1, 1, 1,
0.3817191, -0.2678992, 1.616697, 1, 1, 1, 1, 1,
0.389096, 0.3693012, 0.2612059, 1, 1, 1, 1, 1,
0.3942851, -0.8587273, 1.283551, 1, 1, 1, 1, 1,
0.3979585, -0.6658601, 4.671951, 1, 1, 1, 1, 1,
0.4043814, 1.150416, 2.850976, 1, 1, 1, 1, 1,
0.4044016, -1.789834, 2.705075, 1, 1, 1, 1, 1,
0.4062313, 0.5159901, 0.8119165, 1, 1, 1, 1, 1,
0.4088374, 0.003713383, 1.674671, 1, 1, 1, 1, 1,
0.4090879, 0.5530919, 0.1023612, 1, 1, 1, 1, 1,
0.4114478, 0.06701708, 0.56393, 0, 0, 1, 1, 1,
0.4116017, -1.053832, 3.356661, 1, 0, 0, 1, 1,
0.414883, 1.277969, 1.014816, 1, 0, 0, 1, 1,
0.4186535, 0.0516014, -0.3533854, 1, 0, 0, 1, 1,
0.4192157, 0.2227115, 1.103227, 1, 0, 0, 1, 1,
0.4205168, 0.6200377, -1.018503, 1, 0, 0, 1, 1,
0.4211416, -1.166156, 2.95093, 0, 0, 0, 1, 1,
0.4239985, 0.2455063, 0.7321627, 0, 0, 0, 1, 1,
0.4263259, 1.767727, 0.3525363, 0, 0, 0, 1, 1,
0.426694, 0.01923913, 1.282478, 0, 0, 0, 1, 1,
0.4326041, -1.579743, 3.909012, 0, 0, 0, 1, 1,
0.4364363, -0.7326979, 2.42901, 0, 0, 0, 1, 1,
0.4428816, 0.5183044, 1.456706, 0, 0, 0, 1, 1,
0.4471438, -1.311897, 4.46438, 1, 1, 1, 1, 1,
0.4472446, -1.345213, 2.398319, 1, 1, 1, 1, 1,
0.4473268, 0.1339403, 2.940142, 1, 1, 1, 1, 1,
0.4500926, -0.847993, 3.210738, 1, 1, 1, 1, 1,
0.4509517, -2.247335, 3.634043, 1, 1, 1, 1, 1,
0.4527231, -0.9337113, 1.535784, 1, 1, 1, 1, 1,
0.4554298, 0.5793987, 2.170849, 1, 1, 1, 1, 1,
0.4557478, -0.1894722, 1.588145, 1, 1, 1, 1, 1,
0.4560599, -1.430391, 3.36268, 1, 1, 1, 1, 1,
0.4561709, -0.08077163, 1.306368, 1, 1, 1, 1, 1,
0.4573792, -0.01554922, 2.001444, 1, 1, 1, 1, 1,
0.4638149, 0.7387135, 1.354324, 1, 1, 1, 1, 1,
0.4654102, 0.1232579, 0.5593457, 1, 1, 1, 1, 1,
0.4759271, 2.617626, 0.6611528, 1, 1, 1, 1, 1,
0.478706, 0.1603204, 2.07182, 1, 1, 1, 1, 1,
0.484834, -1.276736, 3.829611, 0, 0, 1, 1, 1,
0.4881504, 0.1238314, 1.292133, 1, 0, 0, 1, 1,
0.4894393, -0.2087903, 0.8593643, 1, 0, 0, 1, 1,
0.4942799, -0.767442, 2.916426, 1, 0, 0, 1, 1,
0.5005476, 0.7841152, 1.056952, 1, 0, 0, 1, 1,
0.5015677, -1.028661, -0.01280486, 1, 0, 0, 1, 1,
0.5022199, 0.4622165, 0.8311865, 0, 0, 0, 1, 1,
0.5040988, 0.1521205, 2.461539, 0, 0, 0, 1, 1,
0.5058469, 0.4287008, 1.560304, 0, 0, 0, 1, 1,
0.5114053, -0.2157062, 1.411099, 0, 0, 0, 1, 1,
0.5259063, -2.096047, 1.266731, 0, 0, 0, 1, 1,
0.532335, -0.2110549, 2.03117, 0, 0, 0, 1, 1,
0.5335832, -0.7785479, 1.813365, 0, 0, 0, 1, 1,
0.5414502, -0.006241434, 0.4291544, 1, 1, 1, 1, 1,
0.5445321, -0.6561182, 2.295673, 1, 1, 1, 1, 1,
0.545742, 0.7366964, -1.126556, 1, 1, 1, 1, 1,
0.549639, -0.4817533, 1.804434, 1, 1, 1, 1, 1,
0.5496652, 0.08946069, 1.475475, 1, 1, 1, 1, 1,
0.551937, 0.9612368, -0.003491935, 1, 1, 1, 1, 1,
0.5534173, 0.334068, 0.2766802, 1, 1, 1, 1, 1,
0.5551452, 0.2776868, 1.86189, 1, 1, 1, 1, 1,
0.5570529, -0.6586512, 2.642375, 1, 1, 1, 1, 1,
0.5583823, 0.9159591, 0.0976731, 1, 1, 1, 1, 1,
0.5604647, 0.614809, 0.6008098, 1, 1, 1, 1, 1,
0.5646008, -0.7406388, 3.164167, 1, 1, 1, 1, 1,
0.5652169, -0.6941528, 2.922785, 1, 1, 1, 1, 1,
0.5685148, -0.6107272, 2.674489, 1, 1, 1, 1, 1,
0.5697835, 1.768187, 0.3986286, 1, 1, 1, 1, 1,
0.5739412, 2.105249, -0.04874061, 0, 0, 1, 1, 1,
0.5752444, -0.7030232, 2.262344, 1, 0, 0, 1, 1,
0.5754846, -0.5847471, 3.565149, 1, 0, 0, 1, 1,
0.5817488, -0.2089675, 3.582384, 1, 0, 0, 1, 1,
0.5832234, 0.6840067, 1.203835, 1, 0, 0, 1, 1,
0.5840787, 0.2850856, 1.252511, 1, 0, 0, 1, 1,
0.5870625, 1.122959, 3.822753, 0, 0, 0, 1, 1,
0.5911697, -1.953883, 3.481084, 0, 0, 0, 1, 1,
0.6038551, -0.2597066, 0.6784521, 0, 0, 0, 1, 1,
0.6106678, -1.70511, 4.064803, 0, 0, 0, 1, 1,
0.6121269, 0.8208212, -1.288232, 0, 0, 0, 1, 1,
0.6134668, -0.04491769, 1.862566, 0, 0, 0, 1, 1,
0.6139044, 0.9788669, -0.1374816, 0, 0, 0, 1, 1,
0.6139711, -0.1672383, 2.786664, 1, 1, 1, 1, 1,
0.6266091, -2.254788, 3.576549, 1, 1, 1, 1, 1,
0.6284229, -1.467411, 2.086861, 1, 1, 1, 1, 1,
0.6287543, -0.6225906, 3.010944, 1, 1, 1, 1, 1,
0.6304368, -0.02406071, 3.752576, 1, 1, 1, 1, 1,
0.6305951, 0.2650944, 2.720288, 1, 1, 1, 1, 1,
0.630854, -1.006172, 1.848321, 1, 1, 1, 1, 1,
0.6366515, 0.8814203, -0.2850901, 1, 1, 1, 1, 1,
0.6406443, 1.014729, -0.3003842, 1, 1, 1, 1, 1,
0.640997, 0.01882109, 2.331543, 1, 1, 1, 1, 1,
0.6465243, -1.093478, 3.704465, 1, 1, 1, 1, 1,
0.6504768, 0.2408445, 0.2922466, 1, 1, 1, 1, 1,
0.6520168, 0.4937981, 0.6131718, 1, 1, 1, 1, 1,
0.6525484, 0.6746899, 2.098241, 1, 1, 1, 1, 1,
0.6548647, 1.637795, 2.142221, 1, 1, 1, 1, 1,
0.6548909, -0.4790437, 2.34716, 0, 0, 1, 1, 1,
0.6614137, 0.2985998, 1.708299, 1, 0, 0, 1, 1,
0.6618197, 0.8722084, 0.2938831, 1, 0, 0, 1, 1,
0.6625422, -0.9166285, 2.132329, 1, 0, 0, 1, 1,
0.6653965, 0.3608758, 1.616637, 1, 0, 0, 1, 1,
0.6722579, 0.367045, 0.5246907, 1, 0, 0, 1, 1,
0.6729359, 0.4268276, 1.800936, 0, 0, 0, 1, 1,
0.6745545, 1.34548, 0.8633093, 0, 0, 0, 1, 1,
0.6795212, 0.07062783, 1.718638, 0, 0, 0, 1, 1,
0.6830751, -0.2734749, 2.505082, 0, 0, 0, 1, 1,
0.6855703, -1.058534, 2.543116, 0, 0, 0, 1, 1,
0.6888999, 0.3041967, 1.742962, 0, 0, 0, 1, 1,
0.6907787, 0.4502614, 0.4433081, 0, 0, 0, 1, 1,
0.706695, -0.03766586, 1.523909, 1, 1, 1, 1, 1,
0.7217366, 1.121286, 1.983898, 1, 1, 1, 1, 1,
0.7281908, -0.9109455, 1.696606, 1, 1, 1, 1, 1,
0.7417678, 0.7767287, 1.572781, 1, 1, 1, 1, 1,
0.7419887, -0.7144349, 1.952888, 1, 1, 1, 1, 1,
0.7439576, 0.2957642, 0.9056478, 1, 1, 1, 1, 1,
0.7455651, -0.2396339, 2.328657, 1, 1, 1, 1, 1,
0.7464271, 0.3056575, -0.2551678, 1, 1, 1, 1, 1,
0.7492182, 0.7393683, 2.475422, 1, 1, 1, 1, 1,
0.7604786, -2.061679, 3.097397, 1, 1, 1, 1, 1,
0.7618365, -0.1485596, 1.640764, 1, 1, 1, 1, 1,
0.7722875, -0.004934686, 0.1166187, 1, 1, 1, 1, 1,
0.7723908, -2.199463, 2.486112, 1, 1, 1, 1, 1,
0.7741377, 0.3385988, 1.066355, 1, 1, 1, 1, 1,
0.7809478, -0.4993245, -0.241689, 1, 1, 1, 1, 1,
0.7820247, 2.059438, 1.990586, 0, 0, 1, 1, 1,
0.7844735, -1.46038, 3.199529, 1, 0, 0, 1, 1,
0.7895354, 2.218048, 0.8160102, 1, 0, 0, 1, 1,
0.7897641, -1.207059, 4.21947, 1, 0, 0, 1, 1,
0.7919065, -0.2311548, 2.933099, 1, 0, 0, 1, 1,
0.7942038, -0.5363392, 0.970436, 1, 0, 0, 1, 1,
0.7948034, 0.2280747, 1.249057, 0, 0, 0, 1, 1,
0.7961464, 0.7747762, 0.8603455, 0, 0, 0, 1, 1,
0.803566, -0.1257841, 1.634769, 0, 0, 0, 1, 1,
0.805691, 1.080195, -1.250455, 0, 0, 0, 1, 1,
0.8071532, 0.2215258, 1.230704, 0, 0, 0, 1, 1,
0.8105907, -0.2787275, 2.389542, 0, 0, 0, 1, 1,
0.8110893, -0.4889153, 1.391885, 0, 0, 0, 1, 1,
0.8144462, 1.142189, 0.6625807, 1, 1, 1, 1, 1,
0.8182623, 0.01217748, -0.2681593, 1, 1, 1, 1, 1,
0.8209075, 1.363118, 1.133318, 1, 1, 1, 1, 1,
0.8231412, 2.211854, 2.206106, 1, 1, 1, 1, 1,
0.8235146, 0.5906643, 0.340813, 1, 1, 1, 1, 1,
0.8276353, 1.158112, 0.4006041, 1, 1, 1, 1, 1,
0.8297636, -2.741093, 2.025148, 1, 1, 1, 1, 1,
0.831704, -0.7341688, 1.963832, 1, 1, 1, 1, 1,
0.8332999, -0.06454224, 1.784158, 1, 1, 1, 1, 1,
0.8365101, 0.704865, 0.5949438, 1, 1, 1, 1, 1,
0.8379447, -0.01933369, 1.525435, 1, 1, 1, 1, 1,
0.838258, -0.04640545, 2.376749, 1, 1, 1, 1, 1,
0.8473697, -0.779009, 1.603363, 1, 1, 1, 1, 1,
0.8546751, -0.5444627, 2.89085, 1, 1, 1, 1, 1,
0.8567146, -0.03749498, 0.7673488, 1, 1, 1, 1, 1,
0.8658009, -0.2097576, 2.0878, 0, 0, 1, 1, 1,
0.8659883, -0.8534231, 2.780821, 1, 0, 0, 1, 1,
0.8688731, -1.224565, 1.087232, 1, 0, 0, 1, 1,
0.8710521, 0.0195856, 2.545354, 1, 0, 0, 1, 1,
0.8725246, 1.395586, 1.54336, 1, 0, 0, 1, 1,
0.8775836, 1.266823, -0.7766872, 1, 0, 0, 1, 1,
0.8786846, 0.1771364, 0.3772659, 0, 0, 0, 1, 1,
0.8832127, 0.5115706, -0.7612662, 0, 0, 0, 1, 1,
0.8860679, -0.5967634, 0.06364038, 0, 0, 0, 1, 1,
0.8880408, 0.2360374, 2.566401, 0, 0, 0, 1, 1,
0.8941401, 1.231792, 1.537704, 0, 0, 0, 1, 1,
0.8987806, -2.507016, 3.307349, 0, 0, 0, 1, 1,
0.899435, 1.337048, 1.832471, 0, 0, 0, 1, 1,
0.9073112, 0.6233068, -0.1515668, 1, 1, 1, 1, 1,
0.9094729, 2.518771, -0.7713014, 1, 1, 1, 1, 1,
0.9115463, 0.1154309, 0.5788361, 1, 1, 1, 1, 1,
0.9177045, -1.549237, 0.6027508, 1, 1, 1, 1, 1,
0.9192615, -0.5162629, 2.031117, 1, 1, 1, 1, 1,
0.9216956, -0.1249804, 1.795491, 1, 1, 1, 1, 1,
0.9237345, -1.087047, 2.556441, 1, 1, 1, 1, 1,
0.9326248, 0.7969876, 1.135888, 1, 1, 1, 1, 1,
0.9437631, 1.372621, 1.387583, 1, 1, 1, 1, 1,
0.9533346, -1.560535, 2.11094, 1, 1, 1, 1, 1,
0.9537163, -0.2009871, 0.9719146, 1, 1, 1, 1, 1,
0.9550453, 0.03973324, 1.821781, 1, 1, 1, 1, 1,
0.9557974, 0.5413864, 1.063276, 1, 1, 1, 1, 1,
0.9571763, 0.1495887, 1.703901, 1, 1, 1, 1, 1,
0.9667835, -0.677896, 2.047287, 1, 1, 1, 1, 1,
0.9670075, 0.8996952, 1.115331, 0, 0, 1, 1, 1,
0.9698157, -1.121988, 2.5885, 1, 0, 0, 1, 1,
0.981445, 0.7606987, 1.742528, 1, 0, 0, 1, 1,
0.9942377, -0.5641103, -0.4818444, 1, 0, 0, 1, 1,
0.9954808, 0.1854785, 1.657454, 1, 0, 0, 1, 1,
0.9984968, -1.498516, 2.201581, 1, 0, 0, 1, 1,
0.9986281, 0.2867891, 0.2847428, 0, 0, 0, 1, 1,
1.004256, 0.3567791, 3.465697, 0, 0, 0, 1, 1,
1.012215, -0.8452035, 1.878134, 0, 0, 0, 1, 1,
1.015017, -1.044615, 4.308842, 0, 0, 0, 1, 1,
1.015731, 0.1117168, 2.225957, 0, 0, 0, 1, 1,
1.018697, 0.503296, -0.4140505, 0, 0, 0, 1, 1,
1.019665, 0.5262666, 1.36161, 0, 0, 0, 1, 1,
1.02736, -1.107728, 1.804562, 1, 1, 1, 1, 1,
1.036955, -1.246343, 1.477111, 1, 1, 1, 1, 1,
1.043022, 0.4913645, 2.279265, 1, 1, 1, 1, 1,
1.047706, -0.2089939, 0.1913774, 1, 1, 1, 1, 1,
1.049108, -0.321682, 3.772344, 1, 1, 1, 1, 1,
1.052335, -0.5860661, 3.968832, 1, 1, 1, 1, 1,
1.052866, 0.7141526, 0.9000515, 1, 1, 1, 1, 1,
1.052904, -3.106265, 3.283854, 1, 1, 1, 1, 1,
1.053509, 0.1260707, 0.5605838, 1, 1, 1, 1, 1,
1.066302, -0.3809861, 2.82844, 1, 1, 1, 1, 1,
1.074653, -0.6307442, 1.782231, 1, 1, 1, 1, 1,
1.078964, 0.3040192, 0.04608364, 1, 1, 1, 1, 1,
1.082352, -0.5739197, 3.150734, 1, 1, 1, 1, 1,
1.083224, 0.1289994, 1.59402, 1, 1, 1, 1, 1,
1.085553, 0.6993566, 1.453556, 1, 1, 1, 1, 1,
1.098827, -0.01386857, 1.433555, 0, 0, 1, 1, 1,
1.100451, -0.6088345, 3.594913, 1, 0, 0, 1, 1,
1.102077, -0.6078392, 2.599695, 1, 0, 0, 1, 1,
1.103758, -0.6466083, 3.671849, 1, 0, 0, 1, 1,
1.105133, -2.328625, 2.611746, 1, 0, 0, 1, 1,
1.111424, 0.8948068, 0.02490423, 1, 0, 0, 1, 1,
1.120381, 1.295327, 1.88742, 0, 0, 0, 1, 1,
1.123522, -0.4358029, 2.116422, 0, 0, 0, 1, 1,
1.132764, -0.3989583, 1.120034, 0, 0, 0, 1, 1,
1.134578, 0.9592099, 0.7923086, 0, 0, 0, 1, 1,
1.138775, -0.7257975, 2.14864, 0, 0, 0, 1, 1,
1.145211, 0.3753009, 3.124551, 0, 0, 0, 1, 1,
1.146281, 0.9795918, 1.95626, 0, 0, 0, 1, 1,
1.148235, 1.845486, -0.3292782, 1, 1, 1, 1, 1,
1.149201, -1.165999, 1.759982, 1, 1, 1, 1, 1,
1.150023, -1.279978, 2.866061, 1, 1, 1, 1, 1,
1.169133, -0.6971566, 1.669481, 1, 1, 1, 1, 1,
1.176204, -0.2466949, 1.067089, 1, 1, 1, 1, 1,
1.188953, 0.2517871, 1.635307, 1, 1, 1, 1, 1,
1.196802, 0.8811088, 1.225498, 1, 1, 1, 1, 1,
1.206082, -1.235461, 2.089883, 1, 1, 1, 1, 1,
1.215803, -2.515224, 2.516848, 1, 1, 1, 1, 1,
1.221235, 0.7150525, 1.843683, 1, 1, 1, 1, 1,
1.223283, -0.6600957, 2.921805, 1, 1, 1, 1, 1,
1.22367, 0.6519502, 0.3178968, 1, 1, 1, 1, 1,
1.239483, 1.393063, 1.683208, 1, 1, 1, 1, 1,
1.23988, 0.02042251, 1.400405, 1, 1, 1, 1, 1,
1.24161, -1.840352, 2.759696, 1, 1, 1, 1, 1,
1.244153, -0.08879847, 2.374969, 0, 0, 1, 1, 1,
1.245757, -0.6674127, 1.673473, 1, 0, 0, 1, 1,
1.24915, -0.3400497, 2.482663, 1, 0, 0, 1, 1,
1.251434, -0.4255573, 0.7145605, 1, 0, 0, 1, 1,
1.254196, -0.1847002, 0.8831228, 1, 0, 0, 1, 1,
1.256059, 0.4863687, 1.6433, 1, 0, 0, 1, 1,
1.257187, -0.5513197, -1.003357, 0, 0, 0, 1, 1,
1.258036, -0.1738412, 0.0263326, 0, 0, 0, 1, 1,
1.265768, -0.2442853, 2.515892, 0, 0, 0, 1, 1,
1.270315, 0.6781241, 1.939855, 0, 0, 0, 1, 1,
1.27476, -0.6523411, 2.218153, 0, 0, 0, 1, 1,
1.280727, -2.092999, 1.234795, 0, 0, 0, 1, 1,
1.28661, 1.958292, 0.4230634, 0, 0, 0, 1, 1,
1.294534, -2.972494, 3.597466, 1, 1, 1, 1, 1,
1.312615, -0.4272431, 1.375243, 1, 1, 1, 1, 1,
1.313183, -0.1494676, 2.02339, 1, 1, 1, 1, 1,
1.318269, -1.283347, 1.667486, 1, 1, 1, 1, 1,
1.33657, 0.2073879, 0.868975, 1, 1, 1, 1, 1,
1.342827, -1.033001, 0.4394544, 1, 1, 1, 1, 1,
1.345253, 0.372142, 2.681015, 1, 1, 1, 1, 1,
1.355295, 2.361904, 2.027878, 1, 1, 1, 1, 1,
1.356709, 0.1546841, 3.617934, 1, 1, 1, 1, 1,
1.359879, 1.65148, 1.251138, 1, 1, 1, 1, 1,
1.36424, 0.3820592, 0.9220938, 1, 1, 1, 1, 1,
1.365056, 0.08602954, -0.1937713, 1, 1, 1, 1, 1,
1.365169, -0.6099752, 0.647913, 1, 1, 1, 1, 1,
1.365922, -0.2563336, 1.771891, 1, 1, 1, 1, 1,
1.366292, -0.3525567, 2.200751, 1, 1, 1, 1, 1,
1.367588, 0.7371389, 0.6861941, 0, 0, 1, 1, 1,
1.368493, -0.84816, 3.075743, 1, 0, 0, 1, 1,
1.378395, -0.3060926, 0.558639, 1, 0, 0, 1, 1,
1.390148, -0.2566251, 2.816542, 1, 0, 0, 1, 1,
1.395323, -0.8526395, 4.007149, 1, 0, 0, 1, 1,
1.42357, -0.7843587, 2.865686, 1, 0, 0, 1, 1,
1.427239, -0.8053715, 3.396676, 0, 0, 0, 1, 1,
1.433774, 1.018897, 0.3756163, 0, 0, 0, 1, 1,
1.439596, -1.093941, 2.136403, 0, 0, 0, 1, 1,
1.451945, -1.518453, 2.022545, 0, 0, 0, 1, 1,
1.464946, 0.6031278, 0.6691923, 0, 0, 0, 1, 1,
1.482894, 0.9004667, 1.4877, 0, 0, 0, 1, 1,
1.483284, 0.2159381, 0.889502, 0, 0, 0, 1, 1,
1.495692, -0.3792833, 1.541189, 1, 1, 1, 1, 1,
1.503935, 1.590109, 0.3462877, 1, 1, 1, 1, 1,
1.508373, 2.083235, 1.126929, 1, 1, 1, 1, 1,
1.518395, 0.1622688, 0.9297253, 1, 1, 1, 1, 1,
1.526989, -1.600925, 1.80847, 1, 1, 1, 1, 1,
1.550121, -0.5988104, -0.06012399, 1, 1, 1, 1, 1,
1.55663, -0.6912867, 0.7934494, 1, 1, 1, 1, 1,
1.565032, -2.480092, 1.167861, 1, 1, 1, 1, 1,
1.594658, -1.008138, 2.887367, 1, 1, 1, 1, 1,
1.605115, -1.02684, 2.911918, 1, 1, 1, 1, 1,
1.605992, 0.0713421, 1.761748, 1, 1, 1, 1, 1,
1.606556, 0.536647, 3.69416, 1, 1, 1, 1, 1,
1.61106, -1.254233, 3.555995, 1, 1, 1, 1, 1,
1.612887, -0.004477577, 0.1486821, 1, 1, 1, 1, 1,
1.614148, -0.8913126, 0.824875, 1, 1, 1, 1, 1,
1.651212, 1.047594, 0.9835681, 0, 0, 1, 1, 1,
1.651712, -0.06919913, 1.09828, 1, 0, 0, 1, 1,
1.652831, -1.136644, 3.170132, 1, 0, 0, 1, 1,
1.67287, 1.716179, 2.817547, 1, 0, 0, 1, 1,
1.684762, -0.07903662, 4.104178, 1, 0, 0, 1, 1,
1.724533, -0.3708582, 1.463083, 1, 0, 0, 1, 1,
1.761347, -1.522037, 2.653212, 0, 0, 0, 1, 1,
1.771572, 1.367047, 0.2484212, 0, 0, 0, 1, 1,
1.785995, 1.566855, 2.041664, 0, 0, 0, 1, 1,
1.792247, 1.139886, -0.2018023, 0, 0, 0, 1, 1,
1.797854, 0.5047653, 1.957438, 0, 0, 0, 1, 1,
1.815747, 2.095275, -0.2497879, 0, 0, 0, 1, 1,
1.820964, 0.1392359, 0.4761579, 0, 0, 0, 1, 1,
1.863104, -0.1584007, 0.8240277, 1, 1, 1, 1, 1,
1.867125, -0.004954573, 1.728334, 1, 1, 1, 1, 1,
1.869986, 0.9219221, 1.043272, 1, 1, 1, 1, 1,
1.870995, 2.176143, 1.300055, 1, 1, 1, 1, 1,
1.890837, 1.70684, -0.1483136, 1, 1, 1, 1, 1,
1.94421, -0.212653, 2.021271, 1, 1, 1, 1, 1,
1.944595, 0.9800818, 2.087167, 1, 1, 1, 1, 1,
1.954219, -1.929553, 1.886008, 1, 1, 1, 1, 1,
1.972009, 0.2070475, 0.9525333, 1, 1, 1, 1, 1,
1.977196, -1.473519, 2.005775, 1, 1, 1, 1, 1,
1.995417, 1.150391, 0.07234725, 1, 1, 1, 1, 1,
2.035087, -0.3702192, 2.207121, 1, 1, 1, 1, 1,
2.059836, -0.9645374, 0.99458, 1, 1, 1, 1, 1,
2.108788, -0.8621839, 2.646235, 1, 1, 1, 1, 1,
2.111832, -0.4427447, 2.566444, 1, 1, 1, 1, 1,
2.113961, -0.4528396, 2.04196, 0, 0, 1, 1, 1,
2.205842, -0.8137546, 1.899033, 1, 0, 0, 1, 1,
2.227937, -0.4864678, 0.8181184, 1, 0, 0, 1, 1,
2.303142, 1.161391, 1.354053, 1, 0, 0, 1, 1,
2.349283, -1.163494, 3.045474, 1, 0, 0, 1, 1,
2.358609, -1.284081, -0.03817938, 1, 0, 0, 1, 1,
2.364531, 0.8348399, 2.228251, 0, 0, 0, 1, 1,
2.374308, -0.477153, -0.7946568, 0, 0, 0, 1, 1,
2.399165, -0.8753179, 2.329251, 0, 0, 0, 1, 1,
2.451266, 1.119974, 0.5916994, 0, 0, 0, 1, 1,
2.461593, 0.228363, 0.5830102, 0, 0, 0, 1, 1,
2.468324, 0.07932124, 3.257432, 0, 0, 0, 1, 1,
2.476424, -1.10154, 1.10952, 0, 0, 0, 1, 1,
2.698834, -1.024374, 0.3861987, 1, 1, 1, 1, 1,
2.714641, -0.4643535, 2.793656, 1, 1, 1, 1, 1,
2.734205, 1.033863, 2.264392, 1, 1, 1, 1, 1,
2.748539, -0.3217623, 0.4065163, 1, 1, 1, 1, 1,
2.824967, -1.183773, -0.4782515, 1, 1, 1, 1, 1,
3.041511, 0.1934026, 2.997027, 1, 1, 1, 1, 1,
3.056788, 0.6358031, -0.7107563, 1, 1, 1, 1, 1
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
var radius = 9.727162;
var distance = 34.16625;
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
mvMatrix.translate( 0.02450228, -0.007376671, 0.2522461 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.16625);
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
