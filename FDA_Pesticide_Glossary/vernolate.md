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
-3.429676, -0.3576462, -1.144244, 1, 0, 0, 1,
-3.360095, -0.03390089, 0.4339761, 1, 0.007843138, 0, 1,
-3.344029, -0.1789279, -0.7405941, 1, 0.01176471, 0, 1,
-3.277976, -0.3573907, -2.167215, 1, 0.01960784, 0, 1,
-2.814668, 0.9672831, -1.77233, 1, 0.02352941, 0, 1,
-2.662019, -1.281107, -1.255792, 1, 0.03137255, 0, 1,
-2.629417, -0.7557783, -2.680956, 1, 0.03529412, 0, 1,
-2.571244, 2.091197, 0.08269105, 1, 0.04313726, 0, 1,
-2.471358, 0.9473634, -0.7842597, 1, 0.04705882, 0, 1,
-2.398502, -1.217938, -1.673598, 1, 0.05490196, 0, 1,
-2.261882, 0.8793685, -0.7440939, 1, 0.05882353, 0, 1,
-2.249902, -0.3201409, -1.901383, 1, 0.06666667, 0, 1,
-2.203197, 1.099677, -0.2573417, 1, 0.07058824, 0, 1,
-2.177233, -1.186469, -1.382647, 1, 0.07843138, 0, 1,
-2.15433, -0.07027524, -2.553391, 1, 0.08235294, 0, 1,
-2.150281, 0.8502807, -1.350051, 1, 0.09019608, 0, 1,
-2.126932, -0.6680996, -2.209258, 1, 0.09411765, 0, 1,
-2.074951, -0.2883189, 0.4813061, 1, 0.1019608, 0, 1,
-2.073147, -0.03094671, -2.480751, 1, 0.1098039, 0, 1,
-2.015603, 0.4377257, -0.8208111, 1, 0.1137255, 0, 1,
-2.000349, 0.7406714, -1.151553, 1, 0.1215686, 0, 1,
-1.95979, 1.539606, -1.50042, 1, 0.1254902, 0, 1,
-1.955301, 0.6656749, -1.0471, 1, 0.1333333, 0, 1,
-1.904361, 0.6217818, -3.920648, 1, 0.1372549, 0, 1,
-1.886172, 0.1859616, -1.030577, 1, 0.145098, 0, 1,
-1.882326, -0.1107663, -1.223718, 1, 0.1490196, 0, 1,
-1.855411, 0.2749537, -0.7750725, 1, 0.1568628, 0, 1,
-1.851427, -0.5599656, -1.749283, 1, 0.1607843, 0, 1,
-1.832782, -1.145925, -0.7637983, 1, 0.1686275, 0, 1,
-1.829213, -0.003524917, -2.806708, 1, 0.172549, 0, 1,
-1.805989, -0.196897, -0.3691483, 1, 0.1803922, 0, 1,
-1.800897, -0.7137414, -2.063354, 1, 0.1843137, 0, 1,
-1.79189, 0.5487006, -0.534559, 1, 0.1921569, 0, 1,
-1.78615, -0.6214624, -3.939581, 1, 0.1960784, 0, 1,
-1.786021, -1.092013, -0.1342087, 1, 0.2039216, 0, 1,
-1.777778, 1.423233, -2.365974, 1, 0.2117647, 0, 1,
-1.776347, 0.4579094, -1.683065, 1, 0.2156863, 0, 1,
-1.77629, -1.7328, -1.957567, 1, 0.2235294, 0, 1,
-1.771371, -1.372008, -3.4814, 1, 0.227451, 0, 1,
-1.771049, -0.07721753, -0.8794984, 1, 0.2352941, 0, 1,
-1.762998, -0.203954, -1.76261, 1, 0.2392157, 0, 1,
-1.748633, 0.9810635, -1.524979, 1, 0.2470588, 0, 1,
-1.73739, -0.569882, -0.5998031, 1, 0.2509804, 0, 1,
-1.721855, 2.503104, -1.333704, 1, 0.2588235, 0, 1,
-1.721325, 0.4160416, -2.166606, 1, 0.2627451, 0, 1,
-1.702949, 0.7637267, -0.5787252, 1, 0.2705882, 0, 1,
-1.668211, 2.192962, -1.078074, 1, 0.2745098, 0, 1,
-1.667544, -0.6473936, -2.594343, 1, 0.282353, 0, 1,
-1.665266, 1.517728, -1.291309, 1, 0.2862745, 0, 1,
-1.65414, 2.835235, -0.800741, 1, 0.2941177, 0, 1,
-1.613201, 0.9891558, -1.628854, 1, 0.3019608, 0, 1,
-1.604059, 0.5862409, -2.328996, 1, 0.3058824, 0, 1,
-1.588629, 0.6886448, -2.484518, 1, 0.3137255, 0, 1,
-1.57503, -0.2512466, -1.716105, 1, 0.3176471, 0, 1,
-1.563034, 4.34035, -0.3774542, 1, 0.3254902, 0, 1,
-1.551355, -1.588384, -2.409992, 1, 0.3294118, 0, 1,
-1.548259, -0.6244451, -2.272439, 1, 0.3372549, 0, 1,
-1.530741, -1.999825, -2.484158, 1, 0.3411765, 0, 1,
-1.525861, 1.673394, -0.3779632, 1, 0.3490196, 0, 1,
-1.512802, 2.130911, -2.023921, 1, 0.3529412, 0, 1,
-1.498407, -0.07035741, -3.159616, 1, 0.3607843, 0, 1,
-1.489491, -0.9636353, -2.200565, 1, 0.3647059, 0, 1,
-1.487669, 0.4753497, -2.269285, 1, 0.372549, 0, 1,
-1.479778, -0.4650679, -1.517193, 1, 0.3764706, 0, 1,
-1.473266, 1.82858, -1.962933, 1, 0.3843137, 0, 1,
-1.451563, 0.8183843, -0.5310929, 1, 0.3882353, 0, 1,
-1.439072, -0.8441733, -2.067425, 1, 0.3960784, 0, 1,
-1.434487, 2.110109, -2.084718, 1, 0.4039216, 0, 1,
-1.422821, 0.1974914, -2.164813, 1, 0.4078431, 0, 1,
-1.411602, 1.340584, -0.48455, 1, 0.4156863, 0, 1,
-1.408644, 0.176534, -1.59205, 1, 0.4196078, 0, 1,
-1.406857, -0.5029531, -3.05857, 1, 0.427451, 0, 1,
-1.40292, -0.3028619, -0.9269854, 1, 0.4313726, 0, 1,
-1.394271, -0.8425205, -2.556592, 1, 0.4392157, 0, 1,
-1.392918, -0.1437644, -2.813057, 1, 0.4431373, 0, 1,
-1.392409, 1.406099, -1.43624, 1, 0.4509804, 0, 1,
-1.378414, -0.8068149, -1.528258, 1, 0.454902, 0, 1,
-1.378027, 0.5969229, -1.714967, 1, 0.4627451, 0, 1,
-1.363904, 0.2721813, -2.196171, 1, 0.4666667, 0, 1,
-1.349985, 0.7363342, -2.072655, 1, 0.4745098, 0, 1,
-1.343165, -1.551454, -1.38246, 1, 0.4784314, 0, 1,
-1.338253, -0.5684784, -1.057885, 1, 0.4862745, 0, 1,
-1.335718, 0.02410842, -2.884714, 1, 0.4901961, 0, 1,
-1.327116, 0.9652849, -1.570255, 1, 0.4980392, 0, 1,
-1.325544, -0.9548417, -1.363088, 1, 0.5058824, 0, 1,
-1.325326, -0.4369196, -2.036275, 1, 0.509804, 0, 1,
-1.319259, -1.14553, -1.709128, 1, 0.5176471, 0, 1,
-1.313611, -0.7344449, -2.499021, 1, 0.5215687, 0, 1,
-1.30407, 1.660854, -0.8581543, 1, 0.5294118, 0, 1,
-1.301619, -0.1761449, -0.07935067, 1, 0.5333334, 0, 1,
-1.292859, 0.2333634, -0.5813459, 1, 0.5411765, 0, 1,
-1.283293, -0.1444948, -1.595215, 1, 0.5450981, 0, 1,
-1.279478, 0.8601437, -4.010302, 1, 0.5529412, 0, 1,
-1.276589, 0.3397675, -1.673659, 1, 0.5568628, 0, 1,
-1.27509, 2.438698, -1.224847, 1, 0.5647059, 0, 1,
-1.270959, -0.6796578, -2.936905, 1, 0.5686275, 0, 1,
-1.262268, 0.8288205, -2.602708, 1, 0.5764706, 0, 1,
-1.262262, -1.423041, -3.0646, 1, 0.5803922, 0, 1,
-1.256451, 0.6410556, -0.0004490663, 1, 0.5882353, 0, 1,
-1.256116, -1.976708, -3.904087, 1, 0.5921569, 0, 1,
-1.255227, 0.4220859, -1.15875, 1, 0.6, 0, 1,
-1.245471, -0.08551624, -2.172201, 1, 0.6078432, 0, 1,
-1.244009, 0.6124097, -3.379142, 1, 0.6117647, 0, 1,
-1.243397, -0.8911574, -3.321934, 1, 0.6196079, 0, 1,
-1.235834, -2.529972, -0.3842892, 1, 0.6235294, 0, 1,
-1.233063, -1.539625, -3.004091, 1, 0.6313726, 0, 1,
-1.230703, -1.878221, -2.954378, 1, 0.6352941, 0, 1,
-1.224186, -1.40992, -4.232032, 1, 0.6431373, 0, 1,
-1.21644, 0.2834533, -0.8387218, 1, 0.6470588, 0, 1,
-1.213705, -0.6428156, -2.144377, 1, 0.654902, 0, 1,
-1.209926, 0.3777011, -1.489868, 1, 0.6588235, 0, 1,
-1.209811, 0.06524134, -0.954917, 1, 0.6666667, 0, 1,
-1.203597, 0.9004082, -0.7135867, 1, 0.6705883, 0, 1,
-1.200032, -0.4217624, -2.881176, 1, 0.6784314, 0, 1,
-1.19013, -1.468252, -1.015575, 1, 0.682353, 0, 1,
-1.185118, -0.9275837, -1.949817, 1, 0.6901961, 0, 1,
-1.183384, -0.2313567, -1.724161, 1, 0.6941177, 0, 1,
-1.17699, -0.2536669, -1.648605, 1, 0.7019608, 0, 1,
-1.17086, 0.8302026, -1.536798, 1, 0.7098039, 0, 1,
-1.17029, -0.1384701, -1.758004, 1, 0.7137255, 0, 1,
-1.167969, 0.9053919, -1.946935, 1, 0.7215686, 0, 1,
-1.163978, 1.421208, -0.439709, 1, 0.7254902, 0, 1,
-1.163858, -0.2714693, -1.696193, 1, 0.7333333, 0, 1,
-1.156059, -0.6858194, -3.248134, 1, 0.7372549, 0, 1,
-1.151469, 0.5576536, 0.2270888, 1, 0.7450981, 0, 1,
-1.147665, 0.9916432, 0.3751685, 1, 0.7490196, 0, 1,
-1.138205, 0.3045243, -1.423812, 1, 0.7568628, 0, 1,
-1.137963, 1.898242, -0.2705313, 1, 0.7607843, 0, 1,
-1.132573, -0.8317798, -4.421019, 1, 0.7686275, 0, 1,
-1.129387, -0.2282904, -3.09735, 1, 0.772549, 0, 1,
-1.128093, -0.239245, -1.583167, 1, 0.7803922, 0, 1,
-1.125226, -0.03911112, -2.388412, 1, 0.7843137, 0, 1,
-1.114209, -0.6887861, -1.432797, 1, 0.7921569, 0, 1,
-1.111731, -0.1934242, -0.6848989, 1, 0.7960784, 0, 1,
-1.105258, 1.645227, -0.2545237, 1, 0.8039216, 0, 1,
-1.102878, 0.9328361, -0.6892169, 1, 0.8117647, 0, 1,
-1.098776, -0.5294364, -1.094573, 1, 0.8156863, 0, 1,
-1.094718, 0.1609615, -0.9005972, 1, 0.8235294, 0, 1,
-1.092024, 0.7636756, -1.063423, 1, 0.827451, 0, 1,
-1.088056, 2.101836, -1.31908, 1, 0.8352941, 0, 1,
-1.083003, 0.1438354, -1.205005, 1, 0.8392157, 0, 1,
-1.081024, -2.039241, -2.375488, 1, 0.8470588, 0, 1,
-1.075902, -1.430312, -0.8040836, 1, 0.8509804, 0, 1,
-1.074075, 0.7211791, -3.622521, 1, 0.8588235, 0, 1,
-1.063866, 0.3193811, -0.8940348, 1, 0.8627451, 0, 1,
-1.060372, -0.5910538, -1.809947, 1, 0.8705882, 0, 1,
-1.057418, -0.5150188, -2.656568, 1, 0.8745098, 0, 1,
-1.055643, -1.378081, -3.64701, 1, 0.8823529, 0, 1,
-1.051128, 2.655484, -0.908964, 1, 0.8862745, 0, 1,
-1.049539, -0.6616336, -1.682686, 1, 0.8941177, 0, 1,
-1.039012, -1.232336, -1.233596, 1, 0.8980392, 0, 1,
-1.028935, 0.4699067, -3.171423, 1, 0.9058824, 0, 1,
-1.021781, 0.2193318, -0.02178406, 1, 0.9137255, 0, 1,
-1.010747, 1.230545, 0.7153221, 1, 0.9176471, 0, 1,
-1.008299, 0.4290617, -2.300972, 1, 0.9254902, 0, 1,
-1.007596, 0.9019657, -0.9920459, 1, 0.9294118, 0, 1,
-1.004961, 0.02869227, -0.07739105, 1, 0.9372549, 0, 1,
-1.004838, 1.355053, -0.7882612, 1, 0.9411765, 0, 1,
-1.004534, 0.9592848, -1.355397, 1, 0.9490196, 0, 1,
-1.001479, -1.773878, -2.954769, 1, 0.9529412, 0, 1,
-0.9915267, -2.419094, -2.874077, 1, 0.9607843, 0, 1,
-0.9899643, 0.2204763, -0.6839543, 1, 0.9647059, 0, 1,
-0.977529, 0.3858145, 0.1307124, 1, 0.972549, 0, 1,
-0.9759227, -0.25841, -0.5527751, 1, 0.9764706, 0, 1,
-0.973828, -0.9973131, -3.100761, 1, 0.9843137, 0, 1,
-0.97278, -0.2598463, -1.525241, 1, 0.9882353, 0, 1,
-0.9727448, 1.295177, -0.5484026, 1, 0.9960784, 0, 1,
-0.9717565, 0.3670042, -1.689099, 0.9960784, 1, 0, 1,
-0.970694, -2.801911, -4.193632, 0.9921569, 1, 0, 1,
-0.969775, 1.140989, -1.714424, 0.9843137, 1, 0, 1,
-0.9691948, -0.2554018, -2.854666, 0.9803922, 1, 0, 1,
-0.9651401, 0.3938826, -0.4589665, 0.972549, 1, 0, 1,
-0.9596046, -0.2951438, -2.338612, 0.9686275, 1, 0, 1,
-0.9541181, -0.4918246, -0.8025861, 0.9607843, 1, 0, 1,
-0.9539664, 1.396549, -0.5043503, 0.9568627, 1, 0, 1,
-0.9512589, 1.92991, -1.204281, 0.9490196, 1, 0, 1,
-0.9430262, 0.2052551, -2.36668, 0.945098, 1, 0, 1,
-0.942623, -1.140379, -2.871387, 0.9372549, 1, 0, 1,
-0.9404377, 2.934992, -0.008719716, 0.9333333, 1, 0, 1,
-0.9394652, 0.3079123, -1.702661, 0.9254902, 1, 0, 1,
-0.9357135, 1.286885, 0.01531229, 0.9215686, 1, 0, 1,
-0.9301643, 0.1402301, -1.917843, 0.9137255, 1, 0, 1,
-0.9296716, 0.7793151, -0.8036065, 0.9098039, 1, 0, 1,
-0.9225207, 0.1113549, -2.349986, 0.9019608, 1, 0, 1,
-0.9124592, 0.447246, -1.021261, 0.8941177, 1, 0, 1,
-0.9110713, 0.7354733, -1.584204, 0.8901961, 1, 0, 1,
-0.9091306, 0.9980922, -1.554427, 0.8823529, 1, 0, 1,
-0.9068711, 1.356684, 1.51002, 0.8784314, 1, 0, 1,
-0.905704, 0.03124917, -1.712286, 0.8705882, 1, 0, 1,
-0.9015644, 1.387891, -1.943589, 0.8666667, 1, 0, 1,
-0.8989801, 0.3552576, -2.718564, 0.8588235, 1, 0, 1,
-0.8950362, -1.374899, -2.694779, 0.854902, 1, 0, 1,
-0.893049, 0.5441831, -1.944477, 0.8470588, 1, 0, 1,
-0.8917697, 0.2027142, -0.6294853, 0.8431373, 1, 0, 1,
-0.8820947, 0.897856, -1.253262, 0.8352941, 1, 0, 1,
-0.8694016, -0.68465, -1.705142, 0.8313726, 1, 0, 1,
-0.8683054, 0.4714731, -1.739227, 0.8235294, 1, 0, 1,
-0.867135, 0.842584, -1.356994, 0.8196079, 1, 0, 1,
-0.8635764, 0.300852, -1.207129, 0.8117647, 1, 0, 1,
-0.8616276, 0.6646405, -1.340395, 0.8078431, 1, 0, 1,
-0.8572096, -0.4743515, -2.740222, 0.8, 1, 0, 1,
-0.852038, -1.340734, -2.344189, 0.7921569, 1, 0, 1,
-0.8510337, 1.067107, -0.3500164, 0.7882353, 1, 0, 1,
-0.8483884, 0.2363926, -3.37906, 0.7803922, 1, 0, 1,
-0.8482523, 0.8383794, 0.4426868, 0.7764706, 1, 0, 1,
-0.8482084, -0.7562693, -1.771303, 0.7686275, 1, 0, 1,
-0.8454348, 0.4869432, 0.04676369, 0.7647059, 1, 0, 1,
-0.8416444, -0.01109244, -2.047902, 0.7568628, 1, 0, 1,
-0.8358763, 0.1839445, -0.978462, 0.7529412, 1, 0, 1,
-0.8311945, 0.2564093, -0.6925629, 0.7450981, 1, 0, 1,
-0.8279989, 0.04520083, -1.581826, 0.7411765, 1, 0, 1,
-0.8250402, 1.04142, -1.539794, 0.7333333, 1, 0, 1,
-0.8225849, -0.9171121, -2.353757, 0.7294118, 1, 0, 1,
-0.8220112, -1.260813, -2.785578, 0.7215686, 1, 0, 1,
-0.8157886, -0.4010748, -0.2087674, 0.7176471, 1, 0, 1,
-0.8156999, -0.7627887, -3.036777, 0.7098039, 1, 0, 1,
-0.8145905, 0.503309, -0.3368602, 0.7058824, 1, 0, 1,
-0.8101985, 1.402541, -0.5879474, 0.6980392, 1, 0, 1,
-0.8101228, 0.9531415, -1.130803, 0.6901961, 1, 0, 1,
-0.8080607, 0.8149636, -1.939689, 0.6862745, 1, 0, 1,
-0.795279, -2.247464, -3.061198, 0.6784314, 1, 0, 1,
-0.7940454, 1.561082, -0.3786609, 0.6745098, 1, 0, 1,
-0.7925723, -0.198524, -1.472807, 0.6666667, 1, 0, 1,
-0.7897416, 0.1755452, -3.154807, 0.6627451, 1, 0, 1,
-0.7886822, -1.67766, -2.468018, 0.654902, 1, 0, 1,
-0.7857142, -0.4630395, -0.9360657, 0.6509804, 1, 0, 1,
-0.7768304, 1.272389, -2.574756, 0.6431373, 1, 0, 1,
-0.7716019, -0.9859149, -5.014536, 0.6392157, 1, 0, 1,
-0.7605622, 1.820553, -2.509722, 0.6313726, 1, 0, 1,
-0.7553521, -1.305748, -2.740335, 0.627451, 1, 0, 1,
-0.7538846, 0.08757578, -0.520988, 0.6196079, 1, 0, 1,
-0.7501759, -0.7526566, -2.338968, 0.6156863, 1, 0, 1,
-0.7494271, -0.4794191, -1.453061, 0.6078432, 1, 0, 1,
-0.743318, 0.06822095, 0.7371829, 0.6039216, 1, 0, 1,
-0.7423993, -0.459506, -2.460528, 0.5960785, 1, 0, 1,
-0.7398255, -0.1030504, -2.312441, 0.5882353, 1, 0, 1,
-0.7283826, -0.1415374, -1.97655, 0.5843138, 1, 0, 1,
-0.7275833, 2.016232, 0.7742793, 0.5764706, 1, 0, 1,
-0.7275435, -1.110981, -2.634784, 0.572549, 1, 0, 1,
-0.716523, 0.4312453, -1.863227, 0.5647059, 1, 0, 1,
-0.7152014, 1.308018, 0.4162291, 0.5607843, 1, 0, 1,
-0.7113256, 0.2536309, -1.122843, 0.5529412, 1, 0, 1,
-0.71085, -1.34595, -0.8730445, 0.5490196, 1, 0, 1,
-0.7102176, 0.4356853, -2.230189, 0.5411765, 1, 0, 1,
-0.7090124, 1.734808, -0.3099064, 0.5372549, 1, 0, 1,
-0.7028539, -1.722667, -1.614273, 0.5294118, 1, 0, 1,
-0.6964222, 0.4523871, 0.3309601, 0.5254902, 1, 0, 1,
-0.6910521, 0.2897527, -1.227929, 0.5176471, 1, 0, 1,
-0.6900281, -0.1821017, -3.11612, 0.5137255, 1, 0, 1,
-0.6894522, -0.1324947, -2.293682, 0.5058824, 1, 0, 1,
-0.6790735, -0.1793031, -2.299031, 0.5019608, 1, 0, 1,
-0.675145, -1.679179, -2.635409, 0.4941176, 1, 0, 1,
-0.6571016, 0.3602143, -1.788149, 0.4862745, 1, 0, 1,
-0.6535439, -0.1251349, -0.3427036, 0.4823529, 1, 0, 1,
-0.6525356, -0.2972575, -2.760268, 0.4745098, 1, 0, 1,
-0.6501291, 0.1907935, -1.740407, 0.4705882, 1, 0, 1,
-0.6305963, -0.04161482, -2.941742, 0.4627451, 1, 0, 1,
-0.6178198, -0.2379812, -1.95188, 0.4588235, 1, 0, 1,
-0.6174024, -0.7444559, -3.933211, 0.4509804, 1, 0, 1,
-0.6159016, -0.8664458, -3.364954, 0.4470588, 1, 0, 1,
-0.615501, -1.534965, -1.890999, 0.4392157, 1, 0, 1,
-0.6053311, 1.69619, 0.3864326, 0.4352941, 1, 0, 1,
-0.5996303, -0.961557, -2.421087, 0.427451, 1, 0, 1,
-0.5954512, 0.6922455, -1.00155, 0.4235294, 1, 0, 1,
-0.5929083, 1.069967, 1.305852, 0.4156863, 1, 0, 1,
-0.5897782, -0.3892153, -2.301898, 0.4117647, 1, 0, 1,
-0.5894946, -0.05531889, -2.344773, 0.4039216, 1, 0, 1,
-0.5887554, 0.176449, -0.8872539, 0.3960784, 1, 0, 1,
-0.5813732, -0.2217583, -3.433758, 0.3921569, 1, 0, 1,
-0.5806572, -0.144467, -2.263319, 0.3843137, 1, 0, 1,
-0.5790067, -1.300394, -2.988034, 0.3803922, 1, 0, 1,
-0.5761244, 1.117761, 1.035266, 0.372549, 1, 0, 1,
-0.5747382, -0.2672282, -2.528431, 0.3686275, 1, 0, 1,
-0.5632882, 0.9519414, 0.2809336, 0.3607843, 1, 0, 1,
-0.5632834, 2.220316, -1.779745, 0.3568628, 1, 0, 1,
-0.5612207, -0.8624913, -3.495708, 0.3490196, 1, 0, 1,
-0.5611836, -1.134822, -2.163583, 0.345098, 1, 0, 1,
-0.5607246, -2.284688, -2.774248, 0.3372549, 1, 0, 1,
-0.5592695, -0.01558896, -1.768155, 0.3333333, 1, 0, 1,
-0.5588823, 0.2239533, -0.4304549, 0.3254902, 1, 0, 1,
-0.5562429, -0.2303198, -3.693505, 0.3215686, 1, 0, 1,
-0.5541654, 0.6891851, 0.7396818, 0.3137255, 1, 0, 1,
-0.5536063, 0.4697418, -0.2148207, 0.3098039, 1, 0, 1,
-0.5432223, -0.6386036, -1.388967, 0.3019608, 1, 0, 1,
-0.5404165, 1.164443, -2.532964, 0.2941177, 1, 0, 1,
-0.5397999, 0.7337484, 0.2371062, 0.2901961, 1, 0, 1,
-0.5396917, 1.837882, 0.7510136, 0.282353, 1, 0, 1,
-0.5390124, 0.4428937, 1.327147, 0.2784314, 1, 0, 1,
-0.5367497, 0.1883387, -0.3504682, 0.2705882, 1, 0, 1,
-0.536048, 0.8031607, -1.333334, 0.2666667, 1, 0, 1,
-0.5349381, -0.9333114, -4.190692, 0.2588235, 1, 0, 1,
-0.5321824, 0.669457, -1.112102, 0.254902, 1, 0, 1,
-0.5292729, 0.2307788, -2.565623, 0.2470588, 1, 0, 1,
-0.5290719, 0.4389747, -0.8305542, 0.2431373, 1, 0, 1,
-0.5281764, -2.108355, -3.242167, 0.2352941, 1, 0, 1,
-0.5221883, 1.878358, -0.9562156, 0.2313726, 1, 0, 1,
-0.5156321, 0.1741538, -0.4763569, 0.2235294, 1, 0, 1,
-0.5155796, 1.625317, -0.0989925, 0.2196078, 1, 0, 1,
-0.5097237, 0.9499589, 1.463819, 0.2117647, 1, 0, 1,
-0.509688, -0.2108504, -2.51032, 0.2078431, 1, 0, 1,
-0.5081578, -0.119214, -1.519391, 0.2, 1, 0, 1,
-0.5013032, -1.267715, -2.401646, 0.1921569, 1, 0, 1,
-0.4987298, 1.868966, -0.0216843, 0.1882353, 1, 0, 1,
-0.4971325, 1.794419, 0.9807793, 0.1803922, 1, 0, 1,
-0.4875429, 2.572936, 0.005040768, 0.1764706, 1, 0, 1,
-0.482953, 0.1835168, -0.8860803, 0.1686275, 1, 0, 1,
-0.478288, -0.09780969, 0.3398966, 0.1647059, 1, 0, 1,
-0.4763766, 0.06156408, -1.581074, 0.1568628, 1, 0, 1,
-0.47561, 0.4766191, -0.3949248, 0.1529412, 1, 0, 1,
-0.4752102, 0.2720084, -1.574155, 0.145098, 1, 0, 1,
-0.4730217, 0.7967192, -0.2098505, 0.1411765, 1, 0, 1,
-0.4720102, 0.9326681, -1.065351, 0.1333333, 1, 0, 1,
-0.469609, -1.11344, -1.73688, 0.1294118, 1, 0, 1,
-0.465822, 0.2386924, -0.008825952, 0.1215686, 1, 0, 1,
-0.4656878, 1.31225, 1.773095, 0.1176471, 1, 0, 1,
-0.4648457, -1.151869, -2.971507, 0.1098039, 1, 0, 1,
-0.4635186, -1.867352, -3.978507, 0.1058824, 1, 0, 1,
-0.4601149, -1.940968, -1.598888, 0.09803922, 1, 0, 1,
-0.4574562, -0.5840933, -3.92556, 0.09019608, 1, 0, 1,
-0.4560756, -1.274566, -2.917157, 0.08627451, 1, 0, 1,
-0.4503503, -0.7204891, -0.8250475, 0.07843138, 1, 0, 1,
-0.4459211, 2.450803, 0.3484274, 0.07450981, 1, 0, 1,
-0.4453149, 0.512457, -1.099378, 0.06666667, 1, 0, 1,
-0.4431655, 2.02986, 1.617414, 0.0627451, 1, 0, 1,
-0.4399673, -0.2328037, -2.848089, 0.05490196, 1, 0, 1,
-0.4379009, -0.3305362, -2.499542, 0.05098039, 1, 0, 1,
-0.435537, 0.8039897, 0.05300567, 0.04313726, 1, 0, 1,
-0.4334352, 0.2957695, 0.02140886, 0.03921569, 1, 0, 1,
-0.4328491, 0.580682, -0.7794409, 0.03137255, 1, 0, 1,
-0.4323967, 0.4815314, -1.393004, 0.02745098, 1, 0, 1,
-0.4264555, -0.300393, -3.465695, 0.01960784, 1, 0, 1,
-0.4254669, -1.24683, -1.916406, 0.01568628, 1, 0, 1,
-0.4236259, 1.009762, 0.943252, 0.007843138, 1, 0, 1,
-0.4167456, -0.2184003, -3.846523, 0.003921569, 1, 0, 1,
-0.416069, -0.2576132, -3.259882, 0, 1, 0.003921569, 1,
-0.4157674, -0.05931842, 0.3142576, 0, 1, 0.01176471, 1,
-0.4141479, 1.118898, -0.3515213, 0, 1, 0.01568628, 1,
-0.4132574, -1.236295, -2.852633, 0, 1, 0.02352941, 1,
-0.4128584, 1.121543, -0.1749882, 0, 1, 0.02745098, 1,
-0.4085505, -0.7203184, -1.100395, 0, 1, 0.03529412, 1,
-0.4064246, 0.6895596, -0.7926981, 0, 1, 0.03921569, 1,
-0.3985239, -0.5162985, -3.142837, 0, 1, 0.04705882, 1,
-0.3984562, 0.5971655, -1.508455, 0, 1, 0.05098039, 1,
-0.3964877, -0.1043235, -4.024598, 0, 1, 0.05882353, 1,
-0.3946629, -0.5812007, -4.162675, 0, 1, 0.0627451, 1,
-0.3927697, -0.1784588, -1.082608, 0, 1, 0.07058824, 1,
-0.392278, -0.3669999, -1.088389, 0, 1, 0.07450981, 1,
-0.3918535, 0.08227011, -2.693256, 0, 1, 0.08235294, 1,
-0.387434, -0.3074792, -3.779497, 0, 1, 0.08627451, 1,
-0.3830797, -0.5939001, -3.467699, 0, 1, 0.09411765, 1,
-0.3816768, -2.220137, -4.026209, 0, 1, 0.1019608, 1,
-0.3772947, 0.5758648, -0.9906049, 0, 1, 0.1058824, 1,
-0.3748477, -0.118395, -1.569655, 0, 1, 0.1137255, 1,
-0.3737184, 0.4149865, 1.480414, 0, 1, 0.1176471, 1,
-0.3728758, -2.13202, -3.244548, 0, 1, 0.1254902, 1,
-0.3726044, -1.000846, -4.537447, 0, 1, 0.1294118, 1,
-0.371172, 0.1824518, 1.044623, 0, 1, 0.1372549, 1,
-0.3704193, -0.9314532, -2.509199, 0, 1, 0.1411765, 1,
-0.363753, 1.067072, -0.6530983, 0, 1, 0.1490196, 1,
-0.3620853, -0.8113175, -1.423618, 0, 1, 0.1529412, 1,
-0.3615763, 0.8001738, 1.111048, 0, 1, 0.1607843, 1,
-0.3594645, 1.03622, 0.3316188, 0, 1, 0.1647059, 1,
-0.359098, 0.9292896, 0.5251947, 0, 1, 0.172549, 1,
-0.3583199, 0.9084228, -0.1952402, 0, 1, 0.1764706, 1,
-0.3563593, 0.05532568, -2.191189, 0, 1, 0.1843137, 1,
-0.3555411, -0.866223, -4.091143, 0, 1, 0.1882353, 1,
-0.3541186, 2.154385, 1.283212, 0, 1, 0.1960784, 1,
-0.3458742, 0.7554108, 0.5578468, 0, 1, 0.2039216, 1,
-0.3451399, -0.6317503, -3.725687, 0, 1, 0.2078431, 1,
-0.343585, -0.5973853, -1.953175, 0, 1, 0.2156863, 1,
-0.3433343, -1.415071, -2.225657, 0, 1, 0.2196078, 1,
-0.3391165, 0.4323355, -1.114226, 0, 1, 0.227451, 1,
-0.3370704, -0.07294809, -2.114795, 0, 1, 0.2313726, 1,
-0.3334154, -1.088221, -2.378404, 0, 1, 0.2392157, 1,
-0.3286469, 2.564204, -0.3057037, 0, 1, 0.2431373, 1,
-0.3286113, -0.2606656, -1.626829, 0, 1, 0.2509804, 1,
-0.3269256, -1.116371, -2.331945, 0, 1, 0.254902, 1,
-0.3264079, -0.2233113, -0.7583591, 0, 1, 0.2627451, 1,
-0.3260951, -0.1674137, -2.121214, 0, 1, 0.2666667, 1,
-0.3249493, 0.2853957, -0.8007777, 0, 1, 0.2745098, 1,
-0.3244625, -0.8136424, -3.255124, 0, 1, 0.2784314, 1,
-0.3222535, 1.454129, -0.4516552, 0, 1, 0.2862745, 1,
-0.319464, 1.027865, -0.8581901, 0, 1, 0.2901961, 1,
-0.3186439, -0.2912966, -2.130095, 0, 1, 0.2980392, 1,
-0.3168006, 2.140678, 0.7811263, 0, 1, 0.3058824, 1,
-0.3157328, -0.1380364, 0.02351169, 0, 1, 0.3098039, 1,
-0.3108132, -0.80339, -2.572254, 0, 1, 0.3176471, 1,
-0.3107828, 0.03924023, -2.578654, 0, 1, 0.3215686, 1,
-0.3105888, 1.231662, -1.348061, 0, 1, 0.3294118, 1,
-0.3087237, -0.6398416, -1.234182, 0, 1, 0.3333333, 1,
-0.3071633, 0.1180525, -1.032998, 0, 1, 0.3411765, 1,
-0.2897249, 0.7920028, -2.246668, 0, 1, 0.345098, 1,
-0.2867226, -1.156727, -1.757052, 0, 1, 0.3529412, 1,
-0.2854557, 0.08104645, -1.637954, 0, 1, 0.3568628, 1,
-0.284552, 0.6329779, -1.302073, 0, 1, 0.3647059, 1,
-0.2833944, -0.6903082, -3.424786, 0, 1, 0.3686275, 1,
-0.2815124, -0.9831955, -3.016608, 0, 1, 0.3764706, 1,
-0.2722195, -0.7950866, -1.651888, 0, 1, 0.3803922, 1,
-0.2706102, -1.421506, -3.012011, 0, 1, 0.3882353, 1,
-0.2680349, 1.386597, -1.265649, 0, 1, 0.3921569, 1,
-0.2607625, 0.233675, -1.148291, 0, 1, 0.4, 1,
-0.2556721, 1.022513, 1.395607, 0, 1, 0.4078431, 1,
-0.2500084, -0.9981802, -2.546725, 0, 1, 0.4117647, 1,
-0.2482634, 1.477673, -0.04540325, 0, 1, 0.4196078, 1,
-0.2480798, -0.1780987, -0.69294, 0, 1, 0.4235294, 1,
-0.2434294, -1.475886, -3.369019, 0, 1, 0.4313726, 1,
-0.2321229, 0.5937284, 0.1394375, 0, 1, 0.4352941, 1,
-0.229918, -0.3392249, -2.847284, 0, 1, 0.4431373, 1,
-0.2273118, -0.1161745, -2.264878, 0, 1, 0.4470588, 1,
-0.2265275, 1.817501, 0.3271701, 0, 1, 0.454902, 1,
-0.2249542, 0.4754322, -0.1333753, 0, 1, 0.4588235, 1,
-0.2235664, -0.369414, -3.485085, 0, 1, 0.4666667, 1,
-0.2232579, -0.2613649, -4.525094, 0, 1, 0.4705882, 1,
-0.2167365, -0.2784617, -0.8173653, 0, 1, 0.4784314, 1,
-0.2167126, -0.9892572, -2.825833, 0, 1, 0.4823529, 1,
-0.214672, -1.224965, -2.196006, 0, 1, 0.4901961, 1,
-0.2132075, -2.987663, -2.077107, 0, 1, 0.4941176, 1,
-0.2106913, 1.396896, -0.1491289, 0, 1, 0.5019608, 1,
-0.2087242, 0.4836103, 0.8999762, 0, 1, 0.509804, 1,
-0.2086891, 0.6268668, -0.6966199, 0, 1, 0.5137255, 1,
-0.2053636, 0.07846319, -1.511718, 0, 1, 0.5215687, 1,
-0.2006266, 0.004998747, -1.928719, 0, 1, 0.5254902, 1,
-0.200451, -0.8905519, -3.494236, 0, 1, 0.5333334, 1,
-0.1985103, 1.031098, -0.4574057, 0, 1, 0.5372549, 1,
-0.1956748, -0.46036, -4.716623, 0, 1, 0.5450981, 1,
-0.1934276, 0.5097514, -1.118364, 0, 1, 0.5490196, 1,
-0.1932487, 0.8653095, 0.344582, 0, 1, 0.5568628, 1,
-0.1919864, -2.417712, -2.341547, 0, 1, 0.5607843, 1,
-0.1904576, 0.9234743, 0.7367638, 0, 1, 0.5686275, 1,
-0.1883649, 0.6646864, -0.3571356, 0, 1, 0.572549, 1,
-0.1835677, -0.5196518, -3.864544, 0, 1, 0.5803922, 1,
-0.1830404, 0.6667962, 0.6703743, 0, 1, 0.5843138, 1,
-0.179529, 0.231818, 0.5286016, 0, 1, 0.5921569, 1,
-0.176863, -0.2051102, -1.97885, 0, 1, 0.5960785, 1,
-0.1761879, -0.5452635, -2.118849, 0, 1, 0.6039216, 1,
-0.1748262, 0.6402622, 1.646031, 0, 1, 0.6117647, 1,
-0.1741799, 0.4116023, 0.1657246, 0, 1, 0.6156863, 1,
-0.1709501, -0.6010082, -2.012671, 0, 1, 0.6235294, 1,
-0.1707723, 0.07296658, -2.478376, 0, 1, 0.627451, 1,
-0.1634053, 1.135294, 1.901144, 0, 1, 0.6352941, 1,
-0.1617539, 0.3580673, -0.8398982, 0, 1, 0.6392157, 1,
-0.157675, 1.833724, -0.09455396, 0, 1, 0.6470588, 1,
-0.1512046, 0.39305, -1.933128, 0, 1, 0.6509804, 1,
-0.1502501, 1.12896, -3.218276, 0, 1, 0.6588235, 1,
-0.1454931, -0.6742055, -2.98903, 0, 1, 0.6627451, 1,
-0.1440511, 0.3852798, -0.4888452, 0, 1, 0.6705883, 1,
-0.1438897, -0.3964013, -3.469718, 0, 1, 0.6745098, 1,
-0.138191, 1.255404, 0.8715368, 0, 1, 0.682353, 1,
-0.1375994, 1.528698, 0.1154162, 0, 1, 0.6862745, 1,
-0.1364568, 0.6923222, -0.06474105, 0, 1, 0.6941177, 1,
-0.1354238, -0.01938419, -0.2170748, 0, 1, 0.7019608, 1,
-0.1307773, 0.7571904, -1.006794, 0, 1, 0.7058824, 1,
-0.1254115, -0.654969, -2.78842, 0, 1, 0.7137255, 1,
-0.1234387, -0.2295377, -2.332943, 0, 1, 0.7176471, 1,
-0.121274, -0.7858585, -3.898044, 0, 1, 0.7254902, 1,
-0.1206043, 0.05264268, -0.07167986, 0, 1, 0.7294118, 1,
-0.118386, 1.610169, -1.158577, 0, 1, 0.7372549, 1,
-0.118283, 0.1181912, -1.007095, 0, 1, 0.7411765, 1,
-0.1181738, -0.5466369, -2.333647, 0, 1, 0.7490196, 1,
-0.1159901, -0.6959187, -3.650833, 0, 1, 0.7529412, 1,
-0.1149512, -0.4240361, -3.221075, 0, 1, 0.7607843, 1,
-0.1111254, 0.2439984, -0.5540335, 0, 1, 0.7647059, 1,
-0.110796, 0.8044857, 0.8835601, 0, 1, 0.772549, 1,
-0.11071, -0.7068098, -4.920985, 0, 1, 0.7764706, 1,
-0.1095567, 2.154111, -2.983722, 0, 1, 0.7843137, 1,
-0.1088863, 0.3130614, -1.328166, 0, 1, 0.7882353, 1,
-0.1082288, 0.8287082, -0.558823, 0, 1, 0.7960784, 1,
-0.106459, 1.662657, -0.3835804, 0, 1, 0.8039216, 1,
-0.1036081, -1.276523, -2.659595, 0, 1, 0.8078431, 1,
-0.1034029, -0.3226031, -2.191531, 0, 1, 0.8156863, 1,
-0.1013559, -1.436267, -1.655437, 0, 1, 0.8196079, 1,
-0.09937941, -0.7019087, -3.057538, 0, 1, 0.827451, 1,
-0.09915863, -0.2074962, -1.966689, 0, 1, 0.8313726, 1,
-0.09764683, 0.4657934, -1.242302, 0, 1, 0.8392157, 1,
-0.09493664, 1.005459, -0.843751, 0, 1, 0.8431373, 1,
-0.09173235, -1.374171, -2.896363, 0, 1, 0.8509804, 1,
-0.08788864, -0.8104044, -3.482618, 0, 1, 0.854902, 1,
-0.08588918, 1.065118, -0.3941702, 0, 1, 0.8627451, 1,
-0.08540757, -1.176591, -3.588768, 0, 1, 0.8666667, 1,
-0.08447634, 1.102495, 0.03225484, 0, 1, 0.8745098, 1,
-0.08137431, -0.125977, -1.416413, 0, 1, 0.8784314, 1,
-0.07922368, -0.8945244, -3.447775, 0, 1, 0.8862745, 1,
-0.07915808, 0.8293112, 1.0862, 0, 1, 0.8901961, 1,
-0.07867483, -0.1370975, -2.788678, 0, 1, 0.8980392, 1,
-0.07758469, -0.4474089, -2.043592, 0, 1, 0.9058824, 1,
-0.07407674, -0.2765671, -4.054417, 0, 1, 0.9098039, 1,
-0.06872682, -0.7702821, -3.934987, 0, 1, 0.9176471, 1,
-0.06828961, -0.1079452, -2.275671, 0, 1, 0.9215686, 1,
-0.06671749, -1.292408, -3.654403, 0, 1, 0.9294118, 1,
-0.06467978, -1.47558, -4.010995, 0, 1, 0.9333333, 1,
-0.06278663, -0.4325174, -3.200343, 0, 1, 0.9411765, 1,
-0.06097917, 0.7199566, 0.1449374, 0, 1, 0.945098, 1,
-0.05662445, -0.3571523, -2.268987, 0, 1, 0.9529412, 1,
-0.05650318, 0.4738095, 0.3551975, 0, 1, 0.9568627, 1,
-0.05631477, 0.8029867, 1.887418, 0, 1, 0.9647059, 1,
-0.04954481, -0.5319831, -4.490206, 0, 1, 0.9686275, 1,
-0.04948119, 0.5027464, 0.4627929, 0, 1, 0.9764706, 1,
-0.04810686, 0.7524594, -0.4352138, 0, 1, 0.9803922, 1,
-0.04653684, -0.4391561, -2.732873, 0, 1, 0.9882353, 1,
-0.04509942, 1.025383, -0.5235204, 0, 1, 0.9921569, 1,
-0.04502832, 0.7514094, 0.7054815, 0, 1, 1, 1,
-0.0426831, -0.07572436, -3.305821, 0, 0.9921569, 1, 1,
-0.04089026, -2.051115, -6.046917, 0, 0.9882353, 1, 1,
-0.03950589, 1.69771, 1.762026, 0, 0.9803922, 1, 1,
-0.03562385, -1.093556, -1.962657, 0, 0.9764706, 1, 1,
-0.03560886, -0.9241799, -2.641814, 0, 0.9686275, 1, 1,
-0.03552548, -0.6806837, -3.168853, 0, 0.9647059, 1, 1,
-0.03414283, 0.1275699, -0.3393297, 0, 0.9568627, 1, 1,
-0.03375427, 0.1755269, 0.9588275, 0, 0.9529412, 1, 1,
-0.03327453, -0.307269, -3.638938, 0, 0.945098, 1, 1,
-0.03233372, 1.12384, 0.4165339, 0, 0.9411765, 1, 1,
-0.0317431, -1.415281, -2.990001, 0, 0.9333333, 1, 1,
-0.03054509, -1.930319, -3.911267, 0, 0.9294118, 1, 1,
-0.02984251, 1.043978, -1.225939, 0, 0.9215686, 1, 1,
-0.02855341, 0.1029941, 0.2129697, 0, 0.9176471, 1, 1,
-0.02277962, 0.06140123, -0.8236503, 0, 0.9098039, 1, 1,
-0.01823896, 0.7070576, -2.692071, 0, 0.9058824, 1, 1,
-0.0110316, -0.4021912, -4.002338, 0, 0.8980392, 1, 1,
-0.009023467, -0.9312217, -3.085558, 0, 0.8901961, 1, 1,
-0.006006373, 0.6422059, -0.6090917, 0, 0.8862745, 1, 1,
-0.004026922, 0.6883851, -0.5455031, 0, 0.8784314, 1, 1,
-0.00335406, -1.268265, -4.158829, 0, 0.8745098, 1, 1,
-0.001587568, 0.5045534, 2.252308, 0, 0.8666667, 1, 1,
-0.001534766, 0.1307874, -0.6778136, 0, 0.8627451, 1, 1,
0.006805693, -0.3400238, 5.989156, 0, 0.854902, 1, 1,
0.007623204, 1.031082, 0.4605733, 0, 0.8509804, 1, 1,
0.01320994, 0.5590907, -0.9244036, 0, 0.8431373, 1, 1,
0.01420603, -0.3245416, 3.294072, 0, 0.8392157, 1, 1,
0.01663247, -0.3321518, 4.167037, 0, 0.8313726, 1, 1,
0.02132006, -0.7739545, 3.794408, 0, 0.827451, 1, 1,
0.02396226, -1.97992, 2.147923, 0, 0.8196079, 1, 1,
0.02924723, -0.6111673, 3.970835, 0, 0.8156863, 1, 1,
0.03558965, 0.9194862, 0.2711768, 0, 0.8078431, 1, 1,
0.03777413, -0.3146364, 2.72021, 0, 0.8039216, 1, 1,
0.04010129, -1.660927, 2.284219, 0, 0.7960784, 1, 1,
0.04147875, 0.4713225, 0.3288129, 0, 0.7882353, 1, 1,
0.04162137, 0.03016573, 1.193212, 0, 0.7843137, 1, 1,
0.04220426, -1.537114, 3.141114, 0, 0.7764706, 1, 1,
0.04452642, 1.437412, 0.2153657, 0, 0.772549, 1, 1,
0.04577256, 2.430327, -0.114687, 0, 0.7647059, 1, 1,
0.04695129, 1.733784, 1.000373, 0, 0.7607843, 1, 1,
0.04752456, -0.4498841, 3.458957, 0, 0.7529412, 1, 1,
0.05385392, -0.3079858, 2.903533, 0, 0.7490196, 1, 1,
0.05395394, -0.88447, 3.256062, 0, 0.7411765, 1, 1,
0.05755287, 1.230292, 0.779911, 0, 0.7372549, 1, 1,
0.0590167, 3.226852, -1.065012, 0, 0.7294118, 1, 1,
0.06020754, 0.64042, 0.3610046, 0, 0.7254902, 1, 1,
0.06170679, 0.01216484, 0.1400977, 0, 0.7176471, 1, 1,
0.06194136, 1.795677, -0.1827853, 0, 0.7137255, 1, 1,
0.0651247, -1.208696, 4.922095, 0, 0.7058824, 1, 1,
0.06781984, -1.28957, 4.049612, 0, 0.6980392, 1, 1,
0.06886946, 3.266879, 2.326498, 0, 0.6941177, 1, 1,
0.06919867, 0.1018791, 0.8397409, 0, 0.6862745, 1, 1,
0.07018963, 0.2382389, -1.570247, 0, 0.682353, 1, 1,
0.07054386, 1.320997, 0.04788919, 0, 0.6745098, 1, 1,
0.07736146, -0.4766143, 2.584187, 0, 0.6705883, 1, 1,
0.079357, 0.1126007, 0.4501051, 0, 0.6627451, 1, 1,
0.08398212, 0.3842832, 1.79156, 0, 0.6588235, 1, 1,
0.08804367, 0.9705584, -1.24848, 0, 0.6509804, 1, 1,
0.08856777, 0.01821085, 2.321709, 0, 0.6470588, 1, 1,
0.08952235, -2.751009, 2.422494, 0, 0.6392157, 1, 1,
0.09156998, -0.8822337, 3.137426, 0, 0.6352941, 1, 1,
0.09515999, -0.7444833, 2.740274, 0, 0.627451, 1, 1,
0.09603567, 2.612363, 0.1763027, 0, 0.6235294, 1, 1,
0.09698502, 1.032726, -1.01432, 0, 0.6156863, 1, 1,
0.09754921, 0.848851, -1.265402, 0, 0.6117647, 1, 1,
0.09978513, -0.3063904, 3.947601, 0, 0.6039216, 1, 1,
0.1055315, 0.06876092, 0.8275823, 0, 0.5960785, 1, 1,
0.1071131, 1.771153, 0.6574995, 0, 0.5921569, 1, 1,
0.1071445, 0.6508059, 1.590202, 0, 0.5843138, 1, 1,
0.1157863, 1.067722, -0.5930368, 0, 0.5803922, 1, 1,
0.1194948, 1.74461, 1.195998, 0, 0.572549, 1, 1,
0.123626, -0.916593, 2.751786, 0, 0.5686275, 1, 1,
0.1308203, -0.6744877, 3.923834, 0, 0.5607843, 1, 1,
0.1377394, 0.7192798, 0.4402801, 0, 0.5568628, 1, 1,
0.1386228, 0.5088745, -1.577077, 0, 0.5490196, 1, 1,
0.1436886, 1.354543, 1.160167, 0, 0.5450981, 1, 1,
0.1488555, -1.500833, 2.015493, 0, 0.5372549, 1, 1,
0.152264, 0.7595161, 0.4035076, 0, 0.5333334, 1, 1,
0.1543797, 0.1111946, 0.4440636, 0, 0.5254902, 1, 1,
0.158926, -0.0244004, 2.469771, 0, 0.5215687, 1, 1,
0.1601463, -0.4177346, 4.543285, 0, 0.5137255, 1, 1,
0.1625016, 1.146007, 1.481556, 0, 0.509804, 1, 1,
0.1652358, 1.062509, 1.162903, 0, 0.5019608, 1, 1,
0.1666595, -0.4058594, 2.105132, 0, 0.4941176, 1, 1,
0.1673794, 0.3379999, -0.8286336, 0, 0.4901961, 1, 1,
0.1691679, -0.9976707, 4.244709, 0, 0.4823529, 1, 1,
0.1775299, -0.2924629, 4.043271, 0, 0.4784314, 1, 1,
0.1791561, 0.5142267, -0.6326257, 0, 0.4705882, 1, 1,
0.1792479, -1.391013, 3.630208, 0, 0.4666667, 1, 1,
0.1810596, 0.1771663, 0.1805579, 0, 0.4588235, 1, 1,
0.1819634, 0.86703, -0.2122644, 0, 0.454902, 1, 1,
0.1883556, 0.1039212, 1.643911, 0, 0.4470588, 1, 1,
0.1884264, 0.7730004, -0.2617821, 0, 0.4431373, 1, 1,
0.1906106, 0.4498111, -0.3090988, 0, 0.4352941, 1, 1,
0.1973859, -0.5233182, 3.170494, 0, 0.4313726, 1, 1,
0.1992194, 1.070899, 1.821618, 0, 0.4235294, 1, 1,
0.2078825, -0.5239024, 2.407174, 0, 0.4196078, 1, 1,
0.2084226, 0.9838226, -0.1096721, 0, 0.4117647, 1, 1,
0.2116197, -0.8607073, 1.869555, 0, 0.4078431, 1, 1,
0.2126469, -1.169854, 3.30877, 0, 0.4, 1, 1,
0.2136548, 0.7664862, 0.8628503, 0, 0.3921569, 1, 1,
0.2151638, 0.114951, 1.11332, 0, 0.3882353, 1, 1,
0.2202454, -1.65461, 0.4951226, 0, 0.3803922, 1, 1,
0.2204398, 1.310704, -1.012356, 0, 0.3764706, 1, 1,
0.2230274, -0.2983066, 4.104068, 0, 0.3686275, 1, 1,
0.2264997, -1.208652, 3.731537, 0, 0.3647059, 1, 1,
0.2334258, 0.5197255, 0.4275851, 0, 0.3568628, 1, 1,
0.2339388, -0.5581079, 3.282928, 0, 0.3529412, 1, 1,
0.2362908, 0.1716664, 1.856629, 0, 0.345098, 1, 1,
0.236524, 0.2893115, 0.3976304, 0, 0.3411765, 1, 1,
0.236783, 0.1244553, 1.90601, 0, 0.3333333, 1, 1,
0.2373599, 0.962409, -0.7759168, 0, 0.3294118, 1, 1,
0.2428972, 0.08880315, 0.9195697, 0, 0.3215686, 1, 1,
0.2439206, 0.4259002, -0.07235157, 0, 0.3176471, 1, 1,
0.2467246, 0.9024375, 0.3277133, 0, 0.3098039, 1, 1,
0.2471281, -0.4658716, 3.621887, 0, 0.3058824, 1, 1,
0.2475948, 1.127132, -0.07373305, 0, 0.2980392, 1, 1,
0.2480892, 1.242081, 0.4913496, 0, 0.2901961, 1, 1,
0.2496838, 0.5838097, -0.02601681, 0, 0.2862745, 1, 1,
0.2572272, -1.104998, 3.531981, 0, 0.2784314, 1, 1,
0.2584111, 1.495112, -0.2719674, 0, 0.2745098, 1, 1,
0.2596484, -1.423812, 2.518993, 0, 0.2666667, 1, 1,
0.2645043, -0.1916739, 1.664303, 0, 0.2627451, 1, 1,
0.2647097, -1.038038, 3.5477, 0, 0.254902, 1, 1,
0.2648859, 1.719588, -0.4069632, 0, 0.2509804, 1, 1,
0.2676992, -1.646017, 3.232396, 0, 0.2431373, 1, 1,
0.2681399, 0.8212513, -0.5535349, 0, 0.2392157, 1, 1,
0.2685615, 0.1525369, 1.122846, 0, 0.2313726, 1, 1,
0.2717574, 0.1990661, -1.234372, 0, 0.227451, 1, 1,
0.2722853, 1.19721, -0.6130716, 0, 0.2196078, 1, 1,
0.2737491, -1.891696, 2.578951, 0, 0.2156863, 1, 1,
0.2802682, -0.7794632, 2.864639, 0, 0.2078431, 1, 1,
0.2803055, -0.403987, 2.821039, 0, 0.2039216, 1, 1,
0.286155, 1.247877, 0.9560562, 0, 0.1960784, 1, 1,
0.28643, -0.6652682, 2.251447, 0, 0.1882353, 1, 1,
0.2869711, -1.059762, 2.468099, 0, 0.1843137, 1, 1,
0.2877106, 0.02952119, 1.927973, 0, 0.1764706, 1, 1,
0.2921025, 1.320669, 1.191067, 0, 0.172549, 1, 1,
0.2991218, -0.3441117, 2.450964, 0, 0.1647059, 1, 1,
0.3014272, 0.7323527, -0.9423612, 0, 0.1607843, 1, 1,
0.3053548, 2.164222, 0.4703311, 0, 0.1529412, 1, 1,
0.3128173, 2.981699, 1.129793, 0, 0.1490196, 1, 1,
0.3147793, -1.039816, 2.578519, 0, 0.1411765, 1, 1,
0.3154042, 1.082954, -1.150663, 0, 0.1372549, 1, 1,
0.3179606, 0.545135, 1.606673, 0, 0.1294118, 1, 1,
0.3190132, -0.4620409, 1.363526, 0, 0.1254902, 1, 1,
0.3208525, 0.4305527, 0.3924876, 0, 0.1176471, 1, 1,
0.3216754, 0.7177859, -1.772176, 0, 0.1137255, 1, 1,
0.3244213, 0.2630678, 1.360816, 0, 0.1058824, 1, 1,
0.3288806, -0.3754918, 2.625755, 0, 0.09803922, 1, 1,
0.3304273, 0.02702936, 1.528062, 0, 0.09411765, 1, 1,
0.3418363, -0.7165366, 4.315583, 0, 0.08627451, 1, 1,
0.3424319, 0.464144, 0.1448662, 0, 0.08235294, 1, 1,
0.3435829, -0.3129687, 1.329493, 0, 0.07450981, 1, 1,
0.3446615, 0.3620157, 2.383026, 0, 0.07058824, 1, 1,
0.3481638, -0.1585521, 2.532613, 0, 0.0627451, 1, 1,
0.3508691, 1.221306, -0.6538366, 0, 0.05882353, 1, 1,
0.3529141, 0.5572305, 0.8748293, 0, 0.05098039, 1, 1,
0.3586675, 1.420218, -0.06207464, 0, 0.04705882, 1, 1,
0.3632737, 0.5086263, 0.9283481, 0, 0.03921569, 1, 1,
0.3787115, 0.4944202, 0.3160076, 0, 0.03529412, 1, 1,
0.3813502, 0.1649379, 0.7708699, 0, 0.02745098, 1, 1,
0.3856739, -0.510184, 1.31439, 0, 0.02352941, 1, 1,
0.3863058, 0.1820299, 0.2646733, 0, 0.01568628, 1, 1,
0.3871647, -1.536148, 2.378068, 0, 0.01176471, 1, 1,
0.3877513, 0.6784113, 1.91946, 0, 0.003921569, 1, 1,
0.3889116, 1.277859, -0.9807519, 0.003921569, 0, 1, 1,
0.3890851, 0.09129174, 2.290674, 0.007843138, 0, 1, 1,
0.3915755, -1.49298, 1.587268, 0.01568628, 0, 1, 1,
0.3924155, 0.219629, 3.320423, 0.01960784, 0, 1, 1,
0.3966792, -0.3483414, 0.4121494, 0.02745098, 0, 1, 1,
0.4012396, 0.8735965, -0.2337679, 0.03137255, 0, 1, 1,
0.4055374, 0.9484478, 0.8756754, 0.03921569, 0, 1, 1,
0.4068258, -0.6808965, 4.159146, 0.04313726, 0, 1, 1,
0.409346, 0.2214395, 1.248835, 0.05098039, 0, 1, 1,
0.4171185, -0.8701288, 3.51054, 0.05490196, 0, 1, 1,
0.4178798, 0.3720503, 2.762518, 0.0627451, 0, 1, 1,
0.4193188, -0.9768478, 4.553031, 0.06666667, 0, 1, 1,
0.4196428, -0.1514613, 2.824025, 0.07450981, 0, 1, 1,
0.4199038, -1.266799, 1.652504, 0.07843138, 0, 1, 1,
0.4257723, -0.3164451, 3.125912, 0.08627451, 0, 1, 1,
0.4277904, -0.2899804, 2.464438, 0.09019608, 0, 1, 1,
0.4280007, -0.8022059, 2.954058, 0.09803922, 0, 1, 1,
0.4305584, 0.1026856, 2.700883, 0.1058824, 0, 1, 1,
0.4310877, 0.641585, 0.1772521, 0.1098039, 0, 1, 1,
0.4324851, 0.3199176, 0.7707111, 0.1176471, 0, 1, 1,
0.4338875, 1.028501, -0.3925563, 0.1215686, 0, 1, 1,
0.4351292, -0.1708814, 3.703111, 0.1294118, 0, 1, 1,
0.4403268, -0.2713499, 3.604819, 0.1333333, 0, 1, 1,
0.4436424, 1.110582, 1.340349, 0.1411765, 0, 1, 1,
0.444787, 0.5385802, 1.371856, 0.145098, 0, 1, 1,
0.4448746, 1.049986, -1.18897, 0.1529412, 0, 1, 1,
0.4567273, 0.7045892, 0.4001645, 0.1568628, 0, 1, 1,
0.4575543, 0.06147592, 1.080461, 0.1647059, 0, 1, 1,
0.4588672, -0.4451868, 1.949079, 0.1686275, 0, 1, 1,
0.4620812, 0.3677223, 0.5688148, 0.1764706, 0, 1, 1,
0.4683859, 0.8150436, 0.3067005, 0.1803922, 0, 1, 1,
0.4687456, -0.2309199, 1.163303, 0.1882353, 0, 1, 1,
0.4720386, -1.122828, 2.635757, 0.1921569, 0, 1, 1,
0.4722146, 0.3578594, 1.452456, 0.2, 0, 1, 1,
0.4731463, 1.341806, -0.06659013, 0.2078431, 0, 1, 1,
0.4749772, -0.3840399, 1.523033, 0.2117647, 0, 1, 1,
0.4773467, -1.240137, 0.9375586, 0.2196078, 0, 1, 1,
0.4816042, 2.147673, 1.506537, 0.2235294, 0, 1, 1,
0.4830397, 0.7871113, 0.4268335, 0.2313726, 0, 1, 1,
0.484517, 1.198789, 0.4067409, 0.2352941, 0, 1, 1,
0.4865732, -0.793878, 1.206288, 0.2431373, 0, 1, 1,
0.4878715, -0.01243473, 0.8353986, 0.2470588, 0, 1, 1,
0.491998, 0.2122061, 1.942567, 0.254902, 0, 1, 1,
0.4937734, -0.2054377, 2.160577, 0.2588235, 0, 1, 1,
0.5007438, -0.0599333, 3.801761, 0.2666667, 0, 1, 1,
0.5054242, 1.293008, 2.121631, 0.2705882, 0, 1, 1,
0.508618, -0.4194166, 2.540767, 0.2784314, 0, 1, 1,
0.5104368, 1.443426, 0.1745818, 0.282353, 0, 1, 1,
0.5140573, 0.2299941, -0.4532433, 0.2901961, 0, 1, 1,
0.5190802, -0.4981886, 2.70256, 0.2941177, 0, 1, 1,
0.5210118, -0.2007234, 2.537858, 0.3019608, 0, 1, 1,
0.5221627, -0.6142822, 3.107775, 0.3098039, 0, 1, 1,
0.5260426, -0.1991642, 1.74518, 0.3137255, 0, 1, 1,
0.5278274, 0.4838539, 0.8219535, 0.3215686, 0, 1, 1,
0.5290983, -0.20317, 2.028648, 0.3254902, 0, 1, 1,
0.5364712, 0.614781, 0.3371882, 0.3333333, 0, 1, 1,
0.5366868, 0.9517501, -0.2553124, 0.3372549, 0, 1, 1,
0.5388098, -0.2316002, 2.691481, 0.345098, 0, 1, 1,
0.5421768, 0.2473087, 1.276343, 0.3490196, 0, 1, 1,
0.5462162, -1.190293, 2.578162, 0.3568628, 0, 1, 1,
0.5480736, 0.3548069, 2.190321, 0.3607843, 0, 1, 1,
0.5489551, 1.59091, 0.4492158, 0.3686275, 0, 1, 1,
0.551356, -0.9171405, 2.751972, 0.372549, 0, 1, 1,
0.5545932, -2.153334, 1.666549, 0.3803922, 0, 1, 1,
0.5553281, -2.239884, 1.788069, 0.3843137, 0, 1, 1,
0.559891, 0.2111329, 2.113419, 0.3921569, 0, 1, 1,
0.5612728, 1.054788, -0.6340773, 0.3960784, 0, 1, 1,
0.5645687, 0.09271188, -0.5287467, 0.4039216, 0, 1, 1,
0.5672328, -0.8747039, 2.669322, 0.4117647, 0, 1, 1,
0.5735154, 0.963406, -0.5020629, 0.4156863, 0, 1, 1,
0.5767781, 2.174748, 0.3535784, 0.4235294, 0, 1, 1,
0.5770533, -1.110874, 3.694015, 0.427451, 0, 1, 1,
0.5795166, 0.9821204, -1.404349, 0.4352941, 0, 1, 1,
0.5835943, 0.1908787, 0.8449267, 0.4392157, 0, 1, 1,
0.587797, 0.5385119, -0.522562, 0.4470588, 0, 1, 1,
0.5927038, -0.08333803, 2.516714, 0.4509804, 0, 1, 1,
0.5968794, -1.432445, 2.418662, 0.4588235, 0, 1, 1,
0.5978278, 2.049793, -0.02876325, 0.4627451, 0, 1, 1,
0.5997239, 0.425745, 0.5090468, 0.4705882, 0, 1, 1,
0.6032805, 0.1755586, 1.744695, 0.4745098, 0, 1, 1,
0.6046705, 0.8992169, 1.56956, 0.4823529, 0, 1, 1,
0.6073406, 0.1456171, 3.282988, 0.4862745, 0, 1, 1,
0.6100478, 1.616302, -0.378697, 0.4941176, 0, 1, 1,
0.612811, -0.6426306, 2.92075, 0.5019608, 0, 1, 1,
0.6206274, 0.002587017, 1.421078, 0.5058824, 0, 1, 1,
0.6245642, -0.3146155, 3.28381, 0.5137255, 0, 1, 1,
0.6338795, 0.009419356, 1.968886, 0.5176471, 0, 1, 1,
0.6386292, -0.937387, 3.556088, 0.5254902, 0, 1, 1,
0.63872, -0.4939759, 2.285295, 0.5294118, 0, 1, 1,
0.6394925, -1.300837, 2.221311, 0.5372549, 0, 1, 1,
0.6396188, 0.0589035, 1.016655, 0.5411765, 0, 1, 1,
0.641956, 0.5857927, 1.396674, 0.5490196, 0, 1, 1,
0.6435802, -1.280307, 3.029741, 0.5529412, 0, 1, 1,
0.6513541, 0.8758777, 1.681218, 0.5607843, 0, 1, 1,
0.655625, -0.1155135, 1.479896, 0.5647059, 0, 1, 1,
0.6557771, 0.8648955, 1.070896, 0.572549, 0, 1, 1,
0.6590455, 0.5242794, 0.9064351, 0.5764706, 0, 1, 1,
0.6599249, 1.772571, 1.89167, 0.5843138, 0, 1, 1,
0.6599897, -0.6127091, 2.322914, 0.5882353, 0, 1, 1,
0.6655276, 0.1460616, 1.886909, 0.5960785, 0, 1, 1,
0.6661775, 0.2995183, 0.8594804, 0.6039216, 0, 1, 1,
0.666618, -0.6033518, 0.7605959, 0.6078432, 0, 1, 1,
0.6675984, -0.2851539, 4.711936, 0.6156863, 0, 1, 1,
0.6738042, 0.5014679, 0.4896682, 0.6196079, 0, 1, 1,
0.6764294, 1.689415, -2.075707, 0.627451, 0, 1, 1,
0.6784871, 0.3538559, 0.4875388, 0.6313726, 0, 1, 1,
0.6813059, 0.929931, -0.3648518, 0.6392157, 0, 1, 1,
0.6834677, -0.9336188, 2.018075, 0.6431373, 0, 1, 1,
0.6866477, -0.5414606, 3.288187, 0.6509804, 0, 1, 1,
0.6873386, -0.4407992, 3.891629, 0.654902, 0, 1, 1,
0.6975853, 0.3175967, 1.426489, 0.6627451, 0, 1, 1,
0.7003929, -0.4406935, 1.171697, 0.6666667, 0, 1, 1,
0.7015837, 0.8732039, 0.9073687, 0.6745098, 0, 1, 1,
0.7017342, 0.4427864, 0.6479075, 0.6784314, 0, 1, 1,
0.7101655, 1.302453, 0.2113925, 0.6862745, 0, 1, 1,
0.7116765, 0.1782243, -0.03922183, 0.6901961, 0, 1, 1,
0.7124851, 2.945511, 1.06131, 0.6980392, 0, 1, 1,
0.7149417, -1.80018, 3.692369, 0.7058824, 0, 1, 1,
0.7208893, 0.8206862, 1.691472, 0.7098039, 0, 1, 1,
0.725076, 0.01481547, 1.040208, 0.7176471, 0, 1, 1,
0.7276774, 0.1539822, 0.8905399, 0.7215686, 0, 1, 1,
0.727895, -1.186977, 3.893225, 0.7294118, 0, 1, 1,
0.7300432, -0.7500895, 3.002447, 0.7333333, 0, 1, 1,
0.7313892, 0.4578882, 1.943064, 0.7411765, 0, 1, 1,
0.7392876, 1.173743, 0.7594501, 0.7450981, 0, 1, 1,
0.7486007, 0.8828532, 0.9358037, 0.7529412, 0, 1, 1,
0.7494863, 0.3131763, 1.402229, 0.7568628, 0, 1, 1,
0.7513398, -0.9538523, 2.156617, 0.7647059, 0, 1, 1,
0.7533398, 0.4300014, 0.5657997, 0.7686275, 0, 1, 1,
0.7606223, -0.1657878, 1.100256, 0.7764706, 0, 1, 1,
0.7608722, -1.279412, 3.025684, 0.7803922, 0, 1, 1,
0.7657937, -0.7275805, 2.628209, 0.7882353, 0, 1, 1,
0.7667903, 0.5394673, -0.173901, 0.7921569, 0, 1, 1,
0.7700199, 1.305017, 0.6793835, 0.8, 0, 1, 1,
0.7720827, 1.804197, 0.5237426, 0.8078431, 0, 1, 1,
0.782141, -1.735404, 3.214092, 0.8117647, 0, 1, 1,
0.7842461, -1.367768, 3.910526, 0.8196079, 0, 1, 1,
0.7844896, 0.9777163, 2.084272, 0.8235294, 0, 1, 1,
0.7866662, 0.3453871, 0.4427483, 0.8313726, 0, 1, 1,
0.7916241, -1.895646, 2.870588, 0.8352941, 0, 1, 1,
0.7946903, -0.1776752, 2.354773, 0.8431373, 0, 1, 1,
0.7981592, 0.8196564, 1.53839, 0.8470588, 0, 1, 1,
0.7986187, -1.146732, 1.937456, 0.854902, 0, 1, 1,
0.8011826, -0.002751424, 1.28583, 0.8588235, 0, 1, 1,
0.8048681, 0.3576364, 1.580904, 0.8666667, 0, 1, 1,
0.8063183, 1.56854, 1.413108, 0.8705882, 0, 1, 1,
0.8132073, -0.5648111, 2.795029, 0.8784314, 0, 1, 1,
0.8134175, -0.4176057, 2.927367, 0.8823529, 0, 1, 1,
0.8205516, -0.4400114, 1.026894, 0.8901961, 0, 1, 1,
0.8243274, -0.1399223, 0.6329669, 0.8941177, 0, 1, 1,
0.836804, -2.211179, 3.035712, 0.9019608, 0, 1, 1,
0.837605, -0.6146544, -0.3254042, 0.9098039, 0, 1, 1,
0.8385501, -0.7116842, 2.023127, 0.9137255, 0, 1, 1,
0.8414924, 0.5672518, 2.146964, 0.9215686, 0, 1, 1,
0.8446881, 1.922051, -0.6195939, 0.9254902, 0, 1, 1,
0.8511309, -0.6775678, 1.379496, 0.9333333, 0, 1, 1,
0.8547964, -0.5857676, 0.3727244, 0.9372549, 0, 1, 1,
0.864149, -0.08681836, 1.631468, 0.945098, 0, 1, 1,
0.8642997, -1.26975, 1.291493, 0.9490196, 0, 1, 1,
0.8681077, -3.014702, 3.820558, 0.9568627, 0, 1, 1,
0.8735344, 1.059167, 1.312435, 0.9607843, 0, 1, 1,
0.8738978, 1.059504, 0.3631317, 0.9686275, 0, 1, 1,
0.8770865, 0.03870758, 1.911038, 0.972549, 0, 1, 1,
0.8813989, -2.058966, 4.146986, 0.9803922, 0, 1, 1,
0.8863878, -0.4222334, 2.579134, 0.9843137, 0, 1, 1,
0.8869607, -1.188414, 0.9278061, 0.9921569, 0, 1, 1,
0.8870282, 0.9930054, 0.8049245, 0.9960784, 0, 1, 1,
0.8877972, -0.3653655, 2.625618, 1, 0, 0.9960784, 1,
0.8909552, -1.639773, 2.671148, 1, 0, 0.9882353, 1,
0.8910378, 0.1843819, 0.7915201, 1, 0, 0.9843137, 1,
0.8950056, -1.129839, 4.111751, 1, 0, 0.9764706, 1,
0.9040704, -0.9224735, 1.784491, 1, 0, 0.972549, 1,
0.9077241, 1.235005, 1.588613, 1, 0, 0.9647059, 1,
0.9081047, -1.155153, 1.657493, 1, 0, 0.9607843, 1,
0.916136, 0.3281058, 2.237207, 1, 0, 0.9529412, 1,
0.9297853, -1.509639, 1.001849, 1, 0, 0.9490196, 1,
0.9408169, 0.9251278, 1.413549, 1, 0, 0.9411765, 1,
0.9413692, -0.9129028, 3.273288, 1, 0, 0.9372549, 1,
0.9465675, -1.517899, 2.482004, 1, 0, 0.9294118, 1,
0.9502131, 1.01047, -0.08234498, 1, 0, 0.9254902, 1,
0.959482, 1.268912, 1.513108, 1, 0, 0.9176471, 1,
0.974166, -0.1586634, 1.432632, 1, 0, 0.9137255, 1,
0.97542, -0.2410526, 0.736509, 1, 0, 0.9058824, 1,
0.9769399, 0.3267842, -0.4980307, 1, 0, 0.9019608, 1,
0.9850952, 1.168358, 2.918181, 1, 0, 0.8941177, 1,
0.9907697, -0.6606948, 0.8711406, 1, 0, 0.8862745, 1,
1.001041, -0.9016193, 2.22801, 1, 0, 0.8823529, 1,
1.004444, -1.302144, 3.942973, 1, 0, 0.8745098, 1,
1.006165, 0.06195791, 0.9969676, 1, 0, 0.8705882, 1,
1.011017, -1.333968, 1.455985, 1, 0, 0.8627451, 1,
1.015504, 0.4773996, 0.3270983, 1, 0, 0.8588235, 1,
1.01797, -1.556137, 0.7944583, 1, 0, 0.8509804, 1,
1.018186, 0.9948743, 1.008286, 1, 0, 0.8470588, 1,
1.025997, -2.175851, 2.809509, 1, 0, 0.8392157, 1,
1.028854, 0.4943282, 0.6684972, 1, 0, 0.8352941, 1,
1.034318, 0.9330105, 2.747123, 1, 0, 0.827451, 1,
1.046512, 0.1582205, 0.1491315, 1, 0, 0.8235294, 1,
1.049438, 1.368035, 0.2860371, 1, 0, 0.8156863, 1,
1.05199, -2.274317, 1.852017, 1, 0, 0.8117647, 1,
1.054292, 2.85639, 2.265487, 1, 0, 0.8039216, 1,
1.057894, 2.935952, 0.2363751, 1, 0, 0.7960784, 1,
1.061443, 1.634735, 0.8833384, 1, 0, 0.7921569, 1,
1.072514, -0.07618062, 0.8206309, 1, 0, 0.7843137, 1,
1.075132, -1.412364, 1.449944, 1, 0, 0.7803922, 1,
1.077044, 0.2396346, -0.96483, 1, 0, 0.772549, 1,
1.080709, 0.1364619, -0.1477963, 1, 0, 0.7686275, 1,
1.081536, 0.2171431, 1.47129, 1, 0, 0.7607843, 1,
1.088359, -0.5598259, 1.215606, 1, 0, 0.7568628, 1,
1.090995, 0.5520275, 0.9936158, 1, 0, 0.7490196, 1,
1.097156, 0.369393, 0.1779529, 1, 0, 0.7450981, 1,
1.097695, -0.1847654, 1.350268, 1, 0, 0.7372549, 1,
1.116331, -0.6097471, 2.485578, 1, 0, 0.7333333, 1,
1.118794, -2.051871, 3.584359, 1, 0, 0.7254902, 1,
1.13193, 1.521657, 1.585526, 1, 0, 0.7215686, 1,
1.137163, 0.8105646, 2.727127, 1, 0, 0.7137255, 1,
1.147168, -0.9388784, 4.392589, 1, 0, 0.7098039, 1,
1.149042, 2.801568, 0.5998325, 1, 0, 0.7019608, 1,
1.156673, 1.429681, 1.660727, 1, 0, 0.6941177, 1,
1.169528, 2.308351, -0.6067563, 1, 0, 0.6901961, 1,
1.172976, -1.019225, 2.077961, 1, 0, 0.682353, 1,
1.181087, -1.584536, 4.109242, 1, 0, 0.6784314, 1,
1.184293, -0.6095411, 1.277544, 1, 0, 0.6705883, 1,
1.18665, -1.583095, 2.185513, 1, 0, 0.6666667, 1,
1.187002, 0.9862618, -0.1409763, 1, 0, 0.6588235, 1,
1.199993, -1.501519, 2.423556, 1, 0, 0.654902, 1,
1.203129, -0.316865, 1.676131, 1, 0, 0.6470588, 1,
1.204644, -1.776729, 0.7178429, 1, 0, 0.6431373, 1,
1.212961, 0.05726113, 2.175342, 1, 0, 0.6352941, 1,
1.21488, 1.844912, -0.4783938, 1, 0, 0.6313726, 1,
1.215751, 0.1268906, 0.623684, 1, 0, 0.6235294, 1,
1.22196, -0.03990124, 1.670082, 1, 0, 0.6196079, 1,
1.231802, -1.361883, 2.214072, 1, 0, 0.6117647, 1,
1.233939, 0.07234356, -1.006168, 1, 0, 0.6078432, 1,
1.235514, 1.035163, 1.646975, 1, 0, 0.6, 1,
1.240848, 0.3197752, 2.443946, 1, 0, 0.5921569, 1,
1.25751, 0.5950467, 1.023727, 1, 0, 0.5882353, 1,
1.260824, 0.7819319, -0.1249509, 1, 0, 0.5803922, 1,
1.265646, -0.2300425, -0.8880756, 1, 0, 0.5764706, 1,
1.2687, 0.6015321, 0.6101844, 1, 0, 0.5686275, 1,
1.272658, -1.84189, 1.59034, 1, 0, 0.5647059, 1,
1.274138, -0.2176225, 0.712984, 1, 0, 0.5568628, 1,
1.289752, 0.5602578, 1.313823, 1, 0, 0.5529412, 1,
1.291282, 0.1504416, 1.581956, 1, 0, 0.5450981, 1,
1.303163, -0.3552196, 1.196436, 1, 0, 0.5411765, 1,
1.303882, -0.1257965, 2.411852, 1, 0, 0.5333334, 1,
1.314801, -0.7302957, -0.09846937, 1, 0, 0.5294118, 1,
1.316771, -0.9134827, 2.206208, 1, 0, 0.5215687, 1,
1.318677, 0.4866862, 1.784357, 1, 0, 0.5176471, 1,
1.320013, -0.6045223, 2.450409, 1, 0, 0.509804, 1,
1.32179, -1.038322, 1.580255, 1, 0, 0.5058824, 1,
1.336681, -0.1611106, 2.543456, 1, 0, 0.4980392, 1,
1.343605, -0.950987, 2.623659, 1, 0, 0.4901961, 1,
1.347858, 0.2715933, 0.474929, 1, 0, 0.4862745, 1,
1.352373, 0.2678337, 0.1828407, 1, 0, 0.4784314, 1,
1.352967, -1.241461, 2.386436, 1, 0, 0.4745098, 1,
1.356225, -0.3398604, 1.825389, 1, 0, 0.4666667, 1,
1.35629, 1.169909, 0.04495405, 1, 0, 0.4627451, 1,
1.367091, 1.015941, 0.4793798, 1, 0, 0.454902, 1,
1.374142, -0.4819907, 2.325, 1, 0, 0.4509804, 1,
1.38296, 0.5568203, 2.903101, 1, 0, 0.4431373, 1,
1.387772, 0.7854063, -0.5620925, 1, 0, 0.4392157, 1,
1.415036, -0.08844556, 1.662546, 1, 0, 0.4313726, 1,
1.415543, 0.09467833, 3.72028, 1, 0, 0.427451, 1,
1.429384, -0.529937, 0.9128096, 1, 0, 0.4196078, 1,
1.439268, -0.9436696, 1.089333, 1, 0, 0.4156863, 1,
1.448928, -0.527568, 1.425401, 1, 0, 0.4078431, 1,
1.456582, 0.5826461, 1.788937, 1, 0, 0.4039216, 1,
1.458832, -1.32796, 0.3542482, 1, 0, 0.3960784, 1,
1.459215, -0.7100544, 2.621818, 1, 0, 0.3882353, 1,
1.463108, -0.1602629, 2.912887, 1, 0, 0.3843137, 1,
1.466384, -0.875645, 1.366344, 1, 0, 0.3764706, 1,
1.469543, -0.7500215, 3.051048, 1, 0, 0.372549, 1,
1.471326, 0.2001824, 1.730681, 1, 0, 0.3647059, 1,
1.474185, -0.3295553, 0.1511549, 1, 0, 0.3607843, 1,
1.480357, 0.8111467, 2.137572, 1, 0, 0.3529412, 1,
1.481079, 1.225695, 1.091598, 1, 0, 0.3490196, 1,
1.483383, 1.637519, 3.450768, 1, 0, 0.3411765, 1,
1.498454, 0.9551383, 1.266397, 1, 0, 0.3372549, 1,
1.502264, -0.01396553, 2.890496, 1, 0, 0.3294118, 1,
1.505829, -0.7074764, 3.794991, 1, 0, 0.3254902, 1,
1.509482, -0.1637441, 1.606042, 1, 0, 0.3176471, 1,
1.515857, 1.13484, 2.512812, 1, 0, 0.3137255, 1,
1.524075, -1.069735, 2.891046, 1, 0, 0.3058824, 1,
1.545818, -1.938949, 2.287566, 1, 0, 0.2980392, 1,
1.564812, -1.044593, 1.051577, 1, 0, 0.2941177, 1,
1.578987, 1.510082, -1.306509, 1, 0, 0.2862745, 1,
1.600536, -0.9995804, 2.808833, 1, 0, 0.282353, 1,
1.600639, -0.1992975, 2.903641, 1, 0, 0.2745098, 1,
1.610767, -1.617889, 2.9444, 1, 0, 0.2705882, 1,
1.619053, 1.014171, 2.023937, 1, 0, 0.2627451, 1,
1.619576, 0.9542845, 0.5345621, 1, 0, 0.2588235, 1,
1.624229, 1.078681, 3.117659, 1, 0, 0.2509804, 1,
1.636239, -0.3699068, 3.718085, 1, 0, 0.2470588, 1,
1.639399, 0.3374072, 0.5048005, 1, 0, 0.2392157, 1,
1.664418, -0.9923301, 2.488699, 1, 0, 0.2352941, 1,
1.725018, 0.9381588, 1.887219, 1, 0, 0.227451, 1,
1.736022, 0.9917609, 1.033275, 1, 0, 0.2235294, 1,
1.739089, -2.954278, 1.375806, 1, 0, 0.2156863, 1,
1.746397, -1.325282, 1.830509, 1, 0, 0.2117647, 1,
1.75221, 0.5797673, 0.9758102, 1, 0, 0.2039216, 1,
1.765625, -0.9763843, 1.960845, 1, 0, 0.1960784, 1,
1.766234, -0.1825607, 3.230382, 1, 0, 0.1921569, 1,
1.781439, -1.915849, 2.194211, 1, 0, 0.1843137, 1,
1.795909, 0.6802197, 1.766621, 1, 0, 0.1803922, 1,
1.808957, 0.8434345, 0.4230043, 1, 0, 0.172549, 1,
1.814485, -0.7327049, 1.974298, 1, 0, 0.1686275, 1,
1.856677, 0.05962895, 1.725305, 1, 0, 0.1607843, 1,
1.916518, 0.7454807, 2.581925, 1, 0, 0.1568628, 1,
1.932455, 0.269339, 0.6421887, 1, 0, 0.1490196, 1,
2.013763, 0.5729088, 1.184186, 1, 0, 0.145098, 1,
2.019856, -1.308816, 1.325133, 1, 0, 0.1372549, 1,
2.040366, 1.0802, 1.404301, 1, 0, 0.1333333, 1,
2.06752, -0.2298231, 4.103385, 1, 0, 0.1254902, 1,
2.092029, 0.4087664, 1.19505, 1, 0, 0.1215686, 1,
2.098225, -0.3759069, 2.55011, 1, 0, 0.1137255, 1,
2.121774, 0.3851787, 2.645265, 1, 0, 0.1098039, 1,
2.152285, 0.729802, 0.7168325, 1, 0, 0.1019608, 1,
2.159715, -0.6255246, 2.038274, 1, 0, 0.09411765, 1,
2.170104, -0.4500932, 1.743731, 1, 0, 0.09019608, 1,
2.175566, -1.72572, 0.5737715, 1, 0, 0.08235294, 1,
2.203625, -0.6350005, 4.26598, 1, 0, 0.07843138, 1,
2.22618, -0.804681, 1.725982, 1, 0, 0.07058824, 1,
2.233357, 0.3929752, 1.511128, 1, 0, 0.06666667, 1,
2.265381, 0.6276349, 0.4126257, 1, 0, 0.05882353, 1,
2.305606, 1.482588, -0.2505052, 1, 0, 0.05490196, 1,
2.334773, 1.184227, 0.4764552, 1, 0, 0.04705882, 1,
2.367926, 0.4354173, 1.424959, 1, 0, 0.04313726, 1,
2.414957, -0.750764, 4.279575, 1, 0, 0.03529412, 1,
2.417133, 1.093017, 1.591735, 1, 0, 0.03137255, 1,
2.424855, -0.06228285, 2.111528, 1, 0, 0.02352941, 1,
2.511713, 1.828354, 1.14514, 1, 0, 0.01960784, 1,
2.738759, -1.347299, 3.443375, 1, 0, 0.01176471, 1,
3.105145, -0.4413867, 0.3524489, 1, 0, 0.007843138, 1
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
-0.1622651, -4.261384, -8.087032, 0, -0.5, 0.5, 0.5,
-0.1622651, -4.261384, -8.087032, 1, -0.5, 0.5, 0.5,
-0.1622651, -4.261384, -8.087032, 1, 1.5, 0.5, 0.5,
-0.1622651, -4.261384, -8.087032, 0, 1.5, 0.5, 0.5
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
-4.537328, 0.6628237, -8.087032, 0, -0.5, 0.5, 0.5,
-4.537328, 0.6628237, -8.087032, 1, -0.5, 0.5, 0.5,
-4.537328, 0.6628237, -8.087032, 1, 1.5, 0.5, 0.5,
-4.537328, 0.6628237, -8.087032, 0, 1.5, 0.5, 0.5
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
-4.537328, -4.261384, -0.0288806, 0, -0.5, 0.5, 0.5,
-4.537328, -4.261384, -0.0288806, 1, -0.5, 0.5, 0.5,
-4.537328, -4.261384, -0.0288806, 1, 1.5, 0.5, 0.5,
-4.537328, -4.261384, -0.0288806, 0, 1.5, 0.5, 0.5
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
-3, -3.125028, -6.227458,
3, -3.125028, -6.227458,
-3, -3.125028, -6.227458,
-3, -3.314421, -6.537387,
-2, -3.125028, -6.227458,
-2, -3.314421, -6.537387,
-1, -3.125028, -6.227458,
-1, -3.314421, -6.537387,
0, -3.125028, -6.227458,
0, -3.314421, -6.537387,
1, -3.125028, -6.227458,
1, -3.314421, -6.537387,
2, -3.125028, -6.227458,
2, -3.314421, -6.537387,
3, -3.125028, -6.227458,
3, -3.314421, -6.537387
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
-3, -3.693206, -7.157245, 0, -0.5, 0.5, 0.5,
-3, -3.693206, -7.157245, 1, -0.5, 0.5, 0.5,
-3, -3.693206, -7.157245, 1, 1.5, 0.5, 0.5,
-3, -3.693206, -7.157245, 0, 1.5, 0.5, 0.5,
-2, -3.693206, -7.157245, 0, -0.5, 0.5, 0.5,
-2, -3.693206, -7.157245, 1, -0.5, 0.5, 0.5,
-2, -3.693206, -7.157245, 1, 1.5, 0.5, 0.5,
-2, -3.693206, -7.157245, 0, 1.5, 0.5, 0.5,
-1, -3.693206, -7.157245, 0, -0.5, 0.5, 0.5,
-1, -3.693206, -7.157245, 1, -0.5, 0.5, 0.5,
-1, -3.693206, -7.157245, 1, 1.5, 0.5, 0.5,
-1, -3.693206, -7.157245, 0, 1.5, 0.5, 0.5,
0, -3.693206, -7.157245, 0, -0.5, 0.5, 0.5,
0, -3.693206, -7.157245, 1, -0.5, 0.5, 0.5,
0, -3.693206, -7.157245, 1, 1.5, 0.5, 0.5,
0, -3.693206, -7.157245, 0, 1.5, 0.5, 0.5,
1, -3.693206, -7.157245, 0, -0.5, 0.5, 0.5,
1, -3.693206, -7.157245, 1, -0.5, 0.5, 0.5,
1, -3.693206, -7.157245, 1, 1.5, 0.5, 0.5,
1, -3.693206, -7.157245, 0, 1.5, 0.5, 0.5,
2, -3.693206, -7.157245, 0, -0.5, 0.5, 0.5,
2, -3.693206, -7.157245, 1, -0.5, 0.5, 0.5,
2, -3.693206, -7.157245, 1, 1.5, 0.5, 0.5,
2, -3.693206, -7.157245, 0, 1.5, 0.5, 0.5,
3, -3.693206, -7.157245, 0, -0.5, 0.5, 0.5,
3, -3.693206, -7.157245, 1, -0.5, 0.5, 0.5,
3, -3.693206, -7.157245, 1, 1.5, 0.5, 0.5,
3, -3.693206, -7.157245, 0, 1.5, 0.5, 0.5
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
-3.527698, -2, -6.227458,
-3.527698, 4, -6.227458,
-3.527698, -2, -6.227458,
-3.69597, -2, -6.537387,
-3.527698, 0, -6.227458,
-3.69597, 0, -6.537387,
-3.527698, 2, -6.227458,
-3.69597, 2, -6.537387,
-3.527698, 4, -6.227458,
-3.69597, 4, -6.537387
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
-4.032513, -2, -7.157245, 0, -0.5, 0.5, 0.5,
-4.032513, -2, -7.157245, 1, -0.5, 0.5, 0.5,
-4.032513, -2, -7.157245, 1, 1.5, 0.5, 0.5,
-4.032513, -2, -7.157245, 0, 1.5, 0.5, 0.5,
-4.032513, 0, -7.157245, 0, -0.5, 0.5, 0.5,
-4.032513, 0, -7.157245, 1, -0.5, 0.5, 0.5,
-4.032513, 0, -7.157245, 1, 1.5, 0.5, 0.5,
-4.032513, 0, -7.157245, 0, 1.5, 0.5, 0.5,
-4.032513, 2, -7.157245, 0, -0.5, 0.5, 0.5,
-4.032513, 2, -7.157245, 1, -0.5, 0.5, 0.5,
-4.032513, 2, -7.157245, 1, 1.5, 0.5, 0.5,
-4.032513, 2, -7.157245, 0, 1.5, 0.5, 0.5,
-4.032513, 4, -7.157245, 0, -0.5, 0.5, 0.5,
-4.032513, 4, -7.157245, 1, -0.5, 0.5, 0.5,
-4.032513, 4, -7.157245, 1, 1.5, 0.5, 0.5,
-4.032513, 4, -7.157245, 0, 1.5, 0.5, 0.5
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
-3.527698, -3.125028, -6,
-3.527698, -3.125028, 4,
-3.527698, -3.125028, -6,
-3.69597, -3.314421, -6,
-3.527698, -3.125028, -4,
-3.69597, -3.314421, -4,
-3.527698, -3.125028, -2,
-3.69597, -3.314421, -2,
-3.527698, -3.125028, 0,
-3.69597, -3.314421, 0,
-3.527698, -3.125028, 2,
-3.69597, -3.314421, 2,
-3.527698, -3.125028, 4,
-3.69597, -3.314421, 4
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
"-6",
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
-4.032513, -3.693206, -6, 0, -0.5, 0.5, 0.5,
-4.032513, -3.693206, -6, 1, -0.5, 0.5, 0.5,
-4.032513, -3.693206, -6, 1, 1.5, 0.5, 0.5,
-4.032513, -3.693206, -6, 0, 1.5, 0.5, 0.5,
-4.032513, -3.693206, -4, 0, -0.5, 0.5, 0.5,
-4.032513, -3.693206, -4, 1, -0.5, 0.5, 0.5,
-4.032513, -3.693206, -4, 1, 1.5, 0.5, 0.5,
-4.032513, -3.693206, -4, 0, 1.5, 0.5, 0.5,
-4.032513, -3.693206, -2, 0, -0.5, 0.5, 0.5,
-4.032513, -3.693206, -2, 1, -0.5, 0.5, 0.5,
-4.032513, -3.693206, -2, 1, 1.5, 0.5, 0.5,
-4.032513, -3.693206, -2, 0, 1.5, 0.5, 0.5,
-4.032513, -3.693206, 0, 0, -0.5, 0.5, 0.5,
-4.032513, -3.693206, 0, 1, -0.5, 0.5, 0.5,
-4.032513, -3.693206, 0, 1, 1.5, 0.5, 0.5,
-4.032513, -3.693206, 0, 0, 1.5, 0.5, 0.5,
-4.032513, -3.693206, 2, 0, -0.5, 0.5, 0.5,
-4.032513, -3.693206, 2, 1, -0.5, 0.5, 0.5,
-4.032513, -3.693206, 2, 1, 1.5, 0.5, 0.5,
-4.032513, -3.693206, 2, 0, 1.5, 0.5, 0.5,
-4.032513, -3.693206, 4, 0, -0.5, 0.5, 0.5,
-4.032513, -3.693206, 4, 1, -0.5, 0.5, 0.5,
-4.032513, -3.693206, 4, 1, 1.5, 0.5, 0.5,
-4.032513, -3.693206, 4, 0, 1.5, 0.5, 0.5
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
-3.527698, -3.125028, -6.227458,
-3.527698, 4.450675, -6.227458,
-3.527698, -3.125028, 6.169697,
-3.527698, 4.450675, 6.169697,
-3.527698, -3.125028, -6.227458,
-3.527698, -3.125028, 6.169697,
-3.527698, 4.450675, -6.227458,
-3.527698, 4.450675, 6.169697,
-3.527698, -3.125028, -6.227458,
3.203168, -3.125028, -6.227458,
-3.527698, -3.125028, 6.169697,
3.203168, -3.125028, 6.169697,
-3.527698, 4.450675, -6.227458,
3.203168, 4.450675, -6.227458,
-3.527698, 4.450675, 6.169697,
3.203168, 4.450675, 6.169697,
3.203168, -3.125028, -6.227458,
3.203168, 4.450675, -6.227458,
3.203168, -3.125028, 6.169697,
3.203168, 4.450675, 6.169697,
3.203168, -3.125028, -6.227458,
3.203168, -3.125028, 6.169697,
3.203168, 4.450675, -6.227458,
3.203168, 4.450675, 6.169697
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
var radius = 8.550117;
var distance = 38.04043;
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
mvMatrix.translate( 0.1622651, -0.6628237, 0.0288806 );
mvMatrix.scale( 1.373457, 1.22029, 0.7456995 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -38.04043);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
vernolate<-read.table("vernolate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-vernolate$V2
```

```
## Error in eval(expr, envir, enclos): object 'vernolate' not found
```

```r
y<-vernolate$V3
```

```
## Error in eval(expr, envir, enclos): object 'vernolate' not found
```

```r
z<-vernolate$V4
```

```
## Error in eval(expr, envir, enclos): object 'vernolate' not found
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
-3.429676, -0.3576462, -1.144244, 0, 0, 1, 1, 1,
-3.360095, -0.03390089, 0.4339761, 1, 0, 0, 1, 1,
-3.344029, -0.1789279, -0.7405941, 1, 0, 0, 1, 1,
-3.277976, -0.3573907, -2.167215, 1, 0, 0, 1, 1,
-2.814668, 0.9672831, -1.77233, 1, 0, 0, 1, 1,
-2.662019, -1.281107, -1.255792, 1, 0, 0, 1, 1,
-2.629417, -0.7557783, -2.680956, 0, 0, 0, 1, 1,
-2.571244, 2.091197, 0.08269105, 0, 0, 0, 1, 1,
-2.471358, 0.9473634, -0.7842597, 0, 0, 0, 1, 1,
-2.398502, -1.217938, -1.673598, 0, 0, 0, 1, 1,
-2.261882, 0.8793685, -0.7440939, 0, 0, 0, 1, 1,
-2.249902, -0.3201409, -1.901383, 0, 0, 0, 1, 1,
-2.203197, 1.099677, -0.2573417, 0, 0, 0, 1, 1,
-2.177233, -1.186469, -1.382647, 1, 1, 1, 1, 1,
-2.15433, -0.07027524, -2.553391, 1, 1, 1, 1, 1,
-2.150281, 0.8502807, -1.350051, 1, 1, 1, 1, 1,
-2.126932, -0.6680996, -2.209258, 1, 1, 1, 1, 1,
-2.074951, -0.2883189, 0.4813061, 1, 1, 1, 1, 1,
-2.073147, -0.03094671, -2.480751, 1, 1, 1, 1, 1,
-2.015603, 0.4377257, -0.8208111, 1, 1, 1, 1, 1,
-2.000349, 0.7406714, -1.151553, 1, 1, 1, 1, 1,
-1.95979, 1.539606, -1.50042, 1, 1, 1, 1, 1,
-1.955301, 0.6656749, -1.0471, 1, 1, 1, 1, 1,
-1.904361, 0.6217818, -3.920648, 1, 1, 1, 1, 1,
-1.886172, 0.1859616, -1.030577, 1, 1, 1, 1, 1,
-1.882326, -0.1107663, -1.223718, 1, 1, 1, 1, 1,
-1.855411, 0.2749537, -0.7750725, 1, 1, 1, 1, 1,
-1.851427, -0.5599656, -1.749283, 1, 1, 1, 1, 1,
-1.832782, -1.145925, -0.7637983, 0, 0, 1, 1, 1,
-1.829213, -0.003524917, -2.806708, 1, 0, 0, 1, 1,
-1.805989, -0.196897, -0.3691483, 1, 0, 0, 1, 1,
-1.800897, -0.7137414, -2.063354, 1, 0, 0, 1, 1,
-1.79189, 0.5487006, -0.534559, 1, 0, 0, 1, 1,
-1.78615, -0.6214624, -3.939581, 1, 0, 0, 1, 1,
-1.786021, -1.092013, -0.1342087, 0, 0, 0, 1, 1,
-1.777778, 1.423233, -2.365974, 0, 0, 0, 1, 1,
-1.776347, 0.4579094, -1.683065, 0, 0, 0, 1, 1,
-1.77629, -1.7328, -1.957567, 0, 0, 0, 1, 1,
-1.771371, -1.372008, -3.4814, 0, 0, 0, 1, 1,
-1.771049, -0.07721753, -0.8794984, 0, 0, 0, 1, 1,
-1.762998, -0.203954, -1.76261, 0, 0, 0, 1, 1,
-1.748633, 0.9810635, -1.524979, 1, 1, 1, 1, 1,
-1.73739, -0.569882, -0.5998031, 1, 1, 1, 1, 1,
-1.721855, 2.503104, -1.333704, 1, 1, 1, 1, 1,
-1.721325, 0.4160416, -2.166606, 1, 1, 1, 1, 1,
-1.702949, 0.7637267, -0.5787252, 1, 1, 1, 1, 1,
-1.668211, 2.192962, -1.078074, 1, 1, 1, 1, 1,
-1.667544, -0.6473936, -2.594343, 1, 1, 1, 1, 1,
-1.665266, 1.517728, -1.291309, 1, 1, 1, 1, 1,
-1.65414, 2.835235, -0.800741, 1, 1, 1, 1, 1,
-1.613201, 0.9891558, -1.628854, 1, 1, 1, 1, 1,
-1.604059, 0.5862409, -2.328996, 1, 1, 1, 1, 1,
-1.588629, 0.6886448, -2.484518, 1, 1, 1, 1, 1,
-1.57503, -0.2512466, -1.716105, 1, 1, 1, 1, 1,
-1.563034, 4.34035, -0.3774542, 1, 1, 1, 1, 1,
-1.551355, -1.588384, -2.409992, 1, 1, 1, 1, 1,
-1.548259, -0.6244451, -2.272439, 0, 0, 1, 1, 1,
-1.530741, -1.999825, -2.484158, 1, 0, 0, 1, 1,
-1.525861, 1.673394, -0.3779632, 1, 0, 0, 1, 1,
-1.512802, 2.130911, -2.023921, 1, 0, 0, 1, 1,
-1.498407, -0.07035741, -3.159616, 1, 0, 0, 1, 1,
-1.489491, -0.9636353, -2.200565, 1, 0, 0, 1, 1,
-1.487669, 0.4753497, -2.269285, 0, 0, 0, 1, 1,
-1.479778, -0.4650679, -1.517193, 0, 0, 0, 1, 1,
-1.473266, 1.82858, -1.962933, 0, 0, 0, 1, 1,
-1.451563, 0.8183843, -0.5310929, 0, 0, 0, 1, 1,
-1.439072, -0.8441733, -2.067425, 0, 0, 0, 1, 1,
-1.434487, 2.110109, -2.084718, 0, 0, 0, 1, 1,
-1.422821, 0.1974914, -2.164813, 0, 0, 0, 1, 1,
-1.411602, 1.340584, -0.48455, 1, 1, 1, 1, 1,
-1.408644, 0.176534, -1.59205, 1, 1, 1, 1, 1,
-1.406857, -0.5029531, -3.05857, 1, 1, 1, 1, 1,
-1.40292, -0.3028619, -0.9269854, 1, 1, 1, 1, 1,
-1.394271, -0.8425205, -2.556592, 1, 1, 1, 1, 1,
-1.392918, -0.1437644, -2.813057, 1, 1, 1, 1, 1,
-1.392409, 1.406099, -1.43624, 1, 1, 1, 1, 1,
-1.378414, -0.8068149, -1.528258, 1, 1, 1, 1, 1,
-1.378027, 0.5969229, -1.714967, 1, 1, 1, 1, 1,
-1.363904, 0.2721813, -2.196171, 1, 1, 1, 1, 1,
-1.349985, 0.7363342, -2.072655, 1, 1, 1, 1, 1,
-1.343165, -1.551454, -1.38246, 1, 1, 1, 1, 1,
-1.338253, -0.5684784, -1.057885, 1, 1, 1, 1, 1,
-1.335718, 0.02410842, -2.884714, 1, 1, 1, 1, 1,
-1.327116, 0.9652849, -1.570255, 1, 1, 1, 1, 1,
-1.325544, -0.9548417, -1.363088, 0, 0, 1, 1, 1,
-1.325326, -0.4369196, -2.036275, 1, 0, 0, 1, 1,
-1.319259, -1.14553, -1.709128, 1, 0, 0, 1, 1,
-1.313611, -0.7344449, -2.499021, 1, 0, 0, 1, 1,
-1.30407, 1.660854, -0.8581543, 1, 0, 0, 1, 1,
-1.301619, -0.1761449, -0.07935067, 1, 0, 0, 1, 1,
-1.292859, 0.2333634, -0.5813459, 0, 0, 0, 1, 1,
-1.283293, -0.1444948, -1.595215, 0, 0, 0, 1, 1,
-1.279478, 0.8601437, -4.010302, 0, 0, 0, 1, 1,
-1.276589, 0.3397675, -1.673659, 0, 0, 0, 1, 1,
-1.27509, 2.438698, -1.224847, 0, 0, 0, 1, 1,
-1.270959, -0.6796578, -2.936905, 0, 0, 0, 1, 1,
-1.262268, 0.8288205, -2.602708, 0, 0, 0, 1, 1,
-1.262262, -1.423041, -3.0646, 1, 1, 1, 1, 1,
-1.256451, 0.6410556, -0.0004490663, 1, 1, 1, 1, 1,
-1.256116, -1.976708, -3.904087, 1, 1, 1, 1, 1,
-1.255227, 0.4220859, -1.15875, 1, 1, 1, 1, 1,
-1.245471, -0.08551624, -2.172201, 1, 1, 1, 1, 1,
-1.244009, 0.6124097, -3.379142, 1, 1, 1, 1, 1,
-1.243397, -0.8911574, -3.321934, 1, 1, 1, 1, 1,
-1.235834, -2.529972, -0.3842892, 1, 1, 1, 1, 1,
-1.233063, -1.539625, -3.004091, 1, 1, 1, 1, 1,
-1.230703, -1.878221, -2.954378, 1, 1, 1, 1, 1,
-1.224186, -1.40992, -4.232032, 1, 1, 1, 1, 1,
-1.21644, 0.2834533, -0.8387218, 1, 1, 1, 1, 1,
-1.213705, -0.6428156, -2.144377, 1, 1, 1, 1, 1,
-1.209926, 0.3777011, -1.489868, 1, 1, 1, 1, 1,
-1.209811, 0.06524134, -0.954917, 1, 1, 1, 1, 1,
-1.203597, 0.9004082, -0.7135867, 0, 0, 1, 1, 1,
-1.200032, -0.4217624, -2.881176, 1, 0, 0, 1, 1,
-1.19013, -1.468252, -1.015575, 1, 0, 0, 1, 1,
-1.185118, -0.9275837, -1.949817, 1, 0, 0, 1, 1,
-1.183384, -0.2313567, -1.724161, 1, 0, 0, 1, 1,
-1.17699, -0.2536669, -1.648605, 1, 0, 0, 1, 1,
-1.17086, 0.8302026, -1.536798, 0, 0, 0, 1, 1,
-1.17029, -0.1384701, -1.758004, 0, 0, 0, 1, 1,
-1.167969, 0.9053919, -1.946935, 0, 0, 0, 1, 1,
-1.163978, 1.421208, -0.439709, 0, 0, 0, 1, 1,
-1.163858, -0.2714693, -1.696193, 0, 0, 0, 1, 1,
-1.156059, -0.6858194, -3.248134, 0, 0, 0, 1, 1,
-1.151469, 0.5576536, 0.2270888, 0, 0, 0, 1, 1,
-1.147665, 0.9916432, 0.3751685, 1, 1, 1, 1, 1,
-1.138205, 0.3045243, -1.423812, 1, 1, 1, 1, 1,
-1.137963, 1.898242, -0.2705313, 1, 1, 1, 1, 1,
-1.132573, -0.8317798, -4.421019, 1, 1, 1, 1, 1,
-1.129387, -0.2282904, -3.09735, 1, 1, 1, 1, 1,
-1.128093, -0.239245, -1.583167, 1, 1, 1, 1, 1,
-1.125226, -0.03911112, -2.388412, 1, 1, 1, 1, 1,
-1.114209, -0.6887861, -1.432797, 1, 1, 1, 1, 1,
-1.111731, -0.1934242, -0.6848989, 1, 1, 1, 1, 1,
-1.105258, 1.645227, -0.2545237, 1, 1, 1, 1, 1,
-1.102878, 0.9328361, -0.6892169, 1, 1, 1, 1, 1,
-1.098776, -0.5294364, -1.094573, 1, 1, 1, 1, 1,
-1.094718, 0.1609615, -0.9005972, 1, 1, 1, 1, 1,
-1.092024, 0.7636756, -1.063423, 1, 1, 1, 1, 1,
-1.088056, 2.101836, -1.31908, 1, 1, 1, 1, 1,
-1.083003, 0.1438354, -1.205005, 0, 0, 1, 1, 1,
-1.081024, -2.039241, -2.375488, 1, 0, 0, 1, 1,
-1.075902, -1.430312, -0.8040836, 1, 0, 0, 1, 1,
-1.074075, 0.7211791, -3.622521, 1, 0, 0, 1, 1,
-1.063866, 0.3193811, -0.8940348, 1, 0, 0, 1, 1,
-1.060372, -0.5910538, -1.809947, 1, 0, 0, 1, 1,
-1.057418, -0.5150188, -2.656568, 0, 0, 0, 1, 1,
-1.055643, -1.378081, -3.64701, 0, 0, 0, 1, 1,
-1.051128, 2.655484, -0.908964, 0, 0, 0, 1, 1,
-1.049539, -0.6616336, -1.682686, 0, 0, 0, 1, 1,
-1.039012, -1.232336, -1.233596, 0, 0, 0, 1, 1,
-1.028935, 0.4699067, -3.171423, 0, 0, 0, 1, 1,
-1.021781, 0.2193318, -0.02178406, 0, 0, 0, 1, 1,
-1.010747, 1.230545, 0.7153221, 1, 1, 1, 1, 1,
-1.008299, 0.4290617, -2.300972, 1, 1, 1, 1, 1,
-1.007596, 0.9019657, -0.9920459, 1, 1, 1, 1, 1,
-1.004961, 0.02869227, -0.07739105, 1, 1, 1, 1, 1,
-1.004838, 1.355053, -0.7882612, 1, 1, 1, 1, 1,
-1.004534, 0.9592848, -1.355397, 1, 1, 1, 1, 1,
-1.001479, -1.773878, -2.954769, 1, 1, 1, 1, 1,
-0.9915267, -2.419094, -2.874077, 1, 1, 1, 1, 1,
-0.9899643, 0.2204763, -0.6839543, 1, 1, 1, 1, 1,
-0.977529, 0.3858145, 0.1307124, 1, 1, 1, 1, 1,
-0.9759227, -0.25841, -0.5527751, 1, 1, 1, 1, 1,
-0.973828, -0.9973131, -3.100761, 1, 1, 1, 1, 1,
-0.97278, -0.2598463, -1.525241, 1, 1, 1, 1, 1,
-0.9727448, 1.295177, -0.5484026, 1, 1, 1, 1, 1,
-0.9717565, 0.3670042, -1.689099, 1, 1, 1, 1, 1,
-0.970694, -2.801911, -4.193632, 0, 0, 1, 1, 1,
-0.969775, 1.140989, -1.714424, 1, 0, 0, 1, 1,
-0.9691948, -0.2554018, -2.854666, 1, 0, 0, 1, 1,
-0.9651401, 0.3938826, -0.4589665, 1, 0, 0, 1, 1,
-0.9596046, -0.2951438, -2.338612, 1, 0, 0, 1, 1,
-0.9541181, -0.4918246, -0.8025861, 1, 0, 0, 1, 1,
-0.9539664, 1.396549, -0.5043503, 0, 0, 0, 1, 1,
-0.9512589, 1.92991, -1.204281, 0, 0, 0, 1, 1,
-0.9430262, 0.2052551, -2.36668, 0, 0, 0, 1, 1,
-0.942623, -1.140379, -2.871387, 0, 0, 0, 1, 1,
-0.9404377, 2.934992, -0.008719716, 0, 0, 0, 1, 1,
-0.9394652, 0.3079123, -1.702661, 0, 0, 0, 1, 1,
-0.9357135, 1.286885, 0.01531229, 0, 0, 0, 1, 1,
-0.9301643, 0.1402301, -1.917843, 1, 1, 1, 1, 1,
-0.9296716, 0.7793151, -0.8036065, 1, 1, 1, 1, 1,
-0.9225207, 0.1113549, -2.349986, 1, 1, 1, 1, 1,
-0.9124592, 0.447246, -1.021261, 1, 1, 1, 1, 1,
-0.9110713, 0.7354733, -1.584204, 1, 1, 1, 1, 1,
-0.9091306, 0.9980922, -1.554427, 1, 1, 1, 1, 1,
-0.9068711, 1.356684, 1.51002, 1, 1, 1, 1, 1,
-0.905704, 0.03124917, -1.712286, 1, 1, 1, 1, 1,
-0.9015644, 1.387891, -1.943589, 1, 1, 1, 1, 1,
-0.8989801, 0.3552576, -2.718564, 1, 1, 1, 1, 1,
-0.8950362, -1.374899, -2.694779, 1, 1, 1, 1, 1,
-0.893049, 0.5441831, -1.944477, 1, 1, 1, 1, 1,
-0.8917697, 0.2027142, -0.6294853, 1, 1, 1, 1, 1,
-0.8820947, 0.897856, -1.253262, 1, 1, 1, 1, 1,
-0.8694016, -0.68465, -1.705142, 1, 1, 1, 1, 1,
-0.8683054, 0.4714731, -1.739227, 0, 0, 1, 1, 1,
-0.867135, 0.842584, -1.356994, 1, 0, 0, 1, 1,
-0.8635764, 0.300852, -1.207129, 1, 0, 0, 1, 1,
-0.8616276, 0.6646405, -1.340395, 1, 0, 0, 1, 1,
-0.8572096, -0.4743515, -2.740222, 1, 0, 0, 1, 1,
-0.852038, -1.340734, -2.344189, 1, 0, 0, 1, 1,
-0.8510337, 1.067107, -0.3500164, 0, 0, 0, 1, 1,
-0.8483884, 0.2363926, -3.37906, 0, 0, 0, 1, 1,
-0.8482523, 0.8383794, 0.4426868, 0, 0, 0, 1, 1,
-0.8482084, -0.7562693, -1.771303, 0, 0, 0, 1, 1,
-0.8454348, 0.4869432, 0.04676369, 0, 0, 0, 1, 1,
-0.8416444, -0.01109244, -2.047902, 0, 0, 0, 1, 1,
-0.8358763, 0.1839445, -0.978462, 0, 0, 0, 1, 1,
-0.8311945, 0.2564093, -0.6925629, 1, 1, 1, 1, 1,
-0.8279989, 0.04520083, -1.581826, 1, 1, 1, 1, 1,
-0.8250402, 1.04142, -1.539794, 1, 1, 1, 1, 1,
-0.8225849, -0.9171121, -2.353757, 1, 1, 1, 1, 1,
-0.8220112, -1.260813, -2.785578, 1, 1, 1, 1, 1,
-0.8157886, -0.4010748, -0.2087674, 1, 1, 1, 1, 1,
-0.8156999, -0.7627887, -3.036777, 1, 1, 1, 1, 1,
-0.8145905, 0.503309, -0.3368602, 1, 1, 1, 1, 1,
-0.8101985, 1.402541, -0.5879474, 1, 1, 1, 1, 1,
-0.8101228, 0.9531415, -1.130803, 1, 1, 1, 1, 1,
-0.8080607, 0.8149636, -1.939689, 1, 1, 1, 1, 1,
-0.795279, -2.247464, -3.061198, 1, 1, 1, 1, 1,
-0.7940454, 1.561082, -0.3786609, 1, 1, 1, 1, 1,
-0.7925723, -0.198524, -1.472807, 1, 1, 1, 1, 1,
-0.7897416, 0.1755452, -3.154807, 1, 1, 1, 1, 1,
-0.7886822, -1.67766, -2.468018, 0, 0, 1, 1, 1,
-0.7857142, -0.4630395, -0.9360657, 1, 0, 0, 1, 1,
-0.7768304, 1.272389, -2.574756, 1, 0, 0, 1, 1,
-0.7716019, -0.9859149, -5.014536, 1, 0, 0, 1, 1,
-0.7605622, 1.820553, -2.509722, 1, 0, 0, 1, 1,
-0.7553521, -1.305748, -2.740335, 1, 0, 0, 1, 1,
-0.7538846, 0.08757578, -0.520988, 0, 0, 0, 1, 1,
-0.7501759, -0.7526566, -2.338968, 0, 0, 0, 1, 1,
-0.7494271, -0.4794191, -1.453061, 0, 0, 0, 1, 1,
-0.743318, 0.06822095, 0.7371829, 0, 0, 0, 1, 1,
-0.7423993, -0.459506, -2.460528, 0, 0, 0, 1, 1,
-0.7398255, -0.1030504, -2.312441, 0, 0, 0, 1, 1,
-0.7283826, -0.1415374, -1.97655, 0, 0, 0, 1, 1,
-0.7275833, 2.016232, 0.7742793, 1, 1, 1, 1, 1,
-0.7275435, -1.110981, -2.634784, 1, 1, 1, 1, 1,
-0.716523, 0.4312453, -1.863227, 1, 1, 1, 1, 1,
-0.7152014, 1.308018, 0.4162291, 1, 1, 1, 1, 1,
-0.7113256, 0.2536309, -1.122843, 1, 1, 1, 1, 1,
-0.71085, -1.34595, -0.8730445, 1, 1, 1, 1, 1,
-0.7102176, 0.4356853, -2.230189, 1, 1, 1, 1, 1,
-0.7090124, 1.734808, -0.3099064, 1, 1, 1, 1, 1,
-0.7028539, -1.722667, -1.614273, 1, 1, 1, 1, 1,
-0.6964222, 0.4523871, 0.3309601, 1, 1, 1, 1, 1,
-0.6910521, 0.2897527, -1.227929, 1, 1, 1, 1, 1,
-0.6900281, -0.1821017, -3.11612, 1, 1, 1, 1, 1,
-0.6894522, -0.1324947, -2.293682, 1, 1, 1, 1, 1,
-0.6790735, -0.1793031, -2.299031, 1, 1, 1, 1, 1,
-0.675145, -1.679179, -2.635409, 1, 1, 1, 1, 1,
-0.6571016, 0.3602143, -1.788149, 0, 0, 1, 1, 1,
-0.6535439, -0.1251349, -0.3427036, 1, 0, 0, 1, 1,
-0.6525356, -0.2972575, -2.760268, 1, 0, 0, 1, 1,
-0.6501291, 0.1907935, -1.740407, 1, 0, 0, 1, 1,
-0.6305963, -0.04161482, -2.941742, 1, 0, 0, 1, 1,
-0.6178198, -0.2379812, -1.95188, 1, 0, 0, 1, 1,
-0.6174024, -0.7444559, -3.933211, 0, 0, 0, 1, 1,
-0.6159016, -0.8664458, -3.364954, 0, 0, 0, 1, 1,
-0.615501, -1.534965, -1.890999, 0, 0, 0, 1, 1,
-0.6053311, 1.69619, 0.3864326, 0, 0, 0, 1, 1,
-0.5996303, -0.961557, -2.421087, 0, 0, 0, 1, 1,
-0.5954512, 0.6922455, -1.00155, 0, 0, 0, 1, 1,
-0.5929083, 1.069967, 1.305852, 0, 0, 0, 1, 1,
-0.5897782, -0.3892153, -2.301898, 1, 1, 1, 1, 1,
-0.5894946, -0.05531889, -2.344773, 1, 1, 1, 1, 1,
-0.5887554, 0.176449, -0.8872539, 1, 1, 1, 1, 1,
-0.5813732, -0.2217583, -3.433758, 1, 1, 1, 1, 1,
-0.5806572, -0.144467, -2.263319, 1, 1, 1, 1, 1,
-0.5790067, -1.300394, -2.988034, 1, 1, 1, 1, 1,
-0.5761244, 1.117761, 1.035266, 1, 1, 1, 1, 1,
-0.5747382, -0.2672282, -2.528431, 1, 1, 1, 1, 1,
-0.5632882, 0.9519414, 0.2809336, 1, 1, 1, 1, 1,
-0.5632834, 2.220316, -1.779745, 1, 1, 1, 1, 1,
-0.5612207, -0.8624913, -3.495708, 1, 1, 1, 1, 1,
-0.5611836, -1.134822, -2.163583, 1, 1, 1, 1, 1,
-0.5607246, -2.284688, -2.774248, 1, 1, 1, 1, 1,
-0.5592695, -0.01558896, -1.768155, 1, 1, 1, 1, 1,
-0.5588823, 0.2239533, -0.4304549, 1, 1, 1, 1, 1,
-0.5562429, -0.2303198, -3.693505, 0, 0, 1, 1, 1,
-0.5541654, 0.6891851, 0.7396818, 1, 0, 0, 1, 1,
-0.5536063, 0.4697418, -0.2148207, 1, 0, 0, 1, 1,
-0.5432223, -0.6386036, -1.388967, 1, 0, 0, 1, 1,
-0.5404165, 1.164443, -2.532964, 1, 0, 0, 1, 1,
-0.5397999, 0.7337484, 0.2371062, 1, 0, 0, 1, 1,
-0.5396917, 1.837882, 0.7510136, 0, 0, 0, 1, 1,
-0.5390124, 0.4428937, 1.327147, 0, 0, 0, 1, 1,
-0.5367497, 0.1883387, -0.3504682, 0, 0, 0, 1, 1,
-0.536048, 0.8031607, -1.333334, 0, 0, 0, 1, 1,
-0.5349381, -0.9333114, -4.190692, 0, 0, 0, 1, 1,
-0.5321824, 0.669457, -1.112102, 0, 0, 0, 1, 1,
-0.5292729, 0.2307788, -2.565623, 0, 0, 0, 1, 1,
-0.5290719, 0.4389747, -0.8305542, 1, 1, 1, 1, 1,
-0.5281764, -2.108355, -3.242167, 1, 1, 1, 1, 1,
-0.5221883, 1.878358, -0.9562156, 1, 1, 1, 1, 1,
-0.5156321, 0.1741538, -0.4763569, 1, 1, 1, 1, 1,
-0.5155796, 1.625317, -0.0989925, 1, 1, 1, 1, 1,
-0.5097237, 0.9499589, 1.463819, 1, 1, 1, 1, 1,
-0.509688, -0.2108504, -2.51032, 1, 1, 1, 1, 1,
-0.5081578, -0.119214, -1.519391, 1, 1, 1, 1, 1,
-0.5013032, -1.267715, -2.401646, 1, 1, 1, 1, 1,
-0.4987298, 1.868966, -0.0216843, 1, 1, 1, 1, 1,
-0.4971325, 1.794419, 0.9807793, 1, 1, 1, 1, 1,
-0.4875429, 2.572936, 0.005040768, 1, 1, 1, 1, 1,
-0.482953, 0.1835168, -0.8860803, 1, 1, 1, 1, 1,
-0.478288, -0.09780969, 0.3398966, 1, 1, 1, 1, 1,
-0.4763766, 0.06156408, -1.581074, 1, 1, 1, 1, 1,
-0.47561, 0.4766191, -0.3949248, 0, 0, 1, 1, 1,
-0.4752102, 0.2720084, -1.574155, 1, 0, 0, 1, 1,
-0.4730217, 0.7967192, -0.2098505, 1, 0, 0, 1, 1,
-0.4720102, 0.9326681, -1.065351, 1, 0, 0, 1, 1,
-0.469609, -1.11344, -1.73688, 1, 0, 0, 1, 1,
-0.465822, 0.2386924, -0.008825952, 1, 0, 0, 1, 1,
-0.4656878, 1.31225, 1.773095, 0, 0, 0, 1, 1,
-0.4648457, -1.151869, -2.971507, 0, 0, 0, 1, 1,
-0.4635186, -1.867352, -3.978507, 0, 0, 0, 1, 1,
-0.4601149, -1.940968, -1.598888, 0, 0, 0, 1, 1,
-0.4574562, -0.5840933, -3.92556, 0, 0, 0, 1, 1,
-0.4560756, -1.274566, -2.917157, 0, 0, 0, 1, 1,
-0.4503503, -0.7204891, -0.8250475, 0, 0, 0, 1, 1,
-0.4459211, 2.450803, 0.3484274, 1, 1, 1, 1, 1,
-0.4453149, 0.512457, -1.099378, 1, 1, 1, 1, 1,
-0.4431655, 2.02986, 1.617414, 1, 1, 1, 1, 1,
-0.4399673, -0.2328037, -2.848089, 1, 1, 1, 1, 1,
-0.4379009, -0.3305362, -2.499542, 1, 1, 1, 1, 1,
-0.435537, 0.8039897, 0.05300567, 1, 1, 1, 1, 1,
-0.4334352, 0.2957695, 0.02140886, 1, 1, 1, 1, 1,
-0.4328491, 0.580682, -0.7794409, 1, 1, 1, 1, 1,
-0.4323967, 0.4815314, -1.393004, 1, 1, 1, 1, 1,
-0.4264555, -0.300393, -3.465695, 1, 1, 1, 1, 1,
-0.4254669, -1.24683, -1.916406, 1, 1, 1, 1, 1,
-0.4236259, 1.009762, 0.943252, 1, 1, 1, 1, 1,
-0.4167456, -0.2184003, -3.846523, 1, 1, 1, 1, 1,
-0.416069, -0.2576132, -3.259882, 1, 1, 1, 1, 1,
-0.4157674, -0.05931842, 0.3142576, 1, 1, 1, 1, 1,
-0.4141479, 1.118898, -0.3515213, 0, 0, 1, 1, 1,
-0.4132574, -1.236295, -2.852633, 1, 0, 0, 1, 1,
-0.4128584, 1.121543, -0.1749882, 1, 0, 0, 1, 1,
-0.4085505, -0.7203184, -1.100395, 1, 0, 0, 1, 1,
-0.4064246, 0.6895596, -0.7926981, 1, 0, 0, 1, 1,
-0.3985239, -0.5162985, -3.142837, 1, 0, 0, 1, 1,
-0.3984562, 0.5971655, -1.508455, 0, 0, 0, 1, 1,
-0.3964877, -0.1043235, -4.024598, 0, 0, 0, 1, 1,
-0.3946629, -0.5812007, -4.162675, 0, 0, 0, 1, 1,
-0.3927697, -0.1784588, -1.082608, 0, 0, 0, 1, 1,
-0.392278, -0.3669999, -1.088389, 0, 0, 0, 1, 1,
-0.3918535, 0.08227011, -2.693256, 0, 0, 0, 1, 1,
-0.387434, -0.3074792, -3.779497, 0, 0, 0, 1, 1,
-0.3830797, -0.5939001, -3.467699, 1, 1, 1, 1, 1,
-0.3816768, -2.220137, -4.026209, 1, 1, 1, 1, 1,
-0.3772947, 0.5758648, -0.9906049, 1, 1, 1, 1, 1,
-0.3748477, -0.118395, -1.569655, 1, 1, 1, 1, 1,
-0.3737184, 0.4149865, 1.480414, 1, 1, 1, 1, 1,
-0.3728758, -2.13202, -3.244548, 1, 1, 1, 1, 1,
-0.3726044, -1.000846, -4.537447, 1, 1, 1, 1, 1,
-0.371172, 0.1824518, 1.044623, 1, 1, 1, 1, 1,
-0.3704193, -0.9314532, -2.509199, 1, 1, 1, 1, 1,
-0.363753, 1.067072, -0.6530983, 1, 1, 1, 1, 1,
-0.3620853, -0.8113175, -1.423618, 1, 1, 1, 1, 1,
-0.3615763, 0.8001738, 1.111048, 1, 1, 1, 1, 1,
-0.3594645, 1.03622, 0.3316188, 1, 1, 1, 1, 1,
-0.359098, 0.9292896, 0.5251947, 1, 1, 1, 1, 1,
-0.3583199, 0.9084228, -0.1952402, 1, 1, 1, 1, 1,
-0.3563593, 0.05532568, -2.191189, 0, 0, 1, 1, 1,
-0.3555411, -0.866223, -4.091143, 1, 0, 0, 1, 1,
-0.3541186, 2.154385, 1.283212, 1, 0, 0, 1, 1,
-0.3458742, 0.7554108, 0.5578468, 1, 0, 0, 1, 1,
-0.3451399, -0.6317503, -3.725687, 1, 0, 0, 1, 1,
-0.343585, -0.5973853, -1.953175, 1, 0, 0, 1, 1,
-0.3433343, -1.415071, -2.225657, 0, 0, 0, 1, 1,
-0.3391165, 0.4323355, -1.114226, 0, 0, 0, 1, 1,
-0.3370704, -0.07294809, -2.114795, 0, 0, 0, 1, 1,
-0.3334154, -1.088221, -2.378404, 0, 0, 0, 1, 1,
-0.3286469, 2.564204, -0.3057037, 0, 0, 0, 1, 1,
-0.3286113, -0.2606656, -1.626829, 0, 0, 0, 1, 1,
-0.3269256, -1.116371, -2.331945, 0, 0, 0, 1, 1,
-0.3264079, -0.2233113, -0.7583591, 1, 1, 1, 1, 1,
-0.3260951, -0.1674137, -2.121214, 1, 1, 1, 1, 1,
-0.3249493, 0.2853957, -0.8007777, 1, 1, 1, 1, 1,
-0.3244625, -0.8136424, -3.255124, 1, 1, 1, 1, 1,
-0.3222535, 1.454129, -0.4516552, 1, 1, 1, 1, 1,
-0.319464, 1.027865, -0.8581901, 1, 1, 1, 1, 1,
-0.3186439, -0.2912966, -2.130095, 1, 1, 1, 1, 1,
-0.3168006, 2.140678, 0.7811263, 1, 1, 1, 1, 1,
-0.3157328, -0.1380364, 0.02351169, 1, 1, 1, 1, 1,
-0.3108132, -0.80339, -2.572254, 1, 1, 1, 1, 1,
-0.3107828, 0.03924023, -2.578654, 1, 1, 1, 1, 1,
-0.3105888, 1.231662, -1.348061, 1, 1, 1, 1, 1,
-0.3087237, -0.6398416, -1.234182, 1, 1, 1, 1, 1,
-0.3071633, 0.1180525, -1.032998, 1, 1, 1, 1, 1,
-0.2897249, 0.7920028, -2.246668, 1, 1, 1, 1, 1,
-0.2867226, -1.156727, -1.757052, 0, 0, 1, 1, 1,
-0.2854557, 0.08104645, -1.637954, 1, 0, 0, 1, 1,
-0.284552, 0.6329779, -1.302073, 1, 0, 0, 1, 1,
-0.2833944, -0.6903082, -3.424786, 1, 0, 0, 1, 1,
-0.2815124, -0.9831955, -3.016608, 1, 0, 0, 1, 1,
-0.2722195, -0.7950866, -1.651888, 1, 0, 0, 1, 1,
-0.2706102, -1.421506, -3.012011, 0, 0, 0, 1, 1,
-0.2680349, 1.386597, -1.265649, 0, 0, 0, 1, 1,
-0.2607625, 0.233675, -1.148291, 0, 0, 0, 1, 1,
-0.2556721, 1.022513, 1.395607, 0, 0, 0, 1, 1,
-0.2500084, -0.9981802, -2.546725, 0, 0, 0, 1, 1,
-0.2482634, 1.477673, -0.04540325, 0, 0, 0, 1, 1,
-0.2480798, -0.1780987, -0.69294, 0, 0, 0, 1, 1,
-0.2434294, -1.475886, -3.369019, 1, 1, 1, 1, 1,
-0.2321229, 0.5937284, 0.1394375, 1, 1, 1, 1, 1,
-0.229918, -0.3392249, -2.847284, 1, 1, 1, 1, 1,
-0.2273118, -0.1161745, -2.264878, 1, 1, 1, 1, 1,
-0.2265275, 1.817501, 0.3271701, 1, 1, 1, 1, 1,
-0.2249542, 0.4754322, -0.1333753, 1, 1, 1, 1, 1,
-0.2235664, -0.369414, -3.485085, 1, 1, 1, 1, 1,
-0.2232579, -0.2613649, -4.525094, 1, 1, 1, 1, 1,
-0.2167365, -0.2784617, -0.8173653, 1, 1, 1, 1, 1,
-0.2167126, -0.9892572, -2.825833, 1, 1, 1, 1, 1,
-0.214672, -1.224965, -2.196006, 1, 1, 1, 1, 1,
-0.2132075, -2.987663, -2.077107, 1, 1, 1, 1, 1,
-0.2106913, 1.396896, -0.1491289, 1, 1, 1, 1, 1,
-0.2087242, 0.4836103, 0.8999762, 1, 1, 1, 1, 1,
-0.2086891, 0.6268668, -0.6966199, 1, 1, 1, 1, 1,
-0.2053636, 0.07846319, -1.511718, 0, 0, 1, 1, 1,
-0.2006266, 0.004998747, -1.928719, 1, 0, 0, 1, 1,
-0.200451, -0.8905519, -3.494236, 1, 0, 0, 1, 1,
-0.1985103, 1.031098, -0.4574057, 1, 0, 0, 1, 1,
-0.1956748, -0.46036, -4.716623, 1, 0, 0, 1, 1,
-0.1934276, 0.5097514, -1.118364, 1, 0, 0, 1, 1,
-0.1932487, 0.8653095, 0.344582, 0, 0, 0, 1, 1,
-0.1919864, -2.417712, -2.341547, 0, 0, 0, 1, 1,
-0.1904576, 0.9234743, 0.7367638, 0, 0, 0, 1, 1,
-0.1883649, 0.6646864, -0.3571356, 0, 0, 0, 1, 1,
-0.1835677, -0.5196518, -3.864544, 0, 0, 0, 1, 1,
-0.1830404, 0.6667962, 0.6703743, 0, 0, 0, 1, 1,
-0.179529, 0.231818, 0.5286016, 0, 0, 0, 1, 1,
-0.176863, -0.2051102, -1.97885, 1, 1, 1, 1, 1,
-0.1761879, -0.5452635, -2.118849, 1, 1, 1, 1, 1,
-0.1748262, 0.6402622, 1.646031, 1, 1, 1, 1, 1,
-0.1741799, 0.4116023, 0.1657246, 1, 1, 1, 1, 1,
-0.1709501, -0.6010082, -2.012671, 1, 1, 1, 1, 1,
-0.1707723, 0.07296658, -2.478376, 1, 1, 1, 1, 1,
-0.1634053, 1.135294, 1.901144, 1, 1, 1, 1, 1,
-0.1617539, 0.3580673, -0.8398982, 1, 1, 1, 1, 1,
-0.157675, 1.833724, -0.09455396, 1, 1, 1, 1, 1,
-0.1512046, 0.39305, -1.933128, 1, 1, 1, 1, 1,
-0.1502501, 1.12896, -3.218276, 1, 1, 1, 1, 1,
-0.1454931, -0.6742055, -2.98903, 1, 1, 1, 1, 1,
-0.1440511, 0.3852798, -0.4888452, 1, 1, 1, 1, 1,
-0.1438897, -0.3964013, -3.469718, 1, 1, 1, 1, 1,
-0.138191, 1.255404, 0.8715368, 1, 1, 1, 1, 1,
-0.1375994, 1.528698, 0.1154162, 0, 0, 1, 1, 1,
-0.1364568, 0.6923222, -0.06474105, 1, 0, 0, 1, 1,
-0.1354238, -0.01938419, -0.2170748, 1, 0, 0, 1, 1,
-0.1307773, 0.7571904, -1.006794, 1, 0, 0, 1, 1,
-0.1254115, -0.654969, -2.78842, 1, 0, 0, 1, 1,
-0.1234387, -0.2295377, -2.332943, 1, 0, 0, 1, 1,
-0.121274, -0.7858585, -3.898044, 0, 0, 0, 1, 1,
-0.1206043, 0.05264268, -0.07167986, 0, 0, 0, 1, 1,
-0.118386, 1.610169, -1.158577, 0, 0, 0, 1, 1,
-0.118283, 0.1181912, -1.007095, 0, 0, 0, 1, 1,
-0.1181738, -0.5466369, -2.333647, 0, 0, 0, 1, 1,
-0.1159901, -0.6959187, -3.650833, 0, 0, 0, 1, 1,
-0.1149512, -0.4240361, -3.221075, 0, 0, 0, 1, 1,
-0.1111254, 0.2439984, -0.5540335, 1, 1, 1, 1, 1,
-0.110796, 0.8044857, 0.8835601, 1, 1, 1, 1, 1,
-0.11071, -0.7068098, -4.920985, 1, 1, 1, 1, 1,
-0.1095567, 2.154111, -2.983722, 1, 1, 1, 1, 1,
-0.1088863, 0.3130614, -1.328166, 1, 1, 1, 1, 1,
-0.1082288, 0.8287082, -0.558823, 1, 1, 1, 1, 1,
-0.106459, 1.662657, -0.3835804, 1, 1, 1, 1, 1,
-0.1036081, -1.276523, -2.659595, 1, 1, 1, 1, 1,
-0.1034029, -0.3226031, -2.191531, 1, 1, 1, 1, 1,
-0.1013559, -1.436267, -1.655437, 1, 1, 1, 1, 1,
-0.09937941, -0.7019087, -3.057538, 1, 1, 1, 1, 1,
-0.09915863, -0.2074962, -1.966689, 1, 1, 1, 1, 1,
-0.09764683, 0.4657934, -1.242302, 1, 1, 1, 1, 1,
-0.09493664, 1.005459, -0.843751, 1, 1, 1, 1, 1,
-0.09173235, -1.374171, -2.896363, 1, 1, 1, 1, 1,
-0.08788864, -0.8104044, -3.482618, 0, 0, 1, 1, 1,
-0.08588918, 1.065118, -0.3941702, 1, 0, 0, 1, 1,
-0.08540757, -1.176591, -3.588768, 1, 0, 0, 1, 1,
-0.08447634, 1.102495, 0.03225484, 1, 0, 0, 1, 1,
-0.08137431, -0.125977, -1.416413, 1, 0, 0, 1, 1,
-0.07922368, -0.8945244, -3.447775, 1, 0, 0, 1, 1,
-0.07915808, 0.8293112, 1.0862, 0, 0, 0, 1, 1,
-0.07867483, -0.1370975, -2.788678, 0, 0, 0, 1, 1,
-0.07758469, -0.4474089, -2.043592, 0, 0, 0, 1, 1,
-0.07407674, -0.2765671, -4.054417, 0, 0, 0, 1, 1,
-0.06872682, -0.7702821, -3.934987, 0, 0, 0, 1, 1,
-0.06828961, -0.1079452, -2.275671, 0, 0, 0, 1, 1,
-0.06671749, -1.292408, -3.654403, 0, 0, 0, 1, 1,
-0.06467978, -1.47558, -4.010995, 1, 1, 1, 1, 1,
-0.06278663, -0.4325174, -3.200343, 1, 1, 1, 1, 1,
-0.06097917, 0.7199566, 0.1449374, 1, 1, 1, 1, 1,
-0.05662445, -0.3571523, -2.268987, 1, 1, 1, 1, 1,
-0.05650318, 0.4738095, 0.3551975, 1, 1, 1, 1, 1,
-0.05631477, 0.8029867, 1.887418, 1, 1, 1, 1, 1,
-0.04954481, -0.5319831, -4.490206, 1, 1, 1, 1, 1,
-0.04948119, 0.5027464, 0.4627929, 1, 1, 1, 1, 1,
-0.04810686, 0.7524594, -0.4352138, 1, 1, 1, 1, 1,
-0.04653684, -0.4391561, -2.732873, 1, 1, 1, 1, 1,
-0.04509942, 1.025383, -0.5235204, 1, 1, 1, 1, 1,
-0.04502832, 0.7514094, 0.7054815, 1, 1, 1, 1, 1,
-0.0426831, -0.07572436, -3.305821, 1, 1, 1, 1, 1,
-0.04089026, -2.051115, -6.046917, 1, 1, 1, 1, 1,
-0.03950589, 1.69771, 1.762026, 1, 1, 1, 1, 1,
-0.03562385, -1.093556, -1.962657, 0, 0, 1, 1, 1,
-0.03560886, -0.9241799, -2.641814, 1, 0, 0, 1, 1,
-0.03552548, -0.6806837, -3.168853, 1, 0, 0, 1, 1,
-0.03414283, 0.1275699, -0.3393297, 1, 0, 0, 1, 1,
-0.03375427, 0.1755269, 0.9588275, 1, 0, 0, 1, 1,
-0.03327453, -0.307269, -3.638938, 1, 0, 0, 1, 1,
-0.03233372, 1.12384, 0.4165339, 0, 0, 0, 1, 1,
-0.0317431, -1.415281, -2.990001, 0, 0, 0, 1, 1,
-0.03054509, -1.930319, -3.911267, 0, 0, 0, 1, 1,
-0.02984251, 1.043978, -1.225939, 0, 0, 0, 1, 1,
-0.02855341, 0.1029941, 0.2129697, 0, 0, 0, 1, 1,
-0.02277962, 0.06140123, -0.8236503, 0, 0, 0, 1, 1,
-0.01823896, 0.7070576, -2.692071, 0, 0, 0, 1, 1,
-0.0110316, -0.4021912, -4.002338, 1, 1, 1, 1, 1,
-0.009023467, -0.9312217, -3.085558, 1, 1, 1, 1, 1,
-0.006006373, 0.6422059, -0.6090917, 1, 1, 1, 1, 1,
-0.004026922, 0.6883851, -0.5455031, 1, 1, 1, 1, 1,
-0.00335406, -1.268265, -4.158829, 1, 1, 1, 1, 1,
-0.001587568, 0.5045534, 2.252308, 1, 1, 1, 1, 1,
-0.001534766, 0.1307874, -0.6778136, 1, 1, 1, 1, 1,
0.006805693, -0.3400238, 5.989156, 1, 1, 1, 1, 1,
0.007623204, 1.031082, 0.4605733, 1, 1, 1, 1, 1,
0.01320994, 0.5590907, -0.9244036, 1, 1, 1, 1, 1,
0.01420603, -0.3245416, 3.294072, 1, 1, 1, 1, 1,
0.01663247, -0.3321518, 4.167037, 1, 1, 1, 1, 1,
0.02132006, -0.7739545, 3.794408, 1, 1, 1, 1, 1,
0.02396226, -1.97992, 2.147923, 1, 1, 1, 1, 1,
0.02924723, -0.6111673, 3.970835, 1, 1, 1, 1, 1,
0.03558965, 0.9194862, 0.2711768, 0, 0, 1, 1, 1,
0.03777413, -0.3146364, 2.72021, 1, 0, 0, 1, 1,
0.04010129, -1.660927, 2.284219, 1, 0, 0, 1, 1,
0.04147875, 0.4713225, 0.3288129, 1, 0, 0, 1, 1,
0.04162137, 0.03016573, 1.193212, 1, 0, 0, 1, 1,
0.04220426, -1.537114, 3.141114, 1, 0, 0, 1, 1,
0.04452642, 1.437412, 0.2153657, 0, 0, 0, 1, 1,
0.04577256, 2.430327, -0.114687, 0, 0, 0, 1, 1,
0.04695129, 1.733784, 1.000373, 0, 0, 0, 1, 1,
0.04752456, -0.4498841, 3.458957, 0, 0, 0, 1, 1,
0.05385392, -0.3079858, 2.903533, 0, 0, 0, 1, 1,
0.05395394, -0.88447, 3.256062, 0, 0, 0, 1, 1,
0.05755287, 1.230292, 0.779911, 0, 0, 0, 1, 1,
0.0590167, 3.226852, -1.065012, 1, 1, 1, 1, 1,
0.06020754, 0.64042, 0.3610046, 1, 1, 1, 1, 1,
0.06170679, 0.01216484, 0.1400977, 1, 1, 1, 1, 1,
0.06194136, 1.795677, -0.1827853, 1, 1, 1, 1, 1,
0.0651247, -1.208696, 4.922095, 1, 1, 1, 1, 1,
0.06781984, -1.28957, 4.049612, 1, 1, 1, 1, 1,
0.06886946, 3.266879, 2.326498, 1, 1, 1, 1, 1,
0.06919867, 0.1018791, 0.8397409, 1, 1, 1, 1, 1,
0.07018963, 0.2382389, -1.570247, 1, 1, 1, 1, 1,
0.07054386, 1.320997, 0.04788919, 1, 1, 1, 1, 1,
0.07736146, -0.4766143, 2.584187, 1, 1, 1, 1, 1,
0.079357, 0.1126007, 0.4501051, 1, 1, 1, 1, 1,
0.08398212, 0.3842832, 1.79156, 1, 1, 1, 1, 1,
0.08804367, 0.9705584, -1.24848, 1, 1, 1, 1, 1,
0.08856777, 0.01821085, 2.321709, 1, 1, 1, 1, 1,
0.08952235, -2.751009, 2.422494, 0, 0, 1, 1, 1,
0.09156998, -0.8822337, 3.137426, 1, 0, 0, 1, 1,
0.09515999, -0.7444833, 2.740274, 1, 0, 0, 1, 1,
0.09603567, 2.612363, 0.1763027, 1, 0, 0, 1, 1,
0.09698502, 1.032726, -1.01432, 1, 0, 0, 1, 1,
0.09754921, 0.848851, -1.265402, 1, 0, 0, 1, 1,
0.09978513, -0.3063904, 3.947601, 0, 0, 0, 1, 1,
0.1055315, 0.06876092, 0.8275823, 0, 0, 0, 1, 1,
0.1071131, 1.771153, 0.6574995, 0, 0, 0, 1, 1,
0.1071445, 0.6508059, 1.590202, 0, 0, 0, 1, 1,
0.1157863, 1.067722, -0.5930368, 0, 0, 0, 1, 1,
0.1194948, 1.74461, 1.195998, 0, 0, 0, 1, 1,
0.123626, -0.916593, 2.751786, 0, 0, 0, 1, 1,
0.1308203, -0.6744877, 3.923834, 1, 1, 1, 1, 1,
0.1377394, 0.7192798, 0.4402801, 1, 1, 1, 1, 1,
0.1386228, 0.5088745, -1.577077, 1, 1, 1, 1, 1,
0.1436886, 1.354543, 1.160167, 1, 1, 1, 1, 1,
0.1488555, -1.500833, 2.015493, 1, 1, 1, 1, 1,
0.152264, 0.7595161, 0.4035076, 1, 1, 1, 1, 1,
0.1543797, 0.1111946, 0.4440636, 1, 1, 1, 1, 1,
0.158926, -0.0244004, 2.469771, 1, 1, 1, 1, 1,
0.1601463, -0.4177346, 4.543285, 1, 1, 1, 1, 1,
0.1625016, 1.146007, 1.481556, 1, 1, 1, 1, 1,
0.1652358, 1.062509, 1.162903, 1, 1, 1, 1, 1,
0.1666595, -0.4058594, 2.105132, 1, 1, 1, 1, 1,
0.1673794, 0.3379999, -0.8286336, 1, 1, 1, 1, 1,
0.1691679, -0.9976707, 4.244709, 1, 1, 1, 1, 1,
0.1775299, -0.2924629, 4.043271, 1, 1, 1, 1, 1,
0.1791561, 0.5142267, -0.6326257, 0, 0, 1, 1, 1,
0.1792479, -1.391013, 3.630208, 1, 0, 0, 1, 1,
0.1810596, 0.1771663, 0.1805579, 1, 0, 0, 1, 1,
0.1819634, 0.86703, -0.2122644, 1, 0, 0, 1, 1,
0.1883556, 0.1039212, 1.643911, 1, 0, 0, 1, 1,
0.1884264, 0.7730004, -0.2617821, 1, 0, 0, 1, 1,
0.1906106, 0.4498111, -0.3090988, 0, 0, 0, 1, 1,
0.1973859, -0.5233182, 3.170494, 0, 0, 0, 1, 1,
0.1992194, 1.070899, 1.821618, 0, 0, 0, 1, 1,
0.2078825, -0.5239024, 2.407174, 0, 0, 0, 1, 1,
0.2084226, 0.9838226, -0.1096721, 0, 0, 0, 1, 1,
0.2116197, -0.8607073, 1.869555, 0, 0, 0, 1, 1,
0.2126469, -1.169854, 3.30877, 0, 0, 0, 1, 1,
0.2136548, 0.7664862, 0.8628503, 1, 1, 1, 1, 1,
0.2151638, 0.114951, 1.11332, 1, 1, 1, 1, 1,
0.2202454, -1.65461, 0.4951226, 1, 1, 1, 1, 1,
0.2204398, 1.310704, -1.012356, 1, 1, 1, 1, 1,
0.2230274, -0.2983066, 4.104068, 1, 1, 1, 1, 1,
0.2264997, -1.208652, 3.731537, 1, 1, 1, 1, 1,
0.2334258, 0.5197255, 0.4275851, 1, 1, 1, 1, 1,
0.2339388, -0.5581079, 3.282928, 1, 1, 1, 1, 1,
0.2362908, 0.1716664, 1.856629, 1, 1, 1, 1, 1,
0.236524, 0.2893115, 0.3976304, 1, 1, 1, 1, 1,
0.236783, 0.1244553, 1.90601, 1, 1, 1, 1, 1,
0.2373599, 0.962409, -0.7759168, 1, 1, 1, 1, 1,
0.2428972, 0.08880315, 0.9195697, 1, 1, 1, 1, 1,
0.2439206, 0.4259002, -0.07235157, 1, 1, 1, 1, 1,
0.2467246, 0.9024375, 0.3277133, 1, 1, 1, 1, 1,
0.2471281, -0.4658716, 3.621887, 0, 0, 1, 1, 1,
0.2475948, 1.127132, -0.07373305, 1, 0, 0, 1, 1,
0.2480892, 1.242081, 0.4913496, 1, 0, 0, 1, 1,
0.2496838, 0.5838097, -0.02601681, 1, 0, 0, 1, 1,
0.2572272, -1.104998, 3.531981, 1, 0, 0, 1, 1,
0.2584111, 1.495112, -0.2719674, 1, 0, 0, 1, 1,
0.2596484, -1.423812, 2.518993, 0, 0, 0, 1, 1,
0.2645043, -0.1916739, 1.664303, 0, 0, 0, 1, 1,
0.2647097, -1.038038, 3.5477, 0, 0, 0, 1, 1,
0.2648859, 1.719588, -0.4069632, 0, 0, 0, 1, 1,
0.2676992, -1.646017, 3.232396, 0, 0, 0, 1, 1,
0.2681399, 0.8212513, -0.5535349, 0, 0, 0, 1, 1,
0.2685615, 0.1525369, 1.122846, 0, 0, 0, 1, 1,
0.2717574, 0.1990661, -1.234372, 1, 1, 1, 1, 1,
0.2722853, 1.19721, -0.6130716, 1, 1, 1, 1, 1,
0.2737491, -1.891696, 2.578951, 1, 1, 1, 1, 1,
0.2802682, -0.7794632, 2.864639, 1, 1, 1, 1, 1,
0.2803055, -0.403987, 2.821039, 1, 1, 1, 1, 1,
0.286155, 1.247877, 0.9560562, 1, 1, 1, 1, 1,
0.28643, -0.6652682, 2.251447, 1, 1, 1, 1, 1,
0.2869711, -1.059762, 2.468099, 1, 1, 1, 1, 1,
0.2877106, 0.02952119, 1.927973, 1, 1, 1, 1, 1,
0.2921025, 1.320669, 1.191067, 1, 1, 1, 1, 1,
0.2991218, -0.3441117, 2.450964, 1, 1, 1, 1, 1,
0.3014272, 0.7323527, -0.9423612, 1, 1, 1, 1, 1,
0.3053548, 2.164222, 0.4703311, 1, 1, 1, 1, 1,
0.3128173, 2.981699, 1.129793, 1, 1, 1, 1, 1,
0.3147793, -1.039816, 2.578519, 1, 1, 1, 1, 1,
0.3154042, 1.082954, -1.150663, 0, 0, 1, 1, 1,
0.3179606, 0.545135, 1.606673, 1, 0, 0, 1, 1,
0.3190132, -0.4620409, 1.363526, 1, 0, 0, 1, 1,
0.3208525, 0.4305527, 0.3924876, 1, 0, 0, 1, 1,
0.3216754, 0.7177859, -1.772176, 1, 0, 0, 1, 1,
0.3244213, 0.2630678, 1.360816, 1, 0, 0, 1, 1,
0.3288806, -0.3754918, 2.625755, 0, 0, 0, 1, 1,
0.3304273, 0.02702936, 1.528062, 0, 0, 0, 1, 1,
0.3418363, -0.7165366, 4.315583, 0, 0, 0, 1, 1,
0.3424319, 0.464144, 0.1448662, 0, 0, 0, 1, 1,
0.3435829, -0.3129687, 1.329493, 0, 0, 0, 1, 1,
0.3446615, 0.3620157, 2.383026, 0, 0, 0, 1, 1,
0.3481638, -0.1585521, 2.532613, 0, 0, 0, 1, 1,
0.3508691, 1.221306, -0.6538366, 1, 1, 1, 1, 1,
0.3529141, 0.5572305, 0.8748293, 1, 1, 1, 1, 1,
0.3586675, 1.420218, -0.06207464, 1, 1, 1, 1, 1,
0.3632737, 0.5086263, 0.9283481, 1, 1, 1, 1, 1,
0.3787115, 0.4944202, 0.3160076, 1, 1, 1, 1, 1,
0.3813502, 0.1649379, 0.7708699, 1, 1, 1, 1, 1,
0.3856739, -0.510184, 1.31439, 1, 1, 1, 1, 1,
0.3863058, 0.1820299, 0.2646733, 1, 1, 1, 1, 1,
0.3871647, -1.536148, 2.378068, 1, 1, 1, 1, 1,
0.3877513, 0.6784113, 1.91946, 1, 1, 1, 1, 1,
0.3889116, 1.277859, -0.9807519, 1, 1, 1, 1, 1,
0.3890851, 0.09129174, 2.290674, 1, 1, 1, 1, 1,
0.3915755, -1.49298, 1.587268, 1, 1, 1, 1, 1,
0.3924155, 0.219629, 3.320423, 1, 1, 1, 1, 1,
0.3966792, -0.3483414, 0.4121494, 1, 1, 1, 1, 1,
0.4012396, 0.8735965, -0.2337679, 0, 0, 1, 1, 1,
0.4055374, 0.9484478, 0.8756754, 1, 0, 0, 1, 1,
0.4068258, -0.6808965, 4.159146, 1, 0, 0, 1, 1,
0.409346, 0.2214395, 1.248835, 1, 0, 0, 1, 1,
0.4171185, -0.8701288, 3.51054, 1, 0, 0, 1, 1,
0.4178798, 0.3720503, 2.762518, 1, 0, 0, 1, 1,
0.4193188, -0.9768478, 4.553031, 0, 0, 0, 1, 1,
0.4196428, -0.1514613, 2.824025, 0, 0, 0, 1, 1,
0.4199038, -1.266799, 1.652504, 0, 0, 0, 1, 1,
0.4257723, -0.3164451, 3.125912, 0, 0, 0, 1, 1,
0.4277904, -0.2899804, 2.464438, 0, 0, 0, 1, 1,
0.4280007, -0.8022059, 2.954058, 0, 0, 0, 1, 1,
0.4305584, 0.1026856, 2.700883, 0, 0, 0, 1, 1,
0.4310877, 0.641585, 0.1772521, 1, 1, 1, 1, 1,
0.4324851, 0.3199176, 0.7707111, 1, 1, 1, 1, 1,
0.4338875, 1.028501, -0.3925563, 1, 1, 1, 1, 1,
0.4351292, -0.1708814, 3.703111, 1, 1, 1, 1, 1,
0.4403268, -0.2713499, 3.604819, 1, 1, 1, 1, 1,
0.4436424, 1.110582, 1.340349, 1, 1, 1, 1, 1,
0.444787, 0.5385802, 1.371856, 1, 1, 1, 1, 1,
0.4448746, 1.049986, -1.18897, 1, 1, 1, 1, 1,
0.4567273, 0.7045892, 0.4001645, 1, 1, 1, 1, 1,
0.4575543, 0.06147592, 1.080461, 1, 1, 1, 1, 1,
0.4588672, -0.4451868, 1.949079, 1, 1, 1, 1, 1,
0.4620812, 0.3677223, 0.5688148, 1, 1, 1, 1, 1,
0.4683859, 0.8150436, 0.3067005, 1, 1, 1, 1, 1,
0.4687456, -0.2309199, 1.163303, 1, 1, 1, 1, 1,
0.4720386, -1.122828, 2.635757, 1, 1, 1, 1, 1,
0.4722146, 0.3578594, 1.452456, 0, 0, 1, 1, 1,
0.4731463, 1.341806, -0.06659013, 1, 0, 0, 1, 1,
0.4749772, -0.3840399, 1.523033, 1, 0, 0, 1, 1,
0.4773467, -1.240137, 0.9375586, 1, 0, 0, 1, 1,
0.4816042, 2.147673, 1.506537, 1, 0, 0, 1, 1,
0.4830397, 0.7871113, 0.4268335, 1, 0, 0, 1, 1,
0.484517, 1.198789, 0.4067409, 0, 0, 0, 1, 1,
0.4865732, -0.793878, 1.206288, 0, 0, 0, 1, 1,
0.4878715, -0.01243473, 0.8353986, 0, 0, 0, 1, 1,
0.491998, 0.2122061, 1.942567, 0, 0, 0, 1, 1,
0.4937734, -0.2054377, 2.160577, 0, 0, 0, 1, 1,
0.5007438, -0.0599333, 3.801761, 0, 0, 0, 1, 1,
0.5054242, 1.293008, 2.121631, 0, 0, 0, 1, 1,
0.508618, -0.4194166, 2.540767, 1, 1, 1, 1, 1,
0.5104368, 1.443426, 0.1745818, 1, 1, 1, 1, 1,
0.5140573, 0.2299941, -0.4532433, 1, 1, 1, 1, 1,
0.5190802, -0.4981886, 2.70256, 1, 1, 1, 1, 1,
0.5210118, -0.2007234, 2.537858, 1, 1, 1, 1, 1,
0.5221627, -0.6142822, 3.107775, 1, 1, 1, 1, 1,
0.5260426, -0.1991642, 1.74518, 1, 1, 1, 1, 1,
0.5278274, 0.4838539, 0.8219535, 1, 1, 1, 1, 1,
0.5290983, -0.20317, 2.028648, 1, 1, 1, 1, 1,
0.5364712, 0.614781, 0.3371882, 1, 1, 1, 1, 1,
0.5366868, 0.9517501, -0.2553124, 1, 1, 1, 1, 1,
0.5388098, -0.2316002, 2.691481, 1, 1, 1, 1, 1,
0.5421768, 0.2473087, 1.276343, 1, 1, 1, 1, 1,
0.5462162, -1.190293, 2.578162, 1, 1, 1, 1, 1,
0.5480736, 0.3548069, 2.190321, 1, 1, 1, 1, 1,
0.5489551, 1.59091, 0.4492158, 0, 0, 1, 1, 1,
0.551356, -0.9171405, 2.751972, 1, 0, 0, 1, 1,
0.5545932, -2.153334, 1.666549, 1, 0, 0, 1, 1,
0.5553281, -2.239884, 1.788069, 1, 0, 0, 1, 1,
0.559891, 0.2111329, 2.113419, 1, 0, 0, 1, 1,
0.5612728, 1.054788, -0.6340773, 1, 0, 0, 1, 1,
0.5645687, 0.09271188, -0.5287467, 0, 0, 0, 1, 1,
0.5672328, -0.8747039, 2.669322, 0, 0, 0, 1, 1,
0.5735154, 0.963406, -0.5020629, 0, 0, 0, 1, 1,
0.5767781, 2.174748, 0.3535784, 0, 0, 0, 1, 1,
0.5770533, -1.110874, 3.694015, 0, 0, 0, 1, 1,
0.5795166, 0.9821204, -1.404349, 0, 0, 0, 1, 1,
0.5835943, 0.1908787, 0.8449267, 0, 0, 0, 1, 1,
0.587797, 0.5385119, -0.522562, 1, 1, 1, 1, 1,
0.5927038, -0.08333803, 2.516714, 1, 1, 1, 1, 1,
0.5968794, -1.432445, 2.418662, 1, 1, 1, 1, 1,
0.5978278, 2.049793, -0.02876325, 1, 1, 1, 1, 1,
0.5997239, 0.425745, 0.5090468, 1, 1, 1, 1, 1,
0.6032805, 0.1755586, 1.744695, 1, 1, 1, 1, 1,
0.6046705, 0.8992169, 1.56956, 1, 1, 1, 1, 1,
0.6073406, 0.1456171, 3.282988, 1, 1, 1, 1, 1,
0.6100478, 1.616302, -0.378697, 1, 1, 1, 1, 1,
0.612811, -0.6426306, 2.92075, 1, 1, 1, 1, 1,
0.6206274, 0.002587017, 1.421078, 1, 1, 1, 1, 1,
0.6245642, -0.3146155, 3.28381, 1, 1, 1, 1, 1,
0.6338795, 0.009419356, 1.968886, 1, 1, 1, 1, 1,
0.6386292, -0.937387, 3.556088, 1, 1, 1, 1, 1,
0.63872, -0.4939759, 2.285295, 1, 1, 1, 1, 1,
0.6394925, -1.300837, 2.221311, 0, 0, 1, 1, 1,
0.6396188, 0.0589035, 1.016655, 1, 0, 0, 1, 1,
0.641956, 0.5857927, 1.396674, 1, 0, 0, 1, 1,
0.6435802, -1.280307, 3.029741, 1, 0, 0, 1, 1,
0.6513541, 0.8758777, 1.681218, 1, 0, 0, 1, 1,
0.655625, -0.1155135, 1.479896, 1, 0, 0, 1, 1,
0.6557771, 0.8648955, 1.070896, 0, 0, 0, 1, 1,
0.6590455, 0.5242794, 0.9064351, 0, 0, 0, 1, 1,
0.6599249, 1.772571, 1.89167, 0, 0, 0, 1, 1,
0.6599897, -0.6127091, 2.322914, 0, 0, 0, 1, 1,
0.6655276, 0.1460616, 1.886909, 0, 0, 0, 1, 1,
0.6661775, 0.2995183, 0.8594804, 0, 0, 0, 1, 1,
0.666618, -0.6033518, 0.7605959, 0, 0, 0, 1, 1,
0.6675984, -0.2851539, 4.711936, 1, 1, 1, 1, 1,
0.6738042, 0.5014679, 0.4896682, 1, 1, 1, 1, 1,
0.6764294, 1.689415, -2.075707, 1, 1, 1, 1, 1,
0.6784871, 0.3538559, 0.4875388, 1, 1, 1, 1, 1,
0.6813059, 0.929931, -0.3648518, 1, 1, 1, 1, 1,
0.6834677, -0.9336188, 2.018075, 1, 1, 1, 1, 1,
0.6866477, -0.5414606, 3.288187, 1, 1, 1, 1, 1,
0.6873386, -0.4407992, 3.891629, 1, 1, 1, 1, 1,
0.6975853, 0.3175967, 1.426489, 1, 1, 1, 1, 1,
0.7003929, -0.4406935, 1.171697, 1, 1, 1, 1, 1,
0.7015837, 0.8732039, 0.9073687, 1, 1, 1, 1, 1,
0.7017342, 0.4427864, 0.6479075, 1, 1, 1, 1, 1,
0.7101655, 1.302453, 0.2113925, 1, 1, 1, 1, 1,
0.7116765, 0.1782243, -0.03922183, 1, 1, 1, 1, 1,
0.7124851, 2.945511, 1.06131, 1, 1, 1, 1, 1,
0.7149417, -1.80018, 3.692369, 0, 0, 1, 1, 1,
0.7208893, 0.8206862, 1.691472, 1, 0, 0, 1, 1,
0.725076, 0.01481547, 1.040208, 1, 0, 0, 1, 1,
0.7276774, 0.1539822, 0.8905399, 1, 0, 0, 1, 1,
0.727895, -1.186977, 3.893225, 1, 0, 0, 1, 1,
0.7300432, -0.7500895, 3.002447, 1, 0, 0, 1, 1,
0.7313892, 0.4578882, 1.943064, 0, 0, 0, 1, 1,
0.7392876, 1.173743, 0.7594501, 0, 0, 0, 1, 1,
0.7486007, 0.8828532, 0.9358037, 0, 0, 0, 1, 1,
0.7494863, 0.3131763, 1.402229, 0, 0, 0, 1, 1,
0.7513398, -0.9538523, 2.156617, 0, 0, 0, 1, 1,
0.7533398, 0.4300014, 0.5657997, 0, 0, 0, 1, 1,
0.7606223, -0.1657878, 1.100256, 0, 0, 0, 1, 1,
0.7608722, -1.279412, 3.025684, 1, 1, 1, 1, 1,
0.7657937, -0.7275805, 2.628209, 1, 1, 1, 1, 1,
0.7667903, 0.5394673, -0.173901, 1, 1, 1, 1, 1,
0.7700199, 1.305017, 0.6793835, 1, 1, 1, 1, 1,
0.7720827, 1.804197, 0.5237426, 1, 1, 1, 1, 1,
0.782141, -1.735404, 3.214092, 1, 1, 1, 1, 1,
0.7842461, -1.367768, 3.910526, 1, 1, 1, 1, 1,
0.7844896, 0.9777163, 2.084272, 1, 1, 1, 1, 1,
0.7866662, 0.3453871, 0.4427483, 1, 1, 1, 1, 1,
0.7916241, -1.895646, 2.870588, 1, 1, 1, 1, 1,
0.7946903, -0.1776752, 2.354773, 1, 1, 1, 1, 1,
0.7981592, 0.8196564, 1.53839, 1, 1, 1, 1, 1,
0.7986187, -1.146732, 1.937456, 1, 1, 1, 1, 1,
0.8011826, -0.002751424, 1.28583, 1, 1, 1, 1, 1,
0.8048681, 0.3576364, 1.580904, 1, 1, 1, 1, 1,
0.8063183, 1.56854, 1.413108, 0, 0, 1, 1, 1,
0.8132073, -0.5648111, 2.795029, 1, 0, 0, 1, 1,
0.8134175, -0.4176057, 2.927367, 1, 0, 0, 1, 1,
0.8205516, -0.4400114, 1.026894, 1, 0, 0, 1, 1,
0.8243274, -0.1399223, 0.6329669, 1, 0, 0, 1, 1,
0.836804, -2.211179, 3.035712, 1, 0, 0, 1, 1,
0.837605, -0.6146544, -0.3254042, 0, 0, 0, 1, 1,
0.8385501, -0.7116842, 2.023127, 0, 0, 0, 1, 1,
0.8414924, 0.5672518, 2.146964, 0, 0, 0, 1, 1,
0.8446881, 1.922051, -0.6195939, 0, 0, 0, 1, 1,
0.8511309, -0.6775678, 1.379496, 0, 0, 0, 1, 1,
0.8547964, -0.5857676, 0.3727244, 0, 0, 0, 1, 1,
0.864149, -0.08681836, 1.631468, 0, 0, 0, 1, 1,
0.8642997, -1.26975, 1.291493, 1, 1, 1, 1, 1,
0.8681077, -3.014702, 3.820558, 1, 1, 1, 1, 1,
0.8735344, 1.059167, 1.312435, 1, 1, 1, 1, 1,
0.8738978, 1.059504, 0.3631317, 1, 1, 1, 1, 1,
0.8770865, 0.03870758, 1.911038, 1, 1, 1, 1, 1,
0.8813989, -2.058966, 4.146986, 1, 1, 1, 1, 1,
0.8863878, -0.4222334, 2.579134, 1, 1, 1, 1, 1,
0.8869607, -1.188414, 0.9278061, 1, 1, 1, 1, 1,
0.8870282, 0.9930054, 0.8049245, 1, 1, 1, 1, 1,
0.8877972, -0.3653655, 2.625618, 1, 1, 1, 1, 1,
0.8909552, -1.639773, 2.671148, 1, 1, 1, 1, 1,
0.8910378, 0.1843819, 0.7915201, 1, 1, 1, 1, 1,
0.8950056, -1.129839, 4.111751, 1, 1, 1, 1, 1,
0.9040704, -0.9224735, 1.784491, 1, 1, 1, 1, 1,
0.9077241, 1.235005, 1.588613, 1, 1, 1, 1, 1,
0.9081047, -1.155153, 1.657493, 0, 0, 1, 1, 1,
0.916136, 0.3281058, 2.237207, 1, 0, 0, 1, 1,
0.9297853, -1.509639, 1.001849, 1, 0, 0, 1, 1,
0.9408169, 0.9251278, 1.413549, 1, 0, 0, 1, 1,
0.9413692, -0.9129028, 3.273288, 1, 0, 0, 1, 1,
0.9465675, -1.517899, 2.482004, 1, 0, 0, 1, 1,
0.9502131, 1.01047, -0.08234498, 0, 0, 0, 1, 1,
0.959482, 1.268912, 1.513108, 0, 0, 0, 1, 1,
0.974166, -0.1586634, 1.432632, 0, 0, 0, 1, 1,
0.97542, -0.2410526, 0.736509, 0, 0, 0, 1, 1,
0.9769399, 0.3267842, -0.4980307, 0, 0, 0, 1, 1,
0.9850952, 1.168358, 2.918181, 0, 0, 0, 1, 1,
0.9907697, -0.6606948, 0.8711406, 0, 0, 0, 1, 1,
1.001041, -0.9016193, 2.22801, 1, 1, 1, 1, 1,
1.004444, -1.302144, 3.942973, 1, 1, 1, 1, 1,
1.006165, 0.06195791, 0.9969676, 1, 1, 1, 1, 1,
1.011017, -1.333968, 1.455985, 1, 1, 1, 1, 1,
1.015504, 0.4773996, 0.3270983, 1, 1, 1, 1, 1,
1.01797, -1.556137, 0.7944583, 1, 1, 1, 1, 1,
1.018186, 0.9948743, 1.008286, 1, 1, 1, 1, 1,
1.025997, -2.175851, 2.809509, 1, 1, 1, 1, 1,
1.028854, 0.4943282, 0.6684972, 1, 1, 1, 1, 1,
1.034318, 0.9330105, 2.747123, 1, 1, 1, 1, 1,
1.046512, 0.1582205, 0.1491315, 1, 1, 1, 1, 1,
1.049438, 1.368035, 0.2860371, 1, 1, 1, 1, 1,
1.05199, -2.274317, 1.852017, 1, 1, 1, 1, 1,
1.054292, 2.85639, 2.265487, 1, 1, 1, 1, 1,
1.057894, 2.935952, 0.2363751, 1, 1, 1, 1, 1,
1.061443, 1.634735, 0.8833384, 0, 0, 1, 1, 1,
1.072514, -0.07618062, 0.8206309, 1, 0, 0, 1, 1,
1.075132, -1.412364, 1.449944, 1, 0, 0, 1, 1,
1.077044, 0.2396346, -0.96483, 1, 0, 0, 1, 1,
1.080709, 0.1364619, -0.1477963, 1, 0, 0, 1, 1,
1.081536, 0.2171431, 1.47129, 1, 0, 0, 1, 1,
1.088359, -0.5598259, 1.215606, 0, 0, 0, 1, 1,
1.090995, 0.5520275, 0.9936158, 0, 0, 0, 1, 1,
1.097156, 0.369393, 0.1779529, 0, 0, 0, 1, 1,
1.097695, -0.1847654, 1.350268, 0, 0, 0, 1, 1,
1.116331, -0.6097471, 2.485578, 0, 0, 0, 1, 1,
1.118794, -2.051871, 3.584359, 0, 0, 0, 1, 1,
1.13193, 1.521657, 1.585526, 0, 0, 0, 1, 1,
1.137163, 0.8105646, 2.727127, 1, 1, 1, 1, 1,
1.147168, -0.9388784, 4.392589, 1, 1, 1, 1, 1,
1.149042, 2.801568, 0.5998325, 1, 1, 1, 1, 1,
1.156673, 1.429681, 1.660727, 1, 1, 1, 1, 1,
1.169528, 2.308351, -0.6067563, 1, 1, 1, 1, 1,
1.172976, -1.019225, 2.077961, 1, 1, 1, 1, 1,
1.181087, -1.584536, 4.109242, 1, 1, 1, 1, 1,
1.184293, -0.6095411, 1.277544, 1, 1, 1, 1, 1,
1.18665, -1.583095, 2.185513, 1, 1, 1, 1, 1,
1.187002, 0.9862618, -0.1409763, 1, 1, 1, 1, 1,
1.199993, -1.501519, 2.423556, 1, 1, 1, 1, 1,
1.203129, -0.316865, 1.676131, 1, 1, 1, 1, 1,
1.204644, -1.776729, 0.7178429, 1, 1, 1, 1, 1,
1.212961, 0.05726113, 2.175342, 1, 1, 1, 1, 1,
1.21488, 1.844912, -0.4783938, 1, 1, 1, 1, 1,
1.215751, 0.1268906, 0.623684, 0, 0, 1, 1, 1,
1.22196, -0.03990124, 1.670082, 1, 0, 0, 1, 1,
1.231802, -1.361883, 2.214072, 1, 0, 0, 1, 1,
1.233939, 0.07234356, -1.006168, 1, 0, 0, 1, 1,
1.235514, 1.035163, 1.646975, 1, 0, 0, 1, 1,
1.240848, 0.3197752, 2.443946, 1, 0, 0, 1, 1,
1.25751, 0.5950467, 1.023727, 0, 0, 0, 1, 1,
1.260824, 0.7819319, -0.1249509, 0, 0, 0, 1, 1,
1.265646, -0.2300425, -0.8880756, 0, 0, 0, 1, 1,
1.2687, 0.6015321, 0.6101844, 0, 0, 0, 1, 1,
1.272658, -1.84189, 1.59034, 0, 0, 0, 1, 1,
1.274138, -0.2176225, 0.712984, 0, 0, 0, 1, 1,
1.289752, 0.5602578, 1.313823, 0, 0, 0, 1, 1,
1.291282, 0.1504416, 1.581956, 1, 1, 1, 1, 1,
1.303163, -0.3552196, 1.196436, 1, 1, 1, 1, 1,
1.303882, -0.1257965, 2.411852, 1, 1, 1, 1, 1,
1.314801, -0.7302957, -0.09846937, 1, 1, 1, 1, 1,
1.316771, -0.9134827, 2.206208, 1, 1, 1, 1, 1,
1.318677, 0.4866862, 1.784357, 1, 1, 1, 1, 1,
1.320013, -0.6045223, 2.450409, 1, 1, 1, 1, 1,
1.32179, -1.038322, 1.580255, 1, 1, 1, 1, 1,
1.336681, -0.1611106, 2.543456, 1, 1, 1, 1, 1,
1.343605, -0.950987, 2.623659, 1, 1, 1, 1, 1,
1.347858, 0.2715933, 0.474929, 1, 1, 1, 1, 1,
1.352373, 0.2678337, 0.1828407, 1, 1, 1, 1, 1,
1.352967, -1.241461, 2.386436, 1, 1, 1, 1, 1,
1.356225, -0.3398604, 1.825389, 1, 1, 1, 1, 1,
1.35629, 1.169909, 0.04495405, 1, 1, 1, 1, 1,
1.367091, 1.015941, 0.4793798, 0, 0, 1, 1, 1,
1.374142, -0.4819907, 2.325, 1, 0, 0, 1, 1,
1.38296, 0.5568203, 2.903101, 1, 0, 0, 1, 1,
1.387772, 0.7854063, -0.5620925, 1, 0, 0, 1, 1,
1.415036, -0.08844556, 1.662546, 1, 0, 0, 1, 1,
1.415543, 0.09467833, 3.72028, 1, 0, 0, 1, 1,
1.429384, -0.529937, 0.9128096, 0, 0, 0, 1, 1,
1.439268, -0.9436696, 1.089333, 0, 0, 0, 1, 1,
1.448928, -0.527568, 1.425401, 0, 0, 0, 1, 1,
1.456582, 0.5826461, 1.788937, 0, 0, 0, 1, 1,
1.458832, -1.32796, 0.3542482, 0, 0, 0, 1, 1,
1.459215, -0.7100544, 2.621818, 0, 0, 0, 1, 1,
1.463108, -0.1602629, 2.912887, 0, 0, 0, 1, 1,
1.466384, -0.875645, 1.366344, 1, 1, 1, 1, 1,
1.469543, -0.7500215, 3.051048, 1, 1, 1, 1, 1,
1.471326, 0.2001824, 1.730681, 1, 1, 1, 1, 1,
1.474185, -0.3295553, 0.1511549, 1, 1, 1, 1, 1,
1.480357, 0.8111467, 2.137572, 1, 1, 1, 1, 1,
1.481079, 1.225695, 1.091598, 1, 1, 1, 1, 1,
1.483383, 1.637519, 3.450768, 1, 1, 1, 1, 1,
1.498454, 0.9551383, 1.266397, 1, 1, 1, 1, 1,
1.502264, -0.01396553, 2.890496, 1, 1, 1, 1, 1,
1.505829, -0.7074764, 3.794991, 1, 1, 1, 1, 1,
1.509482, -0.1637441, 1.606042, 1, 1, 1, 1, 1,
1.515857, 1.13484, 2.512812, 1, 1, 1, 1, 1,
1.524075, -1.069735, 2.891046, 1, 1, 1, 1, 1,
1.545818, -1.938949, 2.287566, 1, 1, 1, 1, 1,
1.564812, -1.044593, 1.051577, 1, 1, 1, 1, 1,
1.578987, 1.510082, -1.306509, 0, 0, 1, 1, 1,
1.600536, -0.9995804, 2.808833, 1, 0, 0, 1, 1,
1.600639, -0.1992975, 2.903641, 1, 0, 0, 1, 1,
1.610767, -1.617889, 2.9444, 1, 0, 0, 1, 1,
1.619053, 1.014171, 2.023937, 1, 0, 0, 1, 1,
1.619576, 0.9542845, 0.5345621, 1, 0, 0, 1, 1,
1.624229, 1.078681, 3.117659, 0, 0, 0, 1, 1,
1.636239, -0.3699068, 3.718085, 0, 0, 0, 1, 1,
1.639399, 0.3374072, 0.5048005, 0, 0, 0, 1, 1,
1.664418, -0.9923301, 2.488699, 0, 0, 0, 1, 1,
1.725018, 0.9381588, 1.887219, 0, 0, 0, 1, 1,
1.736022, 0.9917609, 1.033275, 0, 0, 0, 1, 1,
1.739089, -2.954278, 1.375806, 0, 0, 0, 1, 1,
1.746397, -1.325282, 1.830509, 1, 1, 1, 1, 1,
1.75221, 0.5797673, 0.9758102, 1, 1, 1, 1, 1,
1.765625, -0.9763843, 1.960845, 1, 1, 1, 1, 1,
1.766234, -0.1825607, 3.230382, 1, 1, 1, 1, 1,
1.781439, -1.915849, 2.194211, 1, 1, 1, 1, 1,
1.795909, 0.6802197, 1.766621, 1, 1, 1, 1, 1,
1.808957, 0.8434345, 0.4230043, 1, 1, 1, 1, 1,
1.814485, -0.7327049, 1.974298, 1, 1, 1, 1, 1,
1.856677, 0.05962895, 1.725305, 1, 1, 1, 1, 1,
1.916518, 0.7454807, 2.581925, 1, 1, 1, 1, 1,
1.932455, 0.269339, 0.6421887, 1, 1, 1, 1, 1,
2.013763, 0.5729088, 1.184186, 1, 1, 1, 1, 1,
2.019856, -1.308816, 1.325133, 1, 1, 1, 1, 1,
2.040366, 1.0802, 1.404301, 1, 1, 1, 1, 1,
2.06752, -0.2298231, 4.103385, 1, 1, 1, 1, 1,
2.092029, 0.4087664, 1.19505, 0, 0, 1, 1, 1,
2.098225, -0.3759069, 2.55011, 1, 0, 0, 1, 1,
2.121774, 0.3851787, 2.645265, 1, 0, 0, 1, 1,
2.152285, 0.729802, 0.7168325, 1, 0, 0, 1, 1,
2.159715, -0.6255246, 2.038274, 1, 0, 0, 1, 1,
2.170104, -0.4500932, 1.743731, 1, 0, 0, 1, 1,
2.175566, -1.72572, 0.5737715, 0, 0, 0, 1, 1,
2.203625, -0.6350005, 4.26598, 0, 0, 0, 1, 1,
2.22618, -0.804681, 1.725982, 0, 0, 0, 1, 1,
2.233357, 0.3929752, 1.511128, 0, 0, 0, 1, 1,
2.265381, 0.6276349, 0.4126257, 0, 0, 0, 1, 1,
2.305606, 1.482588, -0.2505052, 0, 0, 0, 1, 1,
2.334773, 1.184227, 0.4764552, 0, 0, 0, 1, 1,
2.367926, 0.4354173, 1.424959, 1, 1, 1, 1, 1,
2.414957, -0.750764, 4.279575, 1, 1, 1, 1, 1,
2.417133, 1.093017, 1.591735, 1, 1, 1, 1, 1,
2.424855, -0.06228285, 2.111528, 1, 1, 1, 1, 1,
2.511713, 1.828354, 1.14514, 1, 1, 1, 1, 1,
2.738759, -1.347299, 3.443375, 1, 1, 1, 1, 1,
3.105145, -0.4413867, 0.3524489, 1, 1, 1, 1, 1
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
var radius = 10.39735;
var distance = 36.52025;
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
mvMatrix.translate( 0.1622651, -0.6628237, 0.0288806 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.52025);
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
