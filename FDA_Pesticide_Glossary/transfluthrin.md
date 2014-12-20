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
-3.19161, 1.065706, -1.844537, 1, 0, 0, 1,
-3.11323, 0.4729023, -1.038336, 1, 0.007843138, 0, 1,
-3.045269, 2.539322, -0.8355792, 1, 0.01176471, 0, 1,
-2.851494, -0.5208506, -1.395883, 1, 0.01960784, 0, 1,
-2.788312, 2.495338, -1.497605, 1, 0.02352941, 0, 1,
-2.676628, 0.08985698, -3.326115, 1, 0.03137255, 0, 1,
-2.670085, 0.5233331, -1.846087, 1, 0.03529412, 0, 1,
-2.59953, -0.2079105, -3.56109, 1, 0.04313726, 0, 1,
-2.546946, -0.0646335, -0.5599058, 1, 0.04705882, 0, 1,
-2.538823, -0.5437869, -0.7829448, 1, 0.05490196, 0, 1,
-2.469021, 0.1855013, -1.200631, 1, 0.05882353, 0, 1,
-2.424431, 0.1907182, -1.881446, 1, 0.06666667, 0, 1,
-2.361631, 2.130899, 0.7660181, 1, 0.07058824, 0, 1,
-2.354748, -1.215437, -3.539758, 1, 0.07843138, 0, 1,
-2.348967, 1.07084, -0.01613621, 1, 0.08235294, 0, 1,
-2.33552, 0.8802202, -1.664929, 1, 0.09019608, 0, 1,
-2.277034, 0.3362074, -2.007138, 1, 0.09411765, 0, 1,
-2.267313, 1.483775, -0.6844081, 1, 0.1019608, 0, 1,
-2.239611, -0.6625239, -1.183999, 1, 0.1098039, 0, 1,
-2.217372, 0.5884619, -1.808497, 1, 0.1137255, 0, 1,
-2.211517, 0.6874508, -0.7361176, 1, 0.1215686, 0, 1,
-2.198531, -0.4326636, -3.110928, 1, 0.1254902, 0, 1,
-2.128248, 1.068169, -1.121131, 1, 0.1333333, 0, 1,
-2.085848, 0.1149049, -2.563133, 1, 0.1372549, 0, 1,
-2.076659, -1.379152, -3.082165, 1, 0.145098, 0, 1,
-2.052158, -0.4380668, -2.255545, 1, 0.1490196, 0, 1,
-2.043645, -0.524022, -0.7305894, 1, 0.1568628, 0, 1,
-2.033742, -0.168401, -1.923566, 1, 0.1607843, 0, 1,
-2.032237, -0.3375392, -2.275974, 1, 0.1686275, 0, 1,
-2.001846, 0.5718111, -0.1688372, 1, 0.172549, 0, 1,
-1.997082, 0.5582963, -2.672279, 1, 0.1803922, 0, 1,
-1.982314, -0.05824259, -0.9321327, 1, 0.1843137, 0, 1,
-1.979329, 0.2418167, -0.04787572, 1, 0.1921569, 0, 1,
-1.979296, -1.459757, -4.189394, 1, 0.1960784, 0, 1,
-1.974934, -0.2897767, -2.305065, 1, 0.2039216, 0, 1,
-1.974262, 1.180064, -1.023018, 1, 0.2117647, 0, 1,
-1.965983, 0.2753302, -2.549694, 1, 0.2156863, 0, 1,
-1.965331, 0.8859322, -0.7785879, 1, 0.2235294, 0, 1,
-1.944082, -1.217444, -4.420911, 1, 0.227451, 0, 1,
-1.934581, -1.821806, -1.918709, 1, 0.2352941, 0, 1,
-1.934075, 0.9102778, -1.063993, 1, 0.2392157, 0, 1,
-1.929683, -0.04194279, -1.875005, 1, 0.2470588, 0, 1,
-1.926855, -1.608429, -1.971463, 1, 0.2509804, 0, 1,
-1.922563, 1.85773, -0.6900932, 1, 0.2588235, 0, 1,
-1.916075, -1.241722, -1.547391, 1, 0.2627451, 0, 1,
-1.89469, 0.5532827, -0.1075859, 1, 0.2705882, 0, 1,
-1.890019, 1.458887, -0.5092188, 1, 0.2745098, 0, 1,
-1.868446, -0.6770795, -2.290932, 1, 0.282353, 0, 1,
-1.852979, -0.6296726, -1.769578, 1, 0.2862745, 0, 1,
-1.825518, -1.492904, -1.357674, 1, 0.2941177, 0, 1,
-1.797657, 0.3180659, -1.636739, 1, 0.3019608, 0, 1,
-1.778517, -1.342952, -1.55429, 1, 0.3058824, 0, 1,
-1.763514, -0.3457083, -1.156571, 1, 0.3137255, 0, 1,
-1.75138, 0.6250632, -2.572024, 1, 0.3176471, 0, 1,
-1.699025, 0.4508424, -2.33164, 1, 0.3254902, 0, 1,
-1.693429, -0.5999787, -1.559142, 1, 0.3294118, 0, 1,
-1.684908, -0.6856776, -1.520648, 1, 0.3372549, 0, 1,
-1.682444, 0.008863571, -2.214769, 1, 0.3411765, 0, 1,
-1.640798, -0.08665612, -2.108174, 1, 0.3490196, 0, 1,
-1.635505, 2.609949, 1.068694, 1, 0.3529412, 0, 1,
-1.633754, -0.1180768, -1.967375, 1, 0.3607843, 0, 1,
-1.633013, 2.381639, -1.714066, 1, 0.3647059, 0, 1,
-1.632104, 0.4032887, -1.062636, 1, 0.372549, 0, 1,
-1.624972, -1.187587, -1.281691, 1, 0.3764706, 0, 1,
-1.621313, -1.259975, -1.342735, 1, 0.3843137, 0, 1,
-1.616513, -0.5362384, -1.970662, 1, 0.3882353, 0, 1,
-1.615469, -0.7052463, -1.067037, 1, 0.3960784, 0, 1,
-1.60096, 0.9079211, -0.301563, 1, 0.4039216, 0, 1,
-1.588791, 0.8329759, -0.3484919, 1, 0.4078431, 0, 1,
-1.581778, 1.688723, 0.1886609, 1, 0.4156863, 0, 1,
-1.575144, -0.3062378, -3.058348, 1, 0.4196078, 0, 1,
-1.542017, 0.555391, -2.160034, 1, 0.427451, 0, 1,
-1.535795, -0.3133555, -3.972516, 1, 0.4313726, 0, 1,
-1.526631, 0.1335101, 0.3148671, 1, 0.4392157, 0, 1,
-1.520911, -1.153221, -1.349348, 1, 0.4431373, 0, 1,
-1.518179, 0.541485, -1.232568, 1, 0.4509804, 0, 1,
-1.501996, 0.3205207, -1.021337, 1, 0.454902, 0, 1,
-1.501499, -1.284455, -2.239731, 1, 0.4627451, 0, 1,
-1.491765, -0.08964246, -3.813088, 1, 0.4666667, 0, 1,
-1.489177, 1.127221, 0.09219866, 1, 0.4745098, 0, 1,
-1.482012, 0.6121833, -0.3005368, 1, 0.4784314, 0, 1,
-1.471407, -0.4862673, -1.773165, 1, 0.4862745, 0, 1,
-1.465648, 0.687713, -1.395075, 1, 0.4901961, 0, 1,
-1.458805, -0.3908097, -3.317839, 1, 0.4980392, 0, 1,
-1.434599, -2.668952, -3.093713, 1, 0.5058824, 0, 1,
-1.427307, -0.2635126, -0.9909451, 1, 0.509804, 0, 1,
-1.424947, 1.254261, -0.4192017, 1, 0.5176471, 0, 1,
-1.417852, -2.021601, -1.996431, 1, 0.5215687, 0, 1,
-1.410031, -0.5844362, -3.610119, 1, 0.5294118, 0, 1,
-1.397437, 1.115979, -1.126694, 1, 0.5333334, 0, 1,
-1.384563, 0.169572, -1.681347, 1, 0.5411765, 0, 1,
-1.372505, -2.014107, -2.485025, 1, 0.5450981, 0, 1,
-1.360397, 1.105302, 0.328294, 1, 0.5529412, 0, 1,
-1.354455, -1.03189, -2.705622, 1, 0.5568628, 0, 1,
-1.353051, -0.3983938, -0.01341414, 1, 0.5647059, 0, 1,
-1.347757, 0.8278507, -0.5108041, 1, 0.5686275, 0, 1,
-1.341175, 1.30603, -1.720053, 1, 0.5764706, 0, 1,
-1.340677, -1.918926, -1.165014, 1, 0.5803922, 0, 1,
-1.330371, -0.881934, -1.781937, 1, 0.5882353, 0, 1,
-1.322726, -1.468657, -0.8790508, 1, 0.5921569, 0, 1,
-1.319884, -0.1969776, -1.723075, 1, 0.6, 0, 1,
-1.31265, 0.3992321, 0.1300454, 1, 0.6078432, 0, 1,
-1.307759, 0.868353, 1.060079, 1, 0.6117647, 0, 1,
-1.29637, 1.998645, -1.408146, 1, 0.6196079, 0, 1,
-1.291052, 0.3985238, -1.193032, 1, 0.6235294, 0, 1,
-1.282971, 1.051603, 0.6250029, 1, 0.6313726, 0, 1,
-1.280994, 0.6290445, -1.354216, 1, 0.6352941, 0, 1,
-1.280612, 1.15236, 0.1786309, 1, 0.6431373, 0, 1,
-1.279967, -1.658081, -0.6583527, 1, 0.6470588, 0, 1,
-1.275426, 0.319985, -0.3346664, 1, 0.654902, 0, 1,
-1.269528, -0.2648656, -0.4659826, 1, 0.6588235, 0, 1,
-1.264876, -1.166451, -1.532516, 1, 0.6666667, 0, 1,
-1.262394, -0.3304409, -0.6191608, 1, 0.6705883, 0, 1,
-1.250633, 0.01432593, -1.634556, 1, 0.6784314, 0, 1,
-1.238878, 0.7481858, -0.7034639, 1, 0.682353, 0, 1,
-1.23842, -1.001251, -2.405337, 1, 0.6901961, 0, 1,
-1.23605, 0.5506281, 0.1169872, 1, 0.6941177, 0, 1,
-1.23534, -2.641097, -3.841873, 1, 0.7019608, 0, 1,
-1.229998, -0.4875003, -2.501684, 1, 0.7098039, 0, 1,
-1.205734, 0.7900543, -2.197728, 1, 0.7137255, 0, 1,
-1.201771, -1.077966, -2.629119, 1, 0.7215686, 0, 1,
-1.198033, -1.116142, -0.4452224, 1, 0.7254902, 0, 1,
-1.173834, -1.096341, -2.200287, 1, 0.7333333, 0, 1,
-1.161271, 0.7146448, 0.4725043, 1, 0.7372549, 0, 1,
-1.157568, -0.3983887, -2.618812, 1, 0.7450981, 0, 1,
-1.150429, 0.1481108, -1.353059, 1, 0.7490196, 0, 1,
-1.135284, -0.6521074, -2.240438, 1, 0.7568628, 0, 1,
-1.132986, -0.01201661, -0.4998447, 1, 0.7607843, 0, 1,
-1.132023, -3.270149, -3.750967, 1, 0.7686275, 0, 1,
-1.126832, 1.344033, -2.268949, 1, 0.772549, 0, 1,
-1.124965, -0.8082731, -1.434008, 1, 0.7803922, 0, 1,
-1.119371, 0.1946867, 0.2982668, 1, 0.7843137, 0, 1,
-1.109799, -0.7640337, -1.601504, 1, 0.7921569, 0, 1,
-1.109523, 1.804266, 0.3982312, 1, 0.7960784, 0, 1,
-1.107534, -1.66233, -0.7088244, 1, 0.8039216, 0, 1,
-1.107317, -0.1315133, -0.9931469, 1, 0.8117647, 0, 1,
-1.102635, 1.559294, -0.4230529, 1, 0.8156863, 0, 1,
-1.102417, 0.2599269, 0.1091442, 1, 0.8235294, 0, 1,
-1.100921, 1.399302, -1.077509, 1, 0.827451, 0, 1,
-1.092168, 0.6401343, -0.6391562, 1, 0.8352941, 0, 1,
-1.068749, 0.4061339, -2.717368, 1, 0.8392157, 0, 1,
-1.0632, -1.356531, -2.177782, 1, 0.8470588, 0, 1,
-1.058721, -0.3905032, -3.476676, 1, 0.8509804, 0, 1,
-1.057617, 0.1545037, -1.433941, 1, 0.8588235, 0, 1,
-1.051418, 0.8252869, -1.357933, 1, 0.8627451, 0, 1,
-1.03586, 0.2446943, -2.280293, 1, 0.8705882, 0, 1,
-1.029852, -0.1638668, -0.5579869, 1, 0.8745098, 0, 1,
-1.028901, 0.9659845, -1.216968, 1, 0.8823529, 0, 1,
-1.027349, -0.4812723, -2.965359, 1, 0.8862745, 0, 1,
-1.019256, 1.033511, -0.5115187, 1, 0.8941177, 0, 1,
-1.018805, 0.6457009, -2.097589, 1, 0.8980392, 0, 1,
-1.014782, 1.338223, -0.8496999, 1, 0.9058824, 0, 1,
-1.011048, -0.02679615, -2.426628, 1, 0.9137255, 0, 1,
-1.008262, -1.703374, -2.178348, 1, 0.9176471, 0, 1,
-1.006589, 0.7754259, -0.6745594, 1, 0.9254902, 0, 1,
-0.9940817, 1.126677, -0.3750712, 1, 0.9294118, 0, 1,
-0.9923894, 0.2525156, -3.409422, 1, 0.9372549, 0, 1,
-0.9885455, -1.310517, -0.7093246, 1, 0.9411765, 0, 1,
-0.9842453, -0.37536, -1.263997, 1, 0.9490196, 0, 1,
-0.9820253, -0.1641388, -1.103828, 1, 0.9529412, 0, 1,
-0.9785902, 0.4643569, -1.173964, 1, 0.9607843, 0, 1,
-0.9782617, -1.230427, -2.310394, 1, 0.9647059, 0, 1,
-0.9710417, -1.612569, -4.188593, 1, 0.972549, 0, 1,
-0.9521937, -0.4638161, -1.34372, 1, 0.9764706, 0, 1,
-0.951623, -0.2263109, -1.446568, 1, 0.9843137, 0, 1,
-0.9512141, -0.1244293, -0.859473, 1, 0.9882353, 0, 1,
-0.9444057, 0.8374364, -1.483908, 1, 0.9960784, 0, 1,
-0.9441322, -0.4763315, -1.35512, 0.9960784, 1, 0, 1,
-0.9439518, -0.6371126, -2.125174, 0.9921569, 1, 0, 1,
-0.9433578, -1.371134, -1.070727, 0.9843137, 1, 0, 1,
-0.9426799, 0.05084097, -1.939783, 0.9803922, 1, 0, 1,
-0.9377978, 1.460678, -1.833465, 0.972549, 1, 0, 1,
-0.9245508, -0.4018176, -1.97626, 0.9686275, 1, 0, 1,
-0.9191779, -0.6302575, -2.584382, 0.9607843, 1, 0, 1,
-0.9190635, -2.353597, -2.05526, 0.9568627, 1, 0, 1,
-0.9181504, -3.14893, -2.41208, 0.9490196, 1, 0, 1,
-0.9120404, -1.691503, -1.858938, 0.945098, 1, 0, 1,
-0.9101473, 1.290819, -1.09162, 0.9372549, 1, 0, 1,
-0.9094588, -1.078651, -2.732813, 0.9333333, 1, 0, 1,
-0.9043495, -0.0667279, -1.267885, 0.9254902, 1, 0, 1,
-0.902985, -0.01130851, -0.4520677, 0.9215686, 1, 0, 1,
-0.9028971, 0.3561262, -4.25442, 0.9137255, 1, 0, 1,
-0.9028918, 0.2598403, -2.373783, 0.9098039, 1, 0, 1,
-0.8978097, -1.674253, -2.558705, 0.9019608, 1, 0, 1,
-0.8971583, -0.4800395, -1.995799, 0.8941177, 1, 0, 1,
-0.8948969, 0.5842472, -1.927559, 0.8901961, 1, 0, 1,
-0.8915056, 1.014497, -0.9502283, 0.8823529, 1, 0, 1,
-0.8883908, -0.5715208, -2.60921, 0.8784314, 1, 0, 1,
-0.886608, 0.3968749, -1.296019, 0.8705882, 1, 0, 1,
-0.8820773, -0.1112431, 0.04828766, 0.8666667, 1, 0, 1,
-0.8788545, 0.4556827, -2.275805, 0.8588235, 1, 0, 1,
-0.8783162, -1.900891, -4.012962, 0.854902, 1, 0, 1,
-0.8772498, 0.5766924, -1.176915, 0.8470588, 1, 0, 1,
-0.8745122, -0.6458719, -2.438213, 0.8431373, 1, 0, 1,
-0.8680346, -0.4432691, -0.2207785, 0.8352941, 1, 0, 1,
-0.8665621, -0.6281421, -1.160796, 0.8313726, 1, 0, 1,
-0.8658012, 0.6108894, -2.761405, 0.8235294, 1, 0, 1,
-0.863682, 0.8906584, 1.307173, 0.8196079, 1, 0, 1,
-0.8636545, -0.09455574, -0.9220556, 0.8117647, 1, 0, 1,
-0.8634811, 0.09408949, -1.260778, 0.8078431, 1, 0, 1,
-0.8600801, -0.1666291, -2.339641, 0.8, 1, 0, 1,
-0.8566464, 0.9389472, -0.02208125, 0.7921569, 1, 0, 1,
-0.8545625, 0.1714989, -1.966727, 0.7882353, 1, 0, 1,
-0.8476197, -1.664096, -2.679134, 0.7803922, 1, 0, 1,
-0.8438682, 1.846181, -0.7432759, 0.7764706, 1, 0, 1,
-0.8423359, 0.0768856, -2.210551, 0.7686275, 1, 0, 1,
-0.8347698, 1.036509, -0.6235929, 0.7647059, 1, 0, 1,
-0.8323336, -0.03132788, -2.317611, 0.7568628, 1, 0, 1,
-0.8304585, -1.686041, -3.084859, 0.7529412, 1, 0, 1,
-0.8251493, 0.8795381, -0.395206, 0.7450981, 1, 0, 1,
-0.8207211, -1.174522, -1.668262, 0.7411765, 1, 0, 1,
-0.8195904, -0.04638828, -2.388224, 0.7333333, 1, 0, 1,
-0.8160754, 1.086905, -0.889385, 0.7294118, 1, 0, 1,
-0.8152631, -0.5068745, -2.085637, 0.7215686, 1, 0, 1,
-0.8136999, -0.3118747, -2.623037, 0.7176471, 1, 0, 1,
-0.8134246, -1.03824, -3.134533, 0.7098039, 1, 0, 1,
-0.8131465, -0.7441572, -3.330302, 0.7058824, 1, 0, 1,
-0.8122134, 0.3198994, -2.041262, 0.6980392, 1, 0, 1,
-0.807613, -0.8299642, -1.807395, 0.6901961, 1, 0, 1,
-0.7996822, -0.009524362, -2.481757, 0.6862745, 1, 0, 1,
-0.7991364, -1.082645, -0.8643689, 0.6784314, 1, 0, 1,
-0.7970187, -0.9077179, -2.539511, 0.6745098, 1, 0, 1,
-0.7961748, -1.115659, -4.586727, 0.6666667, 1, 0, 1,
-0.7960154, 0.9263903, -1.538145, 0.6627451, 1, 0, 1,
-0.7925466, -0.9929423, -3.031688, 0.654902, 1, 0, 1,
-0.7895467, 0.02248789, -0.714251, 0.6509804, 1, 0, 1,
-0.781626, 0.008420994, -1.508415, 0.6431373, 1, 0, 1,
-0.7709381, -0.9208016, -3.773906, 0.6392157, 1, 0, 1,
-0.7680709, -0.9487727, -1.455974, 0.6313726, 1, 0, 1,
-0.7618678, 0.5815536, -1.521813, 0.627451, 1, 0, 1,
-0.7551783, 0.1221208, -1.512223, 0.6196079, 1, 0, 1,
-0.746724, -0.2721527, -1.893147, 0.6156863, 1, 0, 1,
-0.7396975, 0.5854589, 0.3727868, 0.6078432, 1, 0, 1,
-0.7350854, -1.310021, -2.912493, 0.6039216, 1, 0, 1,
-0.7323849, -0.07552934, -2.956149, 0.5960785, 1, 0, 1,
-0.7314692, -0.03403084, -1.087331, 0.5882353, 1, 0, 1,
-0.7302096, -1.406526, -2.267716, 0.5843138, 1, 0, 1,
-0.7270321, -0.2029999, -4.452481, 0.5764706, 1, 0, 1,
-0.7254975, -0.3985649, -1.749247, 0.572549, 1, 0, 1,
-0.7228147, -0.5564997, -2.666744, 0.5647059, 1, 0, 1,
-0.7202441, -1.41741, -4.019306, 0.5607843, 1, 0, 1,
-0.7164503, 0.1420643, -2.493075, 0.5529412, 1, 0, 1,
-0.7159747, 0.5744716, -1.107118, 0.5490196, 1, 0, 1,
-0.7148201, 0.02346303, -1.821525, 0.5411765, 1, 0, 1,
-0.7145399, -1.372429, -0.644942, 0.5372549, 1, 0, 1,
-0.7137421, -1.185823, -2.387196, 0.5294118, 1, 0, 1,
-0.7103739, -0.3619338, -2.48457, 0.5254902, 1, 0, 1,
-0.7091901, 0.6828819, -1.299924, 0.5176471, 1, 0, 1,
-0.7075933, -1.226833, -2.361456, 0.5137255, 1, 0, 1,
-0.7058591, 0.2618645, -2.353691, 0.5058824, 1, 0, 1,
-0.7057893, 0.8545673, -0.9495019, 0.5019608, 1, 0, 1,
-0.7053006, -0.1974069, -0.03426633, 0.4941176, 1, 0, 1,
-0.6926907, 0.1381438, 0.3630697, 0.4862745, 1, 0, 1,
-0.6921482, -0.8122253, -4.340899, 0.4823529, 1, 0, 1,
-0.6911337, 1.166106, -0.355745, 0.4745098, 1, 0, 1,
-0.6900166, -0.2356177, -2.117518, 0.4705882, 1, 0, 1,
-0.6856321, 0.2901586, -2.715259, 0.4627451, 1, 0, 1,
-0.6835482, 0.951382, 0.5897344, 0.4588235, 1, 0, 1,
-0.6825648, 2.108744, -0.6381259, 0.4509804, 1, 0, 1,
-0.670669, -0.1008863, -2.269046, 0.4470588, 1, 0, 1,
-0.669194, -0.4951882, -2.945844, 0.4392157, 1, 0, 1,
-0.6641375, -0.838111, -3.111835, 0.4352941, 1, 0, 1,
-0.6629697, -0.2853428, -3.359188, 0.427451, 1, 0, 1,
-0.6623821, -0.6684455, -0.9209992, 0.4235294, 1, 0, 1,
-0.6494188, -0.492153, -3.241907, 0.4156863, 1, 0, 1,
-0.6478913, 2.018397, -1.321997, 0.4117647, 1, 0, 1,
-0.6456681, 0.5234311, -1.450351, 0.4039216, 1, 0, 1,
-0.6448893, -0.7121458, -1.24417, 0.3960784, 1, 0, 1,
-0.6359764, -0.4594356, -2.663899, 0.3921569, 1, 0, 1,
-0.6308646, -0.2277929, -2.127901, 0.3843137, 1, 0, 1,
-0.6307867, 2.121746, 0.3996663, 0.3803922, 1, 0, 1,
-0.6249052, -0.3062288, -2.61142, 0.372549, 1, 0, 1,
-0.6244729, 0.3491632, -2.29933, 0.3686275, 1, 0, 1,
-0.6232051, -0.2791649, -3.372749, 0.3607843, 1, 0, 1,
-0.6218809, -0.244318, -2.557059, 0.3568628, 1, 0, 1,
-0.6208531, -0.4557097, -3.965068, 0.3490196, 1, 0, 1,
-0.6181514, 0.1401962, 0.8611769, 0.345098, 1, 0, 1,
-0.6178607, 1.283494, -0.5188863, 0.3372549, 1, 0, 1,
-0.6145141, 0.352672, -1.192533, 0.3333333, 1, 0, 1,
-0.6067023, -0.1586292, -1.541191, 0.3254902, 1, 0, 1,
-0.6066427, 0.7472546, 0.59271, 0.3215686, 1, 0, 1,
-0.6042744, -0.3368261, -2.095033, 0.3137255, 1, 0, 1,
-0.602902, -0.7769053, -2.449289, 0.3098039, 1, 0, 1,
-0.5964718, 1.235971, -1.272362, 0.3019608, 1, 0, 1,
-0.5913622, -0.2582539, -1.242806, 0.2941177, 1, 0, 1,
-0.5912257, 0.9797789, 0.554922, 0.2901961, 1, 0, 1,
-0.58984, -0.3076289, -3.857586, 0.282353, 1, 0, 1,
-0.5892138, -0.4588016, -2.512221, 0.2784314, 1, 0, 1,
-0.5885093, -1.028067, -0.6794834, 0.2705882, 1, 0, 1,
-0.5835688, 0.3672427, -1.648, 0.2666667, 1, 0, 1,
-0.5805638, 0.5008001, -1.74569, 0.2588235, 1, 0, 1,
-0.5704795, 1.024484, -0.3281822, 0.254902, 1, 0, 1,
-0.5654061, 0.5428401, -0.4318631, 0.2470588, 1, 0, 1,
-0.5653949, -2.877479, -0.7389717, 0.2431373, 1, 0, 1,
-0.5624629, 0.9692547, -0.2002822, 0.2352941, 1, 0, 1,
-0.561151, -0.9914437, -3.291189, 0.2313726, 1, 0, 1,
-0.5570053, -0.2460109, -2.013413, 0.2235294, 1, 0, 1,
-0.5546385, 0.06446906, -1.474124, 0.2196078, 1, 0, 1,
-0.5536884, 0.2265466, -2.115288, 0.2117647, 1, 0, 1,
-0.5488644, 0.2429157, -0.7596688, 0.2078431, 1, 0, 1,
-0.5470779, 0.6088296, -0.2931251, 0.2, 1, 0, 1,
-0.5455902, -0.9357129, -3.003124, 0.1921569, 1, 0, 1,
-0.5429698, 0.8526913, 0.5253844, 0.1882353, 1, 0, 1,
-0.5421376, 0.8547867, -0.4625596, 0.1803922, 1, 0, 1,
-0.5409635, 0.3269069, -1.061743, 0.1764706, 1, 0, 1,
-0.5407364, -1.048715, -1.624904, 0.1686275, 1, 0, 1,
-0.5375262, 0.2578753, 0.360027, 0.1647059, 1, 0, 1,
-0.5286707, -0.1476688, -0.0966343, 0.1568628, 1, 0, 1,
-0.5273268, 0.128776, -1.840638, 0.1529412, 1, 0, 1,
-0.5251585, 0.1888693, -2.924562, 0.145098, 1, 0, 1,
-0.5225566, -1.475761, -4.738084, 0.1411765, 1, 0, 1,
-0.5167238, -0.9978235, -3.55742, 0.1333333, 1, 0, 1,
-0.5158261, 1.030202, -0.5624905, 0.1294118, 1, 0, 1,
-0.5150802, 0.7394068, -1.634464, 0.1215686, 1, 0, 1,
-0.5146014, -1.98018, -3.613309, 0.1176471, 1, 0, 1,
-0.5083564, -0.5253646, -2.518576, 0.1098039, 1, 0, 1,
-0.5082802, -0.3147198, -3.342661, 0.1058824, 1, 0, 1,
-0.5043375, -1.69417, -3.517663, 0.09803922, 1, 0, 1,
-0.5018679, -1.680573, -2.949788, 0.09019608, 1, 0, 1,
-0.5010739, -1.22539, -3.164593, 0.08627451, 1, 0, 1,
-0.4960243, 1.703404, 0.1365402, 0.07843138, 1, 0, 1,
-0.4959576, -1.535091, -3.608628, 0.07450981, 1, 0, 1,
-0.4953397, -0.09332412, -1.603632, 0.06666667, 1, 0, 1,
-0.4930741, -0.5490344, -3.21066, 0.0627451, 1, 0, 1,
-0.4902028, 1.110703, -1.056058, 0.05490196, 1, 0, 1,
-0.4875983, -0.51912, -1.781082, 0.05098039, 1, 0, 1,
-0.4875761, 0.6054605, -1.950803, 0.04313726, 1, 0, 1,
-0.4857983, 0.3831558, -2.080165, 0.03921569, 1, 0, 1,
-0.4838404, 1.363945, 0.03858875, 0.03137255, 1, 0, 1,
-0.4749678, 0.08771958, -0.5399064, 0.02745098, 1, 0, 1,
-0.4743854, -0.09834804, -2.968011, 0.01960784, 1, 0, 1,
-0.468386, 0.5349146, 0.124078, 0.01568628, 1, 0, 1,
-0.4677127, 1.200102, -0.82524, 0.007843138, 1, 0, 1,
-0.467124, -0.2206756, -2.05971, 0.003921569, 1, 0, 1,
-0.4586244, 2.153318, -0.5879336, 0, 1, 0.003921569, 1,
-0.4585635, -0.1158899, -1.047319, 0, 1, 0.01176471, 1,
-0.4571515, 0.5613806, -1.418887, 0, 1, 0.01568628, 1,
-0.4562159, 1.950704, -1.744131, 0, 1, 0.02352941, 1,
-0.451175, -1.168923, -2.202961, 0, 1, 0.02745098, 1,
-0.4430537, -1.016349, -2.220528, 0, 1, 0.03529412, 1,
-0.436556, 1.233604, -0.5059302, 0, 1, 0.03921569, 1,
-0.4313443, 1.190351, -0.2107091, 0, 1, 0.04705882, 1,
-0.4294596, 0.03422508, -1.325505, 0, 1, 0.05098039, 1,
-0.4264238, -0.4585125, -4.51504, 0, 1, 0.05882353, 1,
-0.4230905, 1.359759, -0.8004266, 0, 1, 0.0627451, 1,
-0.422544, -0.8879796, -5.01673, 0, 1, 0.07058824, 1,
-0.4217748, 1.428178, -1.702139, 0, 1, 0.07450981, 1,
-0.4174971, 0.3945217, -1.265204, 0, 1, 0.08235294, 1,
-0.4158171, -0.9539513, -3.361045, 0, 1, 0.08627451, 1,
-0.4122962, 0.3093281, -0.1513703, 0, 1, 0.09411765, 1,
-0.4095514, 0.4362251, -0.6185798, 0, 1, 0.1019608, 1,
-0.4033661, 1.32248, -0.2287924, 0, 1, 0.1058824, 1,
-0.4025752, 0.1343039, -1.094807, 0, 1, 0.1137255, 1,
-0.3901316, 0.9235622, -1.404883, 0, 1, 0.1176471, 1,
-0.3874014, -1.58992, -3.880563, 0, 1, 0.1254902, 1,
-0.3848676, 0.04121746, -1.237942, 0, 1, 0.1294118, 1,
-0.3831483, -1.066507, -2.770608, 0, 1, 0.1372549, 1,
-0.3817856, 0.5660838, -2.048742, 0, 1, 0.1411765, 1,
-0.3806351, -1.353196, -2.909131, 0, 1, 0.1490196, 1,
-0.380541, -0.3166713, -3.137675, 0, 1, 0.1529412, 1,
-0.3789424, 0.6961658, -0.2042985, 0, 1, 0.1607843, 1,
-0.3786917, -1.061207, -2.510642, 0, 1, 0.1647059, 1,
-0.3765551, 0.1686262, -1.021566, 0, 1, 0.172549, 1,
-0.3760174, -2.076832, -2.405431, 0, 1, 0.1764706, 1,
-0.3730721, -0.8125917, -0.9217192, 0, 1, 0.1843137, 1,
-0.3728619, -1.318638, -2.39923, 0, 1, 0.1882353, 1,
-0.3695029, 0.08427043, -1.25473, 0, 1, 0.1960784, 1,
-0.3670788, -0.3103486, -0.3783302, 0, 1, 0.2039216, 1,
-0.365836, 0.3922248, -0.6031507, 0, 1, 0.2078431, 1,
-0.3618357, -0.4554825, -2.659738, 0, 1, 0.2156863, 1,
-0.3613341, -1.795895, -3.929343, 0, 1, 0.2196078, 1,
-0.3599238, 1.138296, -0.2576695, 0, 1, 0.227451, 1,
-0.3580211, 1.854699, -1.687846, 0, 1, 0.2313726, 1,
-0.3485092, -0.3612953, -1.30581, 0, 1, 0.2392157, 1,
-0.3457834, 1.661821, -0.272697, 0, 1, 0.2431373, 1,
-0.3431588, -0.8533972, -1.047832, 0, 1, 0.2509804, 1,
-0.3318641, -0.9202327, -4.32287, 0, 1, 0.254902, 1,
-0.3274484, 0.8353735, 0.4247279, 0, 1, 0.2627451, 1,
-0.3273048, -1.237369, -1.910209, 0, 1, 0.2666667, 1,
-0.3255983, -0.08421011, -2.167153, 0, 1, 0.2745098, 1,
-0.324603, -1.001048, -2.378725, 0, 1, 0.2784314, 1,
-0.3240126, -0.1209877, -2.473023, 0, 1, 0.2862745, 1,
-0.3185581, 0.1359423, -1.571686, 0, 1, 0.2901961, 1,
-0.3140079, 0.0321562, -0.4512537, 0, 1, 0.2980392, 1,
-0.3133698, 0.0048115, 0.2003945, 0, 1, 0.3058824, 1,
-0.3118795, 1.181969, -0.304634, 0, 1, 0.3098039, 1,
-0.3115973, 0.8143373, -1.81181, 0, 1, 0.3176471, 1,
-0.3115105, 0.8526663, -1.636185, 0, 1, 0.3215686, 1,
-0.3100621, -0.9492531, -2.845329, 0, 1, 0.3294118, 1,
-0.3076299, -0.9026704, -0.8517502, 0, 1, 0.3333333, 1,
-0.307607, -1.118782, -3.039676, 0, 1, 0.3411765, 1,
-0.3067066, 3.024341, -2.080199, 0, 1, 0.345098, 1,
-0.3063304, 1.119771, 0.1551237, 0, 1, 0.3529412, 1,
-0.2983989, -1.497596, -4.056444, 0, 1, 0.3568628, 1,
-0.2969437, 0.0819065, -1.087034, 0, 1, 0.3647059, 1,
-0.2969336, -0.4149771, -2.662567, 0, 1, 0.3686275, 1,
-0.2927302, -0.393751, -1.564003, 0, 1, 0.3764706, 1,
-0.2906502, -0.09043568, -1.997488, 0, 1, 0.3803922, 1,
-0.2859915, 0.7471222, -0.6347548, 0, 1, 0.3882353, 1,
-0.2856665, 0.6389664, -0.07055551, 0, 1, 0.3921569, 1,
-0.285592, 0.0349894, -0.2121805, 0, 1, 0.4, 1,
-0.2823938, 0.6387357, -0.4771889, 0, 1, 0.4078431, 1,
-0.2775452, -0.4655543, -2.839948, 0, 1, 0.4117647, 1,
-0.2758305, -2.275891, -2.782087, 0, 1, 0.4196078, 1,
-0.2753763, -0.43926, -2.597245, 0, 1, 0.4235294, 1,
-0.2733481, -0.7455677, -3.995366, 0, 1, 0.4313726, 1,
-0.2638814, 2.211299, 2.180647, 0, 1, 0.4352941, 1,
-0.2634546, -0.2400356, -0.674925, 0, 1, 0.4431373, 1,
-0.2615367, 0.9226686, -0.1181277, 0, 1, 0.4470588, 1,
-0.2602171, -1.456469, -3.841783, 0, 1, 0.454902, 1,
-0.2591761, -1.214603, -1.814415, 0, 1, 0.4588235, 1,
-0.2573165, -0.9491863, -2.15296, 0, 1, 0.4666667, 1,
-0.2528057, 0.2629841, 0.6218776, 0, 1, 0.4705882, 1,
-0.2510766, -0.22477, -1.078579, 0, 1, 0.4784314, 1,
-0.2505428, 1.040665, -0.1008436, 0, 1, 0.4823529, 1,
-0.2495469, -0.8176708, -2.314506, 0, 1, 0.4901961, 1,
-0.2485142, -0.3594095, -2.027358, 0, 1, 0.4941176, 1,
-0.2457006, -0.0654224, -2.734408, 0, 1, 0.5019608, 1,
-0.2443531, -2.256024, -1.467427, 0, 1, 0.509804, 1,
-0.2358011, 0.7121214, -1.458966, 0, 1, 0.5137255, 1,
-0.2333192, 1.392134, 0.4019609, 0, 1, 0.5215687, 1,
-0.2311286, -0.5388455, -2.053663, 0, 1, 0.5254902, 1,
-0.2262102, -0.8220819, -3.594844, 0, 1, 0.5333334, 1,
-0.2256865, 0.8835059, -1.569926, 0, 1, 0.5372549, 1,
-0.2250894, 0.01334139, 0.0947725, 0, 1, 0.5450981, 1,
-0.2228706, -0.8386864, -2.940767, 0, 1, 0.5490196, 1,
-0.2220783, -0.6599135, -2.642057, 0, 1, 0.5568628, 1,
-0.2217018, 0.5304745, 1.034882, 0, 1, 0.5607843, 1,
-0.2211301, -0.01509258, -1.205328, 0, 1, 0.5686275, 1,
-0.2207854, -1.651866, -2.949675, 0, 1, 0.572549, 1,
-0.2180171, -0.9922829, -3.65749, 0, 1, 0.5803922, 1,
-0.2157519, -0.002829303, -2.08466, 0, 1, 0.5843138, 1,
-0.2152029, -0.558024, -3.642264, 0, 1, 0.5921569, 1,
-0.214913, -0.2203134, -3.378644, 0, 1, 0.5960785, 1,
-0.2130506, 1.19218, 1.054188, 0, 1, 0.6039216, 1,
-0.2128733, 1.255681, -0.8895479, 0, 1, 0.6117647, 1,
-0.2128665, -0.5283114, -4.685398, 0, 1, 0.6156863, 1,
-0.2113963, -0.02639933, -1.486617, 0, 1, 0.6235294, 1,
-0.2099187, -1.780622, -2.985487, 0, 1, 0.627451, 1,
-0.2075914, -0.4617746, -3.68866, 0, 1, 0.6352941, 1,
-0.2073925, 0.1380057, -0.6073112, 0, 1, 0.6392157, 1,
-0.204621, 2.566186, -0.7121819, 0, 1, 0.6470588, 1,
-0.2027655, 1.464807, 1.21787, 0, 1, 0.6509804, 1,
-0.1976079, 0.2616536, -0.5019614, 0, 1, 0.6588235, 1,
-0.1956828, 2.460664, 0.4307516, 0, 1, 0.6627451, 1,
-0.1939965, 0.2773292, -0.7559711, 0, 1, 0.6705883, 1,
-0.189568, 0.8302323, -0.2272258, 0, 1, 0.6745098, 1,
-0.1876601, -0.3740929, -1.042568, 0, 1, 0.682353, 1,
-0.1875506, -1.858334, -2.319723, 0, 1, 0.6862745, 1,
-0.1854084, -0.856436, -3.119347, 0, 1, 0.6941177, 1,
-0.1831771, 0.5976729, 0.2506173, 0, 1, 0.7019608, 1,
-0.1757393, -0.9093299, -3.630038, 0, 1, 0.7058824, 1,
-0.1744452, 0.4495757, -0.4022187, 0, 1, 0.7137255, 1,
-0.1713112, 0.7195083, 0.7166969, 0, 1, 0.7176471, 1,
-0.1577857, -0.8506373, -3.509065, 0, 1, 0.7254902, 1,
-0.1539599, 2.288372, 0.6054718, 0, 1, 0.7294118, 1,
-0.1500634, -1.048682, -3.619401, 0, 1, 0.7372549, 1,
-0.1473034, 1.545792, 0.7233068, 0, 1, 0.7411765, 1,
-0.1420256, 0.09817263, -0.8948807, 0, 1, 0.7490196, 1,
-0.13871, 0.3787695, -0.6701944, 0, 1, 0.7529412, 1,
-0.1337371, -0.123823, -3.388797, 0, 1, 0.7607843, 1,
-0.1319264, -0.829699, -1.997835, 0, 1, 0.7647059, 1,
-0.1272047, -0.6021874, -3.97356, 0, 1, 0.772549, 1,
-0.1247874, 0.9249039, -1.561341, 0, 1, 0.7764706, 1,
-0.1237786, -0.5363008, -3.275304, 0, 1, 0.7843137, 1,
-0.123009, 0.18295, -0.2623497, 0, 1, 0.7882353, 1,
-0.1177993, -0.744855, -3.792887, 0, 1, 0.7960784, 1,
-0.1149808, -1.014202, -2.433619, 0, 1, 0.8039216, 1,
-0.1129409, 0.6436052, -1.970584, 0, 1, 0.8078431, 1,
-0.1109587, 0.9767436, -1.430114, 0, 1, 0.8156863, 1,
-0.1034097, 0.5265056, -0.3157793, 0, 1, 0.8196079, 1,
-0.1015846, -0.7915854, -3.146152, 0, 1, 0.827451, 1,
-0.0992559, 1.856242, 1.076612, 0, 1, 0.8313726, 1,
-0.09252892, 0.0401508, -1.226503, 0, 1, 0.8392157, 1,
-0.09170094, -0.02309717, -0.2210904, 0, 1, 0.8431373, 1,
-0.09035447, -0.02452306, -2.636073, 0, 1, 0.8509804, 1,
-0.08762553, -0.02660114, -0.0484475, 0, 1, 0.854902, 1,
-0.0856382, -1.303892, -4.577311, 0, 1, 0.8627451, 1,
-0.08535086, 0.4544542, 0.0437411, 0, 1, 0.8666667, 1,
-0.07220756, 0.7744359, -0.533254, 0, 1, 0.8745098, 1,
-0.0719955, 1.341035, 1.514082, 0, 1, 0.8784314, 1,
-0.07158181, 1.648261, 1.740412, 0, 1, 0.8862745, 1,
-0.06720769, -1.284823, -2.131552, 0, 1, 0.8901961, 1,
-0.0613295, 0.7752417, -1.886814, 0, 1, 0.8980392, 1,
-0.05772141, 1.217816, -1.193747, 0, 1, 0.9058824, 1,
-0.05398792, -0.843549, -3.039186, 0, 1, 0.9098039, 1,
-0.0489195, 1.395371, -0.1795003, 0, 1, 0.9176471, 1,
-0.0459576, 0.7155855, 0.2626032, 0, 1, 0.9215686, 1,
-0.04257083, 1.250891, -0.4804616, 0, 1, 0.9294118, 1,
-0.03788915, -1.826911, -5.059798, 0, 1, 0.9333333, 1,
-0.03354459, 0.0271782, -1.873614, 0, 1, 0.9411765, 1,
-0.03109197, 1.506979, 0.5645136, 0, 1, 0.945098, 1,
-0.02662185, -1.131634, -2.809411, 0, 1, 0.9529412, 1,
-0.02520878, -0.9898951, -2.792377, 0, 1, 0.9568627, 1,
-0.02421894, -0.1103937, -4.302643, 0, 1, 0.9647059, 1,
-0.02346198, -1.665209, -2.059115, 0, 1, 0.9686275, 1,
-0.02320522, -0.8042421, -2.523277, 0, 1, 0.9764706, 1,
-0.02152338, 0.9219852, 0.8108016, 0, 1, 0.9803922, 1,
-0.01249513, 0.8154395, -0.6624205, 0, 1, 0.9882353, 1,
-0.01018136, 0.9858297, 0.4212219, 0, 1, 0.9921569, 1,
-0.009525713, 0.7479018, -0.2003915, 0, 1, 1, 1,
-0.008598876, 1.045759, -0.3857594, 0, 0.9921569, 1, 1,
-0.007897727, -0.08792295, -5.67932, 0, 0.9882353, 1, 1,
-0.007839724, -0.6650011, -3.654432, 0, 0.9803922, 1, 1,
-0.002685094, 0.5237104, -0.8632813, 0, 0.9764706, 1, 1,
-0.002657858, 1.205662, -1.78677, 0, 0.9686275, 1, 1,
0.0006658181, 1.179741, -0.3708566, 0, 0.9647059, 1, 1,
0.001734108, -1.327643, 2.090468, 0, 0.9568627, 1, 1,
0.002380236, 0.3635014, 1.106318, 0, 0.9529412, 1, 1,
0.002844369, 0.4205558, -0.2734907, 0, 0.945098, 1, 1,
0.004652635, -0.8063208, 3.269398, 0, 0.9411765, 1, 1,
0.004677055, -0.4361466, 2.57125, 0, 0.9333333, 1, 1,
0.004756079, -0.4316357, 2.366782, 0, 0.9294118, 1, 1,
0.01290099, -1.080195, 3.671621, 0, 0.9215686, 1, 1,
0.01332585, 0.5693711, -0.8263827, 0, 0.9176471, 1, 1,
0.01672298, -1.484559, 4.95603, 0, 0.9098039, 1, 1,
0.01700489, -0.8890088, 2.353243, 0, 0.9058824, 1, 1,
0.01767109, -0.2942135, 2.551235, 0, 0.8980392, 1, 1,
0.01947729, -1.900636, 4.531571, 0, 0.8901961, 1, 1,
0.02619136, -2.727768, 3.509774, 0, 0.8862745, 1, 1,
0.02846946, -1.340638, 2.456174, 0, 0.8784314, 1, 1,
0.03508184, 0.8325108, 0.7176666, 0, 0.8745098, 1, 1,
0.03603257, -1.00897, 3.223284, 0, 0.8666667, 1, 1,
0.03985484, -0.9928375, 4.085065, 0, 0.8627451, 1, 1,
0.04123561, 0.002882414, 1.089379, 0, 0.854902, 1, 1,
0.04504474, -2.364002, 3.070417, 0, 0.8509804, 1, 1,
0.04833698, -0.0145438, 3.306928, 0, 0.8431373, 1, 1,
0.048753, -0.6225923, 4.066804, 0, 0.8392157, 1, 1,
0.05061095, -0.7476605, 3.706376, 0, 0.8313726, 1, 1,
0.05066833, 0.4583097, -1.146055, 0, 0.827451, 1, 1,
0.05194813, 0.471949, 0.9839124, 0, 0.8196079, 1, 1,
0.05239888, 0.46809, 1.184043, 0, 0.8156863, 1, 1,
0.05596971, 0.01306894, 1.334182, 0, 0.8078431, 1, 1,
0.05939282, 0.346161, 0.7894043, 0, 0.8039216, 1, 1,
0.06128659, 0.3611776, 0.5736708, 0, 0.7960784, 1, 1,
0.06382982, 1.120813, 0.5807652, 0, 0.7882353, 1, 1,
0.07073066, 0.5078223, 1.172564, 0, 0.7843137, 1, 1,
0.070747, 0.7222689, 0.2539307, 0, 0.7764706, 1, 1,
0.07418103, -0.4211048, 4.097432, 0, 0.772549, 1, 1,
0.0759998, 0.386032, 0.9007725, 0, 0.7647059, 1, 1,
0.08287825, 0.985088, 0.8660809, 0, 0.7607843, 1, 1,
0.08308775, -1.708145, 2.256358, 0, 0.7529412, 1, 1,
0.08328228, 0.5280737, -1.427309, 0, 0.7490196, 1, 1,
0.09021597, -1.799843, 2.288934, 0, 0.7411765, 1, 1,
0.09105019, -0.7947443, 2.735445, 0, 0.7372549, 1, 1,
0.09239475, 0.7008759, 1.11874, 0, 0.7294118, 1, 1,
0.09269834, -0.1316485, 2.393795, 0, 0.7254902, 1, 1,
0.09355983, 0.8068224, -0.6183416, 0, 0.7176471, 1, 1,
0.09477282, -0.3699836, 2.212508, 0, 0.7137255, 1, 1,
0.09782226, -0.9982942, 3.220609, 0, 0.7058824, 1, 1,
0.102999, -1.517948, 4.161752, 0, 0.6980392, 1, 1,
0.1049115, -0.5291798, 3.928708, 0, 0.6941177, 1, 1,
0.1154978, -0.5245656, 3.30721, 0, 0.6862745, 1, 1,
0.1253389, 1.454365, 1.514537, 0, 0.682353, 1, 1,
0.1276365, 0.8675418, -0.6293612, 0, 0.6745098, 1, 1,
0.1300662, 0.6797584, -0.7007244, 0, 0.6705883, 1, 1,
0.1355633, -0.4236231, 2.479205, 0, 0.6627451, 1, 1,
0.139011, 0.7257061, 1.219365, 0, 0.6588235, 1, 1,
0.1470184, -0.2177945, 1.372431, 0, 0.6509804, 1, 1,
0.1498768, 0.02106591, 2.576955, 0, 0.6470588, 1, 1,
0.1521395, 0.3156277, 1.418242, 0, 0.6392157, 1, 1,
0.1531014, 0.1180453, 1.687939, 0, 0.6352941, 1, 1,
0.1575292, -2.457192, 2.360027, 0, 0.627451, 1, 1,
0.1576839, 0.7077321, -0.2131497, 0, 0.6235294, 1, 1,
0.1601827, -1.194366, 3.168625, 0, 0.6156863, 1, 1,
0.1619511, 1.24341, 0.7206967, 0, 0.6117647, 1, 1,
0.1641987, -0.2825631, 1.649719, 0, 0.6039216, 1, 1,
0.1664122, -0.3458124, 5.373466, 0, 0.5960785, 1, 1,
0.1674582, -0.1324902, 0.5654539, 0, 0.5921569, 1, 1,
0.1693577, -0.6335558, 3.209175, 0, 0.5843138, 1, 1,
0.1693727, -0.5828243, 3.242784, 0, 0.5803922, 1, 1,
0.1776287, -0.2189538, 2.394317, 0, 0.572549, 1, 1,
0.1788071, 1.091157, -0.04266392, 0, 0.5686275, 1, 1,
0.1790531, -0.5805672, 1.564361, 0, 0.5607843, 1, 1,
0.1839274, -0.1214296, 1.967585, 0, 0.5568628, 1, 1,
0.1842419, -0.08547769, 1.367387, 0, 0.5490196, 1, 1,
0.1843602, -0.05413707, 2.054211, 0, 0.5450981, 1, 1,
0.187084, 0.6580917, 1.893652, 0, 0.5372549, 1, 1,
0.1887537, -0.3233142, 3.897947, 0, 0.5333334, 1, 1,
0.1888645, 0.1602188, 0.0289484, 0, 0.5254902, 1, 1,
0.1893738, -0.4386207, 3.300897, 0, 0.5215687, 1, 1,
0.1944598, -1.715436, 1.938591, 0, 0.5137255, 1, 1,
0.1945836, 0.6438141, -0.7127546, 0, 0.509804, 1, 1,
0.1992966, -0.7613465, 3.928789, 0, 0.5019608, 1, 1,
0.2017524, 0.4172475, 0.1499529, 0, 0.4941176, 1, 1,
0.205319, 0.1792917, 0.5982572, 0, 0.4901961, 1, 1,
0.2061995, 0.4346648, -1.291052, 0, 0.4823529, 1, 1,
0.2082791, 0.473655, 1.596015, 0, 0.4784314, 1, 1,
0.2123443, 0.7297598, -0.2462544, 0, 0.4705882, 1, 1,
0.2198237, 0.7691207, 2.707904, 0, 0.4666667, 1, 1,
0.2244615, -0.05333934, 0.6652716, 0, 0.4588235, 1, 1,
0.224928, -0.3187424, 1.384115, 0, 0.454902, 1, 1,
0.2281404, 0.705858, 0.8906418, 0, 0.4470588, 1, 1,
0.2287971, -0.9038888, 3.629266, 0, 0.4431373, 1, 1,
0.2292707, -0.6827077, 1.216167, 0, 0.4352941, 1, 1,
0.2312699, -1.341079, 0.3271438, 0, 0.4313726, 1, 1,
0.2334739, 0.7921927, 2.628204, 0, 0.4235294, 1, 1,
0.2395404, -0.5856214, 3.588247, 0, 0.4196078, 1, 1,
0.2442721, 1.2254, 0.7845402, 0, 0.4117647, 1, 1,
0.2449415, -0.3288016, 2.334368, 0, 0.4078431, 1, 1,
0.2450053, -0.002633026, 1.156639, 0, 0.4, 1, 1,
0.2495389, 2.00549, 0.0985167, 0, 0.3921569, 1, 1,
0.2528401, 0.3625414, 0.2550139, 0, 0.3882353, 1, 1,
0.2561708, 0.6000605, 0.3141631, 0, 0.3803922, 1, 1,
0.2586553, 0.08217525, 1.384148, 0, 0.3764706, 1, 1,
0.2592315, 1.284267, 1.232331, 0, 0.3686275, 1, 1,
0.2623613, 0.1719159, -0.4862331, 0, 0.3647059, 1, 1,
0.2752548, -0.7162745, 2.966011, 0, 0.3568628, 1, 1,
0.2778931, -0.318473, 2.071502, 0, 0.3529412, 1, 1,
0.2782521, 1.464437, -1.649309, 0, 0.345098, 1, 1,
0.281772, -0.01695386, 1.853331, 0, 0.3411765, 1, 1,
0.283507, -1.066061, 2.71404, 0, 0.3333333, 1, 1,
0.2836489, -0.1902922, 1.231538, 0, 0.3294118, 1, 1,
0.2888543, 0.25131, 2.172051, 0, 0.3215686, 1, 1,
0.291518, 0.9295411, 0.4510256, 0, 0.3176471, 1, 1,
0.2916047, 0.08843755, 1.643438, 0, 0.3098039, 1, 1,
0.2924151, -0.1302617, 3.121179, 0, 0.3058824, 1, 1,
0.304725, 1.029904, 1.733251, 0, 0.2980392, 1, 1,
0.3047707, -0.7141038, 2.531324, 0, 0.2901961, 1, 1,
0.3068298, 0.140549, 0.8501647, 0, 0.2862745, 1, 1,
0.3075265, 0.8724435, -0.09843338, 0, 0.2784314, 1, 1,
0.3097652, -0.266234, 1.980416, 0, 0.2745098, 1, 1,
0.310328, 0.1352158, 2.154804, 0, 0.2666667, 1, 1,
0.3122227, -0.2168518, 4.803559, 0, 0.2627451, 1, 1,
0.3125939, 0.1680521, 1.993661, 0, 0.254902, 1, 1,
0.3127963, 1.357923, -1.125336, 0, 0.2509804, 1, 1,
0.3155511, -0.9039551, 2.250087, 0, 0.2431373, 1, 1,
0.317811, -0.7151199, 2.678334, 0, 0.2392157, 1, 1,
0.3197183, 0.2157765, 0.3847647, 0, 0.2313726, 1, 1,
0.325582, 1.666519, 1.003922, 0, 0.227451, 1, 1,
0.3487836, 1.18071, 0.9259231, 0, 0.2196078, 1, 1,
0.3488039, -1.990492, 4.19169, 0, 0.2156863, 1, 1,
0.3495186, 0.2750177, 1.251526, 0, 0.2078431, 1, 1,
0.3525996, -0.9756842, 0.4330864, 0, 0.2039216, 1, 1,
0.3541411, 0.06968882, 1.218926, 0, 0.1960784, 1, 1,
0.3551024, -0.3994274, 3.650575, 0, 0.1882353, 1, 1,
0.3635147, -1.68016, 4.510861, 0, 0.1843137, 1, 1,
0.3686807, -0.5553865, 0.9309499, 0, 0.1764706, 1, 1,
0.370185, -0.4845384, 1.377417, 0, 0.172549, 1, 1,
0.3725766, 0.5547915, 0.5481159, 0, 0.1647059, 1, 1,
0.3729636, -0.4688005, 1.753821, 0, 0.1607843, 1, 1,
0.3732146, -0.3406537, 2.793446, 0, 0.1529412, 1, 1,
0.3766866, 0.3663917, 2.261117, 0, 0.1490196, 1, 1,
0.3782754, 0.8351625, -1.518792, 0, 0.1411765, 1, 1,
0.3865207, 0.06059402, 0.8978486, 0, 0.1372549, 1, 1,
0.3945678, 1.557092, 0.5446481, 0, 0.1294118, 1, 1,
0.3952984, -1.448155, 4.075074, 0, 0.1254902, 1, 1,
0.3966485, -1.848226, 3.515846, 0, 0.1176471, 1, 1,
0.3976254, -1.348728, 3.208936, 0, 0.1137255, 1, 1,
0.4008936, 0.3312842, 1.128679, 0, 0.1058824, 1, 1,
0.4084923, 0.5658215, 0.6688055, 0, 0.09803922, 1, 1,
0.4091393, -0.8358096, 2.079685, 0, 0.09411765, 1, 1,
0.4111072, 1.376318, -0.4632366, 0, 0.08627451, 1, 1,
0.4154775, -0.1773836, 0.9188861, 0, 0.08235294, 1, 1,
0.4172733, -0.7325789, 4.055401, 0, 0.07450981, 1, 1,
0.4185506, -0.007727681, 0.6984048, 0, 0.07058824, 1, 1,
0.4186691, 0.3202496, 2.093042, 0, 0.0627451, 1, 1,
0.4206247, 1.715604, 0.3785335, 0, 0.05882353, 1, 1,
0.4236017, -0.05127361, 0.6024594, 0, 0.05098039, 1, 1,
0.4268784, 1.29328, 0.4702268, 0, 0.04705882, 1, 1,
0.4277574, 2.028157, 1.588645, 0, 0.03921569, 1, 1,
0.4292022, 0.09377379, 0.9299591, 0, 0.03529412, 1, 1,
0.431182, 1.655908, 0.7794987, 0, 0.02745098, 1, 1,
0.4397742, 0.1586765, 0.2223041, 0, 0.02352941, 1, 1,
0.4430283, 0.02109051, 0.04437842, 0, 0.01568628, 1, 1,
0.4437463, 0.8689375, 1.802339, 0, 0.01176471, 1, 1,
0.4455079, 0.02242512, -0.1486516, 0, 0.003921569, 1, 1,
0.4512784, -0.1279715, 2.693817, 0.003921569, 0, 1, 1,
0.4562048, 2.245223, 0.007759217, 0.007843138, 0, 1, 1,
0.4570507, 0.5131968, 2.781113, 0.01568628, 0, 1, 1,
0.4635668, -0.7246231, 2.175008, 0.01960784, 0, 1, 1,
0.4681836, 1.687243, -0.06401543, 0.02745098, 0, 1, 1,
0.4687043, 0.2470991, 2.18481, 0.03137255, 0, 1, 1,
0.4721442, 0.5553543, -0.5567443, 0.03921569, 0, 1, 1,
0.4735717, -0.9875451, 1.785462, 0.04313726, 0, 1, 1,
0.4755128, 0.7896727, 1.715169, 0.05098039, 0, 1, 1,
0.4762464, -0.5215994, 3.093846, 0.05490196, 0, 1, 1,
0.478239, 0.3504692, 3.072271, 0.0627451, 0, 1, 1,
0.4809528, 0.768554, 0.1257487, 0.06666667, 0, 1, 1,
0.4817808, -0.04674923, 1.18675, 0.07450981, 0, 1, 1,
0.4821142, 1.391743, -0.1872243, 0.07843138, 0, 1, 1,
0.4869601, -0.7180585, 2.428505, 0.08627451, 0, 1, 1,
0.4872327, -0.7471439, 2.374437, 0.09019608, 0, 1, 1,
0.4877939, -0.9085723, 1.416003, 0.09803922, 0, 1, 1,
0.4920247, -0.6931148, 3.037547, 0.1058824, 0, 1, 1,
0.4926499, 0.6745054, 1.817652, 0.1098039, 0, 1, 1,
0.4955392, 0.008736305, 1.170547, 0.1176471, 0, 1, 1,
0.4961742, 1.225275, 1.115432, 0.1215686, 0, 1, 1,
0.4973422, -0.4540939, 1.982055, 0.1294118, 0, 1, 1,
0.4993689, 2.598321, 1.975959, 0.1333333, 0, 1, 1,
0.5019479, 0.9721471, 1.299602, 0.1411765, 0, 1, 1,
0.5038015, -0.2902615, 2.406874, 0.145098, 0, 1, 1,
0.5052603, 0.4804838, 0.3942598, 0.1529412, 0, 1, 1,
0.5063441, -1.192031, 3.027317, 0.1568628, 0, 1, 1,
0.5133474, -0.6767276, 2.021332, 0.1647059, 0, 1, 1,
0.515183, 0.9832623, 0.5523823, 0.1686275, 0, 1, 1,
0.5155988, -0.8927796, 2.528681, 0.1764706, 0, 1, 1,
0.5172453, -1.838551, 3.071611, 0.1803922, 0, 1, 1,
0.5178474, -0.3629369, 2.984241, 0.1882353, 0, 1, 1,
0.5186604, -1.048247, 3.760907, 0.1921569, 0, 1, 1,
0.527303, 1.930141, -0.3249085, 0.2, 0, 1, 1,
0.527808, -0.8420067, 0.8276849, 0.2078431, 0, 1, 1,
0.528083, 1.347548, -0.05425471, 0.2117647, 0, 1, 1,
0.5288306, 0.1771894, 1.687128, 0.2196078, 0, 1, 1,
0.5312598, 0.7962469, 1.68574, 0.2235294, 0, 1, 1,
0.5400778, 0.1448177, 0.8504035, 0.2313726, 0, 1, 1,
0.5402344, -1.832907, 2.130484, 0.2352941, 0, 1, 1,
0.5405428, -0.1483323, -0.2129111, 0.2431373, 0, 1, 1,
0.5407447, 0.9195541, 2.558778, 0.2470588, 0, 1, 1,
0.544278, -0.8515239, 2.063006, 0.254902, 0, 1, 1,
0.5447276, -0.4873728, 2.780632, 0.2588235, 0, 1, 1,
0.5471482, -0.6453019, 0.4315113, 0.2666667, 0, 1, 1,
0.5473682, -0.7424654, 1.475319, 0.2705882, 0, 1, 1,
0.5523415, -1.018284, 0.5879819, 0.2784314, 0, 1, 1,
0.5542402, 1.132951, 0.7590909, 0.282353, 0, 1, 1,
0.5555478, -0.565709, 2.643547, 0.2901961, 0, 1, 1,
0.5559042, -0.5931356, 1.506837, 0.2941177, 0, 1, 1,
0.5566367, 1.725204, -0.5635698, 0.3019608, 0, 1, 1,
0.5601822, 0.8860284, 1.050562, 0.3098039, 0, 1, 1,
0.5655378, -0.2249511, 2.745056, 0.3137255, 0, 1, 1,
0.5724474, 0.1075036, 0.9657795, 0.3215686, 0, 1, 1,
0.5735232, -0.3657943, 2.75557, 0.3254902, 0, 1, 1,
0.5736298, -0.04761097, 2.038354, 0.3333333, 0, 1, 1,
0.5771558, -0.2884476, 2.031288, 0.3372549, 0, 1, 1,
0.5822846, -0.2646092, -0.005485102, 0.345098, 0, 1, 1,
0.583183, -0.5412578, 2.355903, 0.3490196, 0, 1, 1,
0.5842315, -0.5021175, 3.202648, 0.3568628, 0, 1, 1,
0.5857258, 1.620014, -0.9756523, 0.3607843, 0, 1, 1,
0.588309, -0.4481192, 3.147304, 0.3686275, 0, 1, 1,
0.589009, 0.8714126, 1.136713, 0.372549, 0, 1, 1,
0.5907145, -0.9733923, 1.602359, 0.3803922, 0, 1, 1,
0.5911911, 0.9283024, 0.8613687, 0.3843137, 0, 1, 1,
0.5914004, -0.2470797, 2.247339, 0.3921569, 0, 1, 1,
0.5984058, -0.4660616, 1.445213, 0.3960784, 0, 1, 1,
0.5991981, -1.024608, 2.134061, 0.4039216, 0, 1, 1,
0.6015993, -1.244702, 2.471371, 0.4117647, 0, 1, 1,
0.6027639, -0.134791, 2.799015, 0.4156863, 0, 1, 1,
0.6039977, -0.5877537, 3.564103, 0.4235294, 0, 1, 1,
0.6047524, -0.2682057, 1.831799, 0.427451, 0, 1, 1,
0.6059032, 0.6795259, 0.5918463, 0.4352941, 0, 1, 1,
0.6227919, 1.74993, 0.3602228, 0.4392157, 0, 1, 1,
0.626322, -0.8108506, 3.416914, 0.4470588, 0, 1, 1,
0.6286497, 2.084773, -0.6757872, 0.4509804, 0, 1, 1,
0.6295317, 0.7800761, -1.557307, 0.4588235, 0, 1, 1,
0.6337396, 1.540112, 1.026426, 0.4627451, 0, 1, 1,
0.6401902, -0.9822001, 3.520684, 0.4705882, 0, 1, 1,
0.6417156, -0.3757013, 2.452424, 0.4745098, 0, 1, 1,
0.6418826, -1.040313, 2.157211, 0.4823529, 0, 1, 1,
0.6420127, -0.160749, 2.343516, 0.4862745, 0, 1, 1,
0.644919, 2.052831, -0.1835493, 0.4941176, 0, 1, 1,
0.6517768, -0.4542833, 2.345095, 0.5019608, 0, 1, 1,
0.652664, 0.1785788, 1.850144, 0.5058824, 0, 1, 1,
0.6540027, -0.7507196, 2.703044, 0.5137255, 0, 1, 1,
0.6547878, -0.0642246, 1.511021, 0.5176471, 0, 1, 1,
0.6557077, -1.984491, 1.473048, 0.5254902, 0, 1, 1,
0.6586298, -0.375677, 1.795426, 0.5294118, 0, 1, 1,
0.6598591, 1.609496, 1.50546, 0.5372549, 0, 1, 1,
0.6629862, -0.3045031, 1.689894, 0.5411765, 0, 1, 1,
0.6654732, -0.7955887, 2.704469, 0.5490196, 0, 1, 1,
0.6664926, 0.8648826, -0.008976877, 0.5529412, 0, 1, 1,
0.6694791, -0.002745675, 1.715231, 0.5607843, 0, 1, 1,
0.6758385, -0.1901266, 1.749784, 0.5647059, 0, 1, 1,
0.6758765, 0.1871788, 0.1094306, 0.572549, 0, 1, 1,
0.6765674, -0.6154661, 2.937357, 0.5764706, 0, 1, 1,
0.6773775, -2.270422, 1.877924, 0.5843138, 0, 1, 1,
0.6796118, -1.264282, 2.22594, 0.5882353, 0, 1, 1,
0.6844671, 0.9854766, 0.3346826, 0.5960785, 0, 1, 1,
0.6884999, 0.4105686, 1.608993, 0.6039216, 0, 1, 1,
0.6890017, 1.475958, 2.836702, 0.6078432, 0, 1, 1,
0.6895126, -0.3123374, 2.336707, 0.6156863, 0, 1, 1,
0.6912614, 0.1495438, 1.949768, 0.6196079, 0, 1, 1,
0.6928531, -0.6157023, 2.489656, 0.627451, 0, 1, 1,
0.6955467, -0.6744248, 3.206797, 0.6313726, 0, 1, 1,
0.6955664, -0.3082716, 1.669145, 0.6392157, 0, 1, 1,
0.698158, -0.9945957, 1.648024, 0.6431373, 0, 1, 1,
0.7018036, -0.9171396, 2.173115, 0.6509804, 0, 1, 1,
0.7056736, 1.298542, 0.162292, 0.654902, 0, 1, 1,
0.7102937, -0.2825204, 2.509809, 0.6627451, 0, 1, 1,
0.7140781, -0.7446259, 2.073826, 0.6666667, 0, 1, 1,
0.7189746, -1.807361, 3.485556, 0.6745098, 0, 1, 1,
0.7200441, 1.051452, 2.01783, 0.6784314, 0, 1, 1,
0.721653, 1.405557, 0.5219491, 0.6862745, 0, 1, 1,
0.7277163, -0.1454597, 2.270584, 0.6901961, 0, 1, 1,
0.7312539, -2.546124, 1.485777, 0.6980392, 0, 1, 1,
0.7378275, -1.556966, 3.304163, 0.7058824, 0, 1, 1,
0.738943, 1.902075, 1.880831, 0.7098039, 0, 1, 1,
0.7433966, 1.620146, -1.259717, 0.7176471, 0, 1, 1,
0.7442237, 0.1168179, -0.4680318, 0.7215686, 0, 1, 1,
0.7451342, -0.02352453, 2.153737, 0.7294118, 0, 1, 1,
0.7463655, 1.300888, 1.546151, 0.7333333, 0, 1, 1,
0.750441, -0.2534253, 0.7186892, 0.7411765, 0, 1, 1,
0.7584007, 0.4298107, 0.906735, 0.7450981, 0, 1, 1,
0.7624363, 1.036338, 1.135723, 0.7529412, 0, 1, 1,
0.7763301, -0.5043097, 1.686531, 0.7568628, 0, 1, 1,
0.7789547, 0.9258407, -0.7669156, 0.7647059, 0, 1, 1,
0.780747, -1.124138, 2.718685, 0.7686275, 0, 1, 1,
0.7871053, -0.728177, 1.818021, 0.7764706, 0, 1, 1,
0.7926955, -0.459906, 2.589851, 0.7803922, 0, 1, 1,
0.7936098, 0.3229103, 1.569984, 0.7882353, 0, 1, 1,
0.7953885, 1.622434, -0.05810123, 0.7921569, 0, 1, 1,
0.796454, 0.1462436, 1.45737, 0.8, 0, 1, 1,
0.7977729, -0.9870389, 0.6683033, 0.8078431, 0, 1, 1,
0.8004264, 0.3901863, -0.6606965, 0.8117647, 0, 1, 1,
0.803741, -0.03030611, 1.317945, 0.8196079, 0, 1, 1,
0.8043505, -0.04193715, 1.049687, 0.8235294, 0, 1, 1,
0.8067995, 1.124831, 1.144294, 0.8313726, 0, 1, 1,
0.8083619, 0.4448524, 0.3916006, 0.8352941, 0, 1, 1,
0.8131925, -1.052163, 2.23206, 0.8431373, 0, 1, 1,
0.8205235, 0.539734, 1.41536, 0.8470588, 0, 1, 1,
0.8232347, -0.1348554, 2.899425, 0.854902, 0, 1, 1,
0.8239788, -0.3163096, 2.910798, 0.8588235, 0, 1, 1,
0.8260737, 0.2976861, 2.637399, 0.8666667, 0, 1, 1,
0.8272458, 0.9395422, 2.800871, 0.8705882, 0, 1, 1,
0.8275544, 1.528525, -1.184836, 0.8784314, 0, 1, 1,
0.8297461, -0.3398148, 0.8481529, 0.8823529, 0, 1, 1,
0.8304239, 0.1693002, 1.224639, 0.8901961, 0, 1, 1,
0.830535, 0.6923194, 2.252937, 0.8941177, 0, 1, 1,
0.8342373, 1.159002, -0.3095834, 0.9019608, 0, 1, 1,
0.8365057, 0.2966136, 0.9713843, 0.9098039, 0, 1, 1,
0.8380915, -0.4413695, 3.492758, 0.9137255, 0, 1, 1,
0.8444393, -0.8132665, 1.794868, 0.9215686, 0, 1, 1,
0.8464189, 0.1808155, 1.594042, 0.9254902, 0, 1, 1,
0.8490314, -0.3449458, 2.848313, 0.9333333, 0, 1, 1,
0.8509318, 1.378499, -0.08664563, 0.9372549, 0, 1, 1,
0.8538979, -1.098066, 2.22708, 0.945098, 0, 1, 1,
0.8580753, 2.062781, 1.591429, 0.9490196, 0, 1, 1,
0.8592002, -0.7897411, 3.203342, 0.9568627, 0, 1, 1,
0.8628855, 1.098377, 2.061487, 0.9607843, 0, 1, 1,
0.8629974, -2.911426, 2.769058, 0.9686275, 0, 1, 1,
0.8630215, -0.5958473, 4.376887, 0.972549, 0, 1, 1,
0.8670161, 0.4350789, 0.9276323, 0.9803922, 0, 1, 1,
0.8674637, 0.1107791, 2.540544, 0.9843137, 0, 1, 1,
0.8676873, -1.022169, 0.1790925, 0.9921569, 0, 1, 1,
0.8694819, -0.1780815, -0.0007167732, 0.9960784, 0, 1, 1,
0.8735089, -1.403794, 4.809824, 1, 0, 0.9960784, 1,
0.8817711, 0.7458121, -0.3244615, 1, 0, 0.9882353, 1,
0.8953428, 0.2703654, 2.613093, 1, 0, 0.9843137, 1,
0.8973571, 0.4567373, 1.832365, 1, 0, 0.9764706, 1,
0.900576, -0.3125882, 2.17745, 1, 0, 0.972549, 1,
0.9045772, 1.804152, -1.016598, 1, 0, 0.9647059, 1,
0.9054956, 0.3343023, 2.249107, 1, 0, 0.9607843, 1,
0.9058363, 0.9074643, 2.511127, 1, 0, 0.9529412, 1,
0.9078516, 0.2034306, 1.184572, 1, 0, 0.9490196, 1,
0.9121253, -1.081475, 3.471759, 1, 0, 0.9411765, 1,
0.9131198, 0.6143208, 1.49546, 1, 0, 0.9372549, 1,
0.9276537, 0.9331173, 1.545514, 1, 0, 0.9294118, 1,
0.9277717, -0.1549599, 2.171136, 1, 0, 0.9254902, 1,
0.9280271, -0.8399584, 4.361005, 1, 0, 0.9176471, 1,
0.9317605, 0.4609217, 1.447435, 1, 0, 0.9137255, 1,
0.9343877, 1.432412, 0.02817805, 1, 0, 0.9058824, 1,
0.9401204, 0.4286015, 2.331408, 1, 0, 0.9019608, 1,
0.9672525, -0.6744596, 2.602346, 1, 0, 0.8941177, 1,
0.9739993, -1.113156, 2.770705, 1, 0, 0.8862745, 1,
0.9799348, 0.8080735, 1.103443, 1, 0, 0.8823529, 1,
0.9887181, 2.532798, 1.223621, 1, 0, 0.8745098, 1,
0.9912296, -0.6259575, 3.512074, 1, 0, 0.8705882, 1,
0.994589, 1.011333, 1.479121, 1, 0, 0.8627451, 1,
1.00175, 0.8777015, 0.3166103, 1, 0, 0.8588235, 1,
1.020526, 0.9939473, 1.281739, 1, 0, 0.8509804, 1,
1.021566, 1.185187, -0.1730286, 1, 0, 0.8470588, 1,
1.027702, -0.3945335, 0.1165904, 1, 0, 0.8392157, 1,
1.039806, -0.01184499, 0.7052794, 1, 0, 0.8352941, 1,
1.044032, 0.2181593, 0.7594556, 1, 0, 0.827451, 1,
1.068372, -0.1255182, 2.605507, 1, 0, 0.8235294, 1,
1.078311, 0.8030553, 0.1544714, 1, 0, 0.8156863, 1,
1.09638, 0.9694276, 1.044166, 1, 0, 0.8117647, 1,
1.101832, 0.02008406, 0.2254559, 1, 0, 0.8039216, 1,
1.103985, 1.097456, -1.01398, 1, 0, 0.7960784, 1,
1.107014, -0.6435893, 2.178057, 1, 0, 0.7921569, 1,
1.112852, 1.809441, 0.5194257, 1, 0, 0.7843137, 1,
1.129565, -0.7346557, 1.194622, 1, 0, 0.7803922, 1,
1.132528, -0.4959344, 1.773258, 1, 0, 0.772549, 1,
1.142533, 0.6234367, 1.221202, 1, 0, 0.7686275, 1,
1.142596, -1.546555, 4.150899, 1, 0, 0.7607843, 1,
1.147652, 2.274754, 2.225238, 1, 0, 0.7568628, 1,
1.153549, 1.134918, 0.6567396, 1, 0, 0.7490196, 1,
1.15419, 1.011511, -0.8320807, 1, 0, 0.7450981, 1,
1.160624, -1.182513, 2.455362, 1, 0, 0.7372549, 1,
1.163371, -0.6750637, 3.330778, 1, 0, 0.7333333, 1,
1.163792, -0.3353881, 2.223583, 1, 0, 0.7254902, 1,
1.164527, 0.308302, 0.06728188, 1, 0, 0.7215686, 1,
1.189041, 0.6816351, 2.408078, 1, 0, 0.7137255, 1,
1.189222, 0.6790428, 0.2764292, 1, 0, 0.7098039, 1,
1.189942, 0.9494388, 2.243315, 1, 0, 0.7019608, 1,
1.198649, 0.7152904, 0.01379451, 1, 0, 0.6941177, 1,
1.202541, 0.03472, 2.161118, 1, 0, 0.6901961, 1,
1.212178, 1.297891, 0.07836179, 1, 0, 0.682353, 1,
1.21347, -0.7464369, 4.344806, 1, 0, 0.6784314, 1,
1.223983, -0.9067545, 2.700655, 1, 0, 0.6705883, 1,
1.225212, 1.304948, 0.5386353, 1, 0, 0.6666667, 1,
1.225762, 0.1232103, 0.4855205, 1, 0, 0.6588235, 1,
1.241237, 1.380854, 1.200843, 1, 0, 0.654902, 1,
1.256116, -0.35557, 1.908456, 1, 0, 0.6470588, 1,
1.257137, 1.156353, 2.232602, 1, 0, 0.6431373, 1,
1.259266, -0.8457641, 3.19735, 1, 0, 0.6352941, 1,
1.265063, 1.113281, -0.04735966, 1, 0, 0.6313726, 1,
1.273362, -0.002546881, 0.1636131, 1, 0, 0.6235294, 1,
1.282635, 0.2538914, 0.7834036, 1, 0, 0.6196079, 1,
1.285362, -1.135711, 2.853483, 1, 0, 0.6117647, 1,
1.288772, 0.1200173, 0.7458907, 1, 0, 0.6078432, 1,
1.289503, 0.7998654, 2.094531, 1, 0, 0.6, 1,
1.298456, 0.7845874, -0.5700441, 1, 0, 0.5921569, 1,
1.312405, -0.4451958, 0.6833346, 1, 0, 0.5882353, 1,
1.316519, 0.1646023, 1.6866, 1, 0, 0.5803922, 1,
1.31757, 0.1916133, 0.3408213, 1, 0, 0.5764706, 1,
1.319852, -0.2513955, -1.140524, 1, 0, 0.5686275, 1,
1.321597, 0.3820197, 0.3345207, 1, 0, 0.5647059, 1,
1.332948, -0.6424842, 3.735327, 1, 0, 0.5568628, 1,
1.344204, -1.214348, 1.712127, 1, 0, 0.5529412, 1,
1.363826, -0.3109536, 1.230318, 1, 0, 0.5450981, 1,
1.37019, 0.3049987, 0.7548872, 1, 0, 0.5411765, 1,
1.370365, 0.7038092, 1.065122, 1, 0, 0.5333334, 1,
1.375522, 1.632526, 1.460406, 1, 0, 0.5294118, 1,
1.378256, -0.2255784, 1.664657, 1, 0, 0.5215687, 1,
1.390096, 1.735042, -0.7003708, 1, 0, 0.5176471, 1,
1.391914, -0.5865923, 0.8634192, 1, 0, 0.509804, 1,
1.395242, 1.051681, 0.442498, 1, 0, 0.5058824, 1,
1.398057, -1.076994, 1.335142, 1, 0, 0.4980392, 1,
1.40042, 0.4551172, 1.183817, 1, 0, 0.4901961, 1,
1.407769, 0.01068602, 1.555981, 1, 0, 0.4862745, 1,
1.42538, 0.1677131, 2.000674, 1, 0, 0.4784314, 1,
1.430525, 1.099278, 0.472098, 1, 0, 0.4745098, 1,
1.444449, -2.465888, 3.001051, 1, 0, 0.4666667, 1,
1.446778, 0.3884038, 2.626275, 1, 0, 0.4627451, 1,
1.448914, 0.2344628, 2.187374, 1, 0, 0.454902, 1,
1.449661, -0.6695099, 2.959017, 1, 0, 0.4509804, 1,
1.464387, -0.2205, 0.5472119, 1, 0, 0.4431373, 1,
1.481189, 0.2675266, 2.108252, 1, 0, 0.4392157, 1,
1.483843, 0.6907572, 1.218764, 1, 0, 0.4313726, 1,
1.502723, -0.2284951, 2.83408, 1, 0, 0.427451, 1,
1.503814, -0.8899871, 2.41154, 1, 0, 0.4196078, 1,
1.508006, 0.2161908, 0.492516, 1, 0, 0.4156863, 1,
1.510659, -0.2084188, 1.772095, 1, 0, 0.4078431, 1,
1.517139, -0.3035043, 1.856777, 1, 0, 0.4039216, 1,
1.518443, 0.1490942, 2.613861, 1, 0, 0.3960784, 1,
1.522834, -0.9109035, 1.209871, 1, 0, 0.3882353, 1,
1.535286, -1.87987, 2.313711, 1, 0, 0.3843137, 1,
1.562082, -0.342179, 0.3838726, 1, 0, 0.3764706, 1,
1.581245, 0.06248215, 1.098487, 1, 0, 0.372549, 1,
1.589505, -0.6595908, 2.980766, 1, 0, 0.3647059, 1,
1.617656, -1.077844, 2.207473, 1, 0, 0.3607843, 1,
1.621972, 0.3016795, 0.9277939, 1, 0, 0.3529412, 1,
1.622467, 0.09212588, 2.620862, 1, 0, 0.3490196, 1,
1.631314, -1.086794, 3.429377, 1, 0, 0.3411765, 1,
1.633053, 0.1925939, 1.115745, 1, 0, 0.3372549, 1,
1.64977, -0.2224718, 2.090314, 1, 0, 0.3294118, 1,
1.658223, -1.160051, -0.01511989, 1, 0, 0.3254902, 1,
1.66383, -0.2962229, 4.081367, 1, 0, 0.3176471, 1,
1.67115, -0.1037702, 2.507625, 1, 0, 0.3137255, 1,
1.674688, 1.397651, -0.9069698, 1, 0, 0.3058824, 1,
1.706819, 0.9247266, -0.5688882, 1, 0, 0.2980392, 1,
1.715886, 2.088424, 1.937959, 1, 0, 0.2941177, 1,
1.736128, -0.3535886, -0.5073023, 1, 0, 0.2862745, 1,
1.738807, 0.9399171, 0.6134136, 1, 0, 0.282353, 1,
1.741757, 0.2994155, -0.1671408, 1, 0, 0.2745098, 1,
1.747519, 1.763724, 0.2841097, 1, 0, 0.2705882, 1,
1.7895, -0.1726406, 0.505742, 1, 0, 0.2627451, 1,
1.790119, 0.7722611, 0.9222908, 1, 0, 0.2588235, 1,
1.800042, -1.229824, 0.7579774, 1, 0, 0.2509804, 1,
1.800337, -3.436919, 1.760485, 1, 0, 0.2470588, 1,
1.85876, 1.254397, 1.821333, 1, 0, 0.2392157, 1,
1.869338, 0.0337619, 1.200055, 1, 0, 0.2352941, 1,
1.8757, 0.1600801, 2.574716, 1, 0, 0.227451, 1,
1.880424, -0.09968035, 2.44082, 1, 0, 0.2235294, 1,
1.909738, -0.003124493, 1.755453, 1, 0, 0.2156863, 1,
1.934099, -0.7357104, 2.33083, 1, 0, 0.2117647, 1,
1.943467, 0.3764366, 2.058025, 1, 0, 0.2039216, 1,
1.945869, 0.7846473, 1.196773, 1, 0, 0.1960784, 1,
1.946454, 0.3392197, -1.316322, 1, 0, 0.1921569, 1,
1.968736, 0.9900033, 2.361625, 1, 0, 0.1843137, 1,
1.971816, 0.6559982, 2.819642, 1, 0, 0.1803922, 1,
1.986312, 0.5828293, 1.920362, 1, 0, 0.172549, 1,
1.986842, -0.9647848, 3.521499, 1, 0, 0.1686275, 1,
2.000245, 1.149486, 1.470272, 1, 0, 0.1607843, 1,
2.002276, 0.8122603, 0.8929546, 1, 0, 0.1568628, 1,
2.010432, 0.3916413, 2.124873, 1, 0, 0.1490196, 1,
2.035727, 0.05921391, 0.699499, 1, 0, 0.145098, 1,
2.056469, -0.6465542, 2.111817, 1, 0, 0.1372549, 1,
2.074142, -1.051072, 3.89023, 1, 0, 0.1333333, 1,
2.147834, 2.033961, 1.048025, 1, 0, 0.1254902, 1,
2.172267, -0.02511728, 1.550015, 1, 0, 0.1215686, 1,
2.179626, 1.868484, 0.7302418, 1, 0, 0.1137255, 1,
2.185639, -0.1602301, 2.746098, 1, 0, 0.1098039, 1,
2.194264, -1.17825, 4.172403, 1, 0, 0.1019608, 1,
2.19454, 0.4741124, 0.2347708, 1, 0, 0.09411765, 1,
2.264875, 0.1983222, 1.738314, 1, 0, 0.09019608, 1,
2.300531, 0.5282743, 0.7758923, 1, 0, 0.08235294, 1,
2.308613, 0.1730935, 1.800317, 1, 0, 0.07843138, 1,
2.360007, 0.398812, 2.430419, 1, 0, 0.07058824, 1,
2.489311, 0.7437869, 0.6017974, 1, 0, 0.06666667, 1,
2.516558, 0.754975, 1.234157, 1, 0, 0.05882353, 1,
2.528607, -1.024132, 3.574218, 1, 0, 0.05490196, 1,
2.601043, 1.545312, 2.035116, 1, 0, 0.04705882, 1,
2.673897, -0.3837143, 0.3967195, 1, 0, 0.04313726, 1,
2.707198, -0.7067454, -0.1379362, 1, 0, 0.03529412, 1,
2.741225, -1.541685, 3.139295, 1, 0, 0.03137255, 1,
2.785071, -0.5277034, 2.797454, 1, 0, 0.02352941, 1,
2.845299, -1.409291, 2.144138, 1, 0, 0.01960784, 1,
3.041381, 0.8782399, 1.88403, 1, 0, 0.01176471, 1,
3.060006, -0.1043522, 2.923982, 1, 0, 0.007843138, 1
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
-0.06580222, -4.532103, -7.552767, 0, -0.5, 0.5, 0.5,
-0.06580222, -4.532103, -7.552767, 1, -0.5, 0.5, 0.5,
-0.06580222, -4.532103, -7.552767, 1, 1.5, 0.5, 0.5,
-0.06580222, -4.532103, -7.552767, 0, 1.5, 0.5, 0.5
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
-4.251259, -0.2062891, -7.552767, 0, -0.5, 0.5, 0.5,
-4.251259, -0.2062891, -7.552767, 1, -0.5, 0.5, 0.5,
-4.251259, -0.2062891, -7.552767, 1, 1.5, 0.5, 0.5,
-4.251259, -0.2062891, -7.552767, 0, 1.5, 0.5, 0.5
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
-4.251259, -4.532103, -0.1529267, 0, -0.5, 0.5, 0.5,
-4.251259, -4.532103, -0.1529267, 1, -0.5, 0.5, 0.5,
-4.251259, -4.532103, -0.1529267, 1, 1.5, 0.5, 0.5,
-4.251259, -4.532103, -0.1529267, 0, 1.5, 0.5, 0.5
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
-3, -3.533838, -5.845112,
3, -3.533838, -5.845112,
-3, -3.533838, -5.845112,
-3, -3.700216, -6.129721,
-2, -3.533838, -5.845112,
-2, -3.700216, -6.129721,
-1, -3.533838, -5.845112,
-1, -3.700216, -6.129721,
0, -3.533838, -5.845112,
0, -3.700216, -6.129721,
1, -3.533838, -5.845112,
1, -3.700216, -6.129721,
2, -3.533838, -5.845112,
2, -3.700216, -6.129721,
3, -3.533838, -5.845112,
3, -3.700216, -6.129721
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
-3, -4.032971, -6.698939, 0, -0.5, 0.5, 0.5,
-3, -4.032971, -6.698939, 1, -0.5, 0.5, 0.5,
-3, -4.032971, -6.698939, 1, 1.5, 0.5, 0.5,
-3, -4.032971, -6.698939, 0, 1.5, 0.5, 0.5,
-2, -4.032971, -6.698939, 0, -0.5, 0.5, 0.5,
-2, -4.032971, -6.698939, 1, -0.5, 0.5, 0.5,
-2, -4.032971, -6.698939, 1, 1.5, 0.5, 0.5,
-2, -4.032971, -6.698939, 0, 1.5, 0.5, 0.5,
-1, -4.032971, -6.698939, 0, -0.5, 0.5, 0.5,
-1, -4.032971, -6.698939, 1, -0.5, 0.5, 0.5,
-1, -4.032971, -6.698939, 1, 1.5, 0.5, 0.5,
-1, -4.032971, -6.698939, 0, 1.5, 0.5, 0.5,
0, -4.032971, -6.698939, 0, -0.5, 0.5, 0.5,
0, -4.032971, -6.698939, 1, -0.5, 0.5, 0.5,
0, -4.032971, -6.698939, 1, 1.5, 0.5, 0.5,
0, -4.032971, -6.698939, 0, 1.5, 0.5, 0.5,
1, -4.032971, -6.698939, 0, -0.5, 0.5, 0.5,
1, -4.032971, -6.698939, 1, -0.5, 0.5, 0.5,
1, -4.032971, -6.698939, 1, 1.5, 0.5, 0.5,
1, -4.032971, -6.698939, 0, 1.5, 0.5, 0.5,
2, -4.032971, -6.698939, 0, -0.5, 0.5, 0.5,
2, -4.032971, -6.698939, 1, -0.5, 0.5, 0.5,
2, -4.032971, -6.698939, 1, 1.5, 0.5, 0.5,
2, -4.032971, -6.698939, 0, 1.5, 0.5, 0.5,
3, -4.032971, -6.698939, 0, -0.5, 0.5, 0.5,
3, -4.032971, -6.698939, 1, -0.5, 0.5, 0.5,
3, -4.032971, -6.698939, 1, 1.5, 0.5, 0.5,
3, -4.032971, -6.698939, 0, 1.5, 0.5, 0.5
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
-3.285385, -3, -5.845112,
-3.285385, 3, -5.845112,
-3.285385, -3, -5.845112,
-3.446364, -3, -6.129721,
-3.285385, -2, -5.845112,
-3.446364, -2, -6.129721,
-3.285385, -1, -5.845112,
-3.446364, -1, -6.129721,
-3.285385, 0, -5.845112,
-3.446364, 0, -6.129721,
-3.285385, 1, -5.845112,
-3.446364, 1, -6.129721,
-3.285385, 2, -5.845112,
-3.446364, 2, -6.129721,
-3.285385, 3, -5.845112,
-3.446364, 3, -6.129721
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
-3.768322, -3, -6.698939, 0, -0.5, 0.5, 0.5,
-3.768322, -3, -6.698939, 1, -0.5, 0.5, 0.5,
-3.768322, -3, -6.698939, 1, 1.5, 0.5, 0.5,
-3.768322, -3, -6.698939, 0, 1.5, 0.5, 0.5,
-3.768322, -2, -6.698939, 0, -0.5, 0.5, 0.5,
-3.768322, -2, -6.698939, 1, -0.5, 0.5, 0.5,
-3.768322, -2, -6.698939, 1, 1.5, 0.5, 0.5,
-3.768322, -2, -6.698939, 0, 1.5, 0.5, 0.5,
-3.768322, -1, -6.698939, 0, -0.5, 0.5, 0.5,
-3.768322, -1, -6.698939, 1, -0.5, 0.5, 0.5,
-3.768322, -1, -6.698939, 1, 1.5, 0.5, 0.5,
-3.768322, -1, -6.698939, 0, 1.5, 0.5, 0.5,
-3.768322, 0, -6.698939, 0, -0.5, 0.5, 0.5,
-3.768322, 0, -6.698939, 1, -0.5, 0.5, 0.5,
-3.768322, 0, -6.698939, 1, 1.5, 0.5, 0.5,
-3.768322, 0, -6.698939, 0, 1.5, 0.5, 0.5,
-3.768322, 1, -6.698939, 0, -0.5, 0.5, 0.5,
-3.768322, 1, -6.698939, 1, -0.5, 0.5, 0.5,
-3.768322, 1, -6.698939, 1, 1.5, 0.5, 0.5,
-3.768322, 1, -6.698939, 0, 1.5, 0.5, 0.5,
-3.768322, 2, -6.698939, 0, -0.5, 0.5, 0.5,
-3.768322, 2, -6.698939, 1, -0.5, 0.5, 0.5,
-3.768322, 2, -6.698939, 1, 1.5, 0.5, 0.5,
-3.768322, 2, -6.698939, 0, 1.5, 0.5, 0.5,
-3.768322, 3, -6.698939, 0, -0.5, 0.5, 0.5,
-3.768322, 3, -6.698939, 1, -0.5, 0.5, 0.5,
-3.768322, 3, -6.698939, 1, 1.5, 0.5, 0.5,
-3.768322, 3, -6.698939, 0, 1.5, 0.5, 0.5
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
-3.285385, -3.533838, -4,
-3.285385, -3.533838, 4,
-3.285385, -3.533838, -4,
-3.446364, -3.700216, -4,
-3.285385, -3.533838, -2,
-3.446364, -3.700216, -2,
-3.285385, -3.533838, 0,
-3.446364, -3.700216, 0,
-3.285385, -3.533838, 2,
-3.446364, -3.700216, 2,
-3.285385, -3.533838, 4,
-3.446364, -3.700216, 4
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
-3.768322, -4.032971, -4, 0, -0.5, 0.5, 0.5,
-3.768322, -4.032971, -4, 1, -0.5, 0.5, 0.5,
-3.768322, -4.032971, -4, 1, 1.5, 0.5, 0.5,
-3.768322, -4.032971, -4, 0, 1.5, 0.5, 0.5,
-3.768322, -4.032971, -2, 0, -0.5, 0.5, 0.5,
-3.768322, -4.032971, -2, 1, -0.5, 0.5, 0.5,
-3.768322, -4.032971, -2, 1, 1.5, 0.5, 0.5,
-3.768322, -4.032971, -2, 0, 1.5, 0.5, 0.5,
-3.768322, -4.032971, 0, 0, -0.5, 0.5, 0.5,
-3.768322, -4.032971, 0, 1, -0.5, 0.5, 0.5,
-3.768322, -4.032971, 0, 1, 1.5, 0.5, 0.5,
-3.768322, -4.032971, 0, 0, 1.5, 0.5, 0.5,
-3.768322, -4.032971, 2, 0, -0.5, 0.5, 0.5,
-3.768322, -4.032971, 2, 1, -0.5, 0.5, 0.5,
-3.768322, -4.032971, 2, 1, 1.5, 0.5, 0.5,
-3.768322, -4.032971, 2, 0, 1.5, 0.5, 0.5,
-3.768322, -4.032971, 4, 0, -0.5, 0.5, 0.5,
-3.768322, -4.032971, 4, 1, -0.5, 0.5, 0.5,
-3.768322, -4.032971, 4, 1, 1.5, 0.5, 0.5,
-3.768322, -4.032971, 4, 0, 1.5, 0.5, 0.5
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
-3.285385, -3.533838, -5.845112,
-3.285385, 3.12126, -5.845112,
-3.285385, -3.533838, 5.539258,
-3.285385, 3.12126, 5.539258,
-3.285385, -3.533838, -5.845112,
-3.285385, -3.533838, 5.539258,
-3.285385, 3.12126, -5.845112,
-3.285385, 3.12126, 5.539258,
-3.285385, -3.533838, -5.845112,
3.15378, -3.533838, -5.845112,
-3.285385, -3.533838, 5.539258,
3.15378, -3.533838, 5.539258,
-3.285385, 3.12126, -5.845112,
3.15378, 3.12126, -5.845112,
-3.285385, 3.12126, 5.539258,
3.15378, 3.12126, 5.539258,
3.15378, -3.533838, -5.845112,
3.15378, 3.12126, -5.845112,
3.15378, -3.533838, 5.539258,
3.15378, 3.12126, 5.539258,
3.15378, -3.533838, -5.845112,
3.15378, -3.533838, 5.539258,
3.15378, 3.12126, -5.845112,
3.15378, 3.12126, 5.539258
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
var radius = 7.836191;
var distance = 34.8641;
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
mvMatrix.translate( 0.06580222, 0.2062891, 0.1529267 );
mvMatrix.scale( 1.315799, 1.273106, 0.7442347 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.8641);
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
transfluthrin<-read.table("transfluthrin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-transfluthrin$V2
```

```
## Error in eval(expr, envir, enclos): object 'transfluthrin' not found
```

```r
y<-transfluthrin$V3
```

```
## Error in eval(expr, envir, enclos): object 'transfluthrin' not found
```

```r
z<-transfluthrin$V4
```

```
## Error in eval(expr, envir, enclos): object 'transfluthrin' not found
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
-3.19161, 1.065706, -1.844537, 0, 0, 1, 1, 1,
-3.11323, 0.4729023, -1.038336, 1, 0, 0, 1, 1,
-3.045269, 2.539322, -0.8355792, 1, 0, 0, 1, 1,
-2.851494, -0.5208506, -1.395883, 1, 0, 0, 1, 1,
-2.788312, 2.495338, -1.497605, 1, 0, 0, 1, 1,
-2.676628, 0.08985698, -3.326115, 1, 0, 0, 1, 1,
-2.670085, 0.5233331, -1.846087, 0, 0, 0, 1, 1,
-2.59953, -0.2079105, -3.56109, 0, 0, 0, 1, 1,
-2.546946, -0.0646335, -0.5599058, 0, 0, 0, 1, 1,
-2.538823, -0.5437869, -0.7829448, 0, 0, 0, 1, 1,
-2.469021, 0.1855013, -1.200631, 0, 0, 0, 1, 1,
-2.424431, 0.1907182, -1.881446, 0, 0, 0, 1, 1,
-2.361631, 2.130899, 0.7660181, 0, 0, 0, 1, 1,
-2.354748, -1.215437, -3.539758, 1, 1, 1, 1, 1,
-2.348967, 1.07084, -0.01613621, 1, 1, 1, 1, 1,
-2.33552, 0.8802202, -1.664929, 1, 1, 1, 1, 1,
-2.277034, 0.3362074, -2.007138, 1, 1, 1, 1, 1,
-2.267313, 1.483775, -0.6844081, 1, 1, 1, 1, 1,
-2.239611, -0.6625239, -1.183999, 1, 1, 1, 1, 1,
-2.217372, 0.5884619, -1.808497, 1, 1, 1, 1, 1,
-2.211517, 0.6874508, -0.7361176, 1, 1, 1, 1, 1,
-2.198531, -0.4326636, -3.110928, 1, 1, 1, 1, 1,
-2.128248, 1.068169, -1.121131, 1, 1, 1, 1, 1,
-2.085848, 0.1149049, -2.563133, 1, 1, 1, 1, 1,
-2.076659, -1.379152, -3.082165, 1, 1, 1, 1, 1,
-2.052158, -0.4380668, -2.255545, 1, 1, 1, 1, 1,
-2.043645, -0.524022, -0.7305894, 1, 1, 1, 1, 1,
-2.033742, -0.168401, -1.923566, 1, 1, 1, 1, 1,
-2.032237, -0.3375392, -2.275974, 0, 0, 1, 1, 1,
-2.001846, 0.5718111, -0.1688372, 1, 0, 0, 1, 1,
-1.997082, 0.5582963, -2.672279, 1, 0, 0, 1, 1,
-1.982314, -0.05824259, -0.9321327, 1, 0, 0, 1, 1,
-1.979329, 0.2418167, -0.04787572, 1, 0, 0, 1, 1,
-1.979296, -1.459757, -4.189394, 1, 0, 0, 1, 1,
-1.974934, -0.2897767, -2.305065, 0, 0, 0, 1, 1,
-1.974262, 1.180064, -1.023018, 0, 0, 0, 1, 1,
-1.965983, 0.2753302, -2.549694, 0, 0, 0, 1, 1,
-1.965331, 0.8859322, -0.7785879, 0, 0, 0, 1, 1,
-1.944082, -1.217444, -4.420911, 0, 0, 0, 1, 1,
-1.934581, -1.821806, -1.918709, 0, 0, 0, 1, 1,
-1.934075, 0.9102778, -1.063993, 0, 0, 0, 1, 1,
-1.929683, -0.04194279, -1.875005, 1, 1, 1, 1, 1,
-1.926855, -1.608429, -1.971463, 1, 1, 1, 1, 1,
-1.922563, 1.85773, -0.6900932, 1, 1, 1, 1, 1,
-1.916075, -1.241722, -1.547391, 1, 1, 1, 1, 1,
-1.89469, 0.5532827, -0.1075859, 1, 1, 1, 1, 1,
-1.890019, 1.458887, -0.5092188, 1, 1, 1, 1, 1,
-1.868446, -0.6770795, -2.290932, 1, 1, 1, 1, 1,
-1.852979, -0.6296726, -1.769578, 1, 1, 1, 1, 1,
-1.825518, -1.492904, -1.357674, 1, 1, 1, 1, 1,
-1.797657, 0.3180659, -1.636739, 1, 1, 1, 1, 1,
-1.778517, -1.342952, -1.55429, 1, 1, 1, 1, 1,
-1.763514, -0.3457083, -1.156571, 1, 1, 1, 1, 1,
-1.75138, 0.6250632, -2.572024, 1, 1, 1, 1, 1,
-1.699025, 0.4508424, -2.33164, 1, 1, 1, 1, 1,
-1.693429, -0.5999787, -1.559142, 1, 1, 1, 1, 1,
-1.684908, -0.6856776, -1.520648, 0, 0, 1, 1, 1,
-1.682444, 0.008863571, -2.214769, 1, 0, 0, 1, 1,
-1.640798, -0.08665612, -2.108174, 1, 0, 0, 1, 1,
-1.635505, 2.609949, 1.068694, 1, 0, 0, 1, 1,
-1.633754, -0.1180768, -1.967375, 1, 0, 0, 1, 1,
-1.633013, 2.381639, -1.714066, 1, 0, 0, 1, 1,
-1.632104, 0.4032887, -1.062636, 0, 0, 0, 1, 1,
-1.624972, -1.187587, -1.281691, 0, 0, 0, 1, 1,
-1.621313, -1.259975, -1.342735, 0, 0, 0, 1, 1,
-1.616513, -0.5362384, -1.970662, 0, 0, 0, 1, 1,
-1.615469, -0.7052463, -1.067037, 0, 0, 0, 1, 1,
-1.60096, 0.9079211, -0.301563, 0, 0, 0, 1, 1,
-1.588791, 0.8329759, -0.3484919, 0, 0, 0, 1, 1,
-1.581778, 1.688723, 0.1886609, 1, 1, 1, 1, 1,
-1.575144, -0.3062378, -3.058348, 1, 1, 1, 1, 1,
-1.542017, 0.555391, -2.160034, 1, 1, 1, 1, 1,
-1.535795, -0.3133555, -3.972516, 1, 1, 1, 1, 1,
-1.526631, 0.1335101, 0.3148671, 1, 1, 1, 1, 1,
-1.520911, -1.153221, -1.349348, 1, 1, 1, 1, 1,
-1.518179, 0.541485, -1.232568, 1, 1, 1, 1, 1,
-1.501996, 0.3205207, -1.021337, 1, 1, 1, 1, 1,
-1.501499, -1.284455, -2.239731, 1, 1, 1, 1, 1,
-1.491765, -0.08964246, -3.813088, 1, 1, 1, 1, 1,
-1.489177, 1.127221, 0.09219866, 1, 1, 1, 1, 1,
-1.482012, 0.6121833, -0.3005368, 1, 1, 1, 1, 1,
-1.471407, -0.4862673, -1.773165, 1, 1, 1, 1, 1,
-1.465648, 0.687713, -1.395075, 1, 1, 1, 1, 1,
-1.458805, -0.3908097, -3.317839, 1, 1, 1, 1, 1,
-1.434599, -2.668952, -3.093713, 0, 0, 1, 1, 1,
-1.427307, -0.2635126, -0.9909451, 1, 0, 0, 1, 1,
-1.424947, 1.254261, -0.4192017, 1, 0, 0, 1, 1,
-1.417852, -2.021601, -1.996431, 1, 0, 0, 1, 1,
-1.410031, -0.5844362, -3.610119, 1, 0, 0, 1, 1,
-1.397437, 1.115979, -1.126694, 1, 0, 0, 1, 1,
-1.384563, 0.169572, -1.681347, 0, 0, 0, 1, 1,
-1.372505, -2.014107, -2.485025, 0, 0, 0, 1, 1,
-1.360397, 1.105302, 0.328294, 0, 0, 0, 1, 1,
-1.354455, -1.03189, -2.705622, 0, 0, 0, 1, 1,
-1.353051, -0.3983938, -0.01341414, 0, 0, 0, 1, 1,
-1.347757, 0.8278507, -0.5108041, 0, 0, 0, 1, 1,
-1.341175, 1.30603, -1.720053, 0, 0, 0, 1, 1,
-1.340677, -1.918926, -1.165014, 1, 1, 1, 1, 1,
-1.330371, -0.881934, -1.781937, 1, 1, 1, 1, 1,
-1.322726, -1.468657, -0.8790508, 1, 1, 1, 1, 1,
-1.319884, -0.1969776, -1.723075, 1, 1, 1, 1, 1,
-1.31265, 0.3992321, 0.1300454, 1, 1, 1, 1, 1,
-1.307759, 0.868353, 1.060079, 1, 1, 1, 1, 1,
-1.29637, 1.998645, -1.408146, 1, 1, 1, 1, 1,
-1.291052, 0.3985238, -1.193032, 1, 1, 1, 1, 1,
-1.282971, 1.051603, 0.6250029, 1, 1, 1, 1, 1,
-1.280994, 0.6290445, -1.354216, 1, 1, 1, 1, 1,
-1.280612, 1.15236, 0.1786309, 1, 1, 1, 1, 1,
-1.279967, -1.658081, -0.6583527, 1, 1, 1, 1, 1,
-1.275426, 0.319985, -0.3346664, 1, 1, 1, 1, 1,
-1.269528, -0.2648656, -0.4659826, 1, 1, 1, 1, 1,
-1.264876, -1.166451, -1.532516, 1, 1, 1, 1, 1,
-1.262394, -0.3304409, -0.6191608, 0, 0, 1, 1, 1,
-1.250633, 0.01432593, -1.634556, 1, 0, 0, 1, 1,
-1.238878, 0.7481858, -0.7034639, 1, 0, 0, 1, 1,
-1.23842, -1.001251, -2.405337, 1, 0, 0, 1, 1,
-1.23605, 0.5506281, 0.1169872, 1, 0, 0, 1, 1,
-1.23534, -2.641097, -3.841873, 1, 0, 0, 1, 1,
-1.229998, -0.4875003, -2.501684, 0, 0, 0, 1, 1,
-1.205734, 0.7900543, -2.197728, 0, 0, 0, 1, 1,
-1.201771, -1.077966, -2.629119, 0, 0, 0, 1, 1,
-1.198033, -1.116142, -0.4452224, 0, 0, 0, 1, 1,
-1.173834, -1.096341, -2.200287, 0, 0, 0, 1, 1,
-1.161271, 0.7146448, 0.4725043, 0, 0, 0, 1, 1,
-1.157568, -0.3983887, -2.618812, 0, 0, 0, 1, 1,
-1.150429, 0.1481108, -1.353059, 1, 1, 1, 1, 1,
-1.135284, -0.6521074, -2.240438, 1, 1, 1, 1, 1,
-1.132986, -0.01201661, -0.4998447, 1, 1, 1, 1, 1,
-1.132023, -3.270149, -3.750967, 1, 1, 1, 1, 1,
-1.126832, 1.344033, -2.268949, 1, 1, 1, 1, 1,
-1.124965, -0.8082731, -1.434008, 1, 1, 1, 1, 1,
-1.119371, 0.1946867, 0.2982668, 1, 1, 1, 1, 1,
-1.109799, -0.7640337, -1.601504, 1, 1, 1, 1, 1,
-1.109523, 1.804266, 0.3982312, 1, 1, 1, 1, 1,
-1.107534, -1.66233, -0.7088244, 1, 1, 1, 1, 1,
-1.107317, -0.1315133, -0.9931469, 1, 1, 1, 1, 1,
-1.102635, 1.559294, -0.4230529, 1, 1, 1, 1, 1,
-1.102417, 0.2599269, 0.1091442, 1, 1, 1, 1, 1,
-1.100921, 1.399302, -1.077509, 1, 1, 1, 1, 1,
-1.092168, 0.6401343, -0.6391562, 1, 1, 1, 1, 1,
-1.068749, 0.4061339, -2.717368, 0, 0, 1, 1, 1,
-1.0632, -1.356531, -2.177782, 1, 0, 0, 1, 1,
-1.058721, -0.3905032, -3.476676, 1, 0, 0, 1, 1,
-1.057617, 0.1545037, -1.433941, 1, 0, 0, 1, 1,
-1.051418, 0.8252869, -1.357933, 1, 0, 0, 1, 1,
-1.03586, 0.2446943, -2.280293, 1, 0, 0, 1, 1,
-1.029852, -0.1638668, -0.5579869, 0, 0, 0, 1, 1,
-1.028901, 0.9659845, -1.216968, 0, 0, 0, 1, 1,
-1.027349, -0.4812723, -2.965359, 0, 0, 0, 1, 1,
-1.019256, 1.033511, -0.5115187, 0, 0, 0, 1, 1,
-1.018805, 0.6457009, -2.097589, 0, 0, 0, 1, 1,
-1.014782, 1.338223, -0.8496999, 0, 0, 0, 1, 1,
-1.011048, -0.02679615, -2.426628, 0, 0, 0, 1, 1,
-1.008262, -1.703374, -2.178348, 1, 1, 1, 1, 1,
-1.006589, 0.7754259, -0.6745594, 1, 1, 1, 1, 1,
-0.9940817, 1.126677, -0.3750712, 1, 1, 1, 1, 1,
-0.9923894, 0.2525156, -3.409422, 1, 1, 1, 1, 1,
-0.9885455, -1.310517, -0.7093246, 1, 1, 1, 1, 1,
-0.9842453, -0.37536, -1.263997, 1, 1, 1, 1, 1,
-0.9820253, -0.1641388, -1.103828, 1, 1, 1, 1, 1,
-0.9785902, 0.4643569, -1.173964, 1, 1, 1, 1, 1,
-0.9782617, -1.230427, -2.310394, 1, 1, 1, 1, 1,
-0.9710417, -1.612569, -4.188593, 1, 1, 1, 1, 1,
-0.9521937, -0.4638161, -1.34372, 1, 1, 1, 1, 1,
-0.951623, -0.2263109, -1.446568, 1, 1, 1, 1, 1,
-0.9512141, -0.1244293, -0.859473, 1, 1, 1, 1, 1,
-0.9444057, 0.8374364, -1.483908, 1, 1, 1, 1, 1,
-0.9441322, -0.4763315, -1.35512, 1, 1, 1, 1, 1,
-0.9439518, -0.6371126, -2.125174, 0, 0, 1, 1, 1,
-0.9433578, -1.371134, -1.070727, 1, 0, 0, 1, 1,
-0.9426799, 0.05084097, -1.939783, 1, 0, 0, 1, 1,
-0.9377978, 1.460678, -1.833465, 1, 0, 0, 1, 1,
-0.9245508, -0.4018176, -1.97626, 1, 0, 0, 1, 1,
-0.9191779, -0.6302575, -2.584382, 1, 0, 0, 1, 1,
-0.9190635, -2.353597, -2.05526, 0, 0, 0, 1, 1,
-0.9181504, -3.14893, -2.41208, 0, 0, 0, 1, 1,
-0.9120404, -1.691503, -1.858938, 0, 0, 0, 1, 1,
-0.9101473, 1.290819, -1.09162, 0, 0, 0, 1, 1,
-0.9094588, -1.078651, -2.732813, 0, 0, 0, 1, 1,
-0.9043495, -0.0667279, -1.267885, 0, 0, 0, 1, 1,
-0.902985, -0.01130851, -0.4520677, 0, 0, 0, 1, 1,
-0.9028971, 0.3561262, -4.25442, 1, 1, 1, 1, 1,
-0.9028918, 0.2598403, -2.373783, 1, 1, 1, 1, 1,
-0.8978097, -1.674253, -2.558705, 1, 1, 1, 1, 1,
-0.8971583, -0.4800395, -1.995799, 1, 1, 1, 1, 1,
-0.8948969, 0.5842472, -1.927559, 1, 1, 1, 1, 1,
-0.8915056, 1.014497, -0.9502283, 1, 1, 1, 1, 1,
-0.8883908, -0.5715208, -2.60921, 1, 1, 1, 1, 1,
-0.886608, 0.3968749, -1.296019, 1, 1, 1, 1, 1,
-0.8820773, -0.1112431, 0.04828766, 1, 1, 1, 1, 1,
-0.8788545, 0.4556827, -2.275805, 1, 1, 1, 1, 1,
-0.8783162, -1.900891, -4.012962, 1, 1, 1, 1, 1,
-0.8772498, 0.5766924, -1.176915, 1, 1, 1, 1, 1,
-0.8745122, -0.6458719, -2.438213, 1, 1, 1, 1, 1,
-0.8680346, -0.4432691, -0.2207785, 1, 1, 1, 1, 1,
-0.8665621, -0.6281421, -1.160796, 1, 1, 1, 1, 1,
-0.8658012, 0.6108894, -2.761405, 0, 0, 1, 1, 1,
-0.863682, 0.8906584, 1.307173, 1, 0, 0, 1, 1,
-0.8636545, -0.09455574, -0.9220556, 1, 0, 0, 1, 1,
-0.8634811, 0.09408949, -1.260778, 1, 0, 0, 1, 1,
-0.8600801, -0.1666291, -2.339641, 1, 0, 0, 1, 1,
-0.8566464, 0.9389472, -0.02208125, 1, 0, 0, 1, 1,
-0.8545625, 0.1714989, -1.966727, 0, 0, 0, 1, 1,
-0.8476197, -1.664096, -2.679134, 0, 0, 0, 1, 1,
-0.8438682, 1.846181, -0.7432759, 0, 0, 0, 1, 1,
-0.8423359, 0.0768856, -2.210551, 0, 0, 0, 1, 1,
-0.8347698, 1.036509, -0.6235929, 0, 0, 0, 1, 1,
-0.8323336, -0.03132788, -2.317611, 0, 0, 0, 1, 1,
-0.8304585, -1.686041, -3.084859, 0, 0, 0, 1, 1,
-0.8251493, 0.8795381, -0.395206, 1, 1, 1, 1, 1,
-0.8207211, -1.174522, -1.668262, 1, 1, 1, 1, 1,
-0.8195904, -0.04638828, -2.388224, 1, 1, 1, 1, 1,
-0.8160754, 1.086905, -0.889385, 1, 1, 1, 1, 1,
-0.8152631, -0.5068745, -2.085637, 1, 1, 1, 1, 1,
-0.8136999, -0.3118747, -2.623037, 1, 1, 1, 1, 1,
-0.8134246, -1.03824, -3.134533, 1, 1, 1, 1, 1,
-0.8131465, -0.7441572, -3.330302, 1, 1, 1, 1, 1,
-0.8122134, 0.3198994, -2.041262, 1, 1, 1, 1, 1,
-0.807613, -0.8299642, -1.807395, 1, 1, 1, 1, 1,
-0.7996822, -0.009524362, -2.481757, 1, 1, 1, 1, 1,
-0.7991364, -1.082645, -0.8643689, 1, 1, 1, 1, 1,
-0.7970187, -0.9077179, -2.539511, 1, 1, 1, 1, 1,
-0.7961748, -1.115659, -4.586727, 1, 1, 1, 1, 1,
-0.7960154, 0.9263903, -1.538145, 1, 1, 1, 1, 1,
-0.7925466, -0.9929423, -3.031688, 0, 0, 1, 1, 1,
-0.7895467, 0.02248789, -0.714251, 1, 0, 0, 1, 1,
-0.781626, 0.008420994, -1.508415, 1, 0, 0, 1, 1,
-0.7709381, -0.9208016, -3.773906, 1, 0, 0, 1, 1,
-0.7680709, -0.9487727, -1.455974, 1, 0, 0, 1, 1,
-0.7618678, 0.5815536, -1.521813, 1, 0, 0, 1, 1,
-0.7551783, 0.1221208, -1.512223, 0, 0, 0, 1, 1,
-0.746724, -0.2721527, -1.893147, 0, 0, 0, 1, 1,
-0.7396975, 0.5854589, 0.3727868, 0, 0, 0, 1, 1,
-0.7350854, -1.310021, -2.912493, 0, 0, 0, 1, 1,
-0.7323849, -0.07552934, -2.956149, 0, 0, 0, 1, 1,
-0.7314692, -0.03403084, -1.087331, 0, 0, 0, 1, 1,
-0.7302096, -1.406526, -2.267716, 0, 0, 0, 1, 1,
-0.7270321, -0.2029999, -4.452481, 1, 1, 1, 1, 1,
-0.7254975, -0.3985649, -1.749247, 1, 1, 1, 1, 1,
-0.7228147, -0.5564997, -2.666744, 1, 1, 1, 1, 1,
-0.7202441, -1.41741, -4.019306, 1, 1, 1, 1, 1,
-0.7164503, 0.1420643, -2.493075, 1, 1, 1, 1, 1,
-0.7159747, 0.5744716, -1.107118, 1, 1, 1, 1, 1,
-0.7148201, 0.02346303, -1.821525, 1, 1, 1, 1, 1,
-0.7145399, -1.372429, -0.644942, 1, 1, 1, 1, 1,
-0.7137421, -1.185823, -2.387196, 1, 1, 1, 1, 1,
-0.7103739, -0.3619338, -2.48457, 1, 1, 1, 1, 1,
-0.7091901, 0.6828819, -1.299924, 1, 1, 1, 1, 1,
-0.7075933, -1.226833, -2.361456, 1, 1, 1, 1, 1,
-0.7058591, 0.2618645, -2.353691, 1, 1, 1, 1, 1,
-0.7057893, 0.8545673, -0.9495019, 1, 1, 1, 1, 1,
-0.7053006, -0.1974069, -0.03426633, 1, 1, 1, 1, 1,
-0.6926907, 0.1381438, 0.3630697, 0, 0, 1, 1, 1,
-0.6921482, -0.8122253, -4.340899, 1, 0, 0, 1, 1,
-0.6911337, 1.166106, -0.355745, 1, 0, 0, 1, 1,
-0.6900166, -0.2356177, -2.117518, 1, 0, 0, 1, 1,
-0.6856321, 0.2901586, -2.715259, 1, 0, 0, 1, 1,
-0.6835482, 0.951382, 0.5897344, 1, 0, 0, 1, 1,
-0.6825648, 2.108744, -0.6381259, 0, 0, 0, 1, 1,
-0.670669, -0.1008863, -2.269046, 0, 0, 0, 1, 1,
-0.669194, -0.4951882, -2.945844, 0, 0, 0, 1, 1,
-0.6641375, -0.838111, -3.111835, 0, 0, 0, 1, 1,
-0.6629697, -0.2853428, -3.359188, 0, 0, 0, 1, 1,
-0.6623821, -0.6684455, -0.9209992, 0, 0, 0, 1, 1,
-0.6494188, -0.492153, -3.241907, 0, 0, 0, 1, 1,
-0.6478913, 2.018397, -1.321997, 1, 1, 1, 1, 1,
-0.6456681, 0.5234311, -1.450351, 1, 1, 1, 1, 1,
-0.6448893, -0.7121458, -1.24417, 1, 1, 1, 1, 1,
-0.6359764, -0.4594356, -2.663899, 1, 1, 1, 1, 1,
-0.6308646, -0.2277929, -2.127901, 1, 1, 1, 1, 1,
-0.6307867, 2.121746, 0.3996663, 1, 1, 1, 1, 1,
-0.6249052, -0.3062288, -2.61142, 1, 1, 1, 1, 1,
-0.6244729, 0.3491632, -2.29933, 1, 1, 1, 1, 1,
-0.6232051, -0.2791649, -3.372749, 1, 1, 1, 1, 1,
-0.6218809, -0.244318, -2.557059, 1, 1, 1, 1, 1,
-0.6208531, -0.4557097, -3.965068, 1, 1, 1, 1, 1,
-0.6181514, 0.1401962, 0.8611769, 1, 1, 1, 1, 1,
-0.6178607, 1.283494, -0.5188863, 1, 1, 1, 1, 1,
-0.6145141, 0.352672, -1.192533, 1, 1, 1, 1, 1,
-0.6067023, -0.1586292, -1.541191, 1, 1, 1, 1, 1,
-0.6066427, 0.7472546, 0.59271, 0, 0, 1, 1, 1,
-0.6042744, -0.3368261, -2.095033, 1, 0, 0, 1, 1,
-0.602902, -0.7769053, -2.449289, 1, 0, 0, 1, 1,
-0.5964718, 1.235971, -1.272362, 1, 0, 0, 1, 1,
-0.5913622, -0.2582539, -1.242806, 1, 0, 0, 1, 1,
-0.5912257, 0.9797789, 0.554922, 1, 0, 0, 1, 1,
-0.58984, -0.3076289, -3.857586, 0, 0, 0, 1, 1,
-0.5892138, -0.4588016, -2.512221, 0, 0, 0, 1, 1,
-0.5885093, -1.028067, -0.6794834, 0, 0, 0, 1, 1,
-0.5835688, 0.3672427, -1.648, 0, 0, 0, 1, 1,
-0.5805638, 0.5008001, -1.74569, 0, 0, 0, 1, 1,
-0.5704795, 1.024484, -0.3281822, 0, 0, 0, 1, 1,
-0.5654061, 0.5428401, -0.4318631, 0, 0, 0, 1, 1,
-0.5653949, -2.877479, -0.7389717, 1, 1, 1, 1, 1,
-0.5624629, 0.9692547, -0.2002822, 1, 1, 1, 1, 1,
-0.561151, -0.9914437, -3.291189, 1, 1, 1, 1, 1,
-0.5570053, -0.2460109, -2.013413, 1, 1, 1, 1, 1,
-0.5546385, 0.06446906, -1.474124, 1, 1, 1, 1, 1,
-0.5536884, 0.2265466, -2.115288, 1, 1, 1, 1, 1,
-0.5488644, 0.2429157, -0.7596688, 1, 1, 1, 1, 1,
-0.5470779, 0.6088296, -0.2931251, 1, 1, 1, 1, 1,
-0.5455902, -0.9357129, -3.003124, 1, 1, 1, 1, 1,
-0.5429698, 0.8526913, 0.5253844, 1, 1, 1, 1, 1,
-0.5421376, 0.8547867, -0.4625596, 1, 1, 1, 1, 1,
-0.5409635, 0.3269069, -1.061743, 1, 1, 1, 1, 1,
-0.5407364, -1.048715, -1.624904, 1, 1, 1, 1, 1,
-0.5375262, 0.2578753, 0.360027, 1, 1, 1, 1, 1,
-0.5286707, -0.1476688, -0.0966343, 1, 1, 1, 1, 1,
-0.5273268, 0.128776, -1.840638, 0, 0, 1, 1, 1,
-0.5251585, 0.1888693, -2.924562, 1, 0, 0, 1, 1,
-0.5225566, -1.475761, -4.738084, 1, 0, 0, 1, 1,
-0.5167238, -0.9978235, -3.55742, 1, 0, 0, 1, 1,
-0.5158261, 1.030202, -0.5624905, 1, 0, 0, 1, 1,
-0.5150802, 0.7394068, -1.634464, 1, 0, 0, 1, 1,
-0.5146014, -1.98018, -3.613309, 0, 0, 0, 1, 1,
-0.5083564, -0.5253646, -2.518576, 0, 0, 0, 1, 1,
-0.5082802, -0.3147198, -3.342661, 0, 0, 0, 1, 1,
-0.5043375, -1.69417, -3.517663, 0, 0, 0, 1, 1,
-0.5018679, -1.680573, -2.949788, 0, 0, 0, 1, 1,
-0.5010739, -1.22539, -3.164593, 0, 0, 0, 1, 1,
-0.4960243, 1.703404, 0.1365402, 0, 0, 0, 1, 1,
-0.4959576, -1.535091, -3.608628, 1, 1, 1, 1, 1,
-0.4953397, -0.09332412, -1.603632, 1, 1, 1, 1, 1,
-0.4930741, -0.5490344, -3.21066, 1, 1, 1, 1, 1,
-0.4902028, 1.110703, -1.056058, 1, 1, 1, 1, 1,
-0.4875983, -0.51912, -1.781082, 1, 1, 1, 1, 1,
-0.4875761, 0.6054605, -1.950803, 1, 1, 1, 1, 1,
-0.4857983, 0.3831558, -2.080165, 1, 1, 1, 1, 1,
-0.4838404, 1.363945, 0.03858875, 1, 1, 1, 1, 1,
-0.4749678, 0.08771958, -0.5399064, 1, 1, 1, 1, 1,
-0.4743854, -0.09834804, -2.968011, 1, 1, 1, 1, 1,
-0.468386, 0.5349146, 0.124078, 1, 1, 1, 1, 1,
-0.4677127, 1.200102, -0.82524, 1, 1, 1, 1, 1,
-0.467124, -0.2206756, -2.05971, 1, 1, 1, 1, 1,
-0.4586244, 2.153318, -0.5879336, 1, 1, 1, 1, 1,
-0.4585635, -0.1158899, -1.047319, 1, 1, 1, 1, 1,
-0.4571515, 0.5613806, -1.418887, 0, 0, 1, 1, 1,
-0.4562159, 1.950704, -1.744131, 1, 0, 0, 1, 1,
-0.451175, -1.168923, -2.202961, 1, 0, 0, 1, 1,
-0.4430537, -1.016349, -2.220528, 1, 0, 0, 1, 1,
-0.436556, 1.233604, -0.5059302, 1, 0, 0, 1, 1,
-0.4313443, 1.190351, -0.2107091, 1, 0, 0, 1, 1,
-0.4294596, 0.03422508, -1.325505, 0, 0, 0, 1, 1,
-0.4264238, -0.4585125, -4.51504, 0, 0, 0, 1, 1,
-0.4230905, 1.359759, -0.8004266, 0, 0, 0, 1, 1,
-0.422544, -0.8879796, -5.01673, 0, 0, 0, 1, 1,
-0.4217748, 1.428178, -1.702139, 0, 0, 0, 1, 1,
-0.4174971, 0.3945217, -1.265204, 0, 0, 0, 1, 1,
-0.4158171, -0.9539513, -3.361045, 0, 0, 0, 1, 1,
-0.4122962, 0.3093281, -0.1513703, 1, 1, 1, 1, 1,
-0.4095514, 0.4362251, -0.6185798, 1, 1, 1, 1, 1,
-0.4033661, 1.32248, -0.2287924, 1, 1, 1, 1, 1,
-0.4025752, 0.1343039, -1.094807, 1, 1, 1, 1, 1,
-0.3901316, 0.9235622, -1.404883, 1, 1, 1, 1, 1,
-0.3874014, -1.58992, -3.880563, 1, 1, 1, 1, 1,
-0.3848676, 0.04121746, -1.237942, 1, 1, 1, 1, 1,
-0.3831483, -1.066507, -2.770608, 1, 1, 1, 1, 1,
-0.3817856, 0.5660838, -2.048742, 1, 1, 1, 1, 1,
-0.3806351, -1.353196, -2.909131, 1, 1, 1, 1, 1,
-0.380541, -0.3166713, -3.137675, 1, 1, 1, 1, 1,
-0.3789424, 0.6961658, -0.2042985, 1, 1, 1, 1, 1,
-0.3786917, -1.061207, -2.510642, 1, 1, 1, 1, 1,
-0.3765551, 0.1686262, -1.021566, 1, 1, 1, 1, 1,
-0.3760174, -2.076832, -2.405431, 1, 1, 1, 1, 1,
-0.3730721, -0.8125917, -0.9217192, 0, 0, 1, 1, 1,
-0.3728619, -1.318638, -2.39923, 1, 0, 0, 1, 1,
-0.3695029, 0.08427043, -1.25473, 1, 0, 0, 1, 1,
-0.3670788, -0.3103486, -0.3783302, 1, 0, 0, 1, 1,
-0.365836, 0.3922248, -0.6031507, 1, 0, 0, 1, 1,
-0.3618357, -0.4554825, -2.659738, 1, 0, 0, 1, 1,
-0.3613341, -1.795895, -3.929343, 0, 0, 0, 1, 1,
-0.3599238, 1.138296, -0.2576695, 0, 0, 0, 1, 1,
-0.3580211, 1.854699, -1.687846, 0, 0, 0, 1, 1,
-0.3485092, -0.3612953, -1.30581, 0, 0, 0, 1, 1,
-0.3457834, 1.661821, -0.272697, 0, 0, 0, 1, 1,
-0.3431588, -0.8533972, -1.047832, 0, 0, 0, 1, 1,
-0.3318641, -0.9202327, -4.32287, 0, 0, 0, 1, 1,
-0.3274484, 0.8353735, 0.4247279, 1, 1, 1, 1, 1,
-0.3273048, -1.237369, -1.910209, 1, 1, 1, 1, 1,
-0.3255983, -0.08421011, -2.167153, 1, 1, 1, 1, 1,
-0.324603, -1.001048, -2.378725, 1, 1, 1, 1, 1,
-0.3240126, -0.1209877, -2.473023, 1, 1, 1, 1, 1,
-0.3185581, 0.1359423, -1.571686, 1, 1, 1, 1, 1,
-0.3140079, 0.0321562, -0.4512537, 1, 1, 1, 1, 1,
-0.3133698, 0.0048115, 0.2003945, 1, 1, 1, 1, 1,
-0.3118795, 1.181969, -0.304634, 1, 1, 1, 1, 1,
-0.3115973, 0.8143373, -1.81181, 1, 1, 1, 1, 1,
-0.3115105, 0.8526663, -1.636185, 1, 1, 1, 1, 1,
-0.3100621, -0.9492531, -2.845329, 1, 1, 1, 1, 1,
-0.3076299, -0.9026704, -0.8517502, 1, 1, 1, 1, 1,
-0.307607, -1.118782, -3.039676, 1, 1, 1, 1, 1,
-0.3067066, 3.024341, -2.080199, 1, 1, 1, 1, 1,
-0.3063304, 1.119771, 0.1551237, 0, 0, 1, 1, 1,
-0.2983989, -1.497596, -4.056444, 1, 0, 0, 1, 1,
-0.2969437, 0.0819065, -1.087034, 1, 0, 0, 1, 1,
-0.2969336, -0.4149771, -2.662567, 1, 0, 0, 1, 1,
-0.2927302, -0.393751, -1.564003, 1, 0, 0, 1, 1,
-0.2906502, -0.09043568, -1.997488, 1, 0, 0, 1, 1,
-0.2859915, 0.7471222, -0.6347548, 0, 0, 0, 1, 1,
-0.2856665, 0.6389664, -0.07055551, 0, 0, 0, 1, 1,
-0.285592, 0.0349894, -0.2121805, 0, 0, 0, 1, 1,
-0.2823938, 0.6387357, -0.4771889, 0, 0, 0, 1, 1,
-0.2775452, -0.4655543, -2.839948, 0, 0, 0, 1, 1,
-0.2758305, -2.275891, -2.782087, 0, 0, 0, 1, 1,
-0.2753763, -0.43926, -2.597245, 0, 0, 0, 1, 1,
-0.2733481, -0.7455677, -3.995366, 1, 1, 1, 1, 1,
-0.2638814, 2.211299, 2.180647, 1, 1, 1, 1, 1,
-0.2634546, -0.2400356, -0.674925, 1, 1, 1, 1, 1,
-0.2615367, 0.9226686, -0.1181277, 1, 1, 1, 1, 1,
-0.2602171, -1.456469, -3.841783, 1, 1, 1, 1, 1,
-0.2591761, -1.214603, -1.814415, 1, 1, 1, 1, 1,
-0.2573165, -0.9491863, -2.15296, 1, 1, 1, 1, 1,
-0.2528057, 0.2629841, 0.6218776, 1, 1, 1, 1, 1,
-0.2510766, -0.22477, -1.078579, 1, 1, 1, 1, 1,
-0.2505428, 1.040665, -0.1008436, 1, 1, 1, 1, 1,
-0.2495469, -0.8176708, -2.314506, 1, 1, 1, 1, 1,
-0.2485142, -0.3594095, -2.027358, 1, 1, 1, 1, 1,
-0.2457006, -0.0654224, -2.734408, 1, 1, 1, 1, 1,
-0.2443531, -2.256024, -1.467427, 1, 1, 1, 1, 1,
-0.2358011, 0.7121214, -1.458966, 1, 1, 1, 1, 1,
-0.2333192, 1.392134, 0.4019609, 0, 0, 1, 1, 1,
-0.2311286, -0.5388455, -2.053663, 1, 0, 0, 1, 1,
-0.2262102, -0.8220819, -3.594844, 1, 0, 0, 1, 1,
-0.2256865, 0.8835059, -1.569926, 1, 0, 0, 1, 1,
-0.2250894, 0.01334139, 0.0947725, 1, 0, 0, 1, 1,
-0.2228706, -0.8386864, -2.940767, 1, 0, 0, 1, 1,
-0.2220783, -0.6599135, -2.642057, 0, 0, 0, 1, 1,
-0.2217018, 0.5304745, 1.034882, 0, 0, 0, 1, 1,
-0.2211301, -0.01509258, -1.205328, 0, 0, 0, 1, 1,
-0.2207854, -1.651866, -2.949675, 0, 0, 0, 1, 1,
-0.2180171, -0.9922829, -3.65749, 0, 0, 0, 1, 1,
-0.2157519, -0.002829303, -2.08466, 0, 0, 0, 1, 1,
-0.2152029, -0.558024, -3.642264, 0, 0, 0, 1, 1,
-0.214913, -0.2203134, -3.378644, 1, 1, 1, 1, 1,
-0.2130506, 1.19218, 1.054188, 1, 1, 1, 1, 1,
-0.2128733, 1.255681, -0.8895479, 1, 1, 1, 1, 1,
-0.2128665, -0.5283114, -4.685398, 1, 1, 1, 1, 1,
-0.2113963, -0.02639933, -1.486617, 1, 1, 1, 1, 1,
-0.2099187, -1.780622, -2.985487, 1, 1, 1, 1, 1,
-0.2075914, -0.4617746, -3.68866, 1, 1, 1, 1, 1,
-0.2073925, 0.1380057, -0.6073112, 1, 1, 1, 1, 1,
-0.204621, 2.566186, -0.7121819, 1, 1, 1, 1, 1,
-0.2027655, 1.464807, 1.21787, 1, 1, 1, 1, 1,
-0.1976079, 0.2616536, -0.5019614, 1, 1, 1, 1, 1,
-0.1956828, 2.460664, 0.4307516, 1, 1, 1, 1, 1,
-0.1939965, 0.2773292, -0.7559711, 1, 1, 1, 1, 1,
-0.189568, 0.8302323, -0.2272258, 1, 1, 1, 1, 1,
-0.1876601, -0.3740929, -1.042568, 1, 1, 1, 1, 1,
-0.1875506, -1.858334, -2.319723, 0, 0, 1, 1, 1,
-0.1854084, -0.856436, -3.119347, 1, 0, 0, 1, 1,
-0.1831771, 0.5976729, 0.2506173, 1, 0, 0, 1, 1,
-0.1757393, -0.9093299, -3.630038, 1, 0, 0, 1, 1,
-0.1744452, 0.4495757, -0.4022187, 1, 0, 0, 1, 1,
-0.1713112, 0.7195083, 0.7166969, 1, 0, 0, 1, 1,
-0.1577857, -0.8506373, -3.509065, 0, 0, 0, 1, 1,
-0.1539599, 2.288372, 0.6054718, 0, 0, 0, 1, 1,
-0.1500634, -1.048682, -3.619401, 0, 0, 0, 1, 1,
-0.1473034, 1.545792, 0.7233068, 0, 0, 0, 1, 1,
-0.1420256, 0.09817263, -0.8948807, 0, 0, 0, 1, 1,
-0.13871, 0.3787695, -0.6701944, 0, 0, 0, 1, 1,
-0.1337371, -0.123823, -3.388797, 0, 0, 0, 1, 1,
-0.1319264, -0.829699, -1.997835, 1, 1, 1, 1, 1,
-0.1272047, -0.6021874, -3.97356, 1, 1, 1, 1, 1,
-0.1247874, 0.9249039, -1.561341, 1, 1, 1, 1, 1,
-0.1237786, -0.5363008, -3.275304, 1, 1, 1, 1, 1,
-0.123009, 0.18295, -0.2623497, 1, 1, 1, 1, 1,
-0.1177993, -0.744855, -3.792887, 1, 1, 1, 1, 1,
-0.1149808, -1.014202, -2.433619, 1, 1, 1, 1, 1,
-0.1129409, 0.6436052, -1.970584, 1, 1, 1, 1, 1,
-0.1109587, 0.9767436, -1.430114, 1, 1, 1, 1, 1,
-0.1034097, 0.5265056, -0.3157793, 1, 1, 1, 1, 1,
-0.1015846, -0.7915854, -3.146152, 1, 1, 1, 1, 1,
-0.0992559, 1.856242, 1.076612, 1, 1, 1, 1, 1,
-0.09252892, 0.0401508, -1.226503, 1, 1, 1, 1, 1,
-0.09170094, -0.02309717, -0.2210904, 1, 1, 1, 1, 1,
-0.09035447, -0.02452306, -2.636073, 1, 1, 1, 1, 1,
-0.08762553, -0.02660114, -0.0484475, 0, 0, 1, 1, 1,
-0.0856382, -1.303892, -4.577311, 1, 0, 0, 1, 1,
-0.08535086, 0.4544542, 0.0437411, 1, 0, 0, 1, 1,
-0.07220756, 0.7744359, -0.533254, 1, 0, 0, 1, 1,
-0.0719955, 1.341035, 1.514082, 1, 0, 0, 1, 1,
-0.07158181, 1.648261, 1.740412, 1, 0, 0, 1, 1,
-0.06720769, -1.284823, -2.131552, 0, 0, 0, 1, 1,
-0.0613295, 0.7752417, -1.886814, 0, 0, 0, 1, 1,
-0.05772141, 1.217816, -1.193747, 0, 0, 0, 1, 1,
-0.05398792, -0.843549, -3.039186, 0, 0, 0, 1, 1,
-0.0489195, 1.395371, -0.1795003, 0, 0, 0, 1, 1,
-0.0459576, 0.7155855, 0.2626032, 0, 0, 0, 1, 1,
-0.04257083, 1.250891, -0.4804616, 0, 0, 0, 1, 1,
-0.03788915, -1.826911, -5.059798, 1, 1, 1, 1, 1,
-0.03354459, 0.0271782, -1.873614, 1, 1, 1, 1, 1,
-0.03109197, 1.506979, 0.5645136, 1, 1, 1, 1, 1,
-0.02662185, -1.131634, -2.809411, 1, 1, 1, 1, 1,
-0.02520878, -0.9898951, -2.792377, 1, 1, 1, 1, 1,
-0.02421894, -0.1103937, -4.302643, 1, 1, 1, 1, 1,
-0.02346198, -1.665209, -2.059115, 1, 1, 1, 1, 1,
-0.02320522, -0.8042421, -2.523277, 1, 1, 1, 1, 1,
-0.02152338, 0.9219852, 0.8108016, 1, 1, 1, 1, 1,
-0.01249513, 0.8154395, -0.6624205, 1, 1, 1, 1, 1,
-0.01018136, 0.9858297, 0.4212219, 1, 1, 1, 1, 1,
-0.009525713, 0.7479018, -0.2003915, 1, 1, 1, 1, 1,
-0.008598876, 1.045759, -0.3857594, 1, 1, 1, 1, 1,
-0.007897727, -0.08792295, -5.67932, 1, 1, 1, 1, 1,
-0.007839724, -0.6650011, -3.654432, 1, 1, 1, 1, 1,
-0.002685094, 0.5237104, -0.8632813, 0, 0, 1, 1, 1,
-0.002657858, 1.205662, -1.78677, 1, 0, 0, 1, 1,
0.0006658181, 1.179741, -0.3708566, 1, 0, 0, 1, 1,
0.001734108, -1.327643, 2.090468, 1, 0, 0, 1, 1,
0.002380236, 0.3635014, 1.106318, 1, 0, 0, 1, 1,
0.002844369, 0.4205558, -0.2734907, 1, 0, 0, 1, 1,
0.004652635, -0.8063208, 3.269398, 0, 0, 0, 1, 1,
0.004677055, -0.4361466, 2.57125, 0, 0, 0, 1, 1,
0.004756079, -0.4316357, 2.366782, 0, 0, 0, 1, 1,
0.01290099, -1.080195, 3.671621, 0, 0, 0, 1, 1,
0.01332585, 0.5693711, -0.8263827, 0, 0, 0, 1, 1,
0.01672298, -1.484559, 4.95603, 0, 0, 0, 1, 1,
0.01700489, -0.8890088, 2.353243, 0, 0, 0, 1, 1,
0.01767109, -0.2942135, 2.551235, 1, 1, 1, 1, 1,
0.01947729, -1.900636, 4.531571, 1, 1, 1, 1, 1,
0.02619136, -2.727768, 3.509774, 1, 1, 1, 1, 1,
0.02846946, -1.340638, 2.456174, 1, 1, 1, 1, 1,
0.03508184, 0.8325108, 0.7176666, 1, 1, 1, 1, 1,
0.03603257, -1.00897, 3.223284, 1, 1, 1, 1, 1,
0.03985484, -0.9928375, 4.085065, 1, 1, 1, 1, 1,
0.04123561, 0.002882414, 1.089379, 1, 1, 1, 1, 1,
0.04504474, -2.364002, 3.070417, 1, 1, 1, 1, 1,
0.04833698, -0.0145438, 3.306928, 1, 1, 1, 1, 1,
0.048753, -0.6225923, 4.066804, 1, 1, 1, 1, 1,
0.05061095, -0.7476605, 3.706376, 1, 1, 1, 1, 1,
0.05066833, 0.4583097, -1.146055, 1, 1, 1, 1, 1,
0.05194813, 0.471949, 0.9839124, 1, 1, 1, 1, 1,
0.05239888, 0.46809, 1.184043, 1, 1, 1, 1, 1,
0.05596971, 0.01306894, 1.334182, 0, 0, 1, 1, 1,
0.05939282, 0.346161, 0.7894043, 1, 0, 0, 1, 1,
0.06128659, 0.3611776, 0.5736708, 1, 0, 0, 1, 1,
0.06382982, 1.120813, 0.5807652, 1, 0, 0, 1, 1,
0.07073066, 0.5078223, 1.172564, 1, 0, 0, 1, 1,
0.070747, 0.7222689, 0.2539307, 1, 0, 0, 1, 1,
0.07418103, -0.4211048, 4.097432, 0, 0, 0, 1, 1,
0.0759998, 0.386032, 0.9007725, 0, 0, 0, 1, 1,
0.08287825, 0.985088, 0.8660809, 0, 0, 0, 1, 1,
0.08308775, -1.708145, 2.256358, 0, 0, 0, 1, 1,
0.08328228, 0.5280737, -1.427309, 0, 0, 0, 1, 1,
0.09021597, -1.799843, 2.288934, 0, 0, 0, 1, 1,
0.09105019, -0.7947443, 2.735445, 0, 0, 0, 1, 1,
0.09239475, 0.7008759, 1.11874, 1, 1, 1, 1, 1,
0.09269834, -0.1316485, 2.393795, 1, 1, 1, 1, 1,
0.09355983, 0.8068224, -0.6183416, 1, 1, 1, 1, 1,
0.09477282, -0.3699836, 2.212508, 1, 1, 1, 1, 1,
0.09782226, -0.9982942, 3.220609, 1, 1, 1, 1, 1,
0.102999, -1.517948, 4.161752, 1, 1, 1, 1, 1,
0.1049115, -0.5291798, 3.928708, 1, 1, 1, 1, 1,
0.1154978, -0.5245656, 3.30721, 1, 1, 1, 1, 1,
0.1253389, 1.454365, 1.514537, 1, 1, 1, 1, 1,
0.1276365, 0.8675418, -0.6293612, 1, 1, 1, 1, 1,
0.1300662, 0.6797584, -0.7007244, 1, 1, 1, 1, 1,
0.1355633, -0.4236231, 2.479205, 1, 1, 1, 1, 1,
0.139011, 0.7257061, 1.219365, 1, 1, 1, 1, 1,
0.1470184, -0.2177945, 1.372431, 1, 1, 1, 1, 1,
0.1498768, 0.02106591, 2.576955, 1, 1, 1, 1, 1,
0.1521395, 0.3156277, 1.418242, 0, 0, 1, 1, 1,
0.1531014, 0.1180453, 1.687939, 1, 0, 0, 1, 1,
0.1575292, -2.457192, 2.360027, 1, 0, 0, 1, 1,
0.1576839, 0.7077321, -0.2131497, 1, 0, 0, 1, 1,
0.1601827, -1.194366, 3.168625, 1, 0, 0, 1, 1,
0.1619511, 1.24341, 0.7206967, 1, 0, 0, 1, 1,
0.1641987, -0.2825631, 1.649719, 0, 0, 0, 1, 1,
0.1664122, -0.3458124, 5.373466, 0, 0, 0, 1, 1,
0.1674582, -0.1324902, 0.5654539, 0, 0, 0, 1, 1,
0.1693577, -0.6335558, 3.209175, 0, 0, 0, 1, 1,
0.1693727, -0.5828243, 3.242784, 0, 0, 0, 1, 1,
0.1776287, -0.2189538, 2.394317, 0, 0, 0, 1, 1,
0.1788071, 1.091157, -0.04266392, 0, 0, 0, 1, 1,
0.1790531, -0.5805672, 1.564361, 1, 1, 1, 1, 1,
0.1839274, -0.1214296, 1.967585, 1, 1, 1, 1, 1,
0.1842419, -0.08547769, 1.367387, 1, 1, 1, 1, 1,
0.1843602, -0.05413707, 2.054211, 1, 1, 1, 1, 1,
0.187084, 0.6580917, 1.893652, 1, 1, 1, 1, 1,
0.1887537, -0.3233142, 3.897947, 1, 1, 1, 1, 1,
0.1888645, 0.1602188, 0.0289484, 1, 1, 1, 1, 1,
0.1893738, -0.4386207, 3.300897, 1, 1, 1, 1, 1,
0.1944598, -1.715436, 1.938591, 1, 1, 1, 1, 1,
0.1945836, 0.6438141, -0.7127546, 1, 1, 1, 1, 1,
0.1992966, -0.7613465, 3.928789, 1, 1, 1, 1, 1,
0.2017524, 0.4172475, 0.1499529, 1, 1, 1, 1, 1,
0.205319, 0.1792917, 0.5982572, 1, 1, 1, 1, 1,
0.2061995, 0.4346648, -1.291052, 1, 1, 1, 1, 1,
0.2082791, 0.473655, 1.596015, 1, 1, 1, 1, 1,
0.2123443, 0.7297598, -0.2462544, 0, 0, 1, 1, 1,
0.2198237, 0.7691207, 2.707904, 1, 0, 0, 1, 1,
0.2244615, -0.05333934, 0.6652716, 1, 0, 0, 1, 1,
0.224928, -0.3187424, 1.384115, 1, 0, 0, 1, 1,
0.2281404, 0.705858, 0.8906418, 1, 0, 0, 1, 1,
0.2287971, -0.9038888, 3.629266, 1, 0, 0, 1, 1,
0.2292707, -0.6827077, 1.216167, 0, 0, 0, 1, 1,
0.2312699, -1.341079, 0.3271438, 0, 0, 0, 1, 1,
0.2334739, 0.7921927, 2.628204, 0, 0, 0, 1, 1,
0.2395404, -0.5856214, 3.588247, 0, 0, 0, 1, 1,
0.2442721, 1.2254, 0.7845402, 0, 0, 0, 1, 1,
0.2449415, -0.3288016, 2.334368, 0, 0, 0, 1, 1,
0.2450053, -0.002633026, 1.156639, 0, 0, 0, 1, 1,
0.2495389, 2.00549, 0.0985167, 1, 1, 1, 1, 1,
0.2528401, 0.3625414, 0.2550139, 1, 1, 1, 1, 1,
0.2561708, 0.6000605, 0.3141631, 1, 1, 1, 1, 1,
0.2586553, 0.08217525, 1.384148, 1, 1, 1, 1, 1,
0.2592315, 1.284267, 1.232331, 1, 1, 1, 1, 1,
0.2623613, 0.1719159, -0.4862331, 1, 1, 1, 1, 1,
0.2752548, -0.7162745, 2.966011, 1, 1, 1, 1, 1,
0.2778931, -0.318473, 2.071502, 1, 1, 1, 1, 1,
0.2782521, 1.464437, -1.649309, 1, 1, 1, 1, 1,
0.281772, -0.01695386, 1.853331, 1, 1, 1, 1, 1,
0.283507, -1.066061, 2.71404, 1, 1, 1, 1, 1,
0.2836489, -0.1902922, 1.231538, 1, 1, 1, 1, 1,
0.2888543, 0.25131, 2.172051, 1, 1, 1, 1, 1,
0.291518, 0.9295411, 0.4510256, 1, 1, 1, 1, 1,
0.2916047, 0.08843755, 1.643438, 1, 1, 1, 1, 1,
0.2924151, -0.1302617, 3.121179, 0, 0, 1, 1, 1,
0.304725, 1.029904, 1.733251, 1, 0, 0, 1, 1,
0.3047707, -0.7141038, 2.531324, 1, 0, 0, 1, 1,
0.3068298, 0.140549, 0.8501647, 1, 0, 0, 1, 1,
0.3075265, 0.8724435, -0.09843338, 1, 0, 0, 1, 1,
0.3097652, -0.266234, 1.980416, 1, 0, 0, 1, 1,
0.310328, 0.1352158, 2.154804, 0, 0, 0, 1, 1,
0.3122227, -0.2168518, 4.803559, 0, 0, 0, 1, 1,
0.3125939, 0.1680521, 1.993661, 0, 0, 0, 1, 1,
0.3127963, 1.357923, -1.125336, 0, 0, 0, 1, 1,
0.3155511, -0.9039551, 2.250087, 0, 0, 0, 1, 1,
0.317811, -0.7151199, 2.678334, 0, 0, 0, 1, 1,
0.3197183, 0.2157765, 0.3847647, 0, 0, 0, 1, 1,
0.325582, 1.666519, 1.003922, 1, 1, 1, 1, 1,
0.3487836, 1.18071, 0.9259231, 1, 1, 1, 1, 1,
0.3488039, -1.990492, 4.19169, 1, 1, 1, 1, 1,
0.3495186, 0.2750177, 1.251526, 1, 1, 1, 1, 1,
0.3525996, -0.9756842, 0.4330864, 1, 1, 1, 1, 1,
0.3541411, 0.06968882, 1.218926, 1, 1, 1, 1, 1,
0.3551024, -0.3994274, 3.650575, 1, 1, 1, 1, 1,
0.3635147, -1.68016, 4.510861, 1, 1, 1, 1, 1,
0.3686807, -0.5553865, 0.9309499, 1, 1, 1, 1, 1,
0.370185, -0.4845384, 1.377417, 1, 1, 1, 1, 1,
0.3725766, 0.5547915, 0.5481159, 1, 1, 1, 1, 1,
0.3729636, -0.4688005, 1.753821, 1, 1, 1, 1, 1,
0.3732146, -0.3406537, 2.793446, 1, 1, 1, 1, 1,
0.3766866, 0.3663917, 2.261117, 1, 1, 1, 1, 1,
0.3782754, 0.8351625, -1.518792, 1, 1, 1, 1, 1,
0.3865207, 0.06059402, 0.8978486, 0, 0, 1, 1, 1,
0.3945678, 1.557092, 0.5446481, 1, 0, 0, 1, 1,
0.3952984, -1.448155, 4.075074, 1, 0, 0, 1, 1,
0.3966485, -1.848226, 3.515846, 1, 0, 0, 1, 1,
0.3976254, -1.348728, 3.208936, 1, 0, 0, 1, 1,
0.4008936, 0.3312842, 1.128679, 1, 0, 0, 1, 1,
0.4084923, 0.5658215, 0.6688055, 0, 0, 0, 1, 1,
0.4091393, -0.8358096, 2.079685, 0, 0, 0, 1, 1,
0.4111072, 1.376318, -0.4632366, 0, 0, 0, 1, 1,
0.4154775, -0.1773836, 0.9188861, 0, 0, 0, 1, 1,
0.4172733, -0.7325789, 4.055401, 0, 0, 0, 1, 1,
0.4185506, -0.007727681, 0.6984048, 0, 0, 0, 1, 1,
0.4186691, 0.3202496, 2.093042, 0, 0, 0, 1, 1,
0.4206247, 1.715604, 0.3785335, 1, 1, 1, 1, 1,
0.4236017, -0.05127361, 0.6024594, 1, 1, 1, 1, 1,
0.4268784, 1.29328, 0.4702268, 1, 1, 1, 1, 1,
0.4277574, 2.028157, 1.588645, 1, 1, 1, 1, 1,
0.4292022, 0.09377379, 0.9299591, 1, 1, 1, 1, 1,
0.431182, 1.655908, 0.7794987, 1, 1, 1, 1, 1,
0.4397742, 0.1586765, 0.2223041, 1, 1, 1, 1, 1,
0.4430283, 0.02109051, 0.04437842, 1, 1, 1, 1, 1,
0.4437463, 0.8689375, 1.802339, 1, 1, 1, 1, 1,
0.4455079, 0.02242512, -0.1486516, 1, 1, 1, 1, 1,
0.4512784, -0.1279715, 2.693817, 1, 1, 1, 1, 1,
0.4562048, 2.245223, 0.007759217, 1, 1, 1, 1, 1,
0.4570507, 0.5131968, 2.781113, 1, 1, 1, 1, 1,
0.4635668, -0.7246231, 2.175008, 1, 1, 1, 1, 1,
0.4681836, 1.687243, -0.06401543, 1, 1, 1, 1, 1,
0.4687043, 0.2470991, 2.18481, 0, 0, 1, 1, 1,
0.4721442, 0.5553543, -0.5567443, 1, 0, 0, 1, 1,
0.4735717, -0.9875451, 1.785462, 1, 0, 0, 1, 1,
0.4755128, 0.7896727, 1.715169, 1, 0, 0, 1, 1,
0.4762464, -0.5215994, 3.093846, 1, 0, 0, 1, 1,
0.478239, 0.3504692, 3.072271, 1, 0, 0, 1, 1,
0.4809528, 0.768554, 0.1257487, 0, 0, 0, 1, 1,
0.4817808, -0.04674923, 1.18675, 0, 0, 0, 1, 1,
0.4821142, 1.391743, -0.1872243, 0, 0, 0, 1, 1,
0.4869601, -0.7180585, 2.428505, 0, 0, 0, 1, 1,
0.4872327, -0.7471439, 2.374437, 0, 0, 0, 1, 1,
0.4877939, -0.9085723, 1.416003, 0, 0, 0, 1, 1,
0.4920247, -0.6931148, 3.037547, 0, 0, 0, 1, 1,
0.4926499, 0.6745054, 1.817652, 1, 1, 1, 1, 1,
0.4955392, 0.008736305, 1.170547, 1, 1, 1, 1, 1,
0.4961742, 1.225275, 1.115432, 1, 1, 1, 1, 1,
0.4973422, -0.4540939, 1.982055, 1, 1, 1, 1, 1,
0.4993689, 2.598321, 1.975959, 1, 1, 1, 1, 1,
0.5019479, 0.9721471, 1.299602, 1, 1, 1, 1, 1,
0.5038015, -0.2902615, 2.406874, 1, 1, 1, 1, 1,
0.5052603, 0.4804838, 0.3942598, 1, 1, 1, 1, 1,
0.5063441, -1.192031, 3.027317, 1, 1, 1, 1, 1,
0.5133474, -0.6767276, 2.021332, 1, 1, 1, 1, 1,
0.515183, 0.9832623, 0.5523823, 1, 1, 1, 1, 1,
0.5155988, -0.8927796, 2.528681, 1, 1, 1, 1, 1,
0.5172453, -1.838551, 3.071611, 1, 1, 1, 1, 1,
0.5178474, -0.3629369, 2.984241, 1, 1, 1, 1, 1,
0.5186604, -1.048247, 3.760907, 1, 1, 1, 1, 1,
0.527303, 1.930141, -0.3249085, 0, 0, 1, 1, 1,
0.527808, -0.8420067, 0.8276849, 1, 0, 0, 1, 1,
0.528083, 1.347548, -0.05425471, 1, 0, 0, 1, 1,
0.5288306, 0.1771894, 1.687128, 1, 0, 0, 1, 1,
0.5312598, 0.7962469, 1.68574, 1, 0, 0, 1, 1,
0.5400778, 0.1448177, 0.8504035, 1, 0, 0, 1, 1,
0.5402344, -1.832907, 2.130484, 0, 0, 0, 1, 1,
0.5405428, -0.1483323, -0.2129111, 0, 0, 0, 1, 1,
0.5407447, 0.9195541, 2.558778, 0, 0, 0, 1, 1,
0.544278, -0.8515239, 2.063006, 0, 0, 0, 1, 1,
0.5447276, -0.4873728, 2.780632, 0, 0, 0, 1, 1,
0.5471482, -0.6453019, 0.4315113, 0, 0, 0, 1, 1,
0.5473682, -0.7424654, 1.475319, 0, 0, 0, 1, 1,
0.5523415, -1.018284, 0.5879819, 1, 1, 1, 1, 1,
0.5542402, 1.132951, 0.7590909, 1, 1, 1, 1, 1,
0.5555478, -0.565709, 2.643547, 1, 1, 1, 1, 1,
0.5559042, -0.5931356, 1.506837, 1, 1, 1, 1, 1,
0.5566367, 1.725204, -0.5635698, 1, 1, 1, 1, 1,
0.5601822, 0.8860284, 1.050562, 1, 1, 1, 1, 1,
0.5655378, -0.2249511, 2.745056, 1, 1, 1, 1, 1,
0.5724474, 0.1075036, 0.9657795, 1, 1, 1, 1, 1,
0.5735232, -0.3657943, 2.75557, 1, 1, 1, 1, 1,
0.5736298, -0.04761097, 2.038354, 1, 1, 1, 1, 1,
0.5771558, -0.2884476, 2.031288, 1, 1, 1, 1, 1,
0.5822846, -0.2646092, -0.005485102, 1, 1, 1, 1, 1,
0.583183, -0.5412578, 2.355903, 1, 1, 1, 1, 1,
0.5842315, -0.5021175, 3.202648, 1, 1, 1, 1, 1,
0.5857258, 1.620014, -0.9756523, 1, 1, 1, 1, 1,
0.588309, -0.4481192, 3.147304, 0, 0, 1, 1, 1,
0.589009, 0.8714126, 1.136713, 1, 0, 0, 1, 1,
0.5907145, -0.9733923, 1.602359, 1, 0, 0, 1, 1,
0.5911911, 0.9283024, 0.8613687, 1, 0, 0, 1, 1,
0.5914004, -0.2470797, 2.247339, 1, 0, 0, 1, 1,
0.5984058, -0.4660616, 1.445213, 1, 0, 0, 1, 1,
0.5991981, -1.024608, 2.134061, 0, 0, 0, 1, 1,
0.6015993, -1.244702, 2.471371, 0, 0, 0, 1, 1,
0.6027639, -0.134791, 2.799015, 0, 0, 0, 1, 1,
0.6039977, -0.5877537, 3.564103, 0, 0, 0, 1, 1,
0.6047524, -0.2682057, 1.831799, 0, 0, 0, 1, 1,
0.6059032, 0.6795259, 0.5918463, 0, 0, 0, 1, 1,
0.6227919, 1.74993, 0.3602228, 0, 0, 0, 1, 1,
0.626322, -0.8108506, 3.416914, 1, 1, 1, 1, 1,
0.6286497, 2.084773, -0.6757872, 1, 1, 1, 1, 1,
0.6295317, 0.7800761, -1.557307, 1, 1, 1, 1, 1,
0.6337396, 1.540112, 1.026426, 1, 1, 1, 1, 1,
0.6401902, -0.9822001, 3.520684, 1, 1, 1, 1, 1,
0.6417156, -0.3757013, 2.452424, 1, 1, 1, 1, 1,
0.6418826, -1.040313, 2.157211, 1, 1, 1, 1, 1,
0.6420127, -0.160749, 2.343516, 1, 1, 1, 1, 1,
0.644919, 2.052831, -0.1835493, 1, 1, 1, 1, 1,
0.6517768, -0.4542833, 2.345095, 1, 1, 1, 1, 1,
0.652664, 0.1785788, 1.850144, 1, 1, 1, 1, 1,
0.6540027, -0.7507196, 2.703044, 1, 1, 1, 1, 1,
0.6547878, -0.0642246, 1.511021, 1, 1, 1, 1, 1,
0.6557077, -1.984491, 1.473048, 1, 1, 1, 1, 1,
0.6586298, -0.375677, 1.795426, 1, 1, 1, 1, 1,
0.6598591, 1.609496, 1.50546, 0, 0, 1, 1, 1,
0.6629862, -0.3045031, 1.689894, 1, 0, 0, 1, 1,
0.6654732, -0.7955887, 2.704469, 1, 0, 0, 1, 1,
0.6664926, 0.8648826, -0.008976877, 1, 0, 0, 1, 1,
0.6694791, -0.002745675, 1.715231, 1, 0, 0, 1, 1,
0.6758385, -0.1901266, 1.749784, 1, 0, 0, 1, 1,
0.6758765, 0.1871788, 0.1094306, 0, 0, 0, 1, 1,
0.6765674, -0.6154661, 2.937357, 0, 0, 0, 1, 1,
0.6773775, -2.270422, 1.877924, 0, 0, 0, 1, 1,
0.6796118, -1.264282, 2.22594, 0, 0, 0, 1, 1,
0.6844671, 0.9854766, 0.3346826, 0, 0, 0, 1, 1,
0.6884999, 0.4105686, 1.608993, 0, 0, 0, 1, 1,
0.6890017, 1.475958, 2.836702, 0, 0, 0, 1, 1,
0.6895126, -0.3123374, 2.336707, 1, 1, 1, 1, 1,
0.6912614, 0.1495438, 1.949768, 1, 1, 1, 1, 1,
0.6928531, -0.6157023, 2.489656, 1, 1, 1, 1, 1,
0.6955467, -0.6744248, 3.206797, 1, 1, 1, 1, 1,
0.6955664, -0.3082716, 1.669145, 1, 1, 1, 1, 1,
0.698158, -0.9945957, 1.648024, 1, 1, 1, 1, 1,
0.7018036, -0.9171396, 2.173115, 1, 1, 1, 1, 1,
0.7056736, 1.298542, 0.162292, 1, 1, 1, 1, 1,
0.7102937, -0.2825204, 2.509809, 1, 1, 1, 1, 1,
0.7140781, -0.7446259, 2.073826, 1, 1, 1, 1, 1,
0.7189746, -1.807361, 3.485556, 1, 1, 1, 1, 1,
0.7200441, 1.051452, 2.01783, 1, 1, 1, 1, 1,
0.721653, 1.405557, 0.5219491, 1, 1, 1, 1, 1,
0.7277163, -0.1454597, 2.270584, 1, 1, 1, 1, 1,
0.7312539, -2.546124, 1.485777, 1, 1, 1, 1, 1,
0.7378275, -1.556966, 3.304163, 0, 0, 1, 1, 1,
0.738943, 1.902075, 1.880831, 1, 0, 0, 1, 1,
0.7433966, 1.620146, -1.259717, 1, 0, 0, 1, 1,
0.7442237, 0.1168179, -0.4680318, 1, 0, 0, 1, 1,
0.7451342, -0.02352453, 2.153737, 1, 0, 0, 1, 1,
0.7463655, 1.300888, 1.546151, 1, 0, 0, 1, 1,
0.750441, -0.2534253, 0.7186892, 0, 0, 0, 1, 1,
0.7584007, 0.4298107, 0.906735, 0, 0, 0, 1, 1,
0.7624363, 1.036338, 1.135723, 0, 0, 0, 1, 1,
0.7763301, -0.5043097, 1.686531, 0, 0, 0, 1, 1,
0.7789547, 0.9258407, -0.7669156, 0, 0, 0, 1, 1,
0.780747, -1.124138, 2.718685, 0, 0, 0, 1, 1,
0.7871053, -0.728177, 1.818021, 0, 0, 0, 1, 1,
0.7926955, -0.459906, 2.589851, 1, 1, 1, 1, 1,
0.7936098, 0.3229103, 1.569984, 1, 1, 1, 1, 1,
0.7953885, 1.622434, -0.05810123, 1, 1, 1, 1, 1,
0.796454, 0.1462436, 1.45737, 1, 1, 1, 1, 1,
0.7977729, -0.9870389, 0.6683033, 1, 1, 1, 1, 1,
0.8004264, 0.3901863, -0.6606965, 1, 1, 1, 1, 1,
0.803741, -0.03030611, 1.317945, 1, 1, 1, 1, 1,
0.8043505, -0.04193715, 1.049687, 1, 1, 1, 1, 1,
0.8067995, 1.124831, 1.144294, 1, 1, 1, 1, 1,
0.8083619, 0.4448524, 0.3916006, 1, 1, 1, 1, 1,
0.8131925, -1.052163, 2.23206, 1, 1, 1, 1, 1,
0.8205235, 0.539734, 1.41536, 1, 1, 1, 1, 1,
0.8232347, -0.1348554, 2.899425, 1, 1, 1, 1, 1,
0.8239788, -0.3163096, 2.910798, 1, 1, 1, 1, 1,
0.8260737, 0.2976861, 2.637399, 1, 1, 1, 1, 1,
0.8272458, 0.9395422, 2.800871, 0, 0, 1, 1, 1,
0.8275544, 1.528525, -1.184836, 1, 0, 0, 1, 1,
0.8297461, -0.3398148, 0.8481529, 1, 0, 0, 1, 1,
0.8304239, 0.1693002, 1.224639, 1, 0, 0, 1, 1,
0.830535, 0.6923194, 2.252937, 1, 0, 0, 1, 1,
0.8342373, 1.159002, -0.3095834, 1, 0, 0, 1, 1,
0.8365057, 0.2966136, 0.9713843, 0, 0, 0, 1, 1,
0.8380915, -0.4413695, 3.492758, 0, 0, 0, 1, 1,
0.8444393, -0.8132665, 1.794868, 0, 0, 0, 1, 1,
0.8464189, 0.1808155, 1.594042, 0, 0, 0, 1, 1,
0.8490314, -0.3449458, 2.848313, 0, 0, 0, 1, 1,
0.8509318, 1.378499, -0.08664563, 0, 0, 0, 1, 1,
0.8538979, -1.098066, 2.22708, 0, 0, 0, 1, 1,
0.8580753, 2.062781, 1.591429, 1, 1, 1, 1, 1,
0.8592002, -0.7897411, 3.203342, 1, 1, 1, 1, 1,
0.8628855, 1.098377, 2.061487, 1, 1, 1, 1, 1,
0.8629974, -2.911426, 2.769058, 1, 1, 1, 1, 1,
0.8630215, -0.5958473, 4.376887, 1, 1, 1, 1, 1,
0.8670161, 0.4350789, 0.9276323, 1, 1, 1, 1, 1,
0.8674637, 0.1107791, 2.540544, 1, 1, 1, 1, 1,
0.8676873, -1.022169, 0.1790925, 1, 1, 1, 1, 1,
0.8694819, -0.1780815, -0.0007167732, 1, 1, 1, 1, 1,
0.8735089, -1.403794, 4.809824, 1, 1, 1, 1, 1,
0.8817711, 0.7458121, -0.3244615, 1, 1, 1, 1, 1,
0.8953428, 0.2703654, 2.613093, 1, 1, 1, 1, 1,
0.8973571, 0.4567373, 1.832365, 1, 1, 1, 1, 1,
0.900576, -0.3125882, 2.17745, 1, 1, 1, 1, 1,
0.9045772, 1.804152, -1.016598, 1, 1, 1, 1, 1,
0.9054956, 0.3343023, 2.249107, 0, 0, 1, 1, 1,
0.9058363, 0.9074643, 2.511127, 1, 0, 0, 1, 1,
0.9078516, 0.2034306, 1.184572, 1, 0, 0, 1, 1,
0.9121253, -1.081475, 3.471759, 1, 0, 0, 1, 1,
0.9131198, 0.6143208, 1.49546, 1, 0, 0, 1, 1,
0.9276537, 0.9331173, 1.545514, 1, 0, 0, 1, 1,
0.9277717, -0.1549599, 2.171136, 0, 0, 0, 1, 1,
0.9280271, -0.8399584, 4.361005, 0, 0, 0, 1, 1,
0.9317605, 0.4609217, 1.447435, 0, 0, 0, 1, 1,
0.9343877, 1.432412, 0.02817805, 0, 0, 0, 1, 1,
0.9401204, 0.4286015, 2.331408, 0, 0, 0, 1, 1,
0.9672525, -0.6744596, 2.602346, 0, 0, 0, 1, 1,
0.9739993, -1.113156, 2.770705, 0, 0, 0, 1, 1,
0.9799348, 0.8080735, 1.103443, 1, 1, 1, 1, 1,
0.9887181, 2.532798, 1.223621, 1, 1, 1, 1, 1,
0.9912296, -0.6259575, 3.512074, 1, 1, 1, 1, 1,
0.994589, 1.011333, 1.479121, 1, 1, 1, 1, 1,
1.00175, 0.8777015, 0.3166103, 1, 1, 1, 1, 1,
1.020526, 0.9939473, 1.281739, 1, 1, 1, 1, 1,
1.021566, 1.185187, -0.1730286, 1, 1, 1, 1, 1,
1.027702, -0.3945335, 0.1165904, 1, 1, 1, 1, 1,
1.039806, -0.01184499, 0.7052794, 1, 1, 1, 1, 1,
1.044032, 0.2181593, 0.7594556, 1, 1, 1, 1, 1,
1.068372, -0.1255182, 2.605507, 1, 1, 1, 1, 1,
1.078311, 0.8030553, 0.1544714, 1, 1, 1, 1, 1,
1.09638, 0.9694276, 1.044166, 1, 1, 1, 1, 1,
1.101832, 0.02008406, 0.2254559, 1, 1, 1, 1, 1,
1.103985, 1.097456, -1.01398, 1, 1, 1, 1, 1,
1.107014, -0.6435893, 2.178057, 0, 0, 1, 1, 1,
1.112852, 1.809441, 0.5194257, 1, 0, 0, 1, 1,
1.129565, -0.7346557, 1.194622, 1, 0, 0, 1, 1,
1.132528, -0.4959344, 1.773258, 1, 0, 0, 1, 1,
1.142533, 0.6234367, 1.221202, 1, 0, 0, 1, 1,
1.142596, -1.546555, 4.150899, 1, 0, 0, 1, 1,
1.147652, 2.274754, 2.225238, 0, 0, 0, 1, 1,
1.153549, 1.134918, 0.6567396, 0, 0, 0, 1, 1,
1.15419, 1.011511, -0.8320807, 0, 0, 0, 1, 1,
1.160624, -1.182513, 2.455362, 0, 0, 0, 1, 1,
1.163371, -0.6750637, 3.330778, 0, 0, 0, 1, 1,
1.163792, -0.3353881, 2.223583, 0, 0, 0, 1, 1,
1.164527, 0.308302, 0.06728188, 0, 0, 0, 1, 1,
1.189041, 0.6816351, 2.408078, 1, 1, 1, 1, 1,
1.189222, 0.6790428, 0.2764292, 1, 1, 1, 1, 1,
1.189942, 0.9494388, 2.243315, 1, 1, 1, 1, 1,
1.198649, 0.7152904, 0.01379451, 1, 1, 1, 1, 1,
1.202541, 0.03472, 2.161118, 1, 1, 1, 1, 1,
1.212178, 1.297891, 0.07836179, 1, 1, 1, 1, 1,
1.21347, -0.7464369, 4.344806, 1, 1, 1, 1, 1,
1.223983, -0.9067545, 2.700655, 1, 1, 1, 1, 1,
1.225212, 1.304948, 0.5386353, 1, 1, 1, 1, 1,
1.225762, 0.1232103, 0.4855205, 1, 1, 1, 1, 1,
1.241237, 1.380854, 1.200843, 1, 1, 1, 1, 1,
1.256116, -0.35557, 1.908456, 1, 1, 1, 1, 1,
1.257137, 1.156353, 2.232602, 1, 1, 1, 1, 1,
1.259266, -0.8457641, 3.19735, 1, 1, 1, 1, 1,
1.265063, 1.113281, -0.04735966, 1, 1, 1, 1, 1,
1.273362, -0.002546881, 0.1636131, 0, 0, 1, 1, 1,
1.282635, 0.2538914, 0.7834036, 1, 0, 0, 1, 1,
1.285362, -1.135711, 2.853483, 1, 0, 0, 1, 1,
1.288772, 0.1200173, 0.7458907, 1, 0, 0, 1, 1,
1.289503, 0.7998654, 2.094531, 1, 0, 0, 1, 1,
1.298456, 0.7845874, -0.5700441, 1, 0, 0, 1, 1,
1.312405, -0.4451958, 0.6833346, 0, 0, 0, 1, 1,
1.316519, 0.1646023, 1.6866, 0, 0, 0, 1, 1,
1.31757, 0.1916133, 0.3408213, 0, 0, 0, 1, 1,
1.319852, -0.2513955, -1.140524, 0, 0, 0, 1, 1,
1.321597, 0.3820197, 0.3345207, 0, 0, 0, 1, 1,
1.332948, -0.6424842, 3.735327, 0, 0, 0, 1, 1,
1.344204, -1.214348, 1.712127, 0, 0, 0, 1, 1,
1.363826, -0.3109536, 1.230318, 1, 1, 1, 1, 1,
1.37019, 0.3049987, 0.7548872, 1, 1, 1, 1, 1,
1.370365, 0.7038092, 1.065122, 1, 1, 1, 1, 1,
1.375522, 1.632526, 1.460406, 1, 1, 1, 1, 1,
1.378256, -0.2255784, 1.664657, 1, 1, 1, 1, 1,
1.390096, 1.735042, -0.7003708, 1, 1, 1, 1, 1,
1.391914, -0.5865923, 0.8634192, 1, 1, 1, 1, 1,
1.395242, 1.051681, 0.442498, 1, 1, 1, 1, 1,
1.398057, -1.076994, 1.335142, 1, 1, 1, 1, 1,
1.40042, 0.4551172, 1.183817, 1, 1, 1, 1, 1,
1.407769, 0.01068602, 1.555981, 1, 1, 1, 1, 1,
1.42538, 0.1677131, 2.000674, 1, 1, 1, 1, 1,
1.430525, 1.099278, 0.472098, 1, 1, 1, 1, 1,
1.444449, -2.465888, 3.001051, 1, 1, 1, 1, 1,
1.446778, 0.3884038, 2.626275, 1, 1, 1, 1, 1,
1.448914, 0.2344628, 2.187374, 0, 0, 1, 1, 1,
1.449661, -0.6695099, 2.959017, 1, 0, 0, 1, 1,
1.464387, -0.2205, 0.5472119, 1, 0, 0, 1, 1,
1.481189, 0.2675266, 2.108252, 1, 0, 0, 1, 1,
1.483843, 0.6907572, 1.218764, 1, 0, 0, 1, 1,
1.502723, -0.2284951, 2.83408, 1, 0, 0, 1, 1,
1.503814, -0.8899871, 2.41154, 0, 0, 0, 1, 1,
1.508006, 0.2161908, 0.492516, 0, 0, 0, 1, 1,
1.510659, -0.2084188, 1.772095, 0, 0, 0, 1, 1,
1.517139, -0.3035043, 1.856777, 0, 0, 0, 1, 1,
1.518443, 0.1490942, 2.613861, 0, 0, 0, 1, 1,
1.522834, -0.9109035, 1.209871, 0, 0, 0, 1, 1,
1.535286, -1.87987, 2.313711, 0, 0, 0, 1, 1,
1.562082, -0.342179, 0.3838726, 1, 1, 1, 1, 1,
1.581245, 0.06248215, 1.098487, 1, 1, 1, 1, 1,
1.589505, -0.6595908, 2.980766, 1, 1, 1, 1, 1,
1.617656, -1.077844, 2.207473, 1, 1, 1, 1, 1,
1.621972, 0.3016795, 0.9277939, 1, 1, 1, 1, 1,
1.622467, 0.09212588, 2.620862, 1, 1, 1, 1, 1,
1.631314, -1.086794, 3.429377, 1, 1, 1, 1, 1,
1.633053, 0.1925939, 1.115745, 1, 1, 1, 1, 1,
1.64977, -0.2224718, 2.090314, 1, 1, 1, 1, 1,
1.658223, -1.160051, -0.01511989, 1, 1, 1, 1, 1,
1.66383, -0.2962229, 4.081367, 1, 1, 1, 1, 1,
1.67115, -0.1037702, 2.507625, 1, 1, 1, 1, 1,
1.674688, 1.397651, -0.9069698, 1, 1, 1, 1, 1,
1.706819, 0.9247266, -0.5688882, 1, 1, 1, 1, 1,
1.715886, 2.088424, 1.937959, 1, 1, 1, 1, 1,
1.736128, -0.3535886, -0.5073023, 0, 0, 1, 1, 1,
1.738807, 0.9399171, 0.6134136, 1, 0, 0, 1, 1,
1.741757, 0.2994155, -0.1671408, 1, 0, 0, 1, 1,
1.747519, 1.763724, 0.2841097, 1, 0, 0, 1, 1,
1.7895, -0.1726406, 0.505742, 1, 0, 0, 1, 1,
1.790119, 0.7722611, 0.9222908, 1, 0, 0, 1, 1,
1.800042, -1.229824, 0.7579774, 0, 0, 0, 1, 1,
1.800337, -3.436919, 1.760485, 0, 0, 0, 1, 1,
1.85876, 1.254397, 1.821333, 0, 0, 0, 1, 1,
1.869338, 0.0337619, 1.200055, 0, 0, 0, 1, 1,
1.8757, 0.1600801, 2.574716, 0, 0, 0, 1, 1,
1.880424, -0.09968035, 2.44082, 0, 0, 0, 1, 1,
1.909738, -0.003124493, 1.755453, 0, 0, 0, 1, 1,
1.934099, -0.7357104, 2.33083, 1, 1, 1, 1, 1,
1.943467, 0.3764366, 2.058025, 1, 1, 1, 1, 1,
1.945869, 0.7846473, 1.196773, 1, 1, 1, 1, 1,
1.946454, 0.3392197, -1.316322, 1, 1, 1, 1, 1,
1.968736, 0.9900033, 2.361625, 1, 1, 1, 1, 1,
1.971816, 0.6559982, 2.819642, 1, 1, 1, 1, 1,
1.986312, 0.5828293, 1.920362, 1, 1, 1, 1, 1,
1.986842, -0.9647848, 3.521499, 1, 1, 1, 1, 1,
2.000245, 1.149486, 1.470272, 1, 1, 1, 1, 1,
2.002276, 0.8122603, 0.8929546, 1, 1, 1, 1, 1,
2.010432, 0.3916413, 2.124873, 1, 1, 1, 1, 1,
2.035727, 0.05921391, 0.699499, 1, 1, 1, 1, 1,
2.056469, -0.6465542, 2.111817, 1, 1, 1, 1, 1,
2.074142, -1.051072, 3.89023, 1, 1, 1, 1, 1,
2.147834, 2.033961, 1.048025, 1, 1, 1, 1, 1,
2.172267, -0.02511728, 1.550015, 0, 0, 1, 1, 1,
2.179626, 1.868484, 0.7302418, 1, 0, 0, 1, 1,
2.185639, -0.1602301, 2.746098, 1, 0, 0, 1, 1,
2.194264, -1.17825, 4.172403, 1, 0, 0, 1, 1,
2.19454, 0.4741124, 0.2347708, 1, 0, 0, 1, 1,
2.264875, 0.1983222, 1.738314, 1, 0, 0, 1, 1,
2.300531, 0.5282743, 0.7758923, 0, 0, 0, 1, 1,
2.308613, 0.1730935, 1.800317, 0, 0, 0, 1, 1,
2.360007, 0.398812, 2.430419, 0, 0, 0, 1, 1,
2.489311, 0.7437869, 0.6017974, 0, 0, 0, 1, 1,
2.516558, 0.754975, 1.234157, 0, 0, 0, 1, 1,
2.528607, -1.024132, 3.574218, 0, 0, 0, 1, 1,
2.601043, 1.545312, 2.035116, 0, 0, 0, 1, 1,
2.673897, -0.3837143, 0.3967195, 1, 1, 1, 1, 1,
2.707198, -0.7067454, -0.1379362, 1, 1, 1, 1, 1,
2.741225, -1.541685, 3.139295, 1, 1, 1, 1, 1,
2.785071, -0.5277034, 2.797454, 1, 1, 1, 1, 1,
2.845299, -1.409291, 2.144138, 1, 1, 1, 1, 1,
3.041381, 0.8782399, 1.88403, 1, 1, 1, 1, 1,
3.060006, -0.1043522, 2.923982, 1, 1, 1, 1, 1
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
var radius = 9.684645;
var distance = 34.0169;
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
mvMatrix.translate( 0.0658021, 0.2062888, 0.1529267 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.0169);
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
