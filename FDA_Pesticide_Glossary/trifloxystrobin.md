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
-3.980961, 1.766162, -3.172212, 1, 0, 0, 1,
-3.234314, -1.435459, -1.342518, 1, 0.007843138, 0, 1,
-2.681517, 0.1820959, -1.613454, 1, 0.01176471, 0, 1,
-2.605547, 0.006188991, -1.19332, 1, 0.01960784, 0, 1,
-2.478754, -1.682082, -2.43557, 1, 0.02352941, 0, 1,
-2.436639, -1.311842, -3.002442, 1, 0.03137255, 0, 1,
-2.429538, 0.3224461, -0.6536867, 1, 0.03529412, 0, 1,
-2.411962, -0.1864113, -2.080886, 1, 0.04313726, 0, 1,
-2.370729, 0.7669871, -2.280474, 1, 0.04705882, 0, 1,
-2.370322, -1.472614, -0.7753329, 1, 0.05490196, 0, 1,
-2.358995, -1.568698, -2.538528, 1, 0.05882353, 0, 1,
-2.300999, 1.223581, -1.815306, 1, 0.06666667, 0, 1,
-2.210079, 0.602314, -0.3536022, 1, 0.07058824, 0, 1,
-2.180648, 0.5789179, -1.263828, 1, 0.07843138, 0, 1,
-2.145259, -0.8376158, -2.177848, 1, 0.08235294, 0, 1,
-2.12289, -2.591796, -2.482019, 1, 0.09019608, 0, 1,
-2.096283, -0.02320446, -1.893472, 1, 0.09411765, 0, 1,
-2.093241, 0.4423325, -1.644013, 1, 0.1019608, 0, 1,
-2.087693, -0.6000829, -2.831747, 1, 0.1098039, 0, 1,
-2.076472, 0.8408619, -1.484443, 1, 0.1137255, 0, 1,
-2.070209, -0.9769029, -2.016618, 1, 0.1215686, 0, 1,
-2.014586, 1.478632, -0.8445299, 1, 0.1254902, 0, 1,
-2.004303, -0.4429154, -1.458611, 1, 0.1333333, 0, 1,
-1.986107, 0.1654303, -0.7750061, 1, 0.1372549, 0, 1,
-1.944327, 1.063943, 0.1700017, 1, 0.145098, 0, 1,
-1.936307, 1.033873, -2.325328, 1, 0.1490196, 0, 1,
-1.923663, 0.6809955, -0.3334031, 1, 0.1568628, 0, 1,
-1.899168, -0.2932522, -0.372951, 1, 0.1607843, 0, 1,
-1.889464, -0.2331028, -3.703783, 1, 0.1686275, 0, 1,
-1.880491, 1.034668, -1.897221, 1, 0.172549, 0, 1,
-1.852324, -0.63855, -1.198715, 1, 0.1803922, 0, 1,
-1.827192, 1.495052, -0.6350067, 1, 0.1843137, 0, 1,
-1.824927, 0.1075086, -2.849525, 1, 0.1921569, 0, 1,
-1.823392, 0.2320721, -0.3557898, 1, 0.1960784, 0, 1,
-1.793048, -0.06460452, -1.332413, 1, 0.2039216, 0, 1,
-1.791239, 1.133654, -0.6731667, 1, 0.2117647, 0, 1,
-1.78848, -0.39823, -2.829967, 1, 0.2156863, 0, 1,
-1.787313, -0.130765, -2.284279, 1, 0.2235294, 0, 1,
-1.782385, 0.4164266, -2.284363, 1, 0.227451, 0, 1,
-1.760581, -1.423469, -1.52317, 1, 0.2352941, 0, 1,
-1.758269, -0.8974007, -1.518353, 1, 0.2392157, 0, 1,
-1.75701, 1.510306, -0.184602, 1, 0.2470588, 0, 1,
-1.750935, -0.2054314, -3.229213, 1, 0.2509804, 0, 1,
-1.750333, 2.297259, -1.830975, 1, 0.2588235, 0, 1,
-1.738229, -0.216419, -1.542854, 1, 0.2627451, 0, 1,
-1.706301, 0.8895261, -0.5017056, 1, 0.2705882, 0, 1,
-1.693073, -0.23283, -0.66585, 1, 0.2745098, 0, 1,
-1.677465, 0.5537804, -0.9845167, 1, 0.282353, 0, 1,
-1.674486, 1.445697, -2.293819, 1, 0.2862745, 0, 1,
-1.668718, -1.68119, -1.811311, 1, 0.2941177, 0, 1,
-1.666871, 0.4439971, -1.996761, 1, 0.3019608, 0, 1,
-1.662123, -0.9250615, -3.018543, 1, 0.3058824, 0, 1,
-1.657907, -0.6866465, -3.465016, 1, 0.3137255, 0, 1,
-1.641907, 1.192462, -1.455805, 1, 0.3176471, 0, 1,
-1.641228, 1.939352, -0.9416652, 1, 0.3254902, 0, 1,
-1.616814, 0.548978, 0.04895842, 1, 0.3294118, 0, 1,
-1.607986, -0.2052243, -2.886142, 1, 0.3372549, 0, 1,
-1.594916, -0.8764247, -2.136141, 1, 0.3411765, 0, 1,
-1.57791, 0.1602142, -2.458951, 1, 0.3490196, 0, 1,
-1.575743, 2.327614, -0.1957847, 1, 0.3529412, 0, 1,
-1.574446, -0.3604421, -0.7114524, 1, 0.3607843, 0, 1,
-1.563282, 0.162305, -2.171779, 1, 0.3647059, 0, 1,
-1.544538, -1.081096, -2.925469, 1, 0.372549, 0, 1,
-1.530185, 1.184007, -0.8310726, 1, 0.3764706, 0, 1,
-1.527555, 2.119892, -0.1586126, 1, 0.3843137, 0, 1,
-1.517313, 0.335022, 0.3539764, 1, 0.3882353, 0, 1,
-1.500721, 2.55452, -3.235396, 1, 0.3960784, 0, 1,
-1.499671, -0.5489252, -1.585356, 1, 0.4039216, 0, 1,
-1.498998, -0.3522786, -1.330722, 1, 0.4078431, 0, 1,
-1.4973, -0.09515917, -2.953761, 1, 0.4156863, 0, 1,
-1.481409, -0.3015994, -0.6566912, 1, 0.4196078, 0, 1,
-1.474757, -0.1741357, -0.4786632, 1, 0.427451, 0, 1,
-1.469985, 1.034678, -0.9851528, 1, 0.4313726, 0, 1,
-1.466943, -1.284417, -1.753697, 1, 0.4392157, 0, 1,
-1.465261, 1.659387, 0.00620677, 1, 0.4431373, 0, 1,
-1.457755, -0.4676882, -1.485963, 1, 0.4509804, 0, 1,
-1.45684, -1.600545, -1.904156, 1, 0.454902, 0, 1,
-1.449554, 0.08656224, -0.4659072, 1, 0.4627451, 0, 1,
-1.446748, 1.960602, -0.2748052, 1, 0.4666667, 0, 1,
-1.441474, 0.4205298, -1.522491, 1, 0.4745098, 0, 1,
-1.436258, 0.8964809, -0.2370535, 1, 0.4784314, 0, 1,
-1.418714, 1.428091, -1.902827, 1, 0.4862745, 0, 1,
-1.417818, -0.1079217, -1.359196, 1, 0.4901961, 0, 1,
-1.417338, -1.293987, -1.914015, 1, 0.4980392, 0, 1,
-1.406253, 0.1596752, -0.2901932, 1, 0.5058824, 0, 1,
-1.394878, 0.3069739, 0.3063478, 1, 0.509804, 0, 1,
-1.38098, 0.08697969, -1.174989, 1, 0.5176471, 0, 1,
-1.359345, 0.7087958, 0.5463585, 1, 0.5215687, 0, 1,
-1.354452, -1.802517, -1.36613, 1, 0.5294118, 0, 1,
-1.353756, -0.832885, -2.001122, 1, 0.5333334, 0, 1,
-1.349924, 0.6206139, -0.688556, 1, 0.5411765, 0, 1,
-1.342124, -0.1800085, -1.500744, 1, 0.5450981, 0, 1,
-1.338983, 1.147194, -1.500696, 1, 0.5529412, 0, 1,
-1.326351, 0.2556501, -0.4400451, 1, 0.5568628, 0, 1,
-1.324911, -0.2793554, -0.773594, 1, 0.5647059, 0, 1,
-1.315587, 0.5898571, -0.4666413, 1, 0.5686275, 0, 1,
-1.315128, 1.655284, -1.366539, 1, 0.5764706, 0, 1,
-1.310747, -1.238894, -4.124786, 1, 0.5803922, 0, 1,
-1.309513, 2.524148, 0.2731518, 1, 0.5882353, 0, 1,
-1.282773, -0.9600197, -0.5537451, 1, 0.5921569, 0, 1,
-1.277673, 0.5869957, -2.548863, 1, 0.6, 0, 1,
-1.267418, -1.575371, -1.355949, 1, 0.6078432, 0, 1,
-1.266012, -0.3682446, -3.223653, 1, 0.6117647, 0, 1,
-1.265603, 0.006716989, -1.016355, 1, 0.6196079, 0, 1,
-1.264121, 0.3872592, -1.813159, 1, 0.6235294, 0, 1,
-1.259352, 0.9437054, -0.07668511, 1, 0.6313726, 0, 1,
-1.256958, -0.4607916, -0.3416691, 1, 0.6352941, 0, 1,
-1.254594, 0.923444, 1.556612, 1, 0.6431373, 0, 1,
-1.254454, 0.4067308, 0.06543121, 1, 0.6470588, 0, 1,
-1.253089, -0.1158242, 0.2341004, 1, 0.654902, 0, 1,
-1.235558, -0.4781665, -1.695628, 1, 0.6588235, 0, 1,
-1.233303, -0.7265631, -3.935903, 1, 0.6666667, 0, 1,
-1.208899, 1.317371, -1.696704, 1, 0.6705883, 0, 1,
-1.20748, -1.761281, 0.3211151, 1, 0.6784314, 0, 1,
-1.201979, 0.1062467, -1.929152, 1, 0.682353, 0, 1,
-1.195228, -0.9721435, -3.942946, 1, 0.6901961, 0, 1,
-1.19377, 0.3857816, -2.519852, 1, 0.6941177, 0, 1,
-1.182653, -0.8614917, -3.107083, 1, 0.7019608, 0, 1,
-1.177011, 1.077693, -2.166619, 1, 0.7098039, 0, 1,
-1.167043, -0.7578626, -0.3210681, 1, 0.7137255, 0, 1,
-1.144513, 0.108525, -2.971972, 1, 0.7215686, 0, 1,
-1.138752, -0.7318341, -2.051015, 1, 0.7254902, 0, 1,
-1.133947, 0.2181037, -1.962107, 1, 0.7333333, 0, 1,
-1.131837, 0.1329151, -0.2624699, 1, 0.7372549, 0, 1,
-1.129375, 2.229501, -1.322329, 1, 0.7450981, 0, 1,
-1.12843, -0.7067086, -3.765662, 1, 0.7490196, 0, 1,
-1.122493, -0.9576104, -1.121781, 1, 0.7568628, 0, 1,
-1.122295, 0.1238441, 0.3039823, 1, 0.7607843, 0, 1,
-1.114842, -0.4440904, -1.95684, 1, 0.7686275, 0, 1,
-1.110463, 0.3154638, -0.7401941, 1, 0.772549, 0, 1,
-1.110214, -0.2600234, -2.47985, 1, 0.7803922, 0, 1,
-1.109192, 0.4488558, -2.594089, 1, 0.7843137, 0, 1,
-1.102569, 0.7311515, -1.711282, 1, 0.7921569, 0, 1,
-1.097342, 0.1126967, -0.5810984, 1, 0.7960784, 0, 1,
-1.094015, 1.547145, 0.4014584, 1, 0.8039216, 0, 1,
-1.0931, 0.4982663, -0.7954212, 1, 0.8117647, 0, 1,
-1.093023, 0.8883323, -0.263471, 1, 0.8156863, 0, 1,
-1.090905, 1.384643, -0.9215873, 1, 0.8235294, 0, 1,
-1.079358, -0.178218, -1.766252, 1, 0.827451, 0, 1,
-1.077645, -0.3765771, -0.7094612, 1, 0.8352941, 0, 1,
-1.077464, 1.519926, -0.8589984, 1, 0.8392157, 0, 1,
-1.072985, 0.7940621, -0.8647373, 1, 0.8470588, 0, 1,
-1.063609, -0.07373654, -2.127447, 1, 0.8509804, 0, 1,
-1.061298, -0.2417708, -3.802611, 1, 0.8588235, 0, 1,
-1.057617, 0.1035855, -2.614703, 1, 0.8627451, 0, 1,
-1.055026, 0.213223, -1.45922, 1, 0.8705882, 0, 1,
-1.050496, 0.8881689, -0.905821, 1, 0.8745098, 0, 1,
-1.042111, 0.01653436, -1.936285, 1, 0.8823529, 0, 1,
-1.041439, 0.5235956, -1.226269, 1, 0.8862745, 0, 1,
-1.033123, 0.5813081, -0.7876154, 1, 0.8941177, 0, 1,
-1.032897, -0.5344323, -0.8058856, 1, 0.8980392, 0, 1,
-1.032686, -0.2702219, -0.3169949, 1, 0.9058824, 0, 1,
-1.03037, 1.914153, -0.2504244, 1, 0.9137255, 0, 1,
-1.029846, -0.3158154, -3.570977, 1, 0.9176471, 0, 1,
-1.029282, -0.5386443, -2.075507, 1, 0.9254902, 0, 1,
-1.028767, -1.555905, -2.493903, 1, 0.9294118, 0, 1,
-1.02848, -0.560517, -0.2297925, 1, 0.9372549, 0, 1,
-1.022606, 0.7950587, -1.412282, 1, 0.9411765, 0, 1,
-1.014453, 1.199617, -1.438534, 1, 0.9490196, 0, 1,
-1.013996, 1.000922, -0.4430251, 1, 0.9529412, 0, 1,
-0.9931986, -0.8109398, -3.110394, 1, 0.9607843, 0, 1,
-0.9826665, -0.9416618, -2.999478, 1, 0.9647059, 0, 1,
-0.9733871, 1.642922, -1.084025, 1, 0.972549, 0, 1,
-0.9716109, -0.1829392, -1.188566, 1, 0.9764706, 0, 1,
-0.9693816, -0.01356162, 0.637282, 1, 0.9843137, 0, 1,
-0.966863, -0.2532898, -2.071075, 1, 0.9882353, 0, 1,
-0.9629226, 2.3771, 0.9688075, 1, 0.9960784, 0, 1,
-0.9555331, 1.338521, -1.193128, 0.9960784, 1, 0, 1,
-0.954995, 1.52667, 1.198662, 0.9921569, 1, 0, 1,
-0.9522303, -1.077741, -2.80865, 0.9843137, 1, 0, 1,
-0.9485294, -1.012751, -1.29251, 0.9803922, 1, 0, 1,
-0.9460737, -0.404952, -3.240616, 0.972549, 1, 0, 1,
-0.9457507, 0.5025619, -1.154774, 0.9686275, 1, 0, 1,
-0.943393, 1.084737, -1.27693, 0.9607843, 1, 0, 1,
-0.9386113, 0.7027053, 1.034423, 0.9568627, 1, 0, 1,
-0.9353689, -0.007556158, -1.241037, 0.9490196, 1, 0, 1,
-0.9328166, 0.6861528, -1.591855, 0.945098, 1, 0, 1,
-0.93257, -2.290722, -2.638938, 0.9372549, 1, 0, 1,
-0.9175341, -0.9530287, -1.494101, 0.9333333, 1, 0, 1,
-0.9164805, 1.170623, -0.02357668, 0.9254902, 1, 0, 1,
-0.9159986, -0.4480496, -0.9256687, 0.9215686, 1, 0, 1,
-0.915265, -0.9425744, -0.9825187, 0.9137255, 1, 0, 1,
-0.9136257, -0.2489216, -3.221823, 0.9098039, 1, 0, 1,
-0.9097475, -0.2256809, -2.216002, 0.9019608, 1, 0, 1,
-0.8912183, 0.3360664, -1.996633, 0.8941177, 1, 0, 1,
-0.8876219, 1.267855, -0.1710961, 0.8901961, 1, 0, 1,
-0.8736297, 1.427928, -0.8849563, 0.8823529, 1, 0, 1,
-0.8726996, -1.336647, -2.422255, 0.8784314, 1, 0, 1,
-0.8681518, 0.9568132, -0.9271896, 0.8705882, 1, 0, 1,
-0.866275, -1.20103, -4.626434, 0.8666667, 1, 0, 1,
-0.8625693, 0.1669494, -2.836054, 0.8588235, 1, 0, 1,
-0.8605021, 0.2405567, -1.222784, 0.854902, 1, 0, 1,
-0.8602588, 0.3247073, -3.055477, 0.8470588, 1, 0, 1,
-0.8556338, 0.6934987, -1.701786, 0.8431373, 1, 0, 1,
-0.8543053, 0.146273, -1.927865, 0.8352941, 1, 0, 1,
-0.8470423, -0.1736562, -0.7678844, 0.8313726, 1, 0, 1,
-0.837453, 1.947412, 0.7426714, 0.8235294, 1, 0, 1,
-0.8335315, -1.353677, -3.650035, 0.8196079, 1, 0, 1,
-0.8322175, 1.43947, -2.6329, 0.8117647, 1, 0, 1,
-0.8312247, 0.2595238, -0.7726718, 0.8078431, 1, 0, 1,
-0.8272427, 1.396273, 2.041802, 0.8, 1, 0, 1,
-0.8271607, 0.09088244, 0.6279518, 0.7921569, 1, 0, 1,
-0.8128343, -0.5070513, -2.133827, 0.7882353, 1, 0, 1,
-0.8108422, 1.419264, -0.1843175, 0.7803922, 1, 0, 1,
-0.806528, -0.2870763, -1.662783, 0.7764706, 1, 0, 1,
-0.7954311, 0.7011313, -0.4478098, 0.7686275, 1, 0, 1,
-0.7889203, -0.392364, -1.08634, 0.7647059, 1, 0, 1,
-0.7880617, 0.8492929, -0.9973157, 0.7568628, 1, 0, 1,
-0.7786363, -0.7993134, -3.196817, 0.7529412, 1, 0, 1,
-0.7759809, -0.486213, -2.446529, 0.7450981, 1, 0, 1,
-0.772495, 0.825945, -0.9689348, 0.7411765, 1, 0, 1,
-0.7713507, -0.7388067, -1.009415, 0.7333333, 1, 0, 1,
-0.768914, 1.306527, -3.234552, 0.7294118, 1, 0, 1,
-0.7674839, -0.4838437, -2.761515, 0.7215686, 1, 0, 1,
-0.7667665, 0.07206233, -1.631948, 0.7176471, 1, 0, 1,
-0.7649972, 1.567826, -0.6390405, 0.7098039, 1, 0, 1,
-0.7631873, 0.6588592, -1.217531, 0.7058824, 1, 0, 1,
-0.7614861, 1.52392, -1.357816, 0.6980392, 1, 0, 1,
-0.7601357, 0.7464986, 0.23932, 0.6901961, 1, 0, 1,
-0.7598432, 1.250826, -1.449551, 0.6862745, 1, 0, 1,
-0.7575812, -1.251556, -2.123435, 0.6784314, 1, 0, 1,
-0.7542791, 0.6098774, 1.421448, 0.6745098, 1, 0, 1,
-0.7533953, -1.523979, -4.45432, 0.6666667, 1, 0, 1,
-0.7483601, 0.9523412, -0.1384058, 0.6627451, 1, 0, 1,
-0.7470797, 0.3376208, -1.549419, 0.654902, 1, 0, 1,
-0.7462484, 0.1569456, -1.891029, 0.6509804, 1, 0, 1,
-0.7434833, -0.7541145, -2.867216, 0.6431373, 1, 0, 1,
-0.7420284, -0.6681694, -3.237776, 0.6392157, 1, 0, 1,
-0.7402151, -0.585333, -4.100973, 0.6313726, 1, 0, 1,
-0.7379136, 0.3963528, -2.528728, 0.627451, 1, 0, 1,
-0.7376142, 0.6387321, -0.9188982, 0.6196079, 1, 0, 1,
-0.7366803, 0.7221743, 1.00543, 0.6156863, 1, 0, 1,
-0.7269605, 1.727246, 0.5879441, 0.6078432, 1, 0, 1,
-0.7241507, -1.064621, -0.8183929, 0.6039216, 1, 0, 1,
-0.7203394, 0.4387716, -0.9632722, 0.5960785, 1, 0, 1,
-0.7202124, -0.9874379, -2.301514, 0.5882353, 1, 0, 1,
-0.7148367, -0.5133303, -1.327388, 0.5843138, 1, 0, 1,
-0.71412, -0.9743734, -2.668143, 0.5764706, 1, 0, 1,
-0.7124988, 1.65864, -0.6351458, 0.572549, 1, 0, 1,
-0.7066174, -0.7320845, -1.448777, 0.5647059, 1, 0, 1,
-0.7063363, 0.653284, 1.373372, 0.5607843, 1, 0, 1,
-0.698284, 0.3070282, -0.7324157, 0.5529412, 1, 0, 1,
-0.6980221, 0.5186225, -0.9252749, 0.5490196, 1, 0, 1,
-0.6951191, -0.8802947, -2.454241, 0.5411765, 1, 0, 1,
-0.6950721, -0.4222455, -0.9496067, 0.5372549, 1, 0, 1,
-0.6878904, -1.498898, -2.276354, 0.5294118, 1, 0, 1,
-0.6822858, -0.5824574, -3.397924, 0.5254902, 1, 0, 1,
-0.6778992, 1.164773, -1.841288, 0.5176471, 1, 0, 1,
-0.6680117, -1.9173, -4.111915, 0.5137255, 1, 0, 1,
-0.6675564, -1.659414, -1.380892, 0.5058824, 1, 0, 1,
-0.6667634, 1.302266, -1.122382, 0.5019608, 1, 0, 1,
-0.6644114, 1.840048, -0.1307963, 0.4941176, 1, 0, 1,
-0.6563078, -1.408674, -3.480566, 0.4862745, 1, 0, 1,
-0.6559417, -0.8935775, -3.399839, 0.4823529, 1, 0, 1,
-0.6555633, -1.219638, -3.455198, 0.4745098, 1, 0, 1,
-0.6479351, -1.901561, -2.6979, 0.4705882, 1, 0, 1,
-0.6416938, 0.06523577, -1.21655, 0.4627451, 1, 0, 1,
-0.63931, -1.329932, -2.745487, 0.4588235, 1, 0, 1,
-0.630808, 0.6370577, -0.04366248, 0.4509804, 1, 0, 1,
-0.6289475, 0.05802712, -1.533884, 0.4470588, 1, 0, 1,
-0.6257133, 1.542866, 1.070574, 0.4392157, 1, 0, 1,
-0.6225055, 0.1948893, 0.3857971, 0.4352941, 1, 0, 1,
-0.6200283, 0.4340145, -1.712632, 0.427451, 1, 0, 1,
-0.6173723, -0.9158114, -4.498206, 0.4235294, 1, 0, 1,
-0.6152565, 0.9289312, -1.092776, 0.4156863, 1, 0, 1,
-0.6111753, -0.441514, -2.720422, 0.4117647, 1, 0, 1,
-0.6055453, 0.6247832, -0.6497146, 0.4039216, 1, 0, 1,
-0.604749, -0.8579499, -2.774632, 0.3960784, 1, 0, 1,
-0.602175, 1.049079, -1.26353, 0.3921569, 1, 0, 1,
-0.6021304, -0.1900621, -2.789813, 0.3843137, 1, 0, 1,
-0.5997863, -0.6250685, -2.464156, 0.3803922, 1, 0, 1,
-0.5977061, -0.7604066, -1.762646, 0.372549, 1, 0, 1,
-0.5964909, -1.231584, -2.957881, 0.3686275, 1, 0, 1,
-0.5952004, 1.150022, 0.705251, 0.3607843, 1, 0, 1,
-0.593752, 2.097121, -0.3594337, 0.3568628, 1, 0, 1,
-0.5921335, -1.516869, -1.582766, 0.3490196, 1, 0, 1,
-0.5918068, 0.09648597, -1.201396, 0.345098, 1, 0, 1,
-0.5887444, 0.5042418, -1.28746, 0.3372549, 1, 0, 1,
-0.5883976, -1.148566, -3.142923, 0.3333333, 1, 0, 1,
-0.5770473, -0.2010345, -0.9758522, 0.3254902, 1, 0, 1,
-0.57699, 2.312266, 0.03058436, 0.3215686, 1, 0, 1,
-0.5700746, -0.3021465, -4.154325, 0.3137255, 1, 0, 1,
-0.5690085, 1.338277, -2.718033, 0.3098039, 1, 0, 1,
-0.568529, 0.8571908, -1.872587, 0.3019608, 1, 0, 1,
-0.5651265, -1.480275, -3.361978, 0.2941177, 1, 0, 1,
-0.5649468, 0.5389664, -0.4772695, 0.2901961, 1, 0, 1,
-0.5606129, -0.3174264, -0.8353678, 0.282353, 1, 0, 1,
-0.5593827, -0.4773138, -3.698001, 0.2784314, 1, 0, 1,
-0.5583723, 0.7066237, 0.2336179, 0.2705882, 1, 0, 1,
-0.5547785, -0.8027905, -1.916108, 0.2666667, 1, 0, 1,
-0.5498788, -0.2248807, -1.178689, 0.2588235, 1, 0, 1,
-0.5466412, -1.065237, -2.829822, 0.254902, 1, 0, 1,
-0.5449325, -0.2910929, -3.246186, 0.2470588, 1, 0, 1,
-0.5435006, -0.5872619, -2.405207, 0.2431373, 1, 0, 1,
-0.5405428, 1.831544, 0.3461236, 0.2352941, 1, 0, 1,
-0.5389234, 0.6126552, -0.8528755, 0.2313726, 1, 0, 1,
-0.5352837, -0.1679045, -1.978591, 0.2235294, 1, 0, 1,
-0.5315206, -0.4759251, -1.654672, 0.2196078, 1, 0, 1,
-0.5308937, -1.35252, -1.796492, 0.2117647, 1, 0, 1,
-0.5303549, -1.010244, -1.230086, 0.2078431, 1, 0, 1,
-0.5268028, -0.8633263, -1.08299, 0.2, 1, 0, 1,
-0.5253928, -0.28051, -1.04587, 0.1921569, 1, 0, 1,
-0.5229255, -0.3877278, -3.606597, 0.1882353, 1, 0, 1,
-0.5220178, 1.396726, 0.3359296, 0.1803922, 1, 0, 1,
-0.5171115, -0.1796615, -1.904055, 0.1764706, 1, 0, 1,
-0.51709, 1.158251, -1.179115, 0.1686275, 1, 0, 1,
-0.5138976, 0.2522762, -1.386072, 0.1647059, 1, 0, 1,
-0.5127414, -0.5031055, -2.38828, 0.1568628, 1, 0, 1,
-0.5100092, -0.3693789, -3.716453, 0.1529412, 1, 0, 1,
-0.5094255, -1.750273, -3.452704, 0.145098, 1, 0, 1,
-0.5074293, -0.5602036, -3.028011, 0.1411765, 1, 0, 1,
-0.5071876, -0.01283148, -2.229899, 0.1333333, 1, 0, 1,
-0.5067306, 0.1279888, -3.425591, 0.1294118, 1, 0, 1,
-0.5049079, -0.3353021, -2.757941, 0.1215686, 1, 0, 1,
-0.5047363, 1.119689, 0.8157325, 0.1176471, 1, 0, 1,
-0.4985229, -0.7501824, -2.490857, 0.1098039, 1, 0, 1,
-0.4935744, -1.414029, -2.471073, 0.1058824, 1, 0, 1,
-0.4893054, 0.4281342, -1.87338, 0.09803922, 1, 0, 1,
-0.4866037, 1.008125, -0.8635173, 0.09019608, 1, 0, 1,
-0.4853163, 0.6565968, -0.3826528, 0.08627451, 1, 0, 1,
-0.4847917, -0.2965261, -2.876152, 0.07843138, 1, 0, 1,
-0.4793999, 2.874065, -0.787701, 0.07450981, 1, 0, 1,
-0.476543, 0.5498569, 1.103167, 0.06666667, 1, 0, 1,
-0.4725908, -1.792756, -3.174104, 0.0627451, 1, 0, 1,
-0.4724988, -1.836626, -2.815771, 0.05490196, 1, 0, 1,
-0.4704508, 1.249298, -0.7799117, 0.05098039, 1, 0, 1,
-0.4678369, 0.2525503, -1.424222, 0.04313726, 1, 0, 1,
-0.4675958, -0.06125994, -1.643119, 0.03921569, 1, 0, 1,
-0.4639476, 0.6910854, -2.855359, 0.03137255, 1, 0, 1,
-0.462715, -0.3586877, -0.7375156, 0.02745098, 1, 0, 1,
-0.4585177, -0.8889354, -2.610802, 0.01960784, 1, 0, 1,
-0.4578897, 1.139848, -1.503157, 0.01568628, 1, 0, 1,
-0.4506992, -0.1296646, -3.229882, 0.007843138, 1, 0, 1,
-0.4488334, 0.3861851, -0.5214412, 0.003921569, 1, 0, 1,
-0.445543, 0.9063627, -1.644181, 0, 1, 0.003921569, 1,
-0.4434777, 0.8373374, -1.692959, 0, 1, 0.01176471, 1,
-0.4432682, 0.2037145, -0.9990707, 0, 1, 0.01568628, 1,
-0.4362296, -0.455653, -1.286114, 0, 1, 0.02352941, 1,
-0.4310763, 1.752837, -0.02505292, 0, 1, 0.02745098, 1,
-0.4282709, -0.8977454, -3.510478, 0, 1, 0.03529412, 1,
-0.4232166, 1.156844, -1.633867, 0, 1, 0.03921569, 1,
-0.4209045, 0.47001, -1.931568, 0, 1, 0.04705882, 1,
-0.4138186, -0.0207715, -2.529207, 0, 1, 0.05098039, 1,
-0.4098505, -0.05103779, -1.43653, 0, 1, 0.05882353, 1,
-0.4085741, 0.9610742, -0.3986754, 0, 1, 0.0627451, 1,
-0.4051338, -1.442282, -4.268981, 0, 1, 0.07058824, 1,
-0.4038297, 0.8541673, -0.7070274, 0, 1, 0.07450981, 1,
-0.396969, -0.284845, -3.546161, 0, 1, 0.08235294, 1,
-0.3936499, 1.978523, -1.457925, 0, 1, 0.08627451, 1,
-0.3874996, 1.131412, -0.7416241, 0, 1, 0.09411765, 1,
-0.3869205, -1.915567, -1.376479, 0, 1, 0.1019608, 1,
-0.3836971, 0.6072081, 0.2751057, 0, 1, 0.1058824, 1,
-0.3780229, 0.6848914, -1.184954, 0, 1, 0.1137255, 1,
-0.3757477, -0.3551797, -2.494174, 0, 1, 0.1176471, 1,
-0.3744968, -0.7689962, -0.7426322, 0, 1, 0.1254902, 1,
-0.3713684, -2.419723, -3.383513, 0, 1, 0.1294118, 1,
-0.3693153, -1.670243, -3.162051, 0, 1, 0.1372549, 1,
-0.3661222, -1.02584, -2.883198, 0, 1, 0.1411765, 1,
-0.3639612, 0.9489281, -0.5943604, 0, 1, 0.1490196, 1,
-0.3638446, 1.732316, -0.5110216, 0, 1, 0.1529412, 1,
-0.3625485, -0.7484557, -3.377859, 0, 1, 0.1607843, 1,
-0.3592533, 0.3353383, -0.3774634, 0, 1, 0.1647059, 1,
-0.3572893, -0.2376975, -2.243774, 0, 1, 0.172549, 1,
-0.3565065, -0.3057626, -2.804375, 0, 1, 0.1764706, 1,
-0.3525685, 0.3252496, -0.47414, 0, 1, 0.1843137, 1,
-0.3497105, 2.441532, 0.4515262, 0, 1, 0.1882353, 1,
-0.3472267, -0.9550286, -2.397732, 0, 1, 0.1960784, 1,
-0.3351305, 0.1842775, -0.6090382, 0, 1, 0.2039216, 1,
-0.3308473, -0.1418259, -0.9958472, 0, 1, 0.2078431, 1,
-0.3250932, 0.8556957, -0.2914335, 0, 1, 0.2156863, 1,
-0.3245622, -0.5485093, -1.611363, 0, 1, 0.2196078, 1,
-0.3243685, -0.8892123, -4.134898, 0, 1, 0.227451, 1,
-0.3182888, 1.232055, -0.6183175, 0, 1, 0.2313726, 1,
-0.3164259, 0.3059036, -1.22493, 0, 1, 0.2392157, 1,
-0.315972, 1.453428, 1.730758, 0, 1, 0.2431373, 1,
-0.3144743, 0.171986, 0.355919, 0, 1, 0.2509804, 1,
-0.3086618, 0.8384928, 0.02618285, 0, 1, 0.254902, 1,
-0.3040824, -0.6213345, -2.052839, 0, 1, 0.2627451, 1,
-0.3034846, -0.3985302, -2.840765, 0, 1, 0.2666667, 1,
-0.2996278, 2.062575, -0.4687596, 0, 1, 0.2745098, 1,
-0.29704, 0.7124468, -0.04210311, 0, 1, 0.2784314, 1,
-0.2894734, -0.7285275, -3.596692, 0, 1, 0.2862745, 1,
-0.2839495, 0.5849327, 1.187122, 0, 1, 0.2901961, 1,
-0.2829229, -2.153306, -2.667988, 0, 1, 0.2980392, 1,
-0.278609, -0.4743091, -3.205298, 0, 1, 0.3058824, 1,
-0.2771607, 1.173031, -1.161733, 0, 1, 0.3098039, 1,
-0.2755974, 1.232507, -0.3798042, 0, 1, 0.3176471, 1,
-0.2722486, 0.1684118, -1.542148, 0, 1, 0.3215686, 1,
-0.2716518, 0.846896, 0.2970052, 0, 1, 0.3294118, 1,
-0.2707024, -0.2624477, -2.125902, 0, 1, 0.3333333, 1,
-0.2694083, -0.002841245, -4.535235, 0, 1, 0.3411765, 1,
-0.2643879, -0.4006085, -2.438966, 0, 1, 0.345098, 1,
-0.2588296, -0.1307204, -3.559463, 0, 1, 0.3529412, 1,
-0.2579204, -1.728124, -3.61261, 0, 1, 0.3568628, 1,
-0.2557331, -0.6333555, -2.578387, 0, 1, 0.3647059, 1,
-0.254965, 0.8472823, 1.968421, 0, 1, 0.3686275, 1,
-0.2518754, 2.063091, 1.334617, 0, 1, 0.3764706, 1,
-0.2450463, 1.104246, -1.874157, 0, 1, 0.3803922, 1,
-0.2446686, -0.04080093, -1.224557, 0, 1, 0.3882353, 1,
-0.2436559, 0.3074523, -1.20846, 0, 1, 0.3921569, 1,
-0.2434949, -1.637125, -1.147897, 0, 1, 0.4, 1,
-0.2414629, -0.5376807, -3.333298, 0, 1, 0.4078431, 1,
-0.2371445, 0.3344424, -0.4715651, 0, 1, 0.4117647, 1,
-0.235251, 0.4377041, 0.1109018, 0, 1, 0.4196078, 1,
-0.2301812, -1.00769, -2.984175, 0, 1, 0.4235294, 1,
-0.2262759, -1.120448, -1.540398, 0, 1, 0.4313726, 1,
-0.2255148, -0.5422448, -2.906968, 0, 1, 0.4352941, 1,
-0.2235236, -0.3356096, -3.802464, 0, 1, 0.4431373, 1,
-0.2233421, -0.30336, -3.247489, 0, 1, 0.4470588, 1,
-0.2195462, 0.6515376, -1.347256, 0, 1, 0.454902, 1,
-0.2115081, -0.4600904, -2.694501, 0, 1, 0.4588235, 1,
-0.210957, -1.126146, -2.241513, 0, 1, 0.4666667, 1,
-0.2106718, 1.922474, 0.5899433, 0, 1, 0.4705882, 1,
-0.2092502, 0.6326991, 1.303475, 0, 1, 0.4784314, 1,
-0.2058743, 0.2042202, -0.2203777, 0, 1, 0.4823529, 1,
-0.203208, 1.216627, -1.323037, 0, 1, 0.4901961, 1,
-0.2015179, 0.970686, 1.360659, 0, 1, 0.4941176, 1,
-0.2005287, 0.4307083, -0.07811802, 0, 1, 0.5019608, 1,
-0.194745, 0.269305, -1.097336, 0, 1, 0.509804, 1,
-0.1925412, -0.1660465, -1.032654, 0, 1, 0.5137255, 1,
-0.1818691, 0.7606886, -1.031057, 0, 1, 0.5215687, 1,
-0.1766504, 0.8994525, 2.001702, 0, 1, 0.5254902, 1,
-0.1763799, -0.6584175, -2.301139, 0, 1, 0.5333334, 1,
-0.1750415, -0.1255076, -3.22729, 0, 1, 0.5372549, 1,
-0.1748746, -0.3541355, -1.870476, 0, 1, 0.5450981, 1,
-0.1743658, -1.636893, -1.385073, 0, 1, 0.5490196, 1,
-0.1731819, -0.6633281, -2.288964, 0, 1, 0.5568628, 1,
-0.1703233, -0.5974539, -2.039459, 0, 1, 0.5607843, 1,
-0.1696505, -0.8313665, -3.244215, 0, 1, 0.5686275, 1,
-0.1695767, 0.9280362, -0.6358187, 0, 1, 0.572549, 1,
-0.1683362, 1.108622, 0.9848469, 0, 1, 0.5803922, 1,
-0.1637668, -0.7801718, -3.925105, 0, 1, 0.5843138, 1,
-0.1626811, -1.34896, -3.399774, 0, 1, 0.5921569, 1,
-0.1610906, -0.00507438, -2.547712, 0, 1, 0.5960785, 1,
-0.1579614, -0.6100471, -3.732798, 0, 1, 0.6039216, 1,
-0.1551622, -0.7473541, -3.818956, 0, 1, 0.6117647, 1,
-0.1500916, 0.6433597, 1.085558, 0, 1, 0.6156863, 1,
-0.1488596, 2.156341, -0.1098849, 0, 1, 0.6235294, 1,
-0.1483242, -0.3953536, -2.805472, 0, 1, 0.627451, 1,
-0.1467671, -0.6762401, -2.576532, 0, 1, 0.6352941, 1,
-0.1464662, -1.827389, -4.651242, 0, 1, 0.6392157, 1,
-0.1414445, -0.7274433, -2.979272, 0, 1, 0.6470588, 1,
-0.1409441, -1.009843, -2.707137, 0, 1, 0.6509804, 1,
-0.1392266, -0.9483808, -3.141351, 0, 1, 0.6588235, 1,
-0.1241624, 0.1414176, 0.3826927, 0, 1, 0.6627451, 1,
-0.1204384, -0.1876025, -2.856574, 0, 1, 0.6705883, 1,
-0.1189378, -0.5670819, -2.908748, 0, 1, 0.6745098, 1,
-0.1173736, -1.420306, -3.640056, 0, 1, 0.682353, 1,
-0.1170724, 0.1346308, -0.3597186, 0, 1, 0.6862745, 1,
-0.1158539, -1.17976, -3.781265, 0, 1, 0.6941177, 1,
-0.1148523, -0.07579158, -1.495348, 0, 1, 0.7019608, 1,
-0.1117576, 0.5489103, 2.108047, 0, 1, 0.7058824, 1,
-0.1106623, -1.719603, -2.5383, 0, 1, 0.7137255, 1,
-0.1054411, -0.7657536, -1.63679, 0, 1, 0.7176471, 1,
-0.1021362, -0.201869, -2.193992, 0, 1, 0.7254902, 1,
-0.1017825, 0.2551414, -2.491834, 0, 1, 0.7294118, 1,
-0.09968454, 1.136196, -0.7009714, 0, 1, 0.7372549, 1,
-0.09861578, -0.1137119, -4.152676, 0, 1, 0.7411765, 1,
-0.0980188, 0.8191384, -0.2528259, 0, 1, 0.7490196, 1,
-0.09411589, 1.209895, -1.298349, 0, 1, 0.7529412, 1,
-0.0935547, 0.5669649, -0.5588307, 0, 1, 0.7607843, 1,
-0.09054147, -2.17122, -3.559205, 0, 1, 0.7647059, 1,
-0.08064181, 1.215531, -0.5793425, 0, 1, 0.772549, 1,
-0.0788023, -0.05801352, -2.506469, 0, 1, 0.7764706, 1,
-0.07753744, 0.8924194, -0.189052, 0, 1, 0.7843137, 1,
-0.07390986, -0.3591511, -3.354826, 0, 1, 0.7882353, 1,
-0.07353289, -0.06380083, -1.939142, 0, 1, 0.7960784, 1,
-0.07308558, -0.6044474, -3.502578, 0, 1, 0.8039216, 1,
-0.07169836, -1.500536, -2.399215, 0, 1, 0.8078431, 1,
-0.07052588, -1.499697, -4.449316, 0, 1, 0.8156863, 1,
-0.06998814, 1.030132, 0.6452168, 0, 1, 0.8196079, 1,
-0.06739492, -0.2026219, -3.349681, 0, 1, 0.827451, 1,
-0.0664674, 0.4522756, 0.986359, 0, 1, 0.8313726, 1,
-0.06500137, -1.002958, -3.313121, 0, 1, 0.8392157, 1,
-0.06418373, -0.180905, -2.404425, 0, 1, 0.8431373, 1,
-0.06299942, -0.6964287, -2.740082, 0, 1, 0.8509804, 1,
-0.06242195, -1.427619, -4.637416, 0, 1, 0.854902, 1,
-0.05466169, 0.988433, 1.55619, 0, 1, 0.8627451, 1,
-0.05434373, -0.844879, -3.278596, 0, 1, 0.8666667, 1,
-0.04821774, -0.3964371, -3.582066, 0, 1, 0.8745098, 1,
-0.04804749, -0.6344411, -1.407772, 0, 1, 0.8784314, 1,
-0.04598795, 0.7842914, -0.7525747, 0, 1, 0.8862745, 1,
-0.04379505, 1.844746, 0.3051627, 0, 1, 0.8901961, 1,
-0.03595205, 1.8956, -1.166388, 0, 1, 0.8980392, 1,
-0.03479653, -0.9302819, -2.411616, 0, 1, 0.9058824, 1,
-0.0346291, -1.698774, -3.131084, 0, 1, 0.9098039, 1,
-0.02779442, 1.454784, -0.3798661, 0, 1, 0.9176471, 1,
-0.02393985, 2.338224, 0.6141285, 0, 1, 0.9215686, 1,
-0.0228059, 0.1049383, 0.2094664, 0, 1, 0.9294118, 1,
-0.01094145, -0.1963444, -5.000746, 0, 1, 0.9333333, 1,
-0.002179234, -0.4236953, -2.144454, 0, 1, 0.9411765, 1,
0.0003691312, 0.7425151, 0.5209703, 0, 1, 0.945098, 1,
0.004380942, -0.2213084, 4.811663, 0, 1, 0.9529412, 1,
0.006242097, -1.486745, 3.330852, 0, 1, 0.9568627, 1,
0.00839485, 1.66438, -0.678348, 0, 1, 0.9647059, 1,
0.01436657, -0.6948332, 3.815004, 0, 1, 0.9686275, 1,
0.01859945, -0.6793532, 2.355867, 0, 1, 0.9764706, 1,
0.0189762, 0.02364461, 1.467043, 0, 1, 0.9803922, 1,
0.02033559, -1.477149, 4.310649, 0, 1, 0.9882353, 1,
0.02040651, -0.3047462, 2.779838, 0, 1, 0.9921569, 1,
0.02071551, -0.3002, 3.299849, 0, 1, 1, 1,
0.02286579, 0.1030559, 0.7668492, 0, 0.9921569, 1, 1,
0.02309155, -0.1221025, 4.247488, 0, 0.9882353, 1, 1,
0.02542824, -0.3562151, 1.957187, 0, 0.9803922, 1, 1,
0.0289549, -0.3757689, 4.604656, 0, 0.9764706, 1, 1,
0.03068148, -0.1873247, 3.012984, 0, 0.9686275, 1, 1,
0.04160933, -0.4405245, 1.633595, 0, 0.9647059, 1, 1,
0.04690929, 1.169196, 0.7563661, 0, 0.9568627, 1, 1,
0.04920901, 0.5181888, 0.09722123, 0, 0.9529412, 1, 1,
0.0506038, -2.484497, 3.146076, 0, 0.945098, 1, 1,
0.05378805, 0.4261862, -0.3979273, 0, 0.9411765, 1, 1,
0.05588457, -0.202442, 3.693352, 0, 0.9333333, 1, 1,
0.0592621, 0.9517779, -0.2103794, 0, 0.9294118, 1, 1,
0.0608152, -0.6338424, 2.568039, 0, 0.9215686, 1, 1,
0.06752805, 0.2865174, 1.512493, 0, 0.9176471, 1, 1,
0.06813961, 0.5807946, -0.2825342, 0, 0.9098039, 1, 1,
0.07050262, 1.55897, -0.4229434, 0, 0.9058824, 1, 1,
0.07210846, -0.07897615, 1.449623, 0, 0.8980392, 1, 1,
0.08137386, 0.6378402, 0.3806785, 0, 0.8901961, 1, 1,
0.08296373, 0.0757042, 1.667592, 0, 0.8862745, 1, 1,
0.08321618, 0.9098276, 0.06865218, 0, 0.8784314, 1, 1,
0.083835, 0.7463608, 0.3228852, 0, 0.8745098, 1, 1,
0.0841706, 0.08287957, 1.930376, 0, 0.8666667, 1, 1,
0.08660056, -1.202156, 4.255095, 0, 0.8627451, 1, 1,
0.09513764, -1.061224, 3.188133, 0, 0.854902, 1, 1,
0.09694694, -1.275154, 2.053764, 0, 0.8509804, 1, 1,
0.09809605, -0.7428578, 5.460472, 0, 0.8431373, 1, 1,
0.1066157, -0.08901196, 1.732697, 0, 0.8392157, 1, 1,
0.112841, 0.7797371, -1.517861, 0, 0.8313726, 1, 1,
0.1152467, 0.7294273, -1.410733, 0, 0.827451, 1, 1,
0.1170064, 0.7556102, -0.8301137, 0, 0.8196079, 1, 1,
0.1176337, 0.6855872, 0.1026959, 0, 0.8156863, 1, 1,
0.1204903, -0.1514192, 2.412721, 0, 0.8078431, 1, 1,
0.1278085, -0.4011542, 3.332003, 0, 0.8039216, 1, 1,
0.1316668, 1.498425, 0.3220612, 0, 0.7960784, 1, 1,
0.1318436, 0.9448178, 0.06636779, 0, 0.7882353, 1, 1,
0.1350646, -1.376127, 1.943166, 0, 0.7843137, 1, 1,
0.1361758, -0.1206974, 2.454636, 0, 0.7764706, 1, 1,
0.1408017, -0.7449628, 1.320436, 0, 0.772549, 1, 1,
0.1536474, 0.2704553, -0.254745, 0, 0.7647059, 1, 1,
0.1581809, 2.852734, 1.226119, 0, 0.7607843, 1, 1,
0.1600532, 1.618136, 1.117375, 0, 0.7529412, 1, 1,
0.162119, -2.568792, 3.408822, 0, 0.7490196, 1, 1,
0.1630354, -0.2308743, 1.067153, 0, 0.7411765, 1, 1,
0.1724867, -1.003484, 3.232346, 0, 0.7372549, 1, 1,
0.182853, 0.7481352, 1.772282, 0, 0.7294118, 1, 1,
0.1867636, 1.50334, -0.5360658, 0, 0.7254902, 1, 1,
0.188025, 0.3394666, 1.394627, 0, 0.7176471, 1, 1,
0.1897552, -0.171702, 3.758924, 0, 0.7137255, 1, 1,
0.1926856, 0.06446648, 1.605892, 0, 0.7058824, 1, 1,
0.1955066, 1.445804, 0.1370195, 0, 0.6980392, 1, 1,
0.1985149, -0.9325132, 3.22532, 0, 0.6941177, 1, 1,
0.2035889, 1.100656, 0.1794476, 0, 0.6862745, 1, 1,
0.2037698, -0.4434004, 3.126873, 0, 0.682353, 1, 1,
0.2057642, -0.4805706, 1.997421, 0, 0.6745098, 1, 1,
0.2121682, -0.5565671, 2.981832, 0, 0.6705883, 1, 1,
0.214925, 0.6576589, 0.9488033, 0, 0.6627451, 1, 1,
0.2157374, 0.6291545, 0.3704459, 0, 0.6588235, 1, 1,
0.219567, 1.105965, 1.141892, 0, 0.6509804, 1, 1,
0.222508, 0.02047565, 1.285187, 0, 0.6470588, 1, 1,
0.2242235, 0.3160731, -0.5951014, 0, 0.6392157, 1, 1,
0.2272014, 0.5024627, -0.06157251, 0, 0.6352941, 1, 1,
0.2273434, 0.9146404, 1.419212, 0, 0.627451, 1, 1,
0.228193, -0.2169918, 3.600955, 0, 0.6235294, 1, 1,
0.2291783, 0.1557445, 1.702273, 0, 0.6156863, 1, 1,
0.2330219, 0.1231237, 1.289276, 0, 0.6117647, 1, 1,
0.2353467, 0.457384, 0.559221, 0, 0.6039216, 1, 1,
0.237785, -0.4629484, 0.9492792, 0, 0.5960785, 1, 1,
0.2397254, -1.509788, 1.559176, 0, 0.5921569, 1, 1,
0.2423883, -0.50217, 2.342668, 0, 0.5843138, 1, 1,
0.2462028, 0.05741563, -0.16422, 0, 0.5803922, 1, 1,
0.2518747, 0.8118525, 0.1192848, 0, 0.572549, 1, 1,
0.2521273, 0.420135, 0.1568242, 0, 0.5686275, 1, 1,
0.254819, 0.4555762, -0.5784122, 0, 0.5607843, 1, 1,
0.2558208, 0.01482255, 2.626088, 0, 0.5568628, 1, 1,
0.2568475, 1.142815, 0.1729618, 0, 0.5490196, 1, 1,
0.2611278, -0.08314767, 2.079092, 0, 0.5450981, 1, 1,
0.2621245, -0.9873725, 2.771302, 0, 0.5372549, 1, 1,
0.2626448, 2.117821, -1.232223, 0, 0.5333334, 1, 1,
0.2629386, -2.089101, 3.878897, 0, 0.5254902, 1, 1,
0.2642761, 1.5532, -0.596083, 0, 0.5215687, 1, 1,
0.2643428, 0.1509731, 1.48362, 0, 0.5137255, 1, 1,
0.2705276, -1.752203, 3.742324, 0, 0.509804, 1, 1,
0.2708611, -1.952561, 2.724517, 0, 0.5019608, 1, 1,
0.2709742, 0.1629128, 2.775813, 0, 0.4941176, 1, 1,
0.2736413, 0.6847476, -0.4017937, 0, 0.4901961, 1, 1,
0.2771407, -2.546838, 1.707276, 0, 0.4823529, 1, 1,
0.2855735, -1.465386, 3.363282, 0, 0.4784314, 1, 1,
0.2900118, -0.7114693, 3.523588, 0, 0.4705882, 1, 1,
0.2903444, -0.637895, 1.58986, 0, 0.4666667, 1, 1,
0.2907816, 0.4476715, 0.134045, 0, 0.4588235, 1, 1,
0.2934562, 0.6064398, -0.4642391, 0, 0.454902, 1, 1,
0.2947309, 0.2995047, 0.4406722, 0, 0.4470588, 1, 1,
0.2997996, 0.1459787, 2.656645, 0, 0.4431373, 1, 1,
0.3002682, -0.9472646, 1.326187, 0, 0.4352941, 1, 1,
0.301471, -0.4104553, 2.937111, 0, 0.4313726, 1, 1,
0.3046154, 0.2409022, -0.5524716, 0, 0.4235294, 1, 1,
0.3058098, -0.09853621, 2.163829, 0, 0.4196078, 1, 1,
0.3075246, 0.5224441, 0.6760119, 0, 0.4117647, 1, 1,
0.3085865, 0.5740284, 1.639151, 0, 0.4078431, 1, 1,
0.3086488, 0.3618009, -1.150664, 0, 0.4, 1, 1,
0.3087571, 0.8477084, -1.607025, 0, 0.3921569, 1, 1,
0.3104317, -0.1074848, 0.9135472, 0, 0.3882353, 1, 1,
0.310546, 1.28238, -1.297957, 0, 0.3803922, 1, 1,
0.310914, -0.9996967, 3.546921, 0, 0.3764706, 1, 1,
0.3111415, -2.113856, 1.879406, 0, 0.3686275, 1, 1,
0.3145575, -0.1003886, 3.188817, 0, 0.3647059, 1, 1,
0.3149742, 0.9835205, -1.847408, 0, 0.3568628, 1, 1,
0.3167375, 1.257511, 1.448998, 0, 0.3529412, 1, 1,
0.3213786, -1.198526, 1.179796, 0, 0.345098, 1, 1,
0.3229866, -1.959238, 1.466108, 0, 0.3411765, 1, 1,
0.326948, 0.8894672, 0.9635852, 0, 0.3333333, 1, 1,
0.3314806, 3.076526, 0.3703551, 0, 0.3294118, 1, 1,
0.3385102, -0.4070932, 2.132791, 0, 0.3215686, 1, 1,
0.3424587, -0.9291328, 2.340878, 0, 0.3176471, 1, 1,
0.3443056, -0.3084464, 1.040376, 0, 0.3098039, 1, 1,
0.3488615, 0.4747937, 1.064517, 0, 0.3058824, 1, 1,
0.3490341, -2.212783, 3.48376, 0, 0.2980392, 1, 1,
0.3499141, -0.778845, 2.337924, 0, 0.2901961, 1, 1,
0.3572871, 2.07791, 1.199594, 0, 0.2862745, 1, 1,
0.3587701, 0.2699237, 0.9925679, 0, 0.2784314, 1, 1,
0.3598063, -1.00102, 3.827, 0, 0.2745098, 1, 1,
0.365575, 0.0004311439, 2.242764, 0, 0.2666667, 1, 1,
0.3662241, 0.1353325, 1.574171, 0, 0.2627451, 1, 1,
0.3665384, -0.7433605, 2.837952, 0, 0.254902, 1, 1,
0.3680789, -0.2533043, 2.642222, 0, 0.2509804, 1, 1,
0.3693954, 0.6382263, 0.04807676, 0, 0.2431373, 1, 1,
0.3698027, 0.9013672, 0.4656807, 0, 0.2392157, 1, 1,
0.3738275, -1.975182, 4.094233, 0, 0.2313726, 1, 1,
0.3808044, 1.954877, -0.1608483, 0, 0.227451, 1, 1,
0.3810311, -0.6700864, 2.991034, 0, 0.2196078, 1, 1,
0.383917, 0.7239137, 0.7532805, 0, 0.2156863, 1, 1,
0.3843318, -1.231717, 3.694046, 0, 0.2078431, 1, 1,
0.3870628, 0.1026304, 1.252875, 0, 0.2039216, 1, 1,
0.3876773, 0.928933, 2.138318, 0, 0.1960784, 1, 1,
0.387702, 1.005981, -0.4400048, 0, 0.1882353, 1, 1,
0.3905345, -0.3150103, 2.176708, 0, 0.1843137, 1, 1,
0.3910826, 1.457395, 1.463572, 0, 0.1764706, 1, 1,
0.391598, 0.3511768, 0.22701, 0, 0.172549, 1, 1,
0.3922574, 0.2327654, 3.920142, 0, 0.1647059, 1, 1,
0.3941698, -0.5017333, 1.707176, 0, 0.1607843, 1, 1,
0.3941977, -0.9031495, 0.6628307, 0, 0.1529412, 1, 1,
0.3963207, -0.4478174, 3.59351, 0, 0.1490196, 1, 1,
0.3967916, 0.6322004, 0.2525786, 0, 0.1411765, 1, 1,
0.3976204, 0.3646181, -0.07722826, 0, 0.1372549, 1, 1,
0.3992715, -1.346195, 2.803034, 0, 0.1294118, 1, 1,
0.3995785, -0.8421704, 3.107686, 0, 0.1254902, 1, 1,
0.4051511, 0.4285785, 1.167606, 0, 0.1176471, 1, 1,
0.4071206, -0.181733, 2.156546, 0, 0.1137255, 1, 1,
0.4087686, 0.6593183, 1.626788, 0, 0.1058824, 1, 1,
0.4100221, 2.139332, 0.2181856, 0, 0.09803922, 1, 1,
0.4101519, -1.037277, 2.635819, 0, 0.09411765, 1, 1,
0.4160079, -1.997486, 3.226496, 0, 0.08627451, 1, 1,
0.4171906, 0.1662204, 3.068864, 0, 0.08235294, 1, 1,
0.4209623, -0.8973168, 2.357664, 0, 0.07450981, 1, 1,
0.4248913, 0.2832249, 1.796163, 0, 0.07058824, 1, 1,
0.4310538, -1.562833, 2.802759, 0, 0.0627451, 1, 1,
0.4313936, 0.3248746, 0.3744091, 0, 0.05882353, 1, 1,
0.4335706, 1.229276, 0.06969158, 0, 0.05098039, 1, 1,
0.4336087, -1.586544, 2.773369, 0, 0.04705882, 1, 1,
0.4343697, -0.2242427, 2.421007, 0, 0.03921569, 1, 1,
0.4358956, -0.006127532, 2.560815, 0, 0.03529412, 1, 1,
0.4405296, 1.896023, 0.8774275, 0, 0.02745098, 1, 1,
0.4405854, 0.20032, -0.5230418, 0, 0.02352941, 1, 1,
0.4412019, 0.5994695, 0.9867959, 0, 0.01568628, 1, 1,
0.4455293, -0.5391512, 1.815479, 0, 0.01176471, 1, 1,
0.4503382, 1.261684, 1.230413, 0, 0.003921569, 1, 1,
0.4523815, -0.3579575, 2.848099, 0.003921569, 0, 1, 1,
0.4536825, 1.909549, -0.06234737, 0.007843138, 0, 1, 1,
0.4637088, 0.2951336, 2.468375, 0.01568628, 0, 1, 1,
0.4667195, -0.6680889, 2.425013, 0.01960784, 0, 1, 1,
0.4696957, -0.1151196, 0.6852007, 0.02745098, 0, 1, 1,
0.4724816, 1.44129, -0.7824172, 0.03137255, 0, 1, 1,
0.4739417, -0.3607259, 2.358058, 0.03921569, 0, 1, 1,
0.475792, 0.8187402, 0.8155679, 0.04313726, 0, 1, 1,
0.4771869, -0.9293661, 3.340808, 0.05098039, 0, 1, 1,
0.4812915, -2.107801, 2.999869, 0.05490196, 0, 1, 1,
0.4823451, 0.1764392, 2.032058, 0.0627451, 0, 1, 1,
0.4843286, -2.219497, 2.249822, 0.06666667, 0, 1, 1,
0.4931479, 0.4656447, 0.5563916, 0.07450981, 0, 1, 1,
0.4951931, -0.4232871, 1.88553, 0.07843138, 0, 1, 1,
0.4973149, -0.1671322, 2.881603, 0.08627451, 0, 1, 1,
0.4999938, 0.7090485, -0.1708422, 0.09019608, 0, 1, 1,
0.5007104, -0.6470038, 2.33405, 0.09803922, 0, 1, 1,
0.504375, 0.7455611, 1.353478, 0.1058824, 0, 1, 1,
0.5046887, -1.165235, 3.290255, 0.1098039, 0, 1, 1,
0.508891, 1.755919, -0.5089549, 0.1176471, 0, 1, 1,
0.5096698, -0.8702527, 2.111808, 0.1215686, 0, 1, 1,
0.5128676, -0.2635382, 1.649733, 0.1294118, 0, 1, 1,
0.5132025, 0.6654138, -0.3239491, 0.1333333, 0, 1, 1,
0.519061, -1.328871, 3.661938, 0.1411765, 0, 1, 1,
0.5207577, 0.9011336, 0.4108199, 0.145098, 0, 1, 1,
0.5220192, -0.6142735, 0.490339, 0.1529412, 0, 1, 1,
0.5227919, 0.2228087, 2.719715, 0.1568628, 0, 1, 1,
0.5231706, -0.3643492, 3.063071, 0.1647059, 0, 1, 1,
0.5264249, 0.255492, 1.375572, 0.1686275, 0, 1, 1,
0.5306398, 0.09567329, 1.259913, 0.1764706, 0, 1, 1,
0.5309377, 0.2436056, -0.2198674, 0.1803922, 0, 1, 1,
0.5355636, -1.046914, 0.1053411, 0.1882353, 0, 1, 1,
0.5379783, 0.09103816, 1.771489, 0.1921569, 0, 1, 1,
0.5406264, 0.1036048, -0.1777129, 0.2, 0, 1, 1,
0.5424464, 0.5403062, 0.3353106, 0.2078431, 0, 1, 1,
0.5510156, 0.07794956, 1.940107, 0.2117647, 0, 1, 1,
0.5511461, -0.2812092, 2.655251, 0.2196078, 0, 1, 1,
0.5515667, 0.3991541, 1.650737, 0.2235294, 0, 1, 1,
0.558286, -0.3524598, 3.151953, 0.2313726, 0, 1, 1,
0.5602949, -2.251656, 2.463982, 0.2352941, 0, 1, 1,
0.5638522, 0.615483, -0.1898441, 0.2431373, 0, 1, 1,
0.5661538, -0.7441034, 1.561278, 0.2470588, 0, 1, 1,
0.5685723, 1.506781, -0.3264652, 0.254902, 0, 1, 1,
0.5719398, -0.02243698, 0.4315399, 0.2588235, 0, 1, 1,
0.5770075, 1.281316, 0.6022311, 0.2666667, 0, 1, 1,
0.5787695, 0.5214665, -0.7790695, 0.2705882, 0, 1, 1,
0.581365, -1.40144, 1.641417, 0.2784314, 0, 1, 1,
0.5849164, -1.896615, 1.415515, 0.282353, 0, 1, 1,
0.5877216, -0.2378326, 0.9751723, 0.2901961, 0, 1, 1,
0.5928493, -0.5306016, 3.216599, 0.2941177, 0, 1, 1,
0.5987711, -0.001658539, 0.8456374, 0.3019608, 0, 1, 1,
0.5990619, 0.8257281, 2.786949, 0.3098039, 0, 1, 1,
0.6023037, -2.252326, 2.601519, 0.3137255, 0, 1, 1,
0.6023479, 0.6195272, -1.504838, 0.3215686, 0, 1, 1,
0.6084508, 0.9357116, 1.28775, 0.3254902, 0, 1, 1,
0.6087398, 0.4317962, 0.3990827, 0.3333333, 0, 1, 1,
0.6097671, -0.2942685, 2.475857, 0.3372549, 0, 1, 1,
0.6108609, 1.167326, 0.4698511, 0.345098, 0, 1, 1,
0.6127681, 0.9809512, -0.05390493, 0.3490196, 0, 1, 1,
0.6128114, -0.0984118, 1.470708, 0.3568628, 0, 1, 1,
0.6137348, -0.6521829, 2.10888, 0.3607843, 0, 1, 1,
0.6150507, 2.779856, 0.7950745, 0.3686275, 0, 1, 1,
0.6173553, 0.7141883, -0.06907357, 0.372549, 0, 1, 1,
0.618399, -2.31398, 3.005712, 0.3803922, 0, 1, 1,
0.6196314, -0.3633964, 4.100184, 0.3843137, 0, 1, 1,
0.619855, -1.370186, 3.100767, 0.3921569, 0, 1, 1,
0.62901, -0.5096181, 3.362611, 0.3960784, 0, 1, 1,
0.6300097, -0.2721065, 1.695166, 0.4039216, 0, 1, 1,
0.6308276, 0.4227504, 0.2035909, 0.4117647, 0, 1, 1,
0.6349885, 0.6284707, 0.1384789, 0.4156863, 0, 1, 1,
0.640783, 0.7184698, 1.422861, 0.4235294, 0, 1, 1,
0.6442883, -0.9256213, 2.467237, 0.427451, 0, 1, 1,
0.6482862, -0.2950888, 2.00437, 0.4352941, 0, 1, 1,
0.6512076, -0.649356, 1.823619, 0.4392157, 0, 1, 1,
0.6545653, 0.8543981, 0.7943435, 0.4470588, 0, 1, 1,
0.6559203, 0.1307257, 2.180366, 0.4509804, 0, 1, 1,
0.6566648, -0.09787487, 1.871103, 0.4588235, 0, 1, 1,
0.6577996, 0.7458854, 0.1181751, 0.4627451, 0, 1, 1,
0.6638563, -0.5652111, 2.221196, 0.4705882, 0, 1, 1,
0.664323, 3.467544, -0.2880843, 0.4745098, 0, 1, 1,
0.6713414, -0.04640554, 1.41815, 0.4823529, 0, 1, 1,
0.6764578, 0.1925418, 2.386022, 0.4862745, 0, 1, 1,
0.6769069, 0.02534072, 0.4695319, 0.4941176, 0, 1, 1,
0.6771698, 0.4421343, 2.163781, 0.5019608, 0, 1, 1,
0.6795707, -1.158854, 3.445775, 0.5058824, 0, 1, 1,
0.6806683, -0.3374099, 1.608693, 0.5137255, 0, 1, 1,
0.6824848, -1.143486, 1.082334, 0.5176471, 0, 1, 1,
0.6949903, 0.06105583, 1.642044, 0.5254902, 0, 1, 1,
0.6978985, -1.161843, 3.98976, 0.5294118, 0, 1, 1,
0.6986282, 1.340597, 0.4607768, 0.5372549, 0, 1, 1,
0.6988836, 0.07209712, -0.1916899, 0.5411765, 0, 1, 1,
0.7003461, 0.02931418, 2.189626, 0.5490196, 0, 1, 1,
0.7052086, 0.5383726, 0.384282, 0.5529412, 0, 1, 1,
0.7082532, -1.336779, 3.468504, 0.5607843, 0, 1, 1,
0.7093507, 1.28593, 1.153659, 0.5647059, 0, 1, 1,
0.7112864, -0.2601683, 2.157195, 0.572549, 0, 1, 1,
0.7161902, 0.1914307, 1.526037, 0.5764706, 0, 1, 1,
0.7165937, -0.6736031, 2.72231, 0.5843138, 0, 1, 1,
0.7179326, -0.02455297, 1.474201, 0.5882353, 0, 1, 1,
0.720945, 0.2409373, 1.231675, 0.5960785, 0, 1, 1,
0.7217342, -0.2751234, 0.7611462, 0.6039216, 0, 1, 1,
0.7237563, 0.9252293, 2.279137, 0.6078432, 0, 1, 1,
0.7320793, -0.929883, 3.218291, 0.6156863, 0, 1, 1,
0.7334555, -0.7226319, 2.058984, 0.6196079, 0, 1, 1,
0.7345065, 0.2009972, 2.417856, 0.627451, 0, 1, 1,
0.7382479, -0.5004864, 1.361778, 0.6313726, 0, 1, 1,
0.741284, 1.530576, 0.9398366, 0.6392157, 0, 1, 1,
0.7421001, 0.5555922, 1.761789, 0.6431373, 0, 1, 1,
0.745513, -0.5338614, 0.2466786, 0.6509804, 0, 1, 1,
0.7474018, -1.866436, 1.829125, 0.654902, 0, 1, 1,
0.7478782, 0.4411374, 1.281943, 0.6627451, 0, 1, 1,
0.7510082, -0.1941604, 1.599476, 0.6666667, 0, 1, 1,
0.7616102, 0.9581257, 0.3994156, 0.6745098, 0, 1, 1,
0.7769585, 0.1370379, 0.8644248, 0.6784314, 0, 1, 1,
0.7795005, -0.05665903, 0.4472357, 0.6862745, 0, 1, 1,
0.7810054, 0.3784749, 0.6149684, 0.6901961, 0, 1, 1,
0.7826487, -1.056855, 1.970045, 0.6980392, 0, 1, 1,
0.7924132, 1.620414, -0.08558808, 0.7058824, 0, 1, 1,
0.7937533, -1.098297, 2.03659, 0.7098039, 0, 1, 1,
0.7947432, -0.4260308, 2.77437, 0.7176471, 0, 1, 1,
0.8023013, 1.225748, 0.4245737, 0.7215686, 0, 1, 1,
0.806748, 0.1556581, 2.531141, 0.7294118, 0, 1, 1,
0.8104607, -0.2953992, 0.7605937, 0.7333333, 0, 1, 1,
0.8166742, -1.135229, 2.313717, 0.7411765, 0, 1, 1,
0.817, -2.251, 4.150497, 0.7450981, 0, 1, 1,
0.8234984, 0.3603961, 2.001018, 0.7529412, 0, 1, 1,
0.8239575, 0.8562516, -1.137735, 0.7568628, 0, 1, 1,
0.8283074, -0.05206591, 3.008135, 0.7647059, 0, 1, 1,
0.8324259, 0.8018842, 0.2576715, 0.7686275, 0, 1, 1,
0.8348245, -0.2092224, 2.231093, 0.7764706, 0, 1, 1,
0.8365552, -0.9935145, 2.422557, 0.7803922, 0, 1, 1,
0.8548821, -0.1384707, 3.379645, 0.7882353, 0, 1, 1,
0.8553989, -2.03606, 0.7975887, 0.7921569, 0, 1, 1,
0.8575727, 1.713126, -0.1768272, 0.8, 0, 1, 1,
0.857649, -1.470919, 1.475643, 0.8078431, 0, 1, 1,
0.8680305, -1.321887, 3.276918, 0.8117647, 0, 1, 1,
0.8700024, 0.1690702, 0.9554084, 0.8196079, 0, 1, 1,
0.8801729, -0.7342635, 2.687676, 0.8235294, 0, 1, 1,
0.8869811, 1.358322, 1.790367, 0.8313726, 0, 1, 1,
0.8882891, -0.8373299, 1.128183, 0.8352941, 0, 1, 1,
0.8906157, -0.4553583, 0.302955, 0.8431373, 0, 1, 1,
0.8927888, 0.4454275, 0.885375, 0.8470588, 0, 1, 1,
0.8934083, 0.1858235, 0.4902155, 0.854902, 0, 1, 1,
0.8975282, 0.3615589, 2.115085, 0.8588235, 0, 1, 1,
0.9046308, 2.076967, 2.499886, 0.8666667, 0, 1, 1,
0.9049906, 0.9633304, 1.808553, 0.8705882, 0, 1, 1,
0.9182125, -0.1544993, 0.6222011, 0.8784314, 0, 1, 1,
0.921909, -0.817818, 0.4083941, 0.8823529, 0, 1, 1,
0.9231163, 0.116234, 2.413538, 0.8901961, 0, 1, 1,
0.9253491, 0.7856714, 2.265398, 0.8941177, 0, 1, 1,
0.9268214, -0.07160717, 2.068789, 0.9019608, 0, 1, 1,
0.9280691, 0.571501, 0.2747233, 0.9098039, 0, 1, 1,
0.9323527, 0.4112411, 0.1782383, 0.9137255, 0, 1, 1,
0.9331143, 1.214782, 0.2993383, 0.9215686, 0, 1, 1,
0.9354993, 0.4925537, -0.1861335, 0.9254902, 0, 1, 1,
0.9361759, 0.4402967, 0.3214715, 0.9333333, 0, 1, 1,
0.9373671, 0.1970849, 0.3090723, 0.9372549, 0, 1, 1,
0.9373818, 0.2944852, 1.11029, 0.945098, 0, 1, 1,
0.9385931, -0.1149005, 1.299603, 0.9490196, 0, 1, 1,
0.9451944, -0.7765965, 1.226799, 0.9568627, 0, 1, 1,
0.9518512, 1.250354, 0.690229, 0.9607843, 0, 1, 1,
0.9529489, 1.128343, 2.343753, 0.9686275, 0, 1, 1,
0.9583713, 0.6767914, 1.562504, 0.972549, 0, 1, 1,
0.9638478, 0.4449044, 0.5312797, 0.9803922, 0, 1, 1,
0.9651135, -0.1700748, 0.3256167, 0.9843137, 0, 1, 1,
0.9782997, 1.661927, 0.8716676, 0.9921569, 0, 1, 1,
0.9799308, -0.07942954, 3.16574, 0.9960784, 0, 1, 1,
0.9828776, -0.9043241, 3.962372, 1, 0, 0.9960784, 1,
0.9840606, -0.2729557, -0.2424758, 1, 0, 0.9882353, 1,
0.9961782, 0.2487213, 1.09691, 1, 0, 0.9843137, 1,
1.006783, -1.476231, 4.657786, 1, 0, 0.9764706, 1,
1.007511, 0.4835503, 1.020702, 1, 0, 0.972549, 1,
1.013573, -0.2232863, 1.097872, 1, 0, 0.9647059, 1,
1.014228, 1.129884, 0.5341601, 1, 0, 0.9607843, 1,
1.018954, 0.7208829, -0.2415721, 1, 0, 0.9529412, 1,
1.019965, 0.7923819, -1.152527, 1, 0, 0.9490196, 1,
1.030044, -0.01364447, 2.465183, 1, 0, 0.9411765, 1,
1.030811, 2.001077, 0.4318755, 1, 0, 0.9372549, 1,
1.034474, -0.8106844, 2.317178, 1, 0, 0.9294118, 1,
1.041405, -1.143663, 4.292781, 1, 0, 0.9254902, 1,
1.046337, 0.6430439, 1.653458, 1, 0, 0.9176471, 1,
1.046684, -1.08513, 4.26365, 1, 0, 0.9137255, 1,
1.048288, 0.1537587, 3.084679, 1, 0, 0.9058824, 1,
1.048438, 0.5880523, 1.333338, 1, 0, 0.9019608, 1,
1.052043, -0.124231, 3.769465, 1, 0, 0.8941177, 1,
1.05903, 1.105144, 1.567541, 1, 0, 0.8862745, 1,
1.061824, 0.841986, 1.262123, 1, 0, 0.8823529, 1,
1.072683, 1.511678, 0.9229609, 1, 0, 0.8745098, 1,
1.074527, -0.007287316, 1.548735, 1, 0, 0.8705882, 1,
1.089087, 1.465216, 1.127804, 1, 0, 0.8627451, 1,
1.093676, -0.5962762, 3.130595, 1, 0, 0.8588235, 1,
1.109407, -0.4610736, 1.245857, 1, 0, 0.8509804, 1,
1.112316, -0.2994707, 2.004904, 1, 0, 0.8470588, 1,
1.112787, -0.1170878, 1.244498, 1, 0, 0.8392157, 1,
1.130478, -1.023764, 1.864542, 1, 0, 0.8352941, 1,
1.131422, 2.134678, 0.09412494, 1, 0, 0.827451, 1,
1.132958, -0.152029, 2.127988, 1, 0, 0.8235294, 1,
1.137533, -0.1535383, 1.48246, 1, 0, 0.8156863, 1,
1.145146, -1.923618, 2.828353, 1, 0, 0.8117647, 1,
1.154806, 0.3427332, -0.9515451, 1, 0, 0.8039216, 1,
1.158128, -1.60607, 1.233261, 1, 0, 0.7960784, 1,
1.163518, -0.5561004, 0.4187985, 1, 0, 0.7921569, 1,
1.165365, 1.229391, -0.8800805, 1, 0, 0.7843137, 1,
1.168749, -0.5070485, 1.486596, 1, 0, 0.7803922, 1,
1.173769, -0.9286656, 1.928093, 1, 0, 0.772549, 1,
1.174764, -0.8033845, 1.490302, 1, 0, 0.7686275, 1,
1.188209, 0.05464042, 3.229137, 1, 0, 0.7607843, 1,
1.194198, -0.2253273, 1.834222, 1, 0, 0.7568628, 1,
1.194415, 1.269332, 0.6437416, 1, 0, 0.7490196, 1,
1.197531, 1.786359, 2.031588, 1, 0, 0.7450981, 1,
1.207299, 0.7375709, 1.907119, 1, 0, 0.7372549, 1,
1.208424, -0.5176, 2.453285, 1, 0, 0.7333333, 1,
1.212834, -0.01790624, 2.145024, 1, 0, 0.7254902, 1,
1.213754, -1.059905, 1.493911, 1, 0, 0.7215686, 1,
1.214475, 0.7281082, 1.547992, 1, 0, 0.7137255, 1,
1.21463, -0.1265003, 3.545689, 1, 0, 0.7098039, 1,
1.216115, 0.6774369, 1.889337, 1, 0, 0.7019608, 1,
1.22455, 1.181452, 2.142932, 1, 0, 0.6941177, 1,
1.225066, -0.2519309, 0.6082325, 1, 0, 0.6901961, 1,
1.228519, -1.637713, 1.713327, 1, 0, 0.682353, 1,
1.235898, -0.2463702, 1.754055, 1, 0, 0.6784314, 1,
1.237606, -0.6859184, 1.413239, 1, 0, 0.6705883, 1,
1.245232, -1.68554, 4.029242, 1, 0, 0.6666667, 1,
1.26254, 0.7168347, 1.295959, 1, 0, 0.6588235, 1,
1.265924, 1.126734, -1.112284, 1, 0, 0.654902, 1,
1.273072, -0.9929656, 1.963547, 1, 0, 0.6470588, 1,
1.280542, 1.422608, -0.3537178, 1, 0, 0.6431373, 1,
1.282411, -1.678764, 2.585799, 1, 0, 0.6352941, 1,
1.282963, 2.34014, 0.5980475, 1, 0, 0.6313726, 1,
1.284159, 0.3291705, 3.048983, 1, 0, 0.6235294, 1,
1.284174, -1.74339, 1.897492, 1, 0, 0.6196079, 1,
1.286329, -1.575773, 3.362145, 1, 0, 0.6117647, 1,
1.295887, 1.032081, 1.870857, 1, 0, 0.6078432, 1,
1.29666, 0.2102219, 0.8455138, 1, 0, 0.6, 1,
1.297197, -0.440485, 2.776207, 1, 0, 0.5921569, 1,
1.304734, -0.72618, 4.52527, 1, 0, 0.5882353, 1,
1.321824, -2.003226, 3.72805, 1, 0, 0.5803922, 1,
1.323703, -2.211427, 3.720413, 1, 0, 0.5764706, 1,
1.32702, -0.6231449, 3.270722, 1, 0, 0.5686275, 1,
1.346661, 0.1464263, 1.736888, 1, 0, 0.5647059, 1,
1.346731, -0.8672858, 2.843375, 1, 0, 0.5568628, 1,
1.351103, 1.004103, -0.3076092, 1, 0, 0.5529412, 1,
1.351288, -0.1679461, 2.924549, 1, 0, 0.5450981, 1,
1.367541, 2.246233, 0.233078, 1, 0, 0.5411765, 1,
1.375039, 0.2151413, -1.230419, 1, 0, 0.5333334, 1,
1.380977, -0.03531449, 2.27026, 1, 0, 0.5294118, 1,
1.382841, -0.5818616, 1.807887, 1, 0, 0.5215687, 1,
1.391688, -0.5568798, 2.086881, 1, 0, 0.5176471, 1,
1.41178, -0.2133342, 3.242719, 1, 0, 0.509804, 1,
1.413049, -0.1667596, 2.339138, 1, 0, 0.5058824, 1,
1.414117, 0.8840175, 0.7521651, 1, 0, 0.4980392, 1,
1.427652, 0.05797885, 2.400661, 1, 0, 0.4901961, 1,
1.429777, -2.127042, 3.038862, 1, 0, 0.4862745, 1,
1.432468, 0.5515231, 1.260631, 1, 0, 0.4784314, 1,
1.432834, 0.04184897, 0.3378802, 1, 0, 0.4745098, 1,
1.433662, 0.9135759, 1.759202, 1, 0, 0.4666667, 1,
1.433857, 0.7907195, 0.5741925, 1, 0, 0.4627451, 1,
1.438589, 0.894648, 3.208373, 1, 0, 0.454902, 1,
1.444442, 0.4748005, 1.536318, 1, 0, 0.4509804, 1,
1.456779, 1.085213, 1.308307, 1, 0, 0.4431373, 1,
1.470809, 0.2979833, 0.6072092, 1, 0, 0.4392157, 1,
1.497429, -0.2421252, 0.8512719, 1, 0, 0.4313726, 1,
1.503083, 0.7385338, 1.647121, 1, 0, 0.427451, 1,
1.504862, -0.1712394, 0.341966, 1, 0, 0.4196078, 1,
1.520689, 0.7387831, 1.973527, 1, 0, 0.4156863, 1,
1.523178, -0.3041221, 1.756352, 1, 0, 0.4078431, 1,
1.525454, 0.4429502, -0.2144704, 1, 0, 0.4039216, 1,
1.528155, 0.2143244, 2.425109, 1, 0, 0.3960784, 1,
1.53054, 0.9300624, 0.3555269, 1, 0, 0.3882353, 1,
1.533368, -0.09551547, 0.7730489, 1, 0, 0.3843137, 1,
1.536418, -0.9399374, 0.6682918, 1, 0, 0.3764706, 1,
1.537424, -0.07659056, 1.196904, 1, 0, 0.372549, 1,
1.553843, 1.239923, 1.800382, 1, 0, 0.3647059, 1,
1.555445, 2.150626, 0.5026835, 1, 0, 0.3607843, 1,
1.55568, 1.126502, 1.106707, 1, 0, 0.3529412, 1,
1.557948, 0.4546427, 3.104789, 1, 0, 0.3490196, 1,
1.565021, 1.954559, 2.65998, 1, 0, 0.3411765, 1,
1.57572, -0.06244355, 1.109122, 1, 0, 0.3372549, 1,
1.576252, -1.179627, 3.178292, 1, 0, 0.3294118, 1,
1.580015, -2.196305, 2.789655, 1, 0, 0.3254902, 1,
1.584614, 0.9806547, 1.803906, 1, 0, 0.3176471, 1,
1.646055, -1.736649, 3.190188, 1, 0, 0.3137255, 1,
1.652323, -1.016331, 1.408445, 1, 0, 0.3058824, 1,
1.683584, 0.39039, 1.955422, 1, 0, 0.2980392, 1,
1.694327, -1.275906, 2.866248, 1, 0, 0.2941177, 1,
1.694874, 1.174281, 1.074412, 1, 0, 0.2862745, 1,
1.69676, -0.9807287, 3.08718, 1, 0, 0.282353, 1,
1.713679, 0.7116516, 0.697724, 1, 0, 0.2745098, 1,
1.721882, 0.0978421, 0.3136118, 1, 0, 0.2705882, 1,
1.723268, 0.8953751, 1.017527, 1, 0, 0.2627451, 1,
1.738571, -0.1578622, 0.7525092, 1, 0, 0.2588235, 1,
1.739189, 1.087748, 0.1598892, 1, 0, 0.2509804, 1,
1.740871, -0.8906895, 3.784572, 1, 0, 0.2470588, 1,
1.752987, -0.9507225, 1.116559, 1, 0, 0.2392157, 1,
1.75315, -1.439781, 1.877723, 1, 0, 0.2352941, 1,
1.76346, -2.061034, 1.519102, 1, 0, 0.227451, 1,
1.783036, -1.776989, 2.353792, 1, 0, 0.2235294, 1,
1.79201, -0.5207361, 2.265347, 1, 0, 0.2156863, 1,
1.798492, -0.009931332, 2.426665, 1, 0, 0.2117647, 1,
1.812893, 0.5913699, -1.543598, 1, 0, 0.2039216, 1,
1.818405, 0.4072607, 2.51776, 1, 0, 0.1960784, 1,
1.81951, -0.5238461, 4.07921, 1, 0, 0.1921569, 1,
1.825407, -0.4110365, 3.612741, 1, 0, 0.1843137, 1,
1.845756, -0.7611967, 1.042739, 1, 0, 0.1803922, 1,
1.882271, -0.3598189, 1.040318, 1, 0, 0.172549, 1,
1.925241, -0.8562365, 2.772394, 1, 0, 0.1686275, 1,
1.93884, -1.260805, 2.415357, 1, 0, 0.1607843, 1,
1.959554, -1.236236, 3.112509, 1, 0, 0.1568628, 1,
1.998809, 0.9921532, 1.034587, 1, 0, 0.1490196, 1,
2.007755, -0.6957894, 1.160794, 1, 0, 0.145098, 1,
2.018462, -0.1366357, 2.422686, 1, 0, 0.1372549, 1,
2.068213, -0.2805281, 0.8761541, 1, 0, 0.1333333, 1,
2.120901, 0.7196081, 0.9222309, 1, 0, 0.1254902, 1,
2.124188, 1.044943, 1.379945, 1, 0, 0.1215686, 1,
2.146289, -1.274828, 1.143263, 1, 0, 0.1137255, 1,
2.200906, 1.910638, 2.489281, 1, 0, 0.1098039, 1,
2.242002, -1.621947, 2.385163, 1, 0, 0.1019608, 1,
2.246073, -0.008690029, 2.059187, 1, 0, 0.09411765, 1,
2.269514, 0.824563, 2.361715, 1, 0, 0.09019608, 1,
2.270765, 1.509501, 0.7177845, 1, 0, 0.08235294, 1,
2.294913, 0.06752463, 0.4989276, 1, 0, 0.07843138, 1,
2.31477, 0.4153861, 0.8097074, 1, 0, 0.07058824, 1,
2.353245, 0.5505554, 1.286782, 1, 0, 0.06666667, 1,
2.369341, 1.292306, 0.7090958, 1, 0, 0.05882353, 1,
2.429513, -0.4949748, 1.221245, 1, 0, 0.05490196, 1,
2.504225, 0.3119993, 1.103404, 1, 0, 0.04705882, 1,
2.523077, 0.6111999, 1.877619, 1, 0, 0.04313726, 1,
2.535429, 0.03497683, -0.06916728, 1, 0, 0.03529412, 1,
2.554093, -0.8161685, 2.03441, 1, 0, 0.03137255, 1,
2.616512, 0.4515224, -0.08900668, 1, 0, 0.02352941, 1,
2.725599, 0.7443432, 0.6391594, 1, 0, 0.01960784, 1,
2.809725, 0.365455, 2.706215, 1, 0, 0.01176471, 1,
2.838876, 0.5363554, 2.678973, 1, 0, 0.007843138, 1
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
-0.5710427, -3.618854, -6.773922, 0, -0.5, 0.5, 0.5,
-0.5710427, -3.618854, -6.773922, 1, -0.5, 0.5, 0.5,
-0.5710427, -3.618854, -6.773922, 1, 1.5, 0.5, 0.5,
-0.5710427, -3.618854, -6.773922, 0, 1.5, 0.5, 0.5
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
-5.136923, 0.4378742, -6.773922, 0, -0.5, 0.5, 0.5,
-5.136923, 0.4378742, -6.773922, 1, -0.5, 0.5, 0.5,
-5.136923, 0.4378742, -6.773922, 1, 1.5, 0.5, 0.5,
-5.136923, 0.4378742, -6.773922, 0, 1.5, 0.5, 0.5
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
-5.136923, -3.618854, 0.2298629, 0, -0.5, 0.5, 0.5,
-5.136923, -3.618854, 0.2298629, 1, -0.5, 0.5, 0.5,
-5.136923, -3.618854, 0.2298629, 1, 1.5, 0.5, 0.5,
-5.136923, -3.618854, 0.2298629, 0, 1.5, 0.5, 0.5
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
-3, -2.682686, -5.157664,
2, -2.682686, -5.157664,
-3, -2.682686, -5.157664,
-3, -2.838714, -5.427041,
-2, -2.682686, -5.157664,
-2, -2.838714, -5.427041,
-1, -2.682686, -5.157664,
-1, -2.838714, -5.427041,
0, -2.682686, -5.157664,
0, -2.838714, -5.427041,
1, -2.682686, -5.157664,
1, -2.838714, -5.427041,
2, -2.682686, -5.157664,
2, -2.838714, -5.427041
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
-3, -3.15077, -5.965793, 0, -0.5, 0.5, 0.5,
-3, -3.15077, -5.965793, 1, -0.5, 0.5, 0.5,
-3, -3.15077, -5.965793, 1, 1.5, 0.5, 0.5,
-3, -3.15077, -5.965793, 0, 1.5, 0.5, 0.5,
-2, -3.15077, -5.965793, 0, -0.5, 0.5, 0.5,
-2, -3.15077, -5.965793, 1, -0.5, 0.5, 0.5,
-2, -3.15077, -5.965793, 1, 1.5, 0.5, 0.5,
-2, -3.15077, -5.965793, 0, 1.5, 0.5, 0.5,
-1, -3.15077, -5.965793, 0, -0.5, 0.5, 0.5,
-1, -3.15077, -5.965793, 1, -0.5, 0.5, 0.5,
-1, -3.15077, -5.965793, 1, 1.5, 0.5, 0.5,
-1, -3.15077, -5.965793, 0, 1.5, 0.5, 0.5,
0, -3.15077, -5.965793, 0, -0.5, 0.5, 0.5,
0, -3.15077, -5.965793, 1, -0.5, 0.5, 0.5,
0, -3.15077, -5.965793, 1, 1.5, 0.5, 0.5,
0, -3.15077, -5.965793, 0, 1.5, 0.5, 0.5,
1, -3.15077, -5.965793, 0, -0.5, 0.5, 0.5,
1, -3.15077, -5.965793, 1, -0.5, 0.5, 0.5,
1, -3.15077, -5.965793, 1, 1.5, 0.5, 0.5,
1, -3.15077, -5.965793, 0, 1.5, 0.5, 0.5,
2, -3.15077, -5.965793, 0, -0.5, 0.5, 0.5,
2, -3.15077, -5.965793, 1, -0.5, 0.5, 0.5,
2, -3.15077, -5.965793, 1, 1.5, 0.5, 0.5,
2, -3.15077, -5.965793, 0, 1.5, 0.5, 0.5
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
-4.083259, -2, -5.157664,
-4.083259, 3, -5.157664,
-4.083259, -2, -5.157664,
-4.258869, -2, -5.427041,
-4.083259, -1, -5.157664,
-4.258869, -1, -5.427041,
-4.083259, 0, -5.157664,
-4.258869, 0, -5.427041,
-4.083259, 1, -5.157664,
-4.258869, 1, -5.427041,
-4.083259, 2, -5.157664,
-4.258869, 2, -5.427041,
-4.083259, 3, -5.157664,
-4.258869, 3, -5.427041
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
-4.610091, -2, -5.965793, 0, -0.5, 0.5, 0.5,
-4.610091, -2, -5.965793, 1, -0.5, 0.5, 0.5,
-4.610091, -2, -5.965793, 1, 1.5, 0.5, 0.5,
-4.610091, -2, -5.965793, 0, 1.5, 0.5, 0.5,
-4.610091, -1, -5.965793, 0, -0.5, 0.5, 0.5,
-4.610091, -1, -5.965793, 1, -0.5, 0.5, 0.5,
-4.610091, -1, -5.965793, 1, 1.5, 0.5, 0.5,
-4.610091, -1, -5.965793, 0, 1.5, 0.5, 0.5,
-4.610091, 0, -5.965793, 0, -0.5, 0.5, 0.5,
-4.610091, 0, -5.965793, 1, -0.5, 0.5, 0.5,
-4.610091, 0, -5.965793, 1, 1.5, 0.5, 0.5,
-4.610091, 0, -5.965793, 0, 1.5, 0.5, 0.5,
-4.610091, 1, -5.965793, 0, -0.5, 0.5, 0.5,
-4.610091, 1, -5.965793, 1, -0.5, 0.5, 0.5,
-4.610091, 1, -5.965793, 1, 1.5, 0.5, 0.5,
-4.610091, 1, -5.965793, 0, 1.5, 0.5, 0.5,
-4.610091, 2, -5.965793, 0, -0.5, 0.5, 0.5,
-4.610091, 2, -5.965793, 1, -0.5, 0.5, 0.5,
-4.610091, 2, -5.965793, 1, 1.5, 0.5, 0.5,
-4.610091, 2, -5.965793, 0, 1.5, 0.5, 0.5,
-4.610091, 3, -5.965793, 0, -0.5, 0.5, 0.5,
-4.610091, 3, -5.965793, 1, -0.5, 0.5, 0.5,
-4.610091, 3, -5.965793, 1, 1.5, 0.5, 0.5,
-4.610091, 3, -5.965793, 0, 1.5, 0.5, 0.5
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
-4.083259, -2.682686, -4,
-4.083259, -2.682686, 4,
-4.083259, -2.682686, -4,
-4.258869, -2.838714, -4,
-4.083259, -2.682686, -2,
-4.258869, -2.838714, -2,
-4.083259, -2.682686, 0,
-4.258869, -2.838714, 0,
-4.083259, -2.682686, 2,
-4.258869, -2.838714, 2,
-4.083259, -2.682686, 4,
-4.258869, -2.838714, 4
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
-4.610091, -3.15077, -4, 0, -0.5, 0.5, 0.5,
-4.610091, -3.15077, -4, 1, -0.5, 0.5, 0.5,
-4.610091, -3.15077, -4, 1, 1.5, 0.5, 0.5,
-4.610091, -3.15077, -4, 0, 1.5, 0.5, 0.5,
-4.610091, -3.15077, -2, 0, -0.5, 0.5, 0.5,
-4.610091, -3.15077, -2, 1, -0.5, 0.5, 0.5,
-4.610091, -3.15077, -2, 1, 1.5, 0.5, 0.5,
-4.610091, -3.15077, -2, 0, 1.5, 0.5, 0.5,
-4.610091, -3.15077, 0, 0, -0.5, 0.5, 0.5,
-4.610091, -3.15077, 0, 1, -0.5, 0.5, 0.5,
-4.610091, -3.15077, 0, 1, 1.5, 0.5, 0.5,
-4.610091, -3.15077, 0, 0, 1.5, 0.5, 0.5,
-4.610091, -3.15077, 2, 0, -0.5, 0.5, 0.5,
-4.610091, -3.15077, 2, 1, -0.5, 0.5, 0.5,
-4.610091, -3.15077, 2, 1, 1.5, 0.5, 0.5,
-4.610091, -3.15077, 2, 0, 1.5, 0.5, 0.5,
-4.610091, -3.15077, 4, 0, -0.5, 0.5, 0.5,
-4.610091, -3.15077, 4, 1, -0.5, 0.5, 0.5,
-4.610091, -3.15077, 4, 1, 1.5, 0.5, 0.5,
-4.610091, -3.15077, 4, 0, 1.5, 0.5, 0.5
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
-4.083259, -2.682686, -5.157664,
-4.083259, 3.558434, -5.157664,
-4.083259, -2.682686, 5.61739,
-4.083259, 3.558434, 5.61739,
-4.083259, -2.682686, -5.157664,
-4.083259, -2.682686, 5.61739,
-4.083259, 3.558434, -5.157664,
-4.083259, 3.558434, 5.61739,
-4.083259, -2.682686, -5.157664,
2.941173, -2.682686, -5.157664,
-4.083259, -2.682686, 5.61739,
2.941173, -2.682686, 5.61739,
-4.083259, 3.558434, -5.157664,
2.941173, 3.558434, -5.157664,
-4.083259, 3.558434, 5.61739,
2.941173, 3.558434, 5.61739,
2.941173, -2.682686, -5.157664,
2.941173, 3.558434, -5.157664,
2.941173, -2.682686, 5.61739,
2.941173, 3.558434, 5.61739,
2.941173, -2.682686, -5.157664,
2.941173, -2.682686, 5.61739,
2.941173, 3.558434, -5.157664,
2.941173, 3.558434, 5.61739
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
var radius = 7.634167;
var distance = 33.96527;
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
mvMatrix.translate( 0.5710427, -0.4378742, -0.2298629 );
mvMatrix.scale( 1.175072, 1.322553, 0.7660483 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.96527);
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
trifloxystrobin<-read.table("trifloxystrobin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-trifloxystrobin$V2
```

```
## Error in eval(expr, envir, enclos): object 'trifloxystrobin' not found
```

```r
y<-trifloxystrobin$V3
```

```
## Error in eval(expr, envir, enclos): object 'trifloxystrobin' not found
```

```r
z<-trifloxystrobin$V4
```

```
## Error in eval(expr, envir, enclos): object 'trifloxystrobin' not found
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
-3.980961, 1.766162, -3.172212, 0, 0, 1, 1, 1,
-3.234314, -1.435459, -1.342518, 1, 0, 0, 1, 1,
-2.681517, 0.1820959, -1.613454, 1, 0, 0, 1, 1,
-2.605547, 0.006188991, -1.19332, 1, 0, 0, 1, 1,
-2.478754, -1.682082, -2.43557, 1, 0, 0, 1, 1,
-2.436639, -1.311842, -3.002442, 1, 0, 0, 1, 1,
-2.429538, 0.3224461, -0.6536867, 0, 0, 0, 1, 1,
-2.411962, -0.1864113, -2.080886, 0, 0, 0, 1, 1,
-2.370729, 0.7669871, -2.280474, 0, 0, 0, 1, 1,
-2.370322, -1.472614, -0.7753329, 0, 0, 0, 1, 1,
-2.358995, -1.568698, -2.538528, 0, 0, 0, 1, 1,
-2.300999, 1.223581, -1.815306, 0, 0, 0, 1, 1,
-2.210079, 0.602314, -0.3536022, 0, 0, 0, 1, 1,
-2.180648, 0.5789179, -1.263828, 1, 1, 1, 1, 1,
-2.145259, -0.8376158, -2.177848, 1, 1, 1, 1, 1,
-2.12289, -2.591796, -2.482019, 1, 1, 1, 1, 1,
-2.096283, -0.02320446, -1.893472, 1, 1, 1, 1, 1,
-2.093241, 0.4423325, -1.644013, 1, 1, 1, 1, 1,
-2.087693, -0.6000829, -2.831747, 1, 1, 1, 1, 1,
-2.076472, 0.8408619, -1.484443, 1, 1, 1, 1, 1,
-2.070209, -0.9769029, -2.016618, 1, 1, 1, 1, 1,
-2.014586, 1.478632, -0.8445299, 1, 1, 1, 1, 1,
-2.004303, -0.4429154, -1.458611, 1, 1, 1, 1, 1,
-1.986107, 0.1654303, -0.7750061, 1, 1, 1, 1, 1,
-1.944327, 1.063943, 0.1700017, 1, 1, 1, 1, 1,
-1.936307, 1.033873, -2.325328, 1, 1, 1, 1, 1,
-1.923663, 0.6809955, -0.3334031, 1, 1, 1, 1, 1,
-1.899168, -0.2932522, -0.372951, 1, 1, 1, 1, 1,
-1.889464, -0.2331028, -3.703783, 0, 0, 1, 1, 1,
-1.880491, 1.034668, -1.897221, 1, 0, 0, 1, 1,
-1.852324, -0.63855, -1.198715, 1, 0, 0, 1, 1,
-1.827192, 1.495052, -0.6350067, 1, 0, 0, 1, 1,
-1.824927, 0.1075086, -2.849525, 1, 0, 0, 1, 1,
-1.823392, 0.2320721, -0.3557898, 1, 0, 0, 1, 1,
-1.793048, -0.06460452, -1.332413, 0, 0, 0, 1, 1,
-1.791239, 1.133654, -0.6731667, 0, 0, 0, 1, 1,
-1.78848, -0.39823, -2.829967, 0, 0, 0, 1, 1,
-1.787313, -0.130765, -2.284279, 0, 0, 0, 1, 1,
-1.782385, 0.4164266, -2.284363, 0, 0, 0, 1, 1,
-1.760581, -1.423469, -1.52317, 0, 0, 0, 1, 1,
-1.758269, -0.8974007, -1.518353, 0, 0, 0, 1, 1,
-1.75701, 1.510306, -0.184602, 1, 1, 1, 1, 1,
-1.750935, -0.2054314, -3.229213, 1, 1, 1, 1, 1,
-1.750333, 2.297259, -1.830975, 1, 1, 1, 1, 1,
-1.738229, -0.216419, -1.542854, 1, 1, 1, 1, 1,
-1.706301, 0.8895261, -0.5017056, 1, 1, 1, 1, 1,
-1.693073, -0.23283, -0.66585, 1, 1, 1, 1, 1,
-1.677465, 0.5537804, -0.9845167, 1, 1, 1, 1, 1,
-1.674486, 1.445697, -2.293819, 1, 1, 1, 1, 1,
-1.668718, -1.68119, -1.811311, 1, 1, 1, 1, 1,
-1.666871, 0.4439971, -1.996761, 1, 1, 1, 1, 1,
-1.662123, -0.9250615, -3.018543, 1, 1, 1, 1, 1,
-1.657907, -0.6866465, -3.465016, 1, 1, 1, 1, 1,
-1.641907, 1.192462, -1.455805, 1, 1, 1, 1, 1,
-1.641228, 1.939352, -0.9416652, 1, 1, 1, 1, 1,
-1.616814, 0.548978, 0.04895842, 1, 1, 1, 1, 1,
-1.607986, -0.2052243, -2.886142, 0, 0, 1, 1, 1,
-1.594916, -0.8764247, -2.136141, 1, 0, 0, 1, 1,
-1.57791, 0.1602142, -2.458951, 1, 0, 0, 1, 1,
-1.575743, 2.327614, -0.1957847, 1, 0, 0, 1, 1,
-1.574446, -0.3604421, -0.7114524, 1, 0, 0, 1, 1,
-1.563282, 0.162305, -2.171779, 1, 0, 0, 1, 1,
-1.544538, -1.081096, -2.925469, 0, 0, 0, 1, 1,
-1.530185, 1.184007, -0.8310726, 0, 0, 0, 1, 1,
-1.527555, 2.119892, -0.1586126, 0, 0, 0, 1, 1,
-1.517313, 0.335022, 0.3539764, 0, 0, 0, 1, 1,
-1.500721, 2.55452, -3.235396, 0, 0, 0, 1, 1,
-1.499671, -0.5489252, -1.585356, 0, 0, 0, 1, 1,
-1.498998, -0.3522786, -1.330722, 0, 0, 0, 1, 1,
-1.4973, -0.09515917, -2.953761, 1, 1, 1, 1, 1,
-1.481409, -0.3015994, -0.6566912, 1, 1, 1, 1, 1,
-1.474757, -0.1741357, -0.4786632, 1, 1, 1, 1, 1,
-1.469985, 1.034678, -0.9851528, 1, 1, 1, 1, 1,
-1.466943, -1.284417, -1.753697, 1, 1, 1, 1, 1,
-1.465261, 1.659387, 0.00620677, 1, 1, 1, 1, 1,
-1.457755, -0.4676882, -1.485963, 1, 1, 1, 1, 1,
-1.45684, -1.600545, -1.904156, 1, 1, 1, 1, 1,
-1.449554, 0.08656224, -0.4659072, 1, 1, 1, 1, 1,
-1.446748, 1.960602, -0.2748052, 1, 1, 1, 1, 1,
-1.441474, 0.4205298, -1.522491, 1, 1, 1, 1, 1,
-1.436258, 0.8964809, -0.2370535, 1, 1, 1, 1, 1,
-1.418714, 1.428091, -1.902827, 1, 1, 1, 1, 1,
-1.417818, -0.1079217, -1.359196, 1, 1, 1, 1, 1,
-1.417338, -1.293987, -1.914015, 1, 1, 1, 1, 1,
-1.406253, 0.1596752, -0.2901932, 0, 0, 1, 1, 1,
-1.394878, 0.3069739, 0.3063478, 1, 0, 0, 1, 1,
-1.38098, 0.08697969, -1.174989, 1, 0, 0, 1, 1,
-1.359345, 0.7087958, 0.5463585, 1, 0, 0, 1, 1,
-1.354452, -1.802517, -1.36613, 1, 0, 0, 1, 1,
-1.353756, -0.832885, -2.001122, 1, 0, 0, 1, 1,
-1.349924, 0.6206139, -0.688556, 0, 0, 0, 1, 1,
-1.342124, -0.1800085, -1.500744, 0, 0, 0, 1, 1,
-1.338983, 1.147194, -1.500696, 0, 0, 0, 1, 1,
-1.326351, 0.2556501, -0.4400451, 0, 0, 0, 1, 1,
-1.324911, -0.2793554, -0.773594, 0, 0, 0, 1, 1,
-1.315587, 0.5898571, -0.4666413, 0, 0, 0, 1, 1,
-1.315128, 1.655284, -1.366539, 0, 0, 0, 1, 1,
-1.310747, -1.238894, -4.124786, 1, 1, 1, 1, 1,
-1.309513, 2.524148, 0.2731518, 1, 1, 1, 1, 1,
-1.282773, -0.9600197, -0.5537451, 1, 1, 1, 1, 1,
-1.277673, 0.5869957, -2.548863, 1, 1, 1, 1, 1,
-1.267418, -1.575371, -1.355949, 1, 1, 1, 1, 1,
-1.266012, -0.3682446, -3.223653, 1, 1, 1, 1, 1,
-1.265603, 0.006716989, -1.016355, 1, 1, 1, 1, 1,
-1.264121, 0.3872592, -1.813159, 1, 1, 1, 1, 1,
-1.259352, 0.9437054, -0.07668511, 1, 1, 1, 1, 1,
-1.256958, -0.4607916, -0.3416691, 1, 1, 1, 1, 1,
-1.254594, 0.923444, 1.556612, 1, 1, 1, 1, 1,
-1.254454, 0.4067308, 0.06543121, 1, 1, 1, 1, 1,
-1.253089, -0.1158242, 0.2341004, 1, 1, 1, 1, 1,
-1.235558, -0.4781665, -1.695628, 1, 1, 1, 1, 1,
-1.233303, -0.7265631, -3.935903, 1, 1, 1, 1, 1,
-1.208899, 1.317371, -1.696704, 0, 0, 1, 1, 1,
-1.20748, -1.761281, 0.3211151, 1, 0, 0, 1, 1,
-1.201979, 0.1062467, -1.929152, 1, 0, 0, 1, 1,
-1.195228, -0.9721435, -3.942946, 1, 0, 0, 1, 1,
-1.19377, 0.3857816, -2.519852, 1, 0, 0, 1, 1,
-1.182653, -0.8614917, -3.107083, 1, 0, 0, 1, 1,
-1.177011, 1.077693, -2.166619, 0, 0, 0, 1, 1,
-1.167043, -0.7578626, -0.3210681, 0, 0, 0, 1, 1,
-1.144513, 0.108525, -2.971972, 0, 0, 0, 1, 1,
-1.138752, -0.7318341, -2.051015, 0, 0, 0, 1, 1,
-1.133947, 0.2181037, -1.962107, 0, 0, 0, 1, 1,
-1.131837, 0.1329151, -0.2624699, 0, 0, 0, 1, 1,
-1.129375, 2.229501, -1.322329, 0, 0, 0, 1, 1,
-1.12843, -0.7067086, -3.765662, 1, 1, 1, 1, 1,
-1.122493, -0.9576104, -1.121781, 1, 1, 1, 1, 1,
-1.122295, 0.1238441, 0.3039823, 1, 1, 1, 1, 1,
-1.114842, -0.4440904, -1.95684, 1, 1, 1, 1, 1,
-1.110463, 0.3154638, -0.7401941, 1, 1, 1, 1, 1,
-1.110214, -0.2600234, -2.47985, 1, 1, 1, 1, 1,
-1.109192, 0.4488558, -2.594089, 1, 1, 1, 1, 1,
-1.102569, 0.7311515, -1.711282, 1, 1, 1, 1, 1,
-1.097342, 0.1126967, -0.5810984, 1, 1, 1, 1, 1,
-1.094015, 1.547145, 0.4014584, 1, 1, 1, 1, 1,
-1.0931, 0.4982663, -0.7954212, 1, 1, 1, 1, 1,
-1.093023, 0.8883323, -0.263471, 1, 1, 1, 1, 1,
-1.090905, 1.384643, -0.9215873, 1, 1, 1, 1, 1,
-1.079358, -0.178218, -1.766252, 1, 1, 1, 1, 1,
-1.077645, -0.3765771, -0.7094612, 1, 1, 1, 1, 1,
-1.077464, 1.519926, -0.8589984, 0, 0, 1, 1, 1,
-1.072985, 0.7940621, -0.8647373, 1, 0, 0, 1, 1,
-1.063609, -0.07373654, -2.127447, 1, 0, 0, 1, 1,
-1.061298, -0.2417708, -3.802611, 1, 0, 0, 1, 1,
-1.057617, 0.1035855, -2.614703, 1, 0, 0, 1, 1,
-1.055026, 0.213223, -1.45922, 1, 0, 0, 1, 1,
-1.050496, 0.8881689, -0.905821, 0, 0, 0, 1, 1,
-1.042111, 0.01653436, -1.936285, 0, 0, 0, 1, 1,
-1.041439, 0.5235956, -1.226269, 0, 0, 0, 1, 1,
-1.033123, 0.5813081, -0.7876154, 0, 0, 0, 1, 1,
-1.032897, -0.5344323, -0.8058856, 0, 0, 0, 1, 1,
-1.032686, -0.2702219, -0.3169949, 0, 0, 0, 1, 1,
-1.03037, 1.914153, -0.2504244, 0, 0, 0, 1, 1,
-1.029846, -0.3158154, -3.570977, 1, 1, 1, 1, 1,
-1.029282, -0.5386443, -2.075507, 1, 1, 1, 1, 1,
-1.028767, -1.555905, -2.493903, 1, 1, 1, 1, 1,
-1.02848, -0.560517, -0.2297925, 1, 1, 1, 1, 1,
-1.022606, 0.7950587, -1.412282, 1, 1, 1, 1, 1,
-1.014453, 1.199617, -1.438534, 1, 1, 1, 1, 1,
-1.013996, 1.000922, -0.4430251, 1, 1, 1, 1, 1,
-0.9931986, -0.8109398, -3.110394, 1, 1, 1, 1, 1,
-0.9826665, -0.9416618, -2.999478, 1, 1, 1, 1, 1,
-0.9733871, 1.642922, -1.084025, 1, 1, 1, 1, 1,
-0.9716109, -0.1829392, -1.188566, 1, 1, 1, 1, 1,
-0.9693816, -0.01356162, 0.637282, 1, 1, 1, 1, 1,
-0.966863, -0.2532898, -2.071075, 1, 1, 1, 1, 1,
-0.9629226, 2.3771, 0.9688075, 1, 1, 1, 1, 1,
-0.9555331, 1.338521, -1.193128, 1, 1, 1, 1, 1,
-0.954995, 1.52667, 1.198662, 0, 0, 1, 1, 1,
-0.9522303, -1.077741, -2.80865, 1, 0, 0, 1, 1,
-0.9485294, -1.012751, -1.29251, 1, 0, 0, 1, 1,
-0.9460737, -0.404952, -3.240616, 1, 0, 0, 1, 1,
-0.9457507, 0.5025619, -1.154774, 1, 0, 0, 1, 1,
-0.943393, 1.084737, -1.27693, 1, 0, 0, 1, 1,
-0.9386113, 0.7027053, 1.034423, 0, 0, 0, 1, 1,
-0.9353689, -0.007556158, -1.241037, 0, 0, 0, 1, 1,
-0.9328166, 0.6861528, -1.591855, 0, 0, 0, 1, 1,
-0.93257, -2.290722, -2.638938, 0, 0, 0, 1, 1,
-0.9175341, -0.9530287, -1.494101, 0, 0, 0, 1, 1,
-0.9164805, 1.170623, -0.02357668, 0, 0, 0, 1, 1,
-0.9159986, -0.4480496, -0.9256687, 0, 0, 0, 1, 1,
-0.915265, -0.9425744, -0.9825187, 1, 1, 1, 1, 1,
-0.9136257, -0.2489216, -3.221823, 1, 1, 1, 1, 1,
-0.9097475, -0.2256809, -2.216002, 1, 1, 1, 1, 1,
-0.8912183, 0.3360664, -1.996633, 1, 1, 1, 1, 1,
-0.8876219, 1.267855, -0.1710961, 1, 1, 1, 1, 1,
-0.8736297, 1.427928, -0.8849563, 1, 1, 1, 1, 1,
-0.8726996, -1.336647, -2.422255, 1, 1, 1, 1, 1,
-0.8681518, 0.9568132, -0.9271896, 1, 1, 1, 1, 1,
-0.866275, -1.20103, -4.626434, 1, 1, 1, 1, 1,
-0.8625693, 0.1669494, -2.836054, 1, 1, 1, 1, 1,
-0.8605021, 0.2405567, -1.222784, 1, 1, 1, 1, 1,
-0.8602588, 0.3247073, -3.055477, 1, 1, 1, 1, 1,
-0.8556338, 0.6934987, -1.701786, 1, 1, 1, 1, 1,
-0.8543053, 0.146273, -1.927865, 1, 1, 1, 1, 1,
-0.8470423, -0.1736562, -0.7678844, 1, 1, 1, 1, 1,
-0.837453, 1.947412, 0.7426714, 0, 0, 1, 1, 1,
-0.8335315, -1.353677, -3.650035, 1, 0, 0, 1, 1,
-0.8322175, 1.43947, -2.6329, 1, 0, 0, 1, 1,
-0.8312247, 0.2595238, -0.7726718, 1, 0, 0, 1, 1,
-0.8272427, 1.396273, 2.041802, 1, 0, 0, 1, 1,
-0.8271607, 0.09088244, 0.6279518, 1, 0, 0, 1, 1,
-0.8128343, -0.5070513, -2.133827, 0, 0, 0, 1, 1,
-0.8108422, 1.419264, -0.1843175, 0, 0, 0, 1, 1,
-0.806528, -0.2870763, -1.662783, 0, 0, 0, 1, 1,
-0.7954311, 0.7011313, -0.4478098, 0, 0, 0, 1, 1,
-0.7889203, -0.392364, -1.08634, 0, 0, 0, 1, 1,
-0.7880617, 0.8492929, -0.9973157, 0, 0, 0, 1, 1,
-0.7786363, -0.7993134, -3.196817, 0, 0, 0, 1, 1,
-0.7759809, -0.486213, -2.446529, 1, 1, 1, 1, 1,
-0.772495, 0.825945, -0.9689348, 1, 1, 1, 1, 1,
-0.7713507, -0.7388067, -1.009415, 1, 1, 1, 1, 1,
-0.768914, 1.306527, -3.234552, 1, 1, 1, 1, 1,
-0.7674839, -0.4838437, -2.761515, 1, 1, 1, 1, 1,
-0.7667665, 0.07206233, -1.631948, 1, 1, 1, 1, 1,
-0.7649972, 1.567826, -0.6390405, 1, 1, 1, 1, 1,
-0.7631873, 0.6588592, -1.217531, 1, 1, 1, 1, 1,
-0.7614861, 1.52392, -1.357816, 1, 1, 1, 1, 1,
-0.7601357, 0.7464986, 0.23932, 1, 1, 1, 1, 1,
-0.7598432, 1.250826, -1.449551, 1, 1, 1, 1, 1,
-0.7575812, -1.251556, -2.123435, 1, 1, 1, 1, 1,
-0.7542791, 0.6098774, 1.421448, 1, 1, 1, 1, 1,
-0.7533953, -1.523979, -4.45432, 1, 1, 1, 1, 1,
-0.7483601, 0.9523412, -0.1384058, 1, 1, 1, 1, 1,
-0.7470797, 0.3376208, -1.549419, 0, 0, 1, 1, 1,
-0.7462484, 0.1569456, -1.891029, 1, 0, 0, 1, 1,
-0.7434833, -0.7541145, -2.867216, 1, 0, 0, 1, 1,
-0.7420284, -0.6681694, -3.237776, 1, 0, 0, 1, 1,
-0.7402151, -0.585333, -4.100973, 1, 0, 0, 1, 1,
-0.7379136, 0.3963528, -2.528728, 1, 0, 0, 1, 1,
-0.7376142, 0.6387321, -0.9188982, 0, 0, 0, 1, 1,
-0.7366803, 0.7221743, 1.00543, 0, 0, 0, 1, 1,
-0.7269605, 1.727246, 0.5879441, 0, 0, 0, 1, 1,
-0.7241507, -1.064621, -0.8183929, 0, 0, 0, 1, 1,
-0.7203394, 0.4387716, -0.9632722, 0, 0, 0, 1, 1,
-0.7202124, -0.9874379, -2.301514, 0, 0, 0, 1, 1,
-0.7148367, -0.5133303, -1.327388, 0, 0, 0, 1, 1,
-0.71412, -0.9743734, -2.668143, 1, 1, 1, 1, 1,
-0.7124988, 1.65864, -0.6351458, 1, 1, 1, 1, 1,
-0.7066174, -0.7320845, -1.448777, 1, 1, 1, 1, 1,
-0.7063363, 0.653284, 1.373372, 1, 1, 1, 1, 1,
-0.698284, 0.3070282, -0.7324157, 1, 1, 1, 1, 1,
-0.6980221, 0.5186225, -0.9252749, 1, 1, 1, 1, 1,
-0.6951191, -0.8802947, -2.454241, 1, 1, 1, 1, 1,
-0.6950721, -0.4222455, -0.9496067, 1, 1, 1, 1, 1,
-0.6878904, -1.498898, -2.276354, 1, 1, 1, 1, 1,
-0.6822858, -0.5824574, -3.397924, 1, 1, 1, 1, 1,
-0.6778992, 1.164773, -1.841288, 1, 1, 1, 1, 1,
-0.6680117, -1.9173, -4.111915, 1, 1, 1, 1, 1,
-0.6675564, -1.659414, -1.380892, 1, 1, 1, 1, 1,
-0.6667634, 1.302266, -1.122382, 1, 1, 1, 1, 1,
-0.6644114, 1.840048, -0.1307963, 1, 1, 1, 1, 1,
-0.6563078, -1.408674, -3.480566, 0, 0, 1, 1, 1,
-0.6559417, -0.8935775, -3.399839, 1, 0, 0, 1, 1,
-0.6555633, -1.219638, -3.455198, 1, 0, 0, 1, 1,
-0.6479351, -1.901561, -2.6979, 1, 0, 0, 1, 1,
-0.6416938, 0.06523577, -1.21655, 1, 0, 0, 1, 1,
-0.63931, -1.329932, -2.745487, 1, 0, 0, 1, 1,
-0.630808, 0.6370577, -0.04366248, 0, 0, 0, 1, 1,
-0.6289475, 0.05802712, -1.533884, 0, 0, 0, 1, 1,
-0.6257133, 1.542866, 1.070574, 0, 0, 0, 1, 1,
-0.6225055, 0.1948893, 0.3857971, 0, 0, 0, 1, 1,
-0.6200283, 0.4340145, -1.712632, 0, 0, 0, 1, 1,
-0.6173723, -0.9158114, -4.498206, 0, 0, 0, 1, 1,
-0.6152565, 0.9289312, -1.092776, 0, 0, 0, 1, 1,
-0.6111753, -0.441514, -2.720422, 1, 1, 1, 1, 1,
-0.6055453, 0.6247832, -0.6497146, 1, 1, 1, 1, 1,
-0.604749, -0.8579499, -2.774632, 1, 1, 1, 1, 1,
-0.602175, 1.049079, -1.26353, 1, 1, 1, 1, 1,
-0.6021304, -0.1900621, -2.789813, 1, 1, 1, 1, 1,
-0.5997863, -0.6250685, -2.464156, 1, 1, 1, 1, 1,
-0.5977061, -0.7604066, -1.762646, 1, 1, 1, 1, 1,
-0.5964909, -1.231584, -2.957881, 1, 1, 1, 1, 1,
-0.5952004, 1.150022, 0.705251, 1, 1, 1, 1, 1,
-0.593752, 2.097121, -0.3594337, 1, 1, 1, 1, 1,
-0.5921335, -1.516869, -1.582766, 1, 1, 1, 1, 1,
-0.5918068, 0.09648597, -1.201396, 1, 1, 1, 1, 1,
-0.5887444, 0.5042418, -1.28746, 1, 1, 1, 1, 1,
-0.5883976, -1.148566, -3.142923, 1, 1, 1, 1, 1,
-0.5770473, -0.2010345, -0.9758522, 1, 1, 1, 1, 1,
-0.57699, 2.312266, 0.03058436, 0, 0, 1, 1, 1,
-0.5700746, -0.3021465, -4.154325, 1, 0, 0, 1, 1,
-0.5690085, 1.338277, -2.718033, 1, 0, 0, 1, 1,
-0.568529, 0.8571908, -1.872587, 1, 0, 0, 1, 1,
-0.5651265, -1.480275, -3.361978, 1, 0, 0, 1, 1,
-0.5649468, 0.5389664, -0.4772695, 1, 0, 0, 1, 1,
-0.5606129, -0.3174264, -0.8353678, 0, 0, 0, 1, 1,
-0.5593827, -0.4773138, -3.698001, 0, 0, 0, 1, 1,
-0.5583723, 0.7066237, 0.2336179, 0, 0, 0, 1, 1,
-0.5547785, -0.8027905, -1.916108, 0, 0, 0, 1, 1,
-0.5498788, -0.2248807, -1.178689, 0, 0, 0, 1, 1,
-0.5466412, -1.065237, -2.829822, 0, 0, 0, 1, 1,
-0.5449325, -0.2910929, -3.246186, 0, 0, 0, 1, 1,
-0.5435006, -0.5872619, -2.405207, 1, 1, 1, 1, 1,
-0.5405428, 1.831544, 0.3461236, 1, 1, 1, 1, 1,
-0.5389234, 0.6126552, -0.8528755, 1, 1, 1, 1, 1,
-0.5352837, -0.1679045, -1.978591, 1, 1, 1, 1, 1,
-0.5315206, -0.4759251, -1.654672, 1, 1, 1, 1, 1,
-0.5308937, -1.35252, -1.796492, 1, 1, 1, 1, 1,
-0.5303549, -1.010244, -1.230086, 1, 1, 1, 1, 1,
-0.5268028, -0.8633263, -1.08299, 1, 1, 1, 1, 1,
-0.5253928, -0.28051, -1.04587, 1, 1, 1, 1, 1,
-0.5229255, -0.3877278, -3.606597, 1, 1, 1, 1, 1,
-0.5220178, 1.396726, 0.3359296, 1, 1, 1, 1, 1,
-0.5171115, -0.1796615, -1.904055, 1, 1, 1, 1, 1,
-0.51709, 1.158251, -1.179115, 1, 1, 1, 1, 1,
-0.5138976, 0.2522762, -1.386072, 1, 1, 1, 1, 1,
-0.5127414, -0.5031055, -2.38828, 1, 1, 1, 1, 1,
-0.5100092, -0.3693789, -3.716453, 0, 0, 1, 1, 1,
-0.5094255, -1.750273, -3.452704, 1, 0, 0, 1, 1,
-0.5074293, -0.5602036, -3.028011, 1, 0, 0, 1, 1,
-0.5071876, -0.01283148, -2.229899, 1, 0, 0, 1, 1,
-0.5067306, 0.1279888, -3.425591, 1, 0, 0, 1, 1,
-0.5049079, -0.3353021, -2.757941, 1, 0, 0, 1, 1,
-0.5047363, 1.119689, 0.8157325, 0, 0, 0, 1, 1,
-0.4985229, -0.7501824, -2.490857, 0, 0, 0, 1, 1,
-0.4935744, -1.414029, -2.471073, 0, 0, 0, 1, 1,
-0.4893054, 0.4281342, -1.87338, 0, 0, 0, 1, 1,
-0.4866037, 1.008125, -0.8635173, 0, 0, 0, 1, 1,
-0.4853163, 0.6565968, -0.3826528, 0, 0, 0, 1, 1,
-0.4847917, -0.2965261, -2.876152, 0, 0, 0, 1, 1,
-0.4793999, 2.874065, -0.787701, 1, 1, 1, 1, 1,
-0.476543, 0.5498569, 1.103167, 1, 1, 1, 1, 1,
-0.4725908, -1.792756, -3.174104, 1, 1, 1, 1, 1,
-0.4724988, -1.836626, -2.815771, 1, 1, 1, 1, 1,
-0.4704508, 1.249298, -0.7799117, 1, 1, 1, 1, 1,
-0.4678369, 0.2525503, -1.424222, 1, 1, 1, 1, 1,
-0.4675958, -0.06125994, -1.643119, 1, 1, 1, 1, 1,
-0.4639476, 0.6910854, -2.855359, 1, 1, 1, 1, 1,
-0.462715, -0.3586877, -0.7375156, 1, 1, 1, 1, 1,
-0.4585177, -0.8889354, -2.610802, 1, 1, 1, 1, 1,
-0.4578897, 1.139848, -1.503157, 1, 1, 1, 1, 1,
-0.4506992, -0.1296646, -3.229882, 1, 1, 1, 1, 1,
-0.4488334, 0.3861851, -0.5214412, 1, 1, 1, 1, 1,
-0.445543, 0.9063627, -1.644181, 1, 1, 1, 1, 1,
-0.4434777, 0.8373374, -1.692959, 1, 1, 1, 1, 1,
-0.4432682, 0.2037145, -0.9990707, 0, 0, 1, 1, 1,
-0.4362296, -0.455653, -1.286114, 1, 0, 0, 1, 1,
-0.4310763, 1.752837, -0.02505292, 1, 0, 0, 1, 1,
-0.4282709, -0.8977454, -3.510478, 1, 0, 0, 1, 1,
-0.4232166, 1.156844, -1.633867, 1, 0, 0, 1, 1,
-0.4209045, 0.47001, -1.931568, 1, 0, 0, 1, 1,
-0.4138186, -0.0207715, -2.529207, 0, 0, 0, 1, 1,
-0.4098505, -0.05103779, -1.43653, 0, 0, 0, 1, 1,
-0.4085741, 0.9610742, -0.3986754, 0, 0, 0, 1, 1,
-0.4051338, -1.442282, -4.268981, 0, 0, 0, 1, 1,
-0.4038297, 0.8541673, -0.7070274, 0, 0, 0, 1, 1,
-0.396969, -0.284845, -3.546161, 0, 0, 0, 1, 1,
-0.3936499, 1.978523, -1.457925, 0, 0, 0, 1, 1,
-0.3874996, 1.131412, -0.7416241, 1, 1, 1, 1, 1,
-0.3869205, -1.915567, -1.376479, 1, 1, 1, 1, 1,
-0.3836971, 0.6072081, 0.2751057, 1, 1, 1, 1, 1,
-0.3780229, 0.6848914, -1.184954, 1, 1, 1, 1, 1,
-0.3757477, -0.3551797, -2.494174, 1, 1, 1, 1, 1,
-0.3744968, -0.7689962, -0.7426322, 1, 1, 1, 1, 1,
-0.3713684, -2.419723, -3.383513, 1, 1, 1, 1, 1,
-0.3693153, -1.670243, -3.162051, 1, 1, 1, 1, 1,
-0.3661222, -1.02584, -2.883198, 1, 1, 1, 1, 1,
-0.3639612, 0.9489281, -0.5943604, 1, 1, 1, 1, 1,
-0.3638446, 1.732316, -0.5110216, 1, 1, 1, 1, 1,
-0.3625485, -0.7484557, -3.377859, 1, 1, 1, 1, 1,
-0.3592533, 0.3353383, -0.3774634, 1, 1, 1, 1, 1,
-0.3572893, -0.2376975, -2.243774, 1, 1, 1, 1, 1,
-0.3565065, -0.3057626, -2.804375, 1, 1, 1, 1, 1,
-0.3525685, 0.3252496, -0.47414, 0, 0, 1, 1, 1,
-0.3497105, 2.441532, 0.4515262, 1, 0, 0, 1, 1,
-0.3472267, -0.9550286, -2.397732, 1, 0, 0, 1, 1,
-0.3351305, 0.1842775, -0.6090382, 1, 0, 0, 1, 1,
-0.3308473, -0.1418259, -0.9958472, 1, 0, 0, 1, 1,
-0.3250932, 0.8556957, -0.2914335, 1, 0, 0, 1, 1,
-0.3245622, -0.5485093, -1.611363, 0, 0, 0, 1, 1,
-0.3243685, -0.8892123, -4.134898, 0, 0, 0, 1, 1,
-0.3182888, 1.232055, -0.6183175, 0, 0, 0, 1, 1,
-0.3164259, 0.3059036, -1.22493, 0, 0, 0, 1, 1,
-0.315972, 1.453428, 1.730758, 0, 0, 0, 1, 1,
-0.3144743, 0.171986, 0.355919, 0, 0, 0, 1, 1,
-0.3086618, 0.8384928, 0.02618285, 0, 0, 0, 1, 1,
-0.3040824, -0.6213345, -2.052839, 1, 1, 1, 1, 1,
-0.3034846, -0.3985302, -2.840765, 1, 1, 1, 1, 1,
-0.2996278, 2.062575, -0.4687596, 1, 1, 1, 1, 1,
-0.29704, 0.7124468, -0.04210311, 1, 1, 1, 1, 1,
-0.2894734, -0.7285275, -3.596692, 1, 1, 1, 1, 1,
-0.2839495, 0.5849327, 1.187122, 1, 1, 1, 1, 1,
-0.2829229, -2.153306, -2.667988, 1, 1, 1, 1, 1,
-0.278609, -0.4743091, -3.205298, 1, 1, 1, 1, 1,
-0.2771607, 1.173031, -1.161733, 1, 1, 1, 1, 1,
-0.2755974, 1.232507, -0.3798042, 1, 1, 1, 1, 1,
-0.2722486, 0.1684118, -1.542148, 1, 1, 1, 1, 1,
-0.2716518, 0.846896, 0.2970052, 1, 1, 1, 1, 1,
-0.2707024, -0.2624477, -2.125902, 1, 1, 1, 1, 1,
-0.2694083, -0.002841245, -4.535235, 1, 1, 1, 1, 1,
-0.2643879, -0.4006085, -2.438966, 1, 1, 1, 1, 1,
-0.2588296, -0.1307204, -3.559463, 0, 0, 1, 1, 1,
-0.2579204, -1.728124, -3.61261, 1, 0, 0, 1, 1,
-0.2557331, -0.6333555, -2.578387, 1, 0, 0, 1, 1,
-0.254965, 0.8472823, 1.968421, 1, 0, 0, 1, 1,
-0.2518754, 2.063091, 1.334617, 1, 0, 0, 1, 1,
-0.2450463, 1.104246, -1.874157, 1, 0, 0, 1, 1,
-0.2446686, -0.04080093, -1.224557, 0, 0, 0, 1, 1,
-0.2436559, 0.3074523, -1.20846, 0, 0, 0, 1, 1,
-0.2434949, -1.637125, -1.147897, 0, 0, 0, 1, 1,
-0.2414629, -0.5376807, -3.333298, 0, 0, 0, 1, 1,
-0.2371445, 0.3344424, -0.4715651, 0, 0, 0, 1, 1,
-0.235251, 0.4377041, 0.1109018, 0, 0, 0, 1, 1,
-0.2301812, -1.00769, -2.984175, 0, 0, 0, 1, 1,
-0.2262759, -1.120448, -1.540398, 1, 1, 1, 1, 1,
-0.2255148, -0.5422448, -2.906968, 1, 1, 1, 1, 1,
-0.2235236, -0.3356096, -3.802464, 1, 1, 1, 1, 1,
-0.2233421, -0.30336, -3.247489, 1, 1, 1, 1, 1,
-0.2195462, 0.6515376, -1.347256, 1, 1, 1, 1, 1,
-0.2115081, -0.4600904, -2.694501, 1, 1, 1, 1, 1,
-0.210957, -1.126146, -2.241513, 1, 1, 1, 1, 1,
-0.2106718, 1.922474, 0.5899433, 1, 1, 1, 1, 1,
-0.2092502, 0.6326991, 1.303475, 1, 1, 1, 1, 1,
-0.2058743, 0.2042202, -0.2203777, 1, 1, 1, 1, 1,
-0.203208, 1.216627, -1.323037, 1, 1, 1, 1, 1,
-0.2015179, 0.970686, 1.360659, 1, 1, 1, 1, 1,
-0.2005287, 0.4307083, -0.07811802, 1, 1, 1, 1, 1,
-0.194745, 0.269305, -1.097336, 1, 1, 1, 1, 1,
-0.1925412, -0.1660465, -1.032654, 1, 1, 1, 1, 1,
-0.1818691, 0.7606886, -1.031057, 0, 0, 1, 1, 1,
-0.1766504, 0.8994525, 2.001702, 1, 0, 0, 1, 1,
-0.1763799, -0.6584175, -2.301139, 1, 0, 0, 1, 1,
-0.1750415, -0.1255076, -3.22729, 1, 0, 0, 1, 1,
-0.1748746, -0.3541355, -1.870476, 1, 0, 0, 1, 1,
-0.1743658, -1.636893, -1.385073, 1, 0, 0, 1, 1,
-0.1731819, -0.6633281, -2.288964, 0, 0, 0, 1, 1,
-0.1703233, -0.5974539, -2.039459, 0, 0, 0, 1, 1,
-0.1696505, -0.8313665, -3.244215, 0, 0, 0, 1, 1,
-0.1695767, 0.9280362, -0.6358187, 0, 0, 0, 1, 1,
-0.1683362, 1.108622, 0.9848469, 0, 0, 0, 1, 1,
-0.1637668, -0.7801718, -3.925105, 0, 0, 0, 1, 1,
-0.1626811, -1.34896, -3.399774, 0, 0, 0, 1, 1,
-0.1610906, -0.00507438, -2.547712, 1, 1, 1, 1, 1,
-0.1579614, -0.6100471, -3.732798, 1, 1, 1, 1, 1,
-0.1551622, -0.7473541, -3.818956, 1, 1, 1, 1, 1,
-0.1500916, 0.6433597, 1.085558, 1, 1, 1, 1, 1,
-0.1488596, 2.156341, -0.1098849, 1, 1, 1, 1, 1,
-0.1483242, -0.3953536, -2.805472, 1, 1, 1, 1, 1,
-0.1467671, -0.6762401, -2.576532, 1, 1, 1, 1, 1,
-0.1464662, -1.827389, -4.651242, 1, 1, 1, 1, 1,
-0.1414445, -0.7274433, -2.979272, 1, 1, 1, 1, 1,
-0.1409441, -1.009843, -2.707137, 1, 1, 1, 1, 1,
-0.1392266, -0.9483808, -3.141351, 1, 1, 1, 1, 1,
-0.1241624, 0.1414176, 0.3826927, 1, 1, 1, 1, 1,
-0.1204384, -0.1876025, -2.856574, 1, 1, 1, 1, 1,
-0.1189378, -0.5670819, -2.908748, 1, 1, 1, 1, 1,
-0.1173736, -1.420306, -3.640056, 1, 1, 1, 1, 1,
-0.1170724, 0.1346308, -0.3597186, 0, 0, 1, 1, 1,
-0.1158539, -1.17976, -3.781265, 1, 0, 0, 1, 1,
-0.1148523, -0.07579158, -1.495348, 1, 0, 0, 1, 1,
-0.1117576, 0.5489103, 2.108047, 1, 0, 0, 1, 1,
-0.1106623, -1.719603, -2.5383, 1, 0, 0, 1, 1,
-0.1054411, -0.7657536, -1.63679, 1, 0, 0, 1, 1,
-0.1021362, -0.201869, -2.193992, 0, 0, 0, 1, 1,
-0.1017825, 0.2551414, -2.491834, 0, 0, 0, 1, 1,
-0.09968454, 1.136196, -0.7009714, 0, 0, 0, 1, 1,
-0.09861578, -0.1137119, -4.152676, 0, 0, 0, 1, 1,
-0.0980188, 0.8191384, -0.2528259, 0, 0, 0, 1, 1,
-0.09411589, 1.209895, -1.298349, 0, 0, 0, 1, 1,
-0.0935547, 0.5669649, -0.5588307, 0, 0, 0, 1, 1,
-0.09054147, -2.17122, -3.559205, 1, 1, 1, 1, 1,
-0.08064181, 1.215531, -0.5793425, 1, 1, 1, 1, 1,
-0.0788023, -0.05801352, -2.506469, 1, 1, 1, 1, 1,
-0.07753744, 0.8924194, -0.189052, 1, 1, 1, 1, 1,
-0.07390986, -0.3591511, -3.354826, 1, 1, 1, 1, 1,
-0.07353289, -0.06380083, -1.939142, 1, 1, 1, 1, 1,
-0.07308558, -0.6044474, -3.502578, 1, 1, 1, 1, 1,
-0.07169836, -1.500536, -2.399215, 1, 1, 1, 1, 1,
-0.07052588, -1.499697, -4.449316, 1, 1, 1, 1, 1,
-0.06998814, 1.030132, 0.6452168, 1, 1, 1, 1, 1,
-0.06739492, -0.2026219, -3.349681, 1, 1, 1, 1, 1,
-0.0664674, 0.4522756, 0.986359, 1, 1, 1, 1, 1,
-0.06500137, -1.002958, -3.313121, 1, 1, 1, 1, 1,
-0.06418373, -0.180905, -2.404425, 1, 1, 1, 1, 1,
-0.06299942, -0.6964287, -2.740082, 1, 1, 1, 1, 1,
-0.06242195, -1.427619, -4.637416, 0, 0, 1, 1, 1,
-0.05466169, 0.988433, 1.55619, 1, 0, 0, 1, 1,
-0.05434373, -0.844879, -3.278596, 1, 0, 0, 1, 1,
-0.04821774, -0.3964371, -3.582066, 1, 0, 0, 1, 1,
-0.04804749, -0.6344411, -1.407772, 1, 0, 0, 1, 1,
-0.04598795, 0.7842914, -0.7525747, 1, 0, 0, 1, 1,
-0.04379505, 1.844746, 0.3051627, 0, 0, 0, 1, 1,
-0.03595205, 1.8956, -1.166388, 0, 0, 0, 1, 1,
-0.03479653, -0.9302819, -2.411616, 0, 0, 0, 1, 1,
-0.0346291, -1.698774, -3.131084, 0, 0, 0, 1, 1,
-0.02779442, 1.454784, -0.3798661, 0, 0, 0, 1, 1,
-0.02393985, 2.338224, 0.6141285, 0, 0, 0, 1, 1,
-0.0228059, 0.1049383, 0.2094664, 0, 0, 0, 1, 1,
-0.01094145, -0.1963444, -5.000746, 1, 1, 1, 1, 1,
-0.002179234, -0.4236953, -2.144454, 1, 1, 1, 1, 1,
0.0003691312, 0.7425151, 0.5209703, 1, 1, 1, 1, 1,
0.004380942, -0.2213084, 4.811663, 1, 1, 1, 1, 1,
0.006242097, -1.486745, 3.330852, 1, 1, 1, 1, 1,
0.00839485, 1.66438, -0.678348, 1, 1, 1, 1, 1,
0.01436657, -0.6948332, 3.815004, 1, 1, 1, 1, 1,
0.01859945, -0.6793532, 2.355867, 1, 1, 1, 1, 1,
0.0189762, 0.02364461, 1.467043, 1, 1, 1, 1, 1,
0.02033559, -1.477149, 4.310649, 1, 1, 1, 1, 1,
0.02040651, -0.3047462, 2.779838, 1, 1, 1, 1, 1,
0.02071551, -0.3002, 3.299849, 1, 1, 1, 1, 1,
0.02286579, 0.1030559, 0.7668492, 1, 1, 1, 1, 1,
0.02309155, -0.1221025, 4.247488, 1, 1, 1, 1, 1,
0.02542824, -0.3562151, 1.957187, 1, 1, 1, 1, 1,
0.0289549, -0.3757689, 4.604656, 0, 0, 1, 1, 1,
0.03068148, -0.1873247, 3.012984, 1, 0, 0, 1, 1,
0.04160933, -0.4405245, 1.633595, 1, 0, 0, 1, 1,
0.04690929, 1.169196, 0.7563661, 1, 0, 0, 1, 1,
0.04920901, 0.5181888, 0.09722123, 1, 0, 0, 1, 1,
0.0506038, -2.484497, 3.146076, 1, 0, 0, 1, 1,
0.05378805, 0.4261862, -0.3979273, 0, 0, 0, 1, 1,
0.05588457, -0.202442, 3.693352, 0, 0, 0, 1, 1,
0.0592621, 0.9517779, -0.2103794, 0, 0, 0, 1, 1,
0.0608152, -0.6338424, 2.568039, 0, 0, 0, 1, 1,
0.06752805, 0.2865174, 1.512493, 0, 0, 0, 1, 1,
0.06813961, 0.5807946, -0.2825342, 0, 0, 0, 1, 1,
0.07050262, 1.55897, -0.4229434, 0, 0, 0, 1, 1,
0.07210846, -0.07897615, 1.449623, 1, 1, 1, 1, 1,
0.08137386, 0.6378402, 0.3806785, 1, 1, 1, 1, 1,
0.08296373, 0.0757042, 1.667592, 1, 1, 1, 1, 1,
0.08321618, 0.9098276, 0.06865218, 1, 1, 1, 1, 1,
0.083835, 0.7463608, 0.3228852, 1, 1, 1, 1, 1,
0.0841706, 0.08287957, 1.930376, 1, 1, 1, 1, 1,
0.08660056, -1.202156, 4.255095, 1, 1, 1, 1, 1,
0.09513764, -1.061224, 3.188133, 1, 1, 1, 1, 1,
0.09694694, -1.275154, 2.053764, 1, 1, 1, 1, 1,
0.09809605, -0.7428578, 5.460472, 1, 1, 1, 1, 1,
0.1066157, -0.08901196, 1.732697, 1, 1, 1, 1, 1,
0.112841, 0.7797371, -1.517861, 1, 1, 1, 1, 1,
0.1152467, 0.7294273, -1.410733, 1, 1, 1, 1, 1,
0.1170064, 0.7556102, -0.8301137, 1, 1, 1, 1, 1,
0.1176337, 0.6855872, 0.1026959, 1, 1, 1, 1, 1,
0.1204903, -0.1514192, 2.412721, 0, 0, 1, 1, 1,
0.1278085, -0.4011542, 3.332003, 1, 0, 0, 1, 1,
0.1316668, 1.498425, 0.3220612, 1, 0, 0, 1, 1,
0.1318436, 0.9448178, 0.06636779, 1, 0, 0, 1, 1,
0.1350646, -1.376127, 1.943166, 1, 0, 0, 1, 1,
0.1361758, -0.1206974, 2.454636, 1, 0, 0, 1, 1,
0.1408017, -0.7449628, 1.320436, 0, 0, 0, 1, 1,
0.1536474, 0.2704553, -0.254745, 0, 0, 0, 1, 1,
0.1581809, 2.852734, 1.226119, 0, 0, 0, 1, 1,
0.1600532, 1.618136, 1.117375, 0, 0, 0, 1, 1,
0.162119, -2.568792, 3.408822, 0, 0, 0, 1, 1,
0.1630354, -0.2308743, 1.067153, 0, 0, 0, 1, 1,
0.1724867, -1.003484, 3.232346, 0, 0, 0, 1, 1,
0.182853, 0.7481352, 1.772282, 1, 1, 1, 1, 1,
0.1867636, 1.50334, -0.5360658, 1, 1, 1, 1, 1,
0.188025, 0.3394666, 1.394627, 1, 1, 1, 1, 1,
0.1897552, -0.171702, 3.758924, 1, 1, 1, 1, 1,
0.1926856, 0.06446648, 1.605892, 1, 1, 1, 1, 1,
0.1955066, 1.445804, 0.1370195, 1, 1, 1, 1, 1,
0.1985149, -0.9325132, 3.22532, 1, 1, 1, 1, 1,
0.2035889, 1.100656, 0.1794476, 1, 1, 1, 1, 1,
0.2037698, -0.4434004, 3.126873, 1, 1, 1, 1, 1,
0.2057642, -0.4805706, 1.997421, 1, 1, 1, 1, 1,
0.2121682, -0.5565671, 2.981832, 1, 1, 1, 1, 1,
0.214925, 0.6576589, 0.9488033, 1, 1, 1, 1, 1,
0.2157374, 0.6291545, 0.3704459, 1, 1, 1, 1, 1,
0.219567, 1.105965, 1.141892, 1, 1, 1, 1, 1,
0.222508, 0.02047565, 1.285187, 1, 1, 1, 1, 1,
0.2242235, 0.3160731, -0.5951014, 0, 0, 1, 1, 1,
0.2272014, 0.5024627, -0.06157251, 1, 0, 0, 1, 1,
0.2273434, 0.9146404, 1.419212, 1, 0, 0, 1, 1,
0.228193, -0.2169918, 3.600955, 1, 0, 0, 1, 1,
0.2291783, 0.1557445, 1.702273, 1, 0, 0, 1, 1,
0.2330219, 0.1231237, 1.289276, 1, 0, 0, 1, 1,
0.2353467, 0.457384, 0.559221, 0, 0, 0, 1, 1,
0.237785, -0.4629484, 0.9492792, 0, 0, 0, 1, 1,
0.2397254, -1.509788, 1.559176, 0, 0, 0, 1, 1,
0.2423883, -0.50217, 2.342668, 0, 0, 0, 1, 1,
0.2462028, 0.05741563, -0.16422, 0, 0, 0, 1, 1,
0.2518747, 0.8118525, 0.1192848, 0, 0, 0, 1, 1,
0.2521273, 0.420135, 0.1568242, 0, 0, 0, 1, 1,
0.254819, 0.4555762, -0.5784122, 1, 1, 1, 1, 1,
0.2558208, 0.01482255, 2.626088, 1, 1, 1, 1, 1,
0.2568475, 1.142815, 0.1729618, 1, 1, 1, 1, 1,
0.2611278, -0.08314767, 2.079092, 1, 1, 1, 1, 1,
0.2621245, -0.9873725, 2.771302, 1, 1, 1, 1, 1,
0.2626448, 2.117821, -1.232223, 1, 1, 1, 1, 1,
0.2629386, -2.089101, 3.878897, 1, 1, 1, 1, 1,
0.2642761, 1.5532, -0.596083, 1, 1, 1, 1, 1,
0.2643428, 0.1509731, 1.48362, 1, 1, 1, 1, 1,
0.2705276, -1.752203, 3.742324, 1, 1, 1, 1, 1,
0.2708611, -1.952561, 2.724517, 1, 1, 1, 1, 1,
0.2709742, 0.1629128, 2.775813, 1, 1, 1, 1, 1,
0.2736413, 0.6847476, -0.4017937, 1, 1, 1, 1, 1,
0.2771407, -2.546838, 1.707276, 1, 1, 1, 1, 1,
0.2855735, -1.465386, 3.363282, 1, 1, 1, 1, 1,
0.2900118, -0.7114693, 3.523588, 0, 0, 1, 1, 1,
0.2903444, -0.637895, 1.58986, 1, 0, 0, 1, 1,
0.2907816, 0.4476715, 0.134045, 1, 0, 0, 1, 1,
0.2934562, 0.6064398, -0.4642391, 1, 0, 0, 1, 1,
0.2947309, 0.2995047, 0.4406722, 1, 0, 0, 1, 1,
0.2997996, 0.1459787, 2.656645, 1, 0, 0, 1, 1,
0.3002682, -0.9472646, 1.326187, 0, 0, 0, 1, 1,
0.301471, -0.4104553, 2.937111, 0, 0, 0, 1, 1,
0.3046154, 0.2409022, -0.5524716, 0, 0, 0, 1, 1,
0.3058098, -0.09853621, 2.163829, 0, 0, 0, 1, 1,
0.3075246, 0.5224441, 0.6760119, 0, 0, 0, 1, 1,
0.3085865, 0.5740284, 1.639151, 0, 0, 0, 1, 1,
0.3086488, 0.3618009, -1.150664, 0, 0, 0, 1, 1,
0.3087571, 0.8477084, -1.607025, 1, 1, 1, 1, 1,
0.3104317, -0.1074848, 0.9135472, 1, 1, 1, 1, 1,
0.310546, 1.28238, -1.297957, 1, 1, 1, 1, 1,
0.310914, -0.9996967, 3.546921, 1, 1, 1, 1, 1,
0.3111415, -2.113856, 1.879406, 1, 1, 1, 1, 1,
0.3145575, -0.1003886, 3.188817, 1, 1, 1, 1, 1,
0.3149742, 0.9835205, -1.847408, 1, 1, 1, 1, 1,
0.3167375, 1.257511, 1.448998, 1, 1, 1, 1, 1,
0.3213786, -1.198526, 1.179796, 1, 1, 1, 1, 1,
0.3229866, -1.959238, 1.466108, 1, 1, 1, 1, 1,
0.326948, 0.8894672, 0.9635852, 1, 1, 1, 1, 1,
0.3314806, 3.076526, 0.3703551, 1, 1, 1, 1, 1,
0.3385102, -0.4070932, 2.132791, 1, 1, 1, 1, 1,
0.3424587, -0.9291328, 2.340878, 1, 1, 1, 1, 1,
0.3443056, -0.3084464, 1.040376, 1, 1, 1, 1, 1,
0.3488615, 0.4747937, 1.064517, 0, 0, 1, 1, 1,
0.3490341, -2.212783, 3.48376, 1, 0, 0, 1, 1,
0.3499141, -0.778845, 2.337924, 1, 0, 0, 1, 1,
0.3572871, 2.07791, 1.199594, 1, 0, 0, 1, 1,
0.3587701, 0.2699237, 0.9925679, 1, 0, 0, 1, 1,
0.3598063, -1.00102, 3.827, 1, 0, 0, 1, 1,
0.365575, 0.0004311439, 2.242764, 0, 0, 0, 1, 1,
0.3662241, 0.1353325, 1.574171, 0, 0, 0, 1, 1,
0.3665384, -0.7433605, 2.837952, 0, 0, 0, 1, 1,
0.3680789, -0.2533043, 2.642222, 0, 0, 0, 1, 1,
0.3693954, 0.6382263, 0.04807676, 0, 0, 0, 1, 1,
0.3698027, 0.9013672, 0.4656807, 0, 0, 0, 1, 1,
0.3738275, -1.975182, 4.094233, 0, 0, 0, 1, 1,
0.3808044, 1.954877, -0.1608483, 1, 1, 1, 1, 1,
0.3810311, -0.6700864, 2.991034, 1, 1, 1, 1, 1,
0.383917, 0.7239137, 0.7532805, 1, 1, 1, 1, 1,
0.3843318, -1.231717, 3.694046, 1, 1, 1, 1, 1,
0.3870628, 0.1026304, 1.252875, 1, 1, 1, 1, 1,
0.3876773, 0.928933, 2.138318, 1, 1, 1, 1, 1,
0.387702, 1.005981, -0.4400048, 1, 1, 1, 1, 1,
0.3905345, -0.3150103, 2.176708, 1, 1, 1, 1, 1,
0.3910826, 1.457395, 1.463572, 1, 1, 1, 1, 1,
0.391598, 0.3511768, 0.22701, 1, 1, 1, 1, 1,
0.3922574, 0.2327654, 3.920142, 1, 1, 1, 1, 1,
0.3941698, -0.5017333, 1.707176, 1, 1, 1, 1, 1,
0.3941977, -0.9031495, 0.6628307, 1, 1, 1, 1, 1,
0.3963207, -0.4478174, 3.59351, 1, 1, 1, 1, 1,
0.3967916, 0.6322004, 0.2525786, 1, 1, 1, 1, 1,
0.3976204, 0.3646181, -0.07722826, 0, 0, 1, 1, 1,
0.3992715, -1.346195, 2.803034, 1, 0, 0, 1, 1,
0.3995785, -0.8421704, 3.107686, 1, 0, 0, 1, 1,
0.4051511, 0.4285785, 1.167606, 1, 0, 0, 1, 1,
0.4071206, -0.181733, 2.156546, 1, 0, 0, 1, 1,
0.4087686, 0.6593183, 1.626788, 1, 0, 0, 1, 1,
0.4100221, 2.139332, 0.2181856, 0, 0, 0, 1, 1,
0.4101519, -1.037277, 2.635819, 0, 0, 0, 1, 1,
0.4160079, -1.997486, 3.226496, 0, 0, 0, 1, 1,
0.4171906, 0.1662204, 3.068864, 0, 0, 0, 1, 1,
0.4209623, -0.8973168, 2.357664, 0, 0, 0, 1, 1,
0.4248913, 0.2832249, 1.796163, 0, 0, 0, 1, 1,
0.4310538, -1.562833, 2.802759, 0, 0, 0, 1, 1,
0.4313936, 0.3248746, 0.3744091, 1, 1, 1, 1, 1,
0.4335706, 1.229276, 0.06969158, 1, 1, 1, 1, 1,
0.4336087, -1.586544, 2.773369, 1, 1, 1, 1, 1,
0.4343697, -0.2242427, 2.421007, 1, 1, 1, 1, 1,
0.4358956, -0.006127532, 2.560815, 1, 1, 1, 1, 1,
0.4405296, 1.896023, 0.8774275, 1, 1, 1, 1, 1,
0.4405854, 0.20032, -0.5230418, 1, 1, 1, 1, 1,
0.4412019, 0.5994695, 0.9867959, 1, 1, 1, 1, 1,
0.4455293, -0.5391512, 1.815479, 1, 1, 1, 1, 1,
0.4503382, 1.261684, 1.230413, 1, 1, 1, 1, 1,
0.4523815, -0.3579575, 2.848099, 1, 1, 1, 1, 1,
0.4536825, 1.909549, -0.06234737, 1, 1, 1, 1, 1,
0.4637088, 0.2951336, 2.468375, 1, 1, 1, 1, 1,
0.4667195, -0.6680889, 2.425013, 1, 1, 1, 1, 1,
0.4696957, -0.1151196, 0.6852007, 1, 1, 1, 1, 1,
0.4724816, 1.44129, -0.7824172, 0, 0, 1, 1, 1,
0.4739417, -0.3607259, 2.358058, 1, 0, 0, 1, 1,
0.475792, 0.8187402, 0.8155679, 1, 0, 0, 1, 1,
0.4771869, -0.9293661, 3.340808, 1, 0, 0, 1, 1,
0.4812915, -2.107801, 2.999869, 1, 0, 0, 1, 1,
0.4823451, 0.1764392, 2.032058, 1, 0, 0, 1, 1,
0.4843286, -2.219497, 2.249822, 0, 0, 0, 1, 1,
0.4931479, 0.4656447, 0.5563916, 0, 0, 0, 1, 1,
0.4951931, -0.4232871, 1.88553, 0, 0, 0, 1, 1,
0.4973149, -0.1671322, 2.881603, 0, 0, 0, 1, 1,
0.4999938, 0.7090485, -0.1708422, 0, 0, 0, 1, 1,
0.5007104, -0.6470038, 2.33405, 0, 0, 0, 1, 1,
0.504375, 0.7455611, 1.353478, 0, 0, 0, 1, 1,
0.5046887, -1.165235, 3.290255, 1, 1, 1, 1, 1,
0.508891, 1.755919, -0.5089549, 1, 1, 1, 1, 1,
0.5096698, -0.8702527, 2.111808, 1, 1, 1, 1, 1,
0.5128676, -0.2635382, 1.649733, 1, 1, 1, 1, 1,
0.5132025, 0.6654138, -0.3239491, 1, 1, 1, 1, 1,
0.519061, -1.328871, 3.661938, 1, 1, 1, 1, 1,
0.5207577, 0.9011336, 0.4108199, 1, 1, 1, 1, 1,
0.5220192, -0.6142735, 0.490339, 1, 1, 1, 1, 1,
0.5227919, 0.2228087, 2.719715, 1, 1, 1, 1, 1,
0.5231706, -0.3643492, 3.063071, 1, 1, 1, 1, 1,
0.5264249, 0.255492, 1.375572, 1, 1, 1, 1, 1,
0.5306398, 0.09567329, 1.259913, 1, 1, 1, 1, 1,
0.5309377, 0.2436056, -0.2198674, 1, 1, 1, 1, 1,
0.5355636, -1.046914, 0.1053411, 1, 1, 1, 1, 1,
0.5379783, 0.09103816, 1.771489, 1, 1, 1, 1, 1,
0.5406264, 0.1036048, -0.1777129, 0, 0, 1, 1, 1,
0.5424464, 0.5403062, 0.3353106, 1, 0, 0, 1, 1,
0.5510156, 0.07794956, 1.940107, 1, 0, 0, 1, 1,
0.5511461, -0.2812092, 2.655251, 1, 0, 0, 1, 1,
0.5515667, 0.3991541, 1.650737, 1, 0, 0, 1, 1,
0.558286, -0.3524598, 3.151953, 1, 0, 0, 1, 1,
0.5602949, -2.251656, 2.463982, 0, 0, 0, 1, 1,
0.5638522, 0.615483, -0.1898441, 0, 0, 0, 1, 1,
0.5661538, -0.7441034, 1.561278, 0, 0, 0, 1, 1,
0.5685723, 1.506781, -0.3264652, 0, 0, 0, 1, 1,
0.5719398, -0.02243698, 0.4315399, 0, 0, 0, 1, 1,
0.5770075, 1.281316, 0.6022311, 0, 0, 0, 1, 1,
0.5787695, 0.5214665, -0.7790695, 0, 0, 0, 1, 1,
0.581365, -1.40144, 1.641417, 1, 1, 1, 1, 1,
0.5849164, -1.896615, 1.415515, 1, 1, 1, 1, 1,
0.5877216, -0.2378326, 0.9751723, 1, 1, 1, 1, 1,
0.5928493, -0.5306016, 3.216599, 1, 1, 1, 1, 1,
0.5987711, -0.001658539, 0.8456374, 1, 1, 1, 1, 1,
0.5990619, 0.8257281, 2.786949, 1, 1, 1, 1, 1,
0.6023037, -2.252326, 2.601519, 1, 1, 1, 1, 1,
0.6023479, 0.6195272, -1.504838, 1, 1, 1, 1, 1,
0.6084508, 0.9357116, 1.28775, 1, 1, 1, 1, 1,
0.6087398, 0.4317962, 0.3990827, 1, 1, 1, 1, 1,
0.6097671, -0.2942685, 2.475857, 1, 1, 1, 1, 1,
0.6108609, 1.167326, 0.4698511, 1, 1, 1, 1, 1,
0.6127681, 0.9809512, -0.05390493, 1, 1, 1, 1, 1,
0.6128114, -0.0984118, 1.470708, 1, 1, 1, 1, 1,
0.6137348, -0.6521829, 2.10888, 1, 1, 1, 1, 1,
0.6150507, 2.779856, 0.7950745, 0, 0, 1, 1, 1,
0.6173553, 0.7141883, -0.06907357, 1, 0, 0, 1, 1,
0.618399, -2.31398, 3.005712, 1, 0, 0, 1, 1,
0.6196314, -0.3633964, 4.100184, 1, 0, 0, 1, 1,
0.619855, -1.370186, 3.100767, 1, 0, 0, 1, 1,
0.62901, -0.5096181, 3.362611, 1, 0, 0, 1, 1,
0.6300097, -0.2721065, 1.695166, 0, 0, 0, 1, 1,
0.6308276, 0.4227504, 0.2035909, 0, 0, 0, 1, 1,
0.6349885, 0.6284707, 0.1384789, 0, 0, 0, 1, 1,
0.640783, 0.7184698, 1.422861, 0, 0, 0, 1, 1,
0.6442883, -0.9256213, 2.467237, 0, 0, 0, 1, 1,
0.6482862, -0.2950888, 2.00437, 0, 0, 0, 1, 1,
0.6512076, -0.649356, 1.823619, 0, 0, 0, 1, 1,
0.6545653, 0.8543981, 0.7943435, 1, 1, 1, 1, 1,
0.6559203, 0.1307257, 2.180366, 1, 1, 1, 1, 1,
0.6566648, -0.09787487, 1.871103, 1, 1, 1, 1, 1,
0.6577996, 0.7458854, 0.1181751, 1, 1, 1, 1, 1,
0.6638563, -0.5652111, 2.221196, 1, 1, 1, 1, 1,
0.664323, 3.467544, -0.2880843, 1, 1, 1, 1, 1,
0.6713414, -0.04640554, 1.41815, 1, 1, 1, 1, 1,
0.6764578, 0.1925418, 2.386022, 1, 1, 1, 1, 1,
0.6769069, 0.02534072, 0.4695319, 1, 1, 1, 1, 1,
0.6771698, 0.4421343, 2.163781, 1, 1, 1, 1, 1,
0.6795707, -1.158854, 3.445775, 1, 1, 1, 1, 1,
0.6806683, -0.3374099, 1.608693, 1, 1, 1, 1, 1,
0.6824848, -1.143486, 1.082334, 1, 1, 1, 1, 1,
0.6949903, 0.06105583, 1.642044, 1, 1, 1, 1, 1,
0.6978985, -1.161843, 3.98976, 1, 1, 1, 1, 1,
0.6986282, 1.340597, 0.4607768, 0, 0, 1, 1, 1,
0.6988836, 0.07209712, -0.1916899, 1, 0, 0, 1, 1,
0.7003461, 0.02931418, 2.189626, 1, 0, 0, 1, 1,
0.7052086, 0.5383726, 0.384282, 1, 0, 0, 1, 1,
0.7082532, -1.336779, 3.468504, 1, 0, 0, 1, 1,
0.7093507, 1.28593, 1.153659, 1, 0, 0, 1, 1,
0.7112864, -0.2601683, 2.157195, 0, 0, 0, 1, 1,
0.7161902, 0.1914307, 1.526037, 0, 0, 0, 1, 1,
0.7165937, -0.6736031, 2.72231, 0, 0, 0, 1, 1,
0.7179326, -0.02455297, 1.474201, 0, 0, 0, 1, 1,
0.720945, 0.2409373, 1.231675, 0, 0, 0, 1, 1,
0.7217342, -0.2751234, 0.7611462, 0, 0, 0, 1, 1,
0.7237563, 0.9252293, 2.279137, 0, 0, 0, 1, 1,
0.7320793, -0.929883, 3.218291, 1, 1, 1, 1, 1,
0.7334555, -0.7226319, 2.058984, 1, 1, 1, 1, 1,
0.7345065, 0.2009972, 2.417856, 1, 1, 1, 1, 1,
0.7382479, -0.5004864, 1.361778, 1, 1, 1, 1, 1,
0.741284, 1.530576, 0.9398366, 1, 1, 1, 1, 1,
0.7421001, 0.5555922, 1.761789, 1, 1, 1, 1, 1,
0.745513, -0.5338614, 0.2466786, 1, 1, 1, 1, 1,
0.7474018, -1.866436, 1.829125, 1, 1, 1, 1, 1,
0.7478782, 0.4411374, 1.281943, 1, 1, 1, 1, 1,
0.7510082, -0.1941604, 1.599476, 1, 1, 1, 1, 1,
0.7616102, 0.9581257, 0.3994156, 1, 1, 1, 1, 1,
0.7769585, 0.1370379, 0.8644248, 1, 1, 1, 1, 1,
0.7795005, -0.05665903, 0.4472357, 1, 1, 1, 1, 1,
0.7810054, 0.3784749, 0.6149684, 1, 1, 1, 1, 1,
0.7826487, -1.056855, 1.970045, 1, 1, 1, 1, 1,
0.7924132, 1.620414, -0.08558808, 0, 0, 1, 1, 1,
0.7937533, -1.098297, 2.03659, 1, 0, 0, 1, 1,
0.7947432, -0.4260308, 2.77437, 1, 0, 0, 1, 1,
0.8023013, 1.225748, 0.4245737, 1, 0, 0, 1, 1,
0.806748, 0.1556581, 2.531141, 1, 0, 0, 1, 1,
0.8104607, -0.2953992, 0.7605937, 1, 0, 0, 1, 1,
0.8166742, -1.135229, 2.313717, 0, 0, 0, 1, 1,
0.817, -2.251, 4.150497, 0, 0, 0, 1, 1,
0.8234984, 0.3603961, 2.001018, 0, 0, 0, 1, 1,
0.8239575, 0.8562516, -1.137735, 0, 0, 0, 1, 1,
0.8283074, -0.05206591, 3.008135, 0, 0, 0, 1, 1,
0.8324259, 0.8018842, 0.2576715, 0, 0, 0, 1, 1,
0.8348245, -0.2092224, 2.231093, 0, 0, 0, 1, 1,
0.8365552, -0.9935145, 2.422557, 1, 1, 1, 1, 1,
0.8548821, -0.1384707, 3.379645, 1, 1, 1, 1, 1,
0.8553989, -2.03606, 0.7975887, 1, 1, 1, 1, 1,
0.8575727, 1.713126, -0.1768272, 1, 1, 1, 1, 1,
0.857649, -1.470919, 1.475643, 1, 1, 1, 1, 1,
0.8680305, -1.321887, 3.276918, 1, 1, 1, 1, 1,
0.8700024, 0.1690702, 0.9554084, 1, 1, 1, 1, 1,
0.8801729, -0.7342635, 2.687676, 1, 1, 1, 1, 1,
0.8869811, 1.358322, 1.790367, 1, 1, 1, 1, 1,
0.8882891, -0.8373299, 1.128183, 1, 1, 1, 1, 1,
0.8906157, -0.4553583, 0.302955, 1, 1, 1, 1, 1,
0.8927888, 0.4454275, 0.885375, 1, 1, 1, 1, 1,
0.8934083, 0.1858235, 0.4902155, 1, 1, 1, 1, 1,
0.8975282, 0.3615589, 2.115085, 1, 1, 1, 1, 1,
0.9046308, 2.076967, 2.499886, 1, 1, 1, 1, 1,
0.9049906, 0.9633304, 1.808553, 0, 0, 1, 1, 1,
0.9182125, -0.1544993, 0.6222011, 1, 0, 0, 1, 1,
0.921909, -0.817818, 0.4083941, 1, 0, 0, 1, 1,
0.9231163, 0.116234, 2.413538, 1, 0, 0, 1, 1,
0.9253491, 0.7856714, 2.265398, 1, 0, 0, 1, 1,
0.9268214, -0.07160717, 2.068789, 1, 0, 0, 1, 1,
0.9280691, 0.571501, 0.2747233, 0, 0, 0, 1, 1,
0.9323527, 0.4112411, 0.1782383, 0, 0, 0, 1, 1,
0.9331143, 1.214782, 0.2993383, 0, 0, 0, 1, 1,
0.9354993, 0.4925537, -0.1861335, 0, 0, 0, 1, 1,
0.9361759, 0.4402967, 0.3214715, 0, 0, 0, 1, 1,
0.9373671, 0.1970849, 0.3090723, 0, 0, 0, 1, 1,
0.9373818, 0.2944852, 1.11029, 0, 0, 0, 1, 1,
0.9385931, -0.1149005, 1.299603, 1, 1, 1, 1, 1,
0.9451944, -0.7765965, 1.226799, 1, 1, 1, 1, 1,
0.9518512, 1.250354, 0.690229, 1, 1, 1, 1, 1,
0.9529489, 1.128343, 2.343753, 1, 1, 1, 1, 1,
0.9583713, 0.6767914, 1.562504, 1, 1, 1, 1, 1,
0.9638478, 0.4449044, 0.5312797, 1, 1, 1, 1, 1,
0.9651135, -0.1700748, 0.3256167, 1, 1, 1, 1, 1,
0.9782997, 1.661927, 0.8716676, 1, 1, 1, 1, 1,
0.9799308, -0.07942954, 3.16574, 1, 1, 1, 1, 1,
0.9828776, -0.9043241, 3.962372, 1, 1, 1, 1, 1,
0.9840606, -0.2729557, -0.2424758, 1, 1, 1, 1, 1,
0.9961782, 0.2487213, 1.09691, 1, 1, 1, 1, 1,
1.006783, -1.476231, 4.657786, 1, 1, 1, 1, 1,
1.007511, 0.4835503, 1.020702, 1, 1, 1, 1, 1,
1.013573, -0.2232863, 1.097872, 1, 1, 1, 1, 1,
1.014228, 1.129884, 0.5341601, 0, 0, 1, 1, 1,
1.018954, 0.7208829, -0.2415721, 1, 0, 0, 1, 1,
1.019965, 0.7923819, -1.152527, 1, 0, 0, 1, 1,
1.030044, -0.01364447, 2.465183, 1, 0, 0, 1, 1,
1.030811, 2.001077, 0.4318755, 1, 0, 0, 1, 1,
1.034474, -0.8106844, 2.317178, 1, 0, 0, 1, 1,
1.041405, -1.143663, 4.292781, 0, 0, 0, 1, 1,
1.046337, 0.6430439, 1.653458, 0, 0, 0, 1, 1,
1.046684, -1.08513, 4.26365, 0, 0, 0, 1, 1,
1.048288, 0.1537587, 3.084679, 0, 0, 0, 1, 1,
1.048438, 0.5880523, 1.333338, 0, 0, 0, 1, 1,
1.052043, -0.124231, 3.769465, 0, 0, 0, 1, 1,
1.05903, 1.105144, 1.567541, 0, 0, 0, 1, 1,
1.061824, 0.841986, 1.262123, 1, 1, 1, 1, 1,
1.072683, 1.511678, 0.9229609, 1, 1, 1, 1, 1,
1.074527, -0.007287316, 1.548735, 1, 1, 1, 1, 1,
1.089087, 1.465216, 1.127804, 1, 1, 1, 1, 1,
1.093676, -0.5962762, 3.130595, 1, 1, 1, 1, 1,
1.109407, -0.4610736, 1.245857, 1, 1, 1, 1, 1,
1.112316, -0.2994707, 2.004904, 1, 1, 1, 1, 1,
1.112787, -0.1170878, 1.244498, 1, 1, 1, 1, 1,
1.130478, -1.023764, 1.864542, 1, 1, 1, 1, 1,
1.131422, 2.134678, 0.09412494, 1, 1, 1, 1, 1,
1.132958, -0.152029, 2.127988, 1, 1, 1, 1, 1,
1.137533, -0.1535383, 1.48246, 1, 1, 1, 1, 1,
1.145146, -1.923618, 2.828353, 1, 1, 1, 1, 1,
1.154806, 0.3427332, -0.9515451, 1, 1, 1, 1, 1,
1.158128, -1.60607, 1.233261, 1, 1, 1, 1, 1,
1.163518, -0.5561004, 0.4187985, 0, 0, 1, 1, 1,
1.165365, 1.229391, -0.8800805, 1, 0, 0, 1, 1,
1.168749, -0.5070485, 1.486596, 1, 0, 0, 1, 1,
1.173769, -0.9286656, 1.928093, 1, 0, 0, 1, 1,
1.174764, -0.8033845, 1.490302, 1, 0, 0, 1, 1,
1.188209, 0.05464042, 3.229137, 1, 0, 0, 1, 1,
1.194198, -0.2253273, 1.834222, 0, 0, 0, 1, 1,
1.194415, 1.269332, 0.6437416, 0, 0, 0, 1, 1,
1.197531, 1.786359, 2.031588, 0, 0, 0, 1, 1,
1.207299, 0.7375709, 1.907119, 0, 0, 0, 1, 1,
1.208424, -0.5176, 2.453285, 0, 0, 0, 1, 1,
1.212834, -0.01790624, 2.145024, 0, 0, 0, 1, 1,
1.213754, -1.059905, 1.493911, 0, 0, 0, 1, 1,
1.214475, 0.7281082, 1.547992, 1, 1, 1, 1, 1,
1.21463, -0.1265003, 3.545689, 1, 1, 1, 1, 1,
1.216115, 0.6774369, 1.889337, 1, 1, 1, 1, 1,
1.22455, 1.181452, 2.142932, 1, 1, 1, 1, 1,
1.225066, -0.2519309, 0.6082325, 1, 1, 1, 1, 1,
1.228519, -1.637713, 1.713327, 1, 1, 1, 1, 1,
1.235898, -0.2463702, 1.754055, 1, 1, 1, 1, 1,
1.237606, -0.6859184, 1.413239, 1, 1, 1, 1, 1,
1.245232, -1.68554, 4.029242, 1, 1, 1, 1, 1,
1.26254, 0.7168347, 1.295959, 1, 1, 1, 1, 1,
1.265924, 1.126734, -1.112284, 1, 1, 1, 1, 1,
1.273072, -0.9929656, 1.963547, 1, 1, 1, 1, 1,
1.280542, 1.422608, -0.3537178, 1, 1, 1, 1, 1,
1.282411, -1.678764, 2.585799, 1, 1, 1, 1, 1,
1.282963, 2.34014, 0.5980475, 1, 1, 1, 1, 1,
1.284159, 0.3291705, 3.048983, 0, 0, 1, 1, 1,
1.284174, -1.74339, 1.897492, 1, 0, 0, 1, 1,
1.286329, -1.575773, 3.362145, 1, 0, 0, 1, 1,
1.295887, 1.032081, 1.870857, 1, 0, 0, 1, 1,
1.29666, 0.2102219, 0.8455138, 1, 0, 0, 1, 1,
1.297197, -0.440485, 2.776207, 1, 0, 0, 1, 1,
1.304734, -0.72618, 4.52527, 0, 0, 0, 1, 1,
1.321824, -2.003226, 3.72805, 0, 0, 0, 1, 1,
1.323703, -2.211427, 3.720413, 0, 0, 0, 1, 1,
1.32702, -0.6231449, 3.270722, 0, 0, 0, 1, 1,
1.346661, 0.1464263, 1.736888, 0, 0, 0, 1, 1,
1.346731, -0.8672858, 2.843375, 0, 0, 0, 1, 1,
1.351103, 1.004103, -0.3076092, 0, 0, 0, 1, 1,
1.351288, -0.1679461, 2.924549, 1, 1, 1, 1, 1,
1.367541, 2.246233, 0.233078, 1, 1, 1, 1, 1,
1.375039, 0.2151413, -1.230419, 1, 1, 1, 1, 1,
1.380977, -0.03531449, 2.27026, 1, 1, 1, 1, 1,
1.382841, -0.5818616, 1.807887, 1, 1, 1, 1, 1,
1.391688, -0.5568798, 2.086881, 1, 1, 1, 1, 1,
1.41178, -0.2133342, 3.242719, 1, 1, 1, 1, 1,
1.413049, -0.1667596, 2.339138, 1, 1, 1, 1, 1,
1.414117, 0.8840175, 0.7521651, 1, 1, 1, 1, 1,
1.427652, 0.05797885, 2.400661, 1, 1, 1, 1, 1,
1.429777, -2.127042, 3.038862, 1, 1, 1, 1, 1,
1.432468, 0.5515231, 1.260631, 1, 1, 1, 1, 1,
1.432834, 0.04184897, 0.3378802, 1, 1, 1, 1, 1,
1.433662, 0.9135759, 1.759202, 1, 1, 1, 1, 1,
1.433857, 0.7907195, 0.5741925, 1, 1, 1, 1, 1,
1.438589, 0.894648, 3.208373, 0, 0, 1, 1, 1,
1.444442, 0.4748005, 1.536318, 1, 0, 0, 1, 1,
1.456779, 1.085213, 1.308307, 1, 0, 0, 1, 1,
1.470809, 0.2979833, 0.6072092, 1, 0, 0, 1, 1,
1.497429, -0.2421252, 0.8512719, 1, 0, 0, 1, 1,
1.503083, 0.7385338, 1.647121, 1, 0, 0, 1, 1,
1.504862, -0.1712394, 0.341966, 0, 0, 0, 1, 1,
1.520689, 0.7387831, 1.973527, 0, 0, 0, 1, 1,
1.523178, -0.3041221, 1.756352, 0, 0, 0, 1, 1,
1.525454, 0.4429502, -0.2144704, 0, 0, 0, 1, 1,
1.528155, 0.2143244, 2.425109, 0, 0, 0, 1, 1,
1.53054, 0.9300624, 0.3555269, 0, 0, 0, 1, 1,
1.533368, -0.09551547, 0.7730489, 0, 0, 0, 1, 1,
1.536418, -0.9399374, 0.6682918, 1, 1, 1, 1, 1,
1.537424, -0.07659056, 1.196904, 1, 1, 1, 1, 1,
1.553843, 1.239923, 1.800382, 1, 1, 1, 1, 1,
1.555445, 2.150626, 0.5026835, 1, 1, 1, 1, 1,
1.55568, 1.126502, 1.106707, 1, 1, 1, 1, 1,
1.557948, 0.4546427, 3.104789, 1, 1, 1, 1, 1,
1.565021, 1.954559, 2.65998, 1, 1, 1, 1, 1,
1.57572, -0.06244355, 1.109122, 1, 1, 1, 1, 1,
1.576252, -1.179627, 3.178292, 1, 1, 1, 1, 1,
1.580015, -2.196305, 2.789655, 1, 1, 1, 1, 1,
1.584614, 0.9806547, 1.803906, 1, 1, 1, 1, 1,
1.646055, -1.736649, 3.190188, 1, 1, 1, 1, 1,
1.652323, -1.016331, 1.408445, 1, 1, 1, 1, 1,
1.683584, 0.39039, 1.955422, 1, 1, 1, 1, 1,
1.694327, -1.275906, 2.866248, 1, 1, 1, 1, 1,
1.694874, 1.174281, 1.074412, 0, 0, 1, 1, 1,
1.69676, -0.9807287, 3.08718, 1, 0, 0, 1, 1,
1.713679, 0.7116516, 0.697724, 1, 0, 0, 1, 1,
1.721882, 0.0978421, 0.3136118, 1, 0, 0, 1, 1,
1.723268, 0.8953751, 1.017527, 1, 0, 0, 1, 1,
1.738571, -0.1578622, 0.7525092, 1, 0, 0, 1, 1,
1.739189, 1.087748, 0.1598892, 0, 0, 0, 1, 1,
1.740871, -0.8906895, 3.784572, 0, 0, 0, 1, 1,
1.752987, -0.9507225, 1.116559, 0, 0, 0, 1, 1,
1.75315, -1.439781, 1.877723, 0, 0, 0, 1, 1,
1.76346, -2.061034, 1.519102, 0, 0, 0, 1, 1,
1.783036, -1.776989, 2.353792, 0, 0, 0, 1, 1,
1.79201, -0.5207361, 2.265347, 0, 0, 0, 1, 1,
1.798492, -0.009931332, 2.426665, 1, 1, 1, 1, 1,
1.812893, 0.5913699, -1.543598, 1, 1, 1, 1, 1,
1.818405, 0.4072607, 2.51776, 1, 1, 1, 1, 1,
1.81951, -0.5238461, 4.07921, 1, 1, 1, 1, 1,
1.825407, -0.4110365, 3.612741, 1, 1, 1, 1, 1,
1.845756, -0.7611967, 1.042739, 1, 1, 1, 1, 1,
1.882271, -0.3598189, 1.040318, 1, 1, 1, 1, 1,
1.925241, -0.8562365, 2.772394, 1, 1, 1, 1, 1,
1.93884, -1.260805, 2.415357, 1, 1, 1, 1, 1,
1.959554, -1.236236, 3.112509, 1, 1, 1, 1, 1,
1.998809, 0.9921532, 1.034587, 1, 1, 1, 1, 1,
2.007755, -0.6957894, 1.160794, 1, 1, 1, 1, 1,
2.018462, -0.1366357, 2.422686, 1, 1, 1, 1, 1,
2.068213, -0.2805281, 0.8761541, 1, 1, 1, 1, 1,
2.120901, 0.7196081, 0.9222309, 1, 1, 1, 1, 1,
2.124188, 1.044943, 1.379945, 0, 0, 1, 1, 1,
2.146289, -1.274828, 1.143263, 1, 0, 0, 1, 1,
2.200906, 1.910638, 2.489281, 1, 0, 0, 1, 1,
2.242002, -1.621947, 2.385163, 1, 0, 0, 1, 1,
2.246073, -0.008690029, 2.059187, 1, 0, 0, 1, 1,
2.269514, 0.824563, 2.361715, 1, 0, 0, 1, 1,
2.270765, 1.509501, 0.7177845, 0, 0, 0, 1, 1,
2.294913, 0.06752463, 0.4989276, 0, 0, 0, 1, 1,
2.31477, 0.4153861, 0.8097074, 0, 0, 0, 1, 1,
2.353245, 0.5505554, 1.286782, 0, 0, 0, 1, 1,
2.369341, 1.292306, 0.7090958, 0, 0, 0, 1, 1,
2.429513, -0.4949748, 1.221245, 0, 0, 0, 1, 1,
2.504225, 0.3119993, 1.103404, 0, 0, 0, 1, 1,
2.523077, 0.6111999, 1.877619, 1, 1, 1, 1, 1,
2.535429, 0.03497683, -0.06916728, 1, 1, 1, 1, 1,
2.554093, -0.8161685, 2.03441, 1, 1, 1, 1, 1,
2.616512, 0.4515224, -0.08900668, 1, 1, 1, 1, 1,
2.725599, 0.7443432, 0.6391594, 1, 1, 1, 1, 1,
2.809725, 0.365455, 2.706215, 1, 1, 1, 1, 1,
2.838876, 0.5363554, 2.678973, 1, 1, 1, 1, 1
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
var radius = 9.494861;
var distance = 33.3503;
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
mvMatrix.translate( 0.5710427, -0.4378742, -0.2298629 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.3503);
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
